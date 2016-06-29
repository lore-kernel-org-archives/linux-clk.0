Return-Path: <fengguang.wu@intel.com>
Date: Thu, 30 Jun 2016 00:46:09 +0800
From: kbuild test robot <lkp@intel.com>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: kbuild-all@01.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, sboyd@codeaurora.org,
	mturquette@baylibre.com, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	anson.huang@nxp.com
Subject: Re: [PATCH V2 4/8] clk: core: support clocks which requires parents
 enable (part 2)
Message-ID: <201606300000.VNGxChoP%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
In-Reply-To: <1467212351-16626-5-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v4.7-rc5 next-20160629]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Dong-Aisheng/clk-core-support-clocks-which-requires-parents-enable/20160629-231445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-viper_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 5.3.1-8) 5.3.1 20160205
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All errors (new ones prefixed by >>):

   include/linux/export.h:63:39: error: declaration of '__ksymtab_clk_notifier_register' with no linkage follows extern declaration
     __visible const struct kernel_symbol __ksymtab_##sym \
                                          ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:2958:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_register);
    ^
   include/linux/export.h:62:36: note: previous declaration of '__ksymtab_clk_notifier_register' was here
     extern const struct kernel_symbol __ksymtab_##sym; \
                                       ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:2958:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_register);
    ^
   drivers/clk/clk.c:3005:19: error: non-static declaration of 'clk_notifier_unregister' follows static declaration
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
                      ^
   include/linux/export.h:57:21: note: in definition of macro '___EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
   drivers/clk/clk.c:2971:5: note: previous definition of 'clk_notifier_unregister' was here
    int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
        ^
   In file included from include/linux/linkage.h:6:0,
                    from include/linux/kernel.h:6,
                    from include/linux/clk.h:16,
                    from drivers/clk/clk.c:12:
   include/linux/export.h:63:25: warning: '__used__' attribute ignored [-Wattributes]
     __visible const struct kernel_symbol __ksymtab_##sym \
                            ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
   include/linux/export.h:63:39: error: section attribute cannot be specified for local variables
     __visible const struct kernel_symbol __ksymtab_##sym \
                                          ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
   include/linux/export.h:63:25: warning: 'externally_visible' attribute have effect only on public objects [-Wattributes]
     __visible const struct kernel_symbol __ksymtab_##sym \
                            ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
   include/linux/export.h:63:39: error: declaration of '__ksymtab_clk_notifier_unregister' with no linkage follows extern declaration
     __visible const struct kernel_symbol __ksymtab_##sym \
                                          ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
   include/linux/export.h:62:36: note: previous declaration of '__ksymtab_clk_notifier_unregister' was here
     extern const struct kernel_symbol __ksymtab_##sym; \
                                       ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^
>> include/linux/export.h:63:25: error: expected declaration or statement at end of input
     __visible const struct kernel_symbol __ksymtab_##sym \
                            ^
   include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^
   include/linux/export.h:101:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "_gpl")
     ^
   drivers/clk/clk.c:3005:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(clk_notifier_unregister);
    ^

vim +63 include/linux/export.h

f5016932 Paul Gortmaker 2011-05-23  57  	extern typeof(sym) sym;					\
f5016932 Paul Gortmaker 2011-05-23  58  	__CRC_SYMBOL(sym, sec)					\
f5016932 Paul Gortmaker 2011-05-23  59  	static const char __kstrtab_##sym[]			\
f5016932 Paul Gortmaker 2011-05-23  60  	__attribute__((section("__ksymtab_strings"), aligned(1))) \
b92021b0 Rusty Russell  2013-03-15  61  	= VMLINUX_SYMBOL_STR(sym);				\
7b4ec8dd Johannes Berg  2014-01-16  62  	extern const struct kernel_symbol __ksymtab_##sym;	\
e0f244c6 Andi Kleen     2013-10-23 @63  	__visible const struct kernel_symbol __ksymtab_##sym	\
f5016932 Paul Gortmaker 2011-05-23  64  	__used							\
f5016932 Paul Gortmaker 2011-05-23  65  	__attribute__((section("___ksymtab" sec "+" #sym), unused))	\
f5016932 Paul Gortmaker 2011-05-23  66  	= { (unsigned long)&sym, __kstrtab_##sym }
f5016932 Paul Gortmaker 2011-05-23  67  
c1a95fda Nicolas Pitre  2016-01-22  68  #if defined(__KSYM_DEPS__)
c1a95fda Nicolas Pitre  2016-01-22  69  
c1a95fda Nicolas Pitre  2016-01-22  70  /*
c1a95fda Nicolas Pitre  2016-01-22  71   * For fine grained build dependencies, we want to tell the build system
c1a95fda Nicolas Pitre  2016-01-22  72   * about each possible exported symbol even if they're not actually exported.
c1a95fda Nicolas Pitre  2016-01-22  73   * We use a string pattern that is unlikely to be valid code that the build
c1a95fda Nicolas Pitre  2016-01-22  74   * system filters out from the preprocessor output (see ksym_dep_filter
c1a95fda Nicolas Pitre  2016-01-22  75   * in scripts/Kbuild.include).
c1a95fda Nicolas Pitre  2016-01-22  76   */
c1a95fda Nicolas Pitre  2016-01-22  77  #define __EXPORT_SYMBOL(sym, sec)	=== __KSYM_##sym ===
c1a95fda Nicolas Pitre  2016-01-22  78  
c1a95fda Nicolas Pitre  2016-01-22  79  #elif defined(CONFIG_TRIM_UNUSED_KSYMS)
f2355416 Nicolas Pitre  2016-01-22  80  
f2355416 Nicolas Pitre  2016-01-22  81  #include <linux/kconfig.h>
f2355416 Nicolas Pitre  2016-01-22  82  #include <generated/autoksyms.h>
f2355416 Nicolas Pitre  2016-01-22  83  
f2355416 Nicolas Pitre  2016-01-22  84  #define __EXPORT_SYMBOL(sym, sec)				\
f2355416 Nicolas Pitre  2016-01-22  85  	__cond_export_sym(sym, sec, config_enabled(__KSYM_##sym))
f2355416 Nicolas Pitre  2016-01-22  86  #define __cond_export_sym(sym, sec, conf)			\
f2355416 Nicolas Pitre  2016-01-22  87  	___cond_export_sym(sym, sec, conf)
f2355416 Nicolas Pitre  2016-01-22  88  #define ___cond_export_sym(sym, sec, enabled)			\
f2355416 Nicolas Pitre  2016-01-22  89  	__cond_export_sym_##enabled(sym, sec)
f2355416 Nicolas Pitre  2016-01-22  90  #define __cond_export_sym_1(sym, sec) ___EXPORT_SYMBOL(sym, sec)
f2355416 Nicolas Pitre  2016-01-22  91  #define __cond_export_sym_0(sym, sec) /* nothing */
f2355416 Nicolas Pitre  2016-01-22  92  
f2355416 Nicolas Pitre  2016-01-22  93  #else
f2355416 Nicolas Pitre  2016-01-22 @94  #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
f2355416 Nicolas Pitre  2016-01-22  95  #endif
f2355416 Nicolas Pitre  2016-01-22  96  
f5016932 Paul Gortmaker 2011-05-23  97  #define EXPORT_SYMBOL(sym)					\

:::::: The code at line 63 was first introduced by commit
:::::: e0f244c63fc9d192dfd399cc2677bbdca61994b1 asmlinkage, module: Make ksymtab and kcrctab symbols and __this_module __visible

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--sdtB3X0nJg68CQEu
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--sdtB3X0nJg68CQEu--
