Return-Path: <fengguang.wu@intel.com>
Date: Thu, 30 Jun 2016 00:42:21 +0800
From: kbuild test robot <lkp@intel.com>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: kbuild-all@01.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
	mturquette@baylibre.com, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	anson.huang@nxp.com
Subject: Re: [PATCH V2 4/8] clk: core: support clocks which requires parents
 enable (part 2)
Message-ID: <201606300015.zJJwBdRV%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sm4nu43k4a2Rpi4c"
In-Reply-To: <1467212351-16626-5-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v4.7-rc5 next-20160629]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Dong-Aisheng/clk-core-support-clocks-which-requires-parents-enable/20160629-231445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: x86_64-randconfig-i0-201626 (attached as .config)
compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All error/warnings (new ones prefixed by >>):

   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1957:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_get_phase);
    ^~~~~~~~~~~~~~~~~
   include/linux/export.h:62:36: note: previous declaration of '__ksymtab_clk_get_phase' was here
     extern const struct kernel_symbol __ksymtab_##sym; \
                                       ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1957:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_get_phase);
    ^~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:19: error: non-static declaration of 'clk_is_match' follows static declaration
    EXPORT_SYMBOL_GPL(clk_is_match);
                      ^
   include/linux/export.h:57:21: note: in definition of macro '___EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   drivers/clk/clk.c:1970:6: note: previous definition of 'clk_is_match' was here
    bool clk_is_match(const struct clk *p, const struct clk *q)
         ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:6:0,
                    from include/linux/kernel.h:6,
                    from include/linux/clk.h:16,
                    from drivers/clk/clk.c:12:
   include/linux/export.h:63:25: warning: '__used__' attribute ignored [-Wattributes]
     __visible const struct kernel_symbol __ksymtab_##sym \
                            ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   include/linux/export.h:63:39: error: section attribute cannot be specified for local variables
     __visible const struct kernel_symbol __ksymtab_##sym \
                                          ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   include/linux/export.h:63:25: warning: 'externally_visible' attribute have effect only on public objects [-Wattributes]
     __visible const struct kernel_symbol __ksymtab_##sym \
                            ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   include/linux/export.h:63:39: error: declaration of '__ksymtab_clk_is_match' with no linkage follows extern declaration
     __visible const struct kernel_symbol __ksymtab_##sym \
                                          ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   include/linux/export.h:62:36: note: previous declaration of '__ksymtab_clk_is_match' was here
     extern const struct kernel_symbol __ksymtab_##sym; \
                                       ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^~~~~~~~~~~~~~~
   drivers/clk/clk.c:1983:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_is_match);
    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/fs.h:6:0,
                    from include/linux/debugfs.h:18,
                    from drivers/clk/clk.c:1988:
>> include/linux/kdev_t.h:23:20: error: invalid storage class for function 'old_valid_dev'
    static inline bool old_valid_dev(dev_t dev)
                       ^~~~~~~~~~~~~
>> include/linux/kdev_t.h:28:19: error: invalid storage class for function 'old_encode_dev'
    static inline u16 old_encode_dev(dev_t dev)
                      ^~~~~~~~~~~~~~
>> include/linux/kdev_t.h:33:21: error: invalid storage class for function 'old_decode_dev'
    static inline dev_t old_decode_dev(u16 val)
                        ^~~~~~~~~~~~~~
>> include/linux/kdev_t.h:38:19: error: invalid storage class for function 'new_encode_dev'
    static inline u32 new_encode_dev(dev_t dev)
                      ^~~~~~~~~~~~~~
>> include/linux/kdev_t.h:45:21: error: invalid storage class for function 'new_decode_dev'
    static inline dev_t new_decode_dev(u32 dev)
                        ^~~~~~~~~~~~~~
>> include/linux/kdev_t.h:52:19: error: invalid storage class for function 'huge_encode_dev'
    static inline u64 huge_encode_dev(dev_t dev)
                      ^~~~~~~~~~~~~~~
>> include/linux/kdev_t.h:57:21: error: invalid storage class for function 'huge_decode_dev'
    static inline dev_t huge_decode_dev(u64 dev)
                        ^~~~~~~~~~~~~~~
>> include/linux/kdev_t.h:62:19: error: invalid storage class for function 'sysv_valid_dev'
    static inline int sysv_valid_dev(dev_t dev)
                      ^~~~~~~~~~~~~~
>> include/linux/kdev_t.h:67:19: error: invalid storage class for function 'sysv_encode_dev'
    static inline u32 sysv_encode_dev(dev_t dev)
                      ^~~~~~~~~~~~~~~
>> include/linux/kdev_t.h:72:24: error: invalid storage class for function 'sysv_major'
    static inline unsigned sysv_major(u32 dev)
                           ^~~~~~~~~~
