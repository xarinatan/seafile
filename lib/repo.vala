namespace Seafile {

public class Repo : Object {

    // Section 1: Basic information
    // Members in this section should be set for every Repo object

    // _id is for fast access from c code. id is for
    // vala to automatically generate a property. Note,
    // if a Vala property is start with _, it is not
    // translated into a GObject property.
    public char _id[37];
    public string id {
        get { return (string)_id; }
        set { Posix.memcpy(_id, value, 36); _id[36] = '\0'; }
    }

    public string _name;
    public string name {
        get { return _name; }
        set { _name = value; }
    }

    public string _desc;        // description
    public string desc {
        get { return _desc; }
        set { _desc = value; }
    }

    // data format version
    public int version { get; set; }

    public int    last_modify { get; set; }
    public int64  size { get; set; }
    public int64  file_count { get; set; }
    public string head_cmmt_id { get; set; }
    public string root { get; set; }

    // To be compatible with obsoleted SharedRepo object
    public string repo_id { get; set; }
    public string repo_name { get; set; }
    public string repo_desc { get; set; }
    public int last_modified { get; set; }

    // Section 2: Encryption related
    // Members in this section should be set for every Repo object

    public bool encrypted { get; set; }
    public string magic { get; set; }
    public int enc_version { get; set; }
    public string random_key { get; set; }
    public string salt { get; set; }

    // Section 3: Client only information
    // Should be set for all client repo objects

    public string _worktree;
    public string worktree {
        get { return _worktree; }
        set { _worktree = value; }
    }
    public string _relay_id;
    public string relay_id {
        get { return _relay_id; }
        set { _relay_id = value; }
    }
    public int  last_sync_time { get; set; }
    public bool auto_sync { get; set; }
    public bool worktree_invalid { get; set; }

    // Section 4: Server only information
    // Should be set for all server repo objects

    // virutal repo related
    public bool is_virtual { get; set; }
    public string origin_repo_id { get; set; }
    public string origin_repo_name { get; set; }
    public string origin_path { get; set; }
    public bool is_original_owner { get; set; }
    public string virtual_perm { get; set; }

    // Used to access fs objects
    public string store_id { get; set; }

    public bool is_corrupted { get; set; }
    public bool repaired { get; set; }

    // Section 5: Share information
    // Only set in list_share_repos, get_group_repos and get_inner_pub_repos, etc

    public string share_type { get; set; } // personal, group or public
    public string permission { get; set; }
    public string user { get; set; } // share from or share to
    public int group_id { get; set; } // used when shared to group

    // For list_owned_repo
    public bool is_shared { get; set; }
}

public class SyncTask : Object {

    public bool force_upload { get; set; }
    public string repo_id { get; set; }
    public string state { get; set; }
    public int error { get; set; }
}

public class SessionInfo : Object {
    public string datadir { get; set; }
}

public class DiffEntry : Object {

    public string status { get; set; }
    public string name { get; set; }
    public string new_name { get; set; }
}

public class EncryptionInfo: Object {
    public string repo_id { get; set; }
    public string passwd { get; set; }
    public int enc_version { get; set; }
    public string magic { get; set; }
    public string random_key { get; set; }
    public string salt { get; set; }
}

public class FileSyncError: Object {
    public int id { get; set; }
    public string repo_id { get; set; }
    public string repo_name { get; set; }
    public string path { get; set; }
    public int err_id { get; set; }
    public int64 timestamp { get; set; }
}

} // namespace
