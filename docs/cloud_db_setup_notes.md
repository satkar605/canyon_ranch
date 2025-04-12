# 🌩️ Cloud Database Setup Notes

This document captures important considerations and best practices for setting up the Canyon Ranch database in a cloud server environment. These notes are based on supervisor recommendations to avoid common mistakes during database creation and deployment.

## Pre-deployment Checklist

### Access and Security
- [ ] Verify you have proper permissions to create new databases on the target SQL Server instance
- [ ] Check firewall settings to ensure your IP address has access to the server
- [ ] Use a secure connection method (encrypted connection)
- [ ] Keep database credentials secure (never in source code or public repositories)

### Environment Preparation
- [ ] Verify SQL Server version compatibility with your script
- [ ] Check available storage space before database creation
- [ ] Confirm memory and CPU allocation are sufficient
- [ ] Backup any existing databases that might be affected

### Script Verification
- [ ] Test the script in a development environment first
- [ ] Verify schema naming conventions match company standards
- [ ] Check for any server-specific syntax that might need adjustment
- [ ] Ensure all object names are correctly cased (case sensitivity varies by server config)

## Execution Process

1. **Connection**: Use a trusted network connection to the server
2. **Script Execution**:
   - Run the script in manageable sections if possible
   - Start with database creation, then tables, then constraints
   - Monitor for errors at each stage
3. **Verification**:
   - Check that all objects were created correctly
   - Verify FK relationships with test queries
   - Run sample queries to ensure performance is as expected

## Common Pitfalls to Avoid

- **Dropping Production Objects**: Always verify the target server is correct before dropping objects
- **Collation Mismatch**: Ensure the database collation matches your requirements
- **Table Order**: Create tables in the correct order to respect foreign key dependencies
- **Space Issues**: Monitor storage usage during large object creation
- **Transaction Management**: Use transactions for critical operations to allow rollback
- **Naming Conflicts**: Check for existing object names before creation

## Recovery Plan

1. If script execution fails, identify at which point the failure occurred
2. Use transaction rollback if available
3. If needed, execute the drop statements to clean up partially created objects
4. Fix the issue that caused the failure
5. Re-run the script from the beginning or from a savepoint

## Server-Specific Notes

- **Azure SQL Database**:
  - DTU limits may affect script execution speed
  - Some T-SQL commands may be restricted
  - Use Azure authentication options appropriately

- **AWS RDS**:
  - Parameter groups may need configuration
  - Multi-AZ considerations for production
  - Backup configuration is separate from script

- **On-premises SQL Server**:
  - File growth settings should be configured appropriately
  - Check SQL Server Agent status for scheduled jobs
  - Verify server memory settings

---

📌 *Update this document with specific guidance from your supervisor as it becomes available.* 