>> include/linux/kdev_t.h:77:24: error: invalid storage class for function 'sysv_minor'
    static inline unsigned sysv_minor(u32 dev)
                           ^~~~~~~~~~
   In file included from include/linux/list_bl.h:5:0,
                    from include/linux/rculist_bl.h:7,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:18,
                    from drivers/clk/clk.c:1988:
>> include/linux/bit_spinlock.h:15:20: error: invalid storage class for function 'bit_spin_lock'
    static inline void bit_spin_lock(int bitnum, unsigned long *addr)
                       ^~~~~~~~~~~~~
>> include/linux/bit_spinlock.h:40:19: error: invalid storage class for function 'bit_spin_trylock'
    static inline int bit_spin_trylock(int bitnum, unsigned long *addr)
                      ^~~~~~~~~~~~~~~~
>> include/linux/bit_spinlock.h:56:20: error: invalid storage class for function 'bit_spin_unlock'
    static inline void bit_spin_unlock(int bitnum, unsigned long *addr)
                       ^~~~~~~~~~~~~~~
>> include/linux/bit_spinlock.h:73:20: error: invalid storage class for function '__bit_spin_unlock'
    static inline void __bit_spin_unlock(int bitnum, unsigned long *addr)
                       ^~~~~~~~~~~~~~~~~
>> include/linux/bit_spinlock.h:88:19: error: invalid storage class for function 'bit_spin_is_locked'
    static inline int bit_spin_is_locked(int bitnum, unsigned long *addr)
                      ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/rculist_bl.h:7:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:18,
                    from drivers/clk/clk.c:1988:
>> include/linux/list_bl.h:43:20: error: invalid storage class for function 'INIT_HLIST_BL_NODE'
    static inline void INIT_HLIST_BL_NODE(struct hlist_bl_node *h)
                       ^~~~~~~~~~~~~~~~~~
>> include/linux/list_bl.h:51:21: error: invalid storage class for function 'hlist_bl_unhashed'
    static inline bool  hlist_bl_unhashed(const struct hlist_bl_node *h)
                        ^~~~~~~~~~~~~~~~~
>> include/linux/list_bl.h:56:37: error: invalid storage class for function 'hlist_bl_first'
    static inline struct hlist_bl_node *hlist_bl_first(struct hlist_bl_head *h)
                                        ^~~~~~~~~~~~~~
