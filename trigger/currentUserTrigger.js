const checkTriggerExists = async (sequelize, tableName) => {
  const triggerName = `before_${tableName}_insert`;
  const query = `
      SELECT COUNT(*)
      AS triggerExists
      FROM information_schema.triggers
      WHERE trigger_schema = DATABASE()
      AND trigger_name = '${triggerName}'
      AND event_object_table = '${tableName}';
    `;

  const [results] = await sequelize.query(query);
  return results[0].triggerExists > 0;
};

const createTrigger = async (tableName) => {
  return `
      CREATE TRIGGER before_${tableName}_insert
      BEFORE INSERT ON ${tableName}
      FOR EACH ROW
      BEGIN
        SET NEW.CREATED_BY = IFNULL(NEW.CREATED_BY, CURRENT_USER());
        SET NEW.UPDATED_BY = CURRENT_USER();
      END;
    `;
};

const createTriggerForTable = async (sequelize, tableName) => {
  const triggerExists = await checkTriggerExists(sequelize, tableName);
  if (!triggerExists) {
    const triggerSQL = createTrigger(tableName);
    try {
      await sequelize.query(triggerSQL);
      console.log(`Trigger before_${tableName}_insert created successfully.`);
    } catch (error) {
      console.error(`Error creating trigger for table ${tableName}:`, error);
    }
  } else {
    console.log(`Trigger before_${tableName}_insert already exists.`);
  }
};
module.exports = createTriggerForTable;