>> include/linux/list_bl.h:62:20: error: invalid storage class for function 'hlist_bl_set_first'
    static inline void hlist_bl_set_first(struct hlist_bl_head *h,
                       ^~~~~~~~~~~~~~~~~~

vim +2148 drivers/clk/clk.c

4dff95dc9 Stephen Boyd   2015-04-30  2122  static int clk_dump_open(struct inode *inode, struct file *file)
b33d212f4 Ulf Hansson    2013-04-02  2123  {
4dff95dc9 Stephen Boyd   2015-04-30  2124  	return single_open(file, clk_dump, inode->i_private);
b2476490e Mike Turquette 2012-03-15  2125  }
b2476490e Mike Turquette 2012-03-15  2126  
4dff95dc9 Stephen Boyd   2015-04-30  2127  static const struct file_operations clk_dump_fops = {
4dff95dc9 Stephen Boyd   2015-04-30 @2128  	.open		= clk_dump_open,
4dff95dc9 Stephen Boyd   2015-04-30  2129  	.read		= seq_read,
4dff95dc9 Stephen Boyd   2015-04-30  2130  	.llseek		= seq_lseek,
4dff95dc9 Stephen Boyd   2015-04-30  2131  	.release	= single_release,
4dff95dc9 Stephen Boyd   2015-04-30  2132  };
4dff95dc9 Stephen Boyd   2015-04-30  2133  
4dff95dc9 Stephen Boyd   2015-04-30  2134  static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
4e88f3de8 Thierry Reding 2015-01-21  2135  {
4dff95dc9 Stephen Boyd   2015-04-30  2136  	struct dentry *d;
4dff95dc9 Stephen Boyd   2015-04-30  2137  	int ret = -ENOMEM;
4e88f3de8 Thierry Reding 2015-01-21  2138  
4dff95dc9 Stephen Boyd   2015-04-30  2139  	if (!core || !pdentry) {
4dff95dc9 Stephen Boyd   2015-04-30  2140  		ret = -EINVAL;
4dff95dc9 Stephen Boyd   2015-04-30  2141  		goto out;
4dff95dc9 Stephen Boyd   2015-04-30  2142  	}
4e88f3de8 Thierry Reding 2015-01-21  2143  
4dff95dc9 Stephen Boyd   2015-04-30  2144  	d = debugfs_create_dir(core->name, pdentry);
4dff95dc9 Stephen Boyd   2015-04-30  2145  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2146  		goto out;
035a61c31 Tomeu Vizoso   2015-01-23  2147  
4dff95dc9 Stephen Boyd   2015-04-30 @2148  	core->dentry = d;
4e88f3de8 Thierry Reding 2015-01-21  2149  
4dff95dc9 Stephen Boyd   2015-04-30 @2150  	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2151  			(u32 *)&core->rate);
4dff95dc9 Stephen Boyd   2015-04-30  2152  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2153  		goto err_out;
4e88f3de8 Thierry Reding 2015-01-21  2154  
4dff95dc9 Stephen Boyd   2015-04-30  2155  	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2156  			(u32 *)&core->accuracy);
4dff95dc9 Stephen Boyd   2015-04-30  2157  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2158  		goto err_out;
4e88f3de8 Thierry Reding 2015-01-21  2159  
4dff95dc9 Stephen Boyd   2015-04-30 @2160  	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2161  			(u32 *)&core->phase);
4dff95dc9 Stephen Boyd   2015-04-30  2162  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2163  		goto err_out;
b2476490e Mike Turquette 2012-03-15  2164  
4dff95dc9 Stephen Boyd   2015-04-30 @2165  	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2166  			(u32 *)&core->flags);
4dff95dc9 Stephen Boyd   2015-04-30  2167  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2168  		goto err_out;
89ac8d7ae Mike Turquette 2013-08-21  2169  
4dff95dc9 Stephen Boyd   2015-04-30  2170  	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2171  			(u32 *)&core->prepare_count);
4dff95dc9 Stephen Boyd   2015-04-30  2172  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2173  		goto err_out;
b2476490e Mike Turquette 2012-03-15  2174  
4dff95dc9 Stephen Boyd   2015-04-30  2175  	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2176  			(u32 *)&core->enable_count);
4dff95dc9 Stephen Boyd   2015-04-30  2177  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2178  		goto err_out;
b2476490e Mike Turquette 2012-03-15  2179  
4dff95dc9 Stephen Boyd   2015-04-30 @2180  	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
4dff95dc9 Stephen Boyd   2015-04-30  2181  			(u32 *)&core->notifier_count);
4dff95dc9 Stephen Boyd   2015-04-30  2182  	if (!d)
4dff95dc9 Stephen Boyd   2015-04-30  2183  		goto err_out;
b61c43c09 Stephen Boyd   2015-02-02  2184  
4dff95dc9 Stephen Boyd   2015-04-30  2185  	if (core->ops->debug_init) {
4dff95dc9 Stephen Boyd   2015-04-30  2186  		ret = core->ops->debug_init(core->hw, core->dentry);
4dff95dc9 Stephen Boyd   2015-04-30  2187  		if (ret)
4dff95dc9 Stephen Boyd   2015-04-30  2188  			goto err_out;
031dcc9bd Ulf Hansson    2013-04-02  2189  	}
031dcc9bd Ulf Hansson    2013-04-02  2190  
4dff95dc9 Stephen Boyd   2015-04-30  2191  	ret = 0;
031dcc9bd Ulf Hansson    2013-04-02  2192  	goto out;
031dcc9bd Ulf Hansson    2013-04-02  2193  
4dff95dc9 Stephen Boyd   2015-04-30  2194  err_out:
4dff95dc9 Stephen Boyd   2015-04-30 @2195  	debugfs_remove_recursive(core->dentry);
4dff95dc9 Stephen Boyd   2015-04-30  2196  	core->dentry = NULL;
4dff95dc9 Stephen Boyd   2015-04-30  2197  out:
4dff95dc9 Stephen Boyd   2015-04-30  2198  	return ret;
4dff95dc9 Stephen Boyd   2015-04-30  2199  }
b2476490e Mike Turquette 2012-03-15  2200  
4dff95dc9 Stephen Boyd   2015-04-30  2201  /**
6e5ab41b1 Stephen Boyd   2015-04-30  2202   * clk_debug_register - add a clk node to the debugfs clk directory
6e5ab41b1 Stephen Boyd   2015-04-30  2203   * @core: the clk being added to the debugfs clk directory
4dff95dc9 Stephen Boyd   2015-04-30  2204   *
6e5ab41b1 Stephen Boyd   2015-04-30  2205   * Dynamically adds a clk to the debugfs clk directory if debugfs has been
6e5ab41b1 Stephen Boyd   2015-04-30  2206   * initialized.  Otherwise it bails out early since the debugfs clk directory
4dff95dc9 Stephen Boyd   2015-04-30  2207   * will be created lazily by clk_debug_init as part of a late_initcall.
4dff95dc9 Stephen Boyd   2015-04-30  2208   */
4dff95dc9 Stephen Boyd   2015-04-30  2209  static int clk_debug_register(struct clk_core *core)
4dff95dc9 Stephen Boyd   2015-04-30  2210  {
4dff95dc9 Stephen Boyd   2015-04-30  2211  	int ret = 0;
b2476490e Mike Turquette 2012-03-15  2212  
4dff95dc9 Stephen Boyd   2015-04-30  2213  	mutex_lock(&clk_debug_lock);
4dff95dc9 Stephen Boyd   2015-04-30  2214  	hlist_add_head(&core->debug_node, &clk_debug_list);
b2476490e Mike Turquette 2012-03-15  2215  
4dff95dc9 Stephen Boyd   2015-04-30  2216  	if (!inited)
4dff95dc9 Stephen Boyd   2015-04-30  2217  		goto unlock;
b2476490e Mike Turquette 2012-03-15  2218  
4dff95dc9 Stephen Boyd   2015-04-30  2219  	ret = clk_debug_create_one(core, rootdir);
4dff95dc9 Stephen Boyd   2015-04-30  2220  unlock:
4dff95dc9 Stephen Boyd   2015-04-30  2221  	mutex_unlock(&clk_debug_lock);
b2476490e Mike Turquette 2012-03-15  2222  
b2476490e Mike Turquette 2012-03-15  2223  	return ret;
b2476490e Mike Turquette 2012-03-15  2224  }
035a61c31 Tomeu Vizoso   2015-01-23  2225  
035a61c31 Tomeu Vizoso   2015-01-23  2226   /**
6e5ab41b1 Stephen Boyd   2015-04-30  2227   * clk_debug_unregister - remove a clk node from the debugfs clk directory
6e5ab41b1 Stephen Boyd   2015-04-30  2228   * @core: the clk being removed from the debugfs clk directory
035a61c31 Tomeu Vizoso   2015-01-23  2229   *
6e5ab41b1 Stephen Boyd   2015-04-30  2230   * Dynamically removes a clk and all its child nodes from the
6e5ab41b1 Stephen Boyd   2015-04-30  2231   * debugfs clk directory if clk->dentry points to debugfs created by
706d5c73e Stephen Boyd   2016-02-22  2232   * clk_debug_register in __clk_core_init.
035a61c31 Tomeu Vizoso   2015-01-23  2233   */
4dff95dc9 Stephen Boyd   2015-04-30  2234  static void clk_debug_unregister(struct clk_core *core)
035a61c31 Tomeu Vizoso   2015-01-23  2235  {
4dff95dc9 Stephen Boyd   2015-04-30  2236  	mutex_lock(&clk_debug_lock);
4dff95dc9 Stephen Boyd   2015-04-30  2237  	hlist_del_init(&core->debug_node);
4dff95dc9 Stephen Boyd   2015-04-30 @2238  	debugfs_remove_recursive(core->dentry);
4dff95dc9 Stephen Boyd   2015-04-30  2239  	core->dentry = NULL;
4dff95dc9 Stephen Boyd   2015-04-30  2240  	mutex_unlock(&clk_debug_lock);
4dff95dc9 Stephen Boyd   2015-04-30  2241  }
035a61c31 Tomeu Vizoso   2015-01-23  2242  
4dff95dc9 Stephen Boyd   2015-04-30  2243  struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
4dff95dc9 Stephen Boyd   2015-04-30  2244  				void *data, const struct file_operations *fops)
4dff95dc9 Stephen Boyd   2015-04-30  2245  {
4dff95dc9 Stephen Boyd   2015-04-30  2246  	struct dentry *d = NULL;
4dff95dc9 Stephen Boyd   2015-04-30  2247  
4dff95dc9 Stephen Boyd   2015-04-30  2248  	if (hw->core->dentry)
4dff95dc9 Stephen Boyd   2015-04-30 @2249  		d = debugfs_create_file(name, mode, hw->core->dentry, data,
4dff95dc9 Stephen Boyd   2015-04-30  2250  					fops);
4dff95dc9 Stephen Boyd   2015-04-30  2251  
4dff95dc9 Stephen Boyd   2015-04-30  2252  	return d;

:::::: The code at line 2148 was first introduced by commit
:::::: 4dff95dc9477a34de77d24c59dcf1dc593687fcf clk: Remove forward declared function prototypes

:::::: TO: Stephen Boyd <sboyd@codeaurora.org>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--sm4nu43k4a2Rpi4c
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ZcMBAA==

--sm4nu43k4a2Rpi4c--
