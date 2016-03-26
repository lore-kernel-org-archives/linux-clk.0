Return-Path: <fengguang.wu@intel.com>
Date: Sat, 26 Mar 2016 16:41:20 +0800
From: kbuild test robot <lkp@intel.com>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: kbuild-all@01.org, linux-rockchip@lists.infradead.org, heiko@sntech.de,
	huangtao@rock-chips.com, jay.xu@rock-chips.com,
	elaine.zhang@rock-chips.com, dianders@chromium.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] clk: rockchip: add clock controller for the RK3399
Message-ID: <201603261645.lZcOmgu0%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
In-Reply-To: <1458974276-10325-5-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xing,

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on v4.5 next-20160324]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Xing-Zheng/clk-rockchip-fix-big-LITTLE-cores-alternate-reparent-failed/20160326-144243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
config: arm-multi_v7_defconfig (attached as .config)
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

   In file included from drivers/clk/rockchip/clk-rk3399.c:22:0:
>> drivers/clk/rockchip/clk-rk3399.c:195:15: error: 'pll_rk3399' undeclared here (not in a function)
     [lpll] = PLL(pll_rk3399, PLL_APLLL, "lpll", mux_pll_p, 0, RK3399_PLL_CON(0),
                  ^
   drivers/clk/rockchip/clk.h:206:12: note: in definition of macro 'PLL'
      .type  = _type,    \
               ^
>> drivers/clk/rockchip/clk-rk3399.c:212:2: error: initializer element is not constant
     [ppll] = PLL(pll_rk3399, PLL_PPLL, "ppll",  mux_pll_p, 0, RK3399_PMU_PLL_CON(0),
     ^
   drivers/clk/rockchip/clk-rk3399.c:212:2: error: (near initialization for 'rk3399_pmu_pll_clks[0].type')
>> drivers/clk/rockchip/clk-rk3399.c:257:2: error: unknown field 'mux_core_alt' specified in initializer
     .mux_core_alt = 3,
     ^
>> drivers/clk/rockchip/clk-rk3399.c:258:2: error: unknown field 'mux_core_main' specified in initializer
     .mux_core_main = 0,
     ^
>> drivers/clk/rockchip/clk-rk3399.c:260:2: error: unknown field 'mux_core_mask' specified in initializer
     .mux_core_mask = 0x3,
     ^
>> drivers/clk/rockchip/clk-rk3399.c:260:2: warning: excess elements in struct initializer
   drivers/clk/rockchip/clk-rk3399.c:260:2: warning: (near initialization for 'rk3399_cpuclkl_data')
   drivers/clk/rockchip/clk-rk3399.c:267:2: error: unknown field 'mux_core_alt' specified in initializer
     .mux_core_alt = 3,
     ^
   drivers/clk/rockchip/clk-rk3399.c:268:2: error: unknown field 'mux_core_main' specified in initializer
     .mux_core_main = 1,
     ^
   drivers/clk/rockchip/clk-rk3399.c:270:2: error: unknown field 'mux_core_mask' specified in initializer
     .mux_core_mask = 0x3,
     ^
   drivers/clk/rockchip/clk-rk3399.c:270:2: warning: excess elements in struct initializer
   drivers/clk/rockchip/clk-rk3399.c:270:2: warning: (near initialization for 'rk3399_cpuclkb_data')
>> drivers/clk/rockchip/clk-rk3399.c:1125:2: error: implicit declaration of function 'COMPOSITE_FRACMUX_NOGATE' [-Werror=implicit-function-declaration]
     COMPOSITE_FRACMUX_NOGATE(0, "dclk_vop0_frac", "dclk_vop0_div", CLK_SET_RATE_PARENT,
     ^
>> drivers/clk/rockchip/clk-rk3399.c:1127:4: warning: missing braces around initializer [-Wmissing-braces]
       &rk3399_dclk_vop0_fracmux),
       ^
   drivers/clk/rockchip/clk-rk3399.c:1127:4: warning: (near initialization for 'rk3399_clk_branches[300]') [-Wmissing-braces]
   drivers/clk/rockchip/clk-rk3399.c:1127:4: error: initializer element is not constant
   drivers/clk/rockchip/clk-rk3399.c:1127:4: error: (near initialization for 'rk3399_clk_branches[300].id')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: braces around scalar initializer
     COMPOSITE(SCLK_VOP0_PWM, "clk_vop0_pwm", mux_pll_src_vpll_cpll_gpll_24m_p, CLK_IGNORE_UNUSED,
     ^
   drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: error: field name not in record or union initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: error: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: error: field name not in record or union initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: error: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: excess elements in scalar initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: error: field name not in record or union initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: error: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: excess elements in scalar initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: error: field name not in record or union initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: error: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: excess elements in scalar initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: warning: (near initialization for 'rk3399_clk_branches[300].branch_type')
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: error: field name not in record or union initializer
   drivers/clk/rockchip/clk-rk3399.c:1129:2: error: (near initialization for 'rk3399_clk_branches[300].branch_type')
   In file included from include/linux/io.h:23:0,
                    from include/linux/clk-provider.h:14,
                    from drivers/clk/rockchip/clk-rk3399.c:16:
>> include/linux/bug.h:34:45: warning: excess elements in scalar initializer
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
                                                ^
   include/linux/compiler-gcc.h:64:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^
   include/linux/kernel.h:54:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^
>> drivers/clk/rockchip/clk.h:310:18: note: in expansion of macro 'ARRAY_SIZE'
      .num_parents = ARRAY_SIZE(pnames),  \
                     ^
>> drivers/clk/rockchip/clk-rk3399.c:1129:2: note: in expansion of macro 'COMPOSITE'
     COMPOSITE(SCLK_VOP0_PWM, "clk_vop0_pwm", mux_pll_src_vpll_cpll_gpll_24m_p, CLK_IGNORE_UNUSED,
     ^
   include/linux/bug.h:34:45: warning: (near initialization for 'rk3399_clk_branches[300].branch_type')
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
                                                ^
   include/linux/compiler-gcc.h:64:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^
   include/linux/kernel.h:54:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^

vim +/pll_rk3399 +195 drivers/clk/rockchip/clk-rk3399.c

    16	#include <linux/clk-provider.h>
    17	#include <linux/of.h>
    18	#include <linux/of_address.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/regmap.h>
    21	#include <dt-bindings/clock/rk3399-cru.h>
  > 22	#include "clk.h"
    23	
    24	#define RK3399_PMUGRF_SOC_CON0			0x180
    25	#define RK3399_PMUCRU_PCLK_GATE_MASK		0x1
    26	#define RK3399_PMUCRU_PCLK_GATE_SHIFT		4
    27	#define RK3399_PMUCRU_PCLK_ALIVE_MASK		0x1
    28	#define RK3399_PMUCRU_PCLK_ALIVE_SHIFT		6
    29	
    30	enum rk3399_plls {
    31		lpll, bpll, dpll, cpll, gpll, npll, vpll,
    32	};
    33	
    34	enum rk3399_pmu_plls {
    35		ppll,
    36	};
    37	
    38	static struct rockchip_pll_rate_table rk3399_pll_rates[] = {
    39		/* _mhz, _refdiv, _fbdiv, _postdiv1, _postdiv2, _dsmpd, _frac */
    40		RK3036_PLL_RATE(2208000000, 1, 92, 1, 1, 1, 0),
    41		RK3036_PLL_RATE(2184000000, 1, 91, 1, 1, 1, 0),
    42		RK3036_PLL_RATE(2160000000, 1, 90, 1, 1, 1, 0),
    43		RK3036_PLL_RATE(2136000000, 1, 89, 1, 1, 1, 0),
    44		RK3036_PLL_RATE(2112000000, 1, 88, 1, 1, 1, 0),
    45		RK3036_PLL_RATE(2088000000, 1, 87, 1, 1, 1, 0),
    46		RK3036_PLL_RATE(2064000000, 1, 86, 1, 1, 1, 0),
    47		RK3036_PLL_RATE(2040000000, 1, 85, 1, 1, 1, 0),
    48		RK3036_PLL_RATE(2016000000, 1, 84, 1, 1, 1, 0),
    49		RK3036_PLL_RATE(1992000000, 1, 83, 1, 1, 1, 0),
    50		RK3036_PLL_RATE(1968000000, 1, 82, 1, 1, 1, 0),
    51		RK3036_PLL_RATE(1944000000, 1, 81, 1, 1, 1, 0),
    52		RK3036_PLL_RATE(1920000000, 1, 80, 1, 1, 1, 0),
    53		RK3036_PLL_RATE(1896000000, 1, 79, 1, 1, 1, 0),
    54		RK3036_PLL_RATE(1872000000, 1, 78, 1, 1, 1, 0),
    55		RK3036_PLL_RATE(1848000000, 1, 77, 1, 1, 1, 0),
    56		RK3036_PLL_RATE(1824000000, 1, 76, 1, 1, 1, 0),
    57		RK3036_PLL_RATE(1800000000, 1, 75, 1, 1, 1, 0),
    58		RK3036_PLL_RATE(1776000000, 1, 74, 1, 1, 1, 0),
    59		RK3036_PLL_RATE(1752000000, 1, 73, 1, 1, 1, 0),
    60		RK3036_PLL_RATE(1728000000, 1, 72, 1, 1, 1, 0),
    61		RK3036_PLL_RATE(1704000000, 1, 71, 1, 1, 1, 0),
    62		RK3036_PLL_RATE(1680000000, 1, 70, 1, 1, 1, 0),
    63		RK3036_PLL_RATE(1656000000, 1, 69, 1, 1, 1, 0),
    64		RK3036_PLL_RATE(1632000000, 1, 68, 1, 1, 1, 0),
    65		RK3036_PLL_RATE(1608000000, 1, 67, 1, 1, 1, 0),
    66		RK3036_PLL_RATE(1584000000, 1, 66, 1, 1, 1, 0),
    67		RK3036_PLL_RATE(1560000000, 1, 65, 1, 1, 1, 0),
    68		RK3036_PLL_RATE(1536000000, 1, 64, 1, 1, 1, 0),
    69		RK3036_PLL_RATE(1512000000, 1, 63, 1, 1, 1, 0),
    70		RK3036_PLL_RATE(1488000000, 1, 62, 1, 1, 1, 0),
    71		RK3036_PLL_RATE(1464000000, 1, 61, 1, 1, 1, 0),
    72		RK3036_PLL_RATE(1440000000, 1, 60, 1, 1, 1, 0),
    73		RK3036_PLL_RATE(1416000000, 1, 59, 1, 1, 1, 0),
    74		RK3036_PLL_RATE(1392000000, 1, 58, 1, 1, 1, 0),
    75		RK3036_PLL_RATE(1368000000, 1, 57, 1, 1, 1, 0),
    76		RK3036_PLL_RATE(1344000000, 1, 56, 1, 1, 1, 0),
    77		RK3036_PLL_RATE(1320000000, 1, 55, 1, 1, 1, 0),
    78		RK3036_PLL_RATE(1296000000, 1, 54, 1, 1, 1, 0),
    79		RK3036_PLL_RATE(1272000000, 1, 53, 1, 1, 1, 0),
    80		RK3036_PLL_RATE(1248000000, 1, 52, 1, 1, 1, 0),
    81		RK3036_PLL_RATE(1200000000, 1, 50, 1, 1, 1, 0),
    82		RK3036_PLL_RATE(1188000000, 2, 99, 1, 1, 1, 0),
    83		RK3036_PLL_RATE(1104000000, 1, 46, 1, 1, 1, 0),
    84		RK3036_PLL_RATE(1100000000, 12, 550, 1, 1, 1, 0),
    85		RK3036_PLL_RATE(1008000000, 1, 84, 2, 1, 1, 0),
    86		RK3036_PLL_RATE(1000000000, 6, 500, 2, 1, 1, 0),
    87		RK3036_PLL_RATE( 984000000, 1, 82, 2, 1, 1, 0),
    88		RK3036_PLL_RATE( 960000000, 1, 80, 2, 1, 1, 0),
    89		RK3036_PLL_RATE( 936000000, 1, 78, 2, 1, 1, 0),
    90		RK3036_PLL_RATE( 912000000, 1, 76, 2, 1, 1, 0),
    91		RK3036_PLL_RATE( 900000000, 4, 300, 2, 1, 1, 0),
    92		RK3036_PLL_RATE( 888000000, 1, 74, 2, 1, 1, 0),
    93		RK3036_PLL_RATE( 864000000, 1, 72, 2, 1, 1, 0),
    94		RK3036_PLL_RATE( 840000000, 1, 70, 2, 1, 1, 0),
    95		RK3036_PLL_RATE( 816000000, 1, 68, 2, 1, 1, 0),
    96		RK3036_PLL_RATE( 800000000, 6, 400, 2, 1, 1, 0),
    97		RK3036_PLL_RATE( 700000000, 6, 350, 2, 1, 1, 0),
    98		RK3036_PLL_RATE( 696000000, 1, 58, 2, 1, 1, 0),
    99		RK3036_PLL_RATE( 676000000, 3, 169, 2, 1, 1, 0),
   100		RK3036_PLL_RATE( 600000000, 1, 75, 3, 1, 1, 0),
   101		RK3036_PLL_RATE( 594000000, 2, 99, 2, 1, 1, 0),
   102		RK3036_PLL_RATE( 504000000, 1, 63, 3, 1, 1, 0),
   103		RK3036_PLL_RATE( 500000000, 6, 250, 2, 1, 1, 0),
   104		RK3036_PLL_RATE( 408000000, 1, 68, 2, 2, 1, 0),
   105		RK3036_PLL_RATE( 312000000, 1, 52, 2, 2, 1, 0),
   106		RK3036_PLL_RATE( 216000000, 1, 72, 4, 2, 1, 0),
   107		RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
   108		{ /* sentinel */ },
   109	};
   110	
   111	/* CRU parents */
   112	PNAME(mux_pll_p)				= { "xin24m", "xin32k" };
   113	
   114	PNAME(mux_armclkl_p)				= { "clk_core_l_lpll_src",
   115							    "clk_core_l_bpll_src",
   116							    "clk_core_l_dpll_src",
   117							    "clk_core_l_gpll_src" };
   118	PNAME(mux_armclkb_p)				= { "clk_core_b_lpll_src",
   119							    "clk_core_b_bpll_src",
   120							    "clk_core_b_dpll_src",
   121							    "clk_core_b_gpll_src" };
   122	PNAME(mux_aclk_cci_p)				= { "cpll_aclk_cci_src",
   123							    "gpll_aclk_cci_src",
   124							    "npll_aclk_cci_src",
   125							    "vpll_aclk_cci_src" };
   126	PNAME(mux_cci_trace_p)				= { "cpll_cci_trace", "gpll_cci_trace" };
   127	PNAME(mux_cs_p)					= { "cpll_cs", "gpll_cs", "npll_cs"};
   128	PNAME(mux_aclk_perihp_p)			= { "cpll_aclk_perihp_src", "gpll_aclk_perihp_src" };
   129	
   130	PNAME(mux_pll_src_cpll_gpll_p)			= { "cpll", "gpll" };
   131	PNAME(mux_pll_src_cpll_gpll_npll_p)		= { "cpll", "gpll", "npll" };
   132	PNAME(mux_pll_src_cpll_gpll_ppll_p)		= { "cpll", "gpll", "ppll" };
   133	PNAME(mux_pll_src_cpll_gpll_upll_p)		= { "cpll", "gpll", "upll" };
   134	PNAME(mux_pll_src_npll_cpll_gpll_p)		= { "npll", "cpll", "gpll" };
   135	PNAME(mux_pll_src_cpll_gpll_npll_ppll_p)	= { "cpll", "gpll", "npll", "ppll" };
   136	PNAME(mux_pll_src_cpll_gpll_npll_24m_p)		= { "cpll", "gpll", "npll", "xin24m" };
   137	PNAME(mux_pll_src_cpll_gpll_npll_usbphy480m_p)	= { "cpll", "gpll", "npll", "clk_usbphy_480m" };
   138	PNAME(mux_pll_src_ppll_cpll_gpll_npll_p)	= { "ppll", "cpll", "gpll", "npll", "upll" };
   139	PNAME(mux_pll_src_cpll_gpll_npll_upll_24m_p)	= { "cpll", "gpll", "npll", "upll", "xin24m" };
   140	PNAME(mux_pll_src_cpll_gpll_npll_ppll_upll_24m_p) = { "cpll", "gpll", "npll", "ppll", "upll", "xin24m" };
   141	
   142	PNAME(mux_pll_src_vpll_cpll_gpll_p)		= { "vpll", "cpll", "gpll" };
   143	PNAME(mux_pll_src_vpll_cpll_gpll_npll_p)	= { "vpll", "cpll", "gpll", "npll" };
   144	PNAME(mux_pll_src_vpll_cpll_gpll_24m_p)		= { "vpll", "cpll", "gpll", "xin24m" };
   145	
   146	PNAME(mux_dclk_vop0_p)				= { "dclk_vop0_div", "dclk_vop0_frac" };
   147	PNAME(mux_dclk_vop1_p)				= { "dclk_vop1_div", "dclk_vop1_frac" };
   148	
   149	PNAME(mux_clk_cif_p)				= { "clk_cifout_div", "xin24m" };
   150	
   151	PNAME(mux_pll_src_24m_usbphy480m_p)		= { "xin24m", "clk_usbphy_480m" };
   152	PNAME(mux_pll_src_24m_pciephy_p)		= { "xin24m", "clk_pciephy_ref100m" };
   153	PNAME(mux_pll_src_24m_32k_cpll_gpll_p)		= { "xin24m", "xin32k", "cpll", "gpll" };
   154	PNAME(mux_pciecore_cru_phy_p)			= { "clk_pcie_core_cru", "clk_pcie_core_phy" };
   155	
   156	PNAME(mux_aclk_emmc_p)				= { "cpll_aclk_emmc_src", "gpll_aclk_emmc_src" };
   157	
   158	PNAME(mux_aclk_perilp0_p)			= { "cpll_aclk_perilp0_src", "gpll_aclk_perilp0_src" };
   159	
   160	PNAME(mux_fclk_cm0s_p)				= { "cpll_fclk_cm0s_src", "gpll_fclk_cm0s_src" };
   161	
   162	PNAME(mux_hclk_perilp1_p)			= { "cpll_hclk_perilp1_src", "gpll_hclk_perilp1_src" };
   163	
   164	PNAME(mux_clk_testout1_p)			= { "clk_testout1_pll_src", "xin24m" };
   165	PNAME(mux_clk_testout2_p)			= { "clk_testout2_pll_src", "xin24m" };
   166	
   167	PNAME(mux_usbphy_480m_p)			= { "clk_usbphy0_480m_src", "clk_usbphy1_480m_src" };
   168	PNAME(mux_aclk_gmac_p)				= { "cpll_aclk_gmac_src", "gpll_aclk_gmac_src" };
   169	PNAME(mux_rmii_p)				= { "clk_gmac", "clkin_gmac" };
   170	PNAME(mux_spdif_p)				= { "clk_spdif_div", "clk_spdif_frac",
   171							    "clkin_i2s", "xin12m" };
   172	PNAME(mux_i2s0_p)				= { "clk_i2s0_div", "clk_i2s0_frac",
   173							    "clkin_i2s", "xin12m" };
   174	PNAME(mux_i2s1_p)				= { "clk_i2s1_div", "clk_i2s1_frac",
   175							    "clkin_i2s", "xin12m" };
   176	PNAME(mux_i2s2_p)				= { "clk_i2s2_div", "clk_i2s2_frac",
   177							    "clkin_i2s", "xin12m" };
   178	PNAME(mux_i2sch_p)				= { "clk_i2s0", "clk_i2s1", "clk_i2s2" };
   179	PNAME(mux_i2sout_p)				= { "clk_i2sout_src", "xin12m" };
   180	
   181	PNAME(mux_uart0_p)				= { "clk_uart0_div", "clk_uart0_frac", "xin24m" };
   182	PNAME(mux_uart1_p)				= { "clk_uart1_div", "clk_uart1_frac", "xin24m" };
   183	PNAME(mux_uart2_p)				= { "clk_uart2_div", "clk_uart2_frac", "xin24m" };
   184	PNAME(mux_uart3_p)				= { "clk_uart3_div", "clk_uart3_frac", "xin24m" };
   185	
   186	/* PMU CRU parents */
   187	PNAME(mux_ppll_24m_p)				= { "ppll", "xin24m" };
   188	PNAME(mux_24m_ppll_p)				= { "xin24m", "ppll" };
   189	PNAME(mux_fclk_cm0s_pmu_ppll_p)			= { "fclk_cm0s_pmu_ppll_src", "xin24m" };
   190	PNAME(mux_wifi_pmu_p)				= { "clk_wifi_div", "clk_wifi_frac" };
   191	PNAME(mux_uart4_pmu_p)				= { "clk_uart4_div", "clk_uart4_frac", "xin24m" };
   192	PNAME(mux_clk_testout2_2io_p)			= { "clk_testout2", "clk_32k_suspend_pmu" };
   193	
   194	static struct rockchip_pll_clock rk3399_pll_clks[] __initdata = {
 > 195		[lpll] = PLL(pll_rk3399, PLL_APLLL, "lpll", mux_pll_p, 0, RK3399_PLL_CON(0),
   196			     RK3399_PLL_CON(3), 8, 31, 0, rk3399_pll_rates),
   197		[bpll] = PLL(pll_rk3399, PLL_APLLB, "bpll", mux_pll_p, 0, RK3399_PLL_CON(8),
   198			     RK3399_PLL_CON(11), 8, 31, 0, rk3399_pll_rates),
   199		[dpll] = PLL(pll_rk3399, PLL_DPLL, "dpll", mux_pll_p, 0, RK3399_PLL_CON(16),
   200			     RK3399_PLL_CON(19), 8, 31, 0, NULL),
   201		[cpll] = PLL(pll_rk3399, PLL_CPLL, "cpll", mux_pll_p, 0, RK3399_PLL_CON(24),
   202			     RK3399_PLL_CON(27), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rk3399_pll_rates),
   203		[gpll] = PLL(pll_rk3399, PLL_GPLL, "gpll", mux_pll_p, 0, RK3399_PLL_CON(32),
   204			     RK3399_PLL_CON(35), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rk3399_pll_rates),
   205		[npll] = PLL(pll_rk3399, PLL_NPLL, "npll",  mux_pll_p, 0, RK3399_PLL_CON(40),
   206			     RK3399_PLL_CON(43), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rk3399_pll_rates),
   207		[vpll] = PLL(pll_rk3399, PLL_VPLL, "vpll",  mux_pll_p, 0, RK3399_PLL_CON(48),
   208			     RK3399_PLL_CON(51), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rk3399_pll_rates),
   209	};
   210	
   211	static struct rockchip_pll_clock rk3399_pmu_pll_clks[] __initdata = {
 > 212		[ppll] = PLL(pll_rk3399, PLL_PPLL, "ppll",  mux_pll_p, 0, RK3399_PMU_PLL_CON(0),
   213			     RK3399_PMU_PLL_CON(3), 8, 31, ROCKCHIP_PLL_SYNC_RATE, rk3399_pll_rates),
   214	};
   215	
   216	#define MFLAGS CLK_MUX_HIWORD_MASK
   217	#define DFLAGS CLK_DIVIDER_HIWORD_MASK
   218	#define GFLAGS (CLK_GATE_HIWORD_MASK | CLK_GATE_SET_TO_DISABLE)
   219	#define IFLAGS ROCKCHIP_INVERTER_HIWORD_MASK
   220	
   221	static struct rockchip_clk_branch rk3399_uart0_fracmux __initdata =
   222		MUX(SCLK_UART0, "clk_uart0", mux_uart0_p, CLK_SET_RATE_PARENT,
   223				RK3399_CLKSEL_CON(33), 8, 2, MFLAGS);
   224	
   225	static struct rockchip_clk_branch rk3399_uart1_fracmux __initdata =
   226		MUX(SCLK_UART1, "clk_uart1", mux_uart1_p, CLK_SET_RATE_PARENT,
   227				RK3399_CLKSEL_CON(34), 8, 2, MFLAGS);
   228	
   229	static struct rockchip_clk_branch rk3399_uart2_fracmux __initdata =
   230		MUX(SCLK_UART2, "clk_uart2", mux_uart2_p, CLK_SET_RATE_PARENT,
   231				RK3399_CLKSEL_CON(35), 8, 2, MFLAGS);
   232	
   233	static struct rockchip_clk_branch rk3399_uart3_fracmux __initdata =
   234		MUX(SCLK_UART3, "clk_uart3", mux_uart3_p, CLK_SET_RATE_PARENT,
   235				RK3399_CLKSEL_CON(36), 8, 2, MFLAGS);
   236	
   237	static struct rockchip_clk_branch rk3399_uart4_pmu_fracmux __initdata =
   238		MUX(SCLK_UART4_PMU, "clk_uart4_pmu", mux_uart4_pmu_p, CLK_SET_RATE_PARENT,
   239				RK3399_PMU_CLKSEL_CON(5), 8, 2, MFLAGS);
   240	
   241	static struct rockchip_clk_branch rk3399_dclk_vop0_fracmux __initdata =
   242		MUX(DCLK_VOP0, "dclk_vop0", mux_dclk_vop0_p, CLK_SET_RATE_PARENT,
   243				RK3399_CLKSEL_CON(49), 11, 1, MFLAGS);
   244	
   245	static struct rockchip_clk_branch rk3399_dclk_vop1_fracmux __initdata =
   246		MUX(DCLK_VOP1, "dclk_vop1", mux_dclk_vop1_p, CLK_SET_RATE_PARENT,
   247				RK3399_CLKSEL_CON(50), 11, 1, MFLAGS);
   248	
   249	static struct rockchip_clk_branch rk3399_pmuclk_wifi_fracmux __initdata =
   250		MUX(SCLK_WIFI_PMU, "clk_wifi_pmu", mux_wifi_pmu_p, CLK_SET_RATE_PARENT,
   251				RK3399_PMU_CLKSEL_CON(1), 14, 1, MFLAGS);
   252	
   253	static const struct rockchip_cpuclk_reg_data rk3399_cpuclkl_data = {
   254		.core_reg = RK3399_CLKSEL_CON(0),
   255		.div_core_shift = 0,
   256		.div_core_mask = 0x1f,
 > 257		.mux_core_alt = 3,
 > 258		.mux_core_main = 0,
   259		.mux_core_shift = 6,
 > 260		.mux_core_mask = 0x3,
   261	};
   262	
   263	static const struct rockchip_cpuclk_reg_data rk3399_cpuclkb_data = {
   264		.core_reg = RK3399_CLKSEL_CON(2),
   265		.div_core_shift = 0,
   266		.div_core_mask = 0x1f,
   267		.mux_core_alt = 3,
 > 268		.mux_core_main = 1,
   269		.mux_core_shift = 6,
 > 270		.mux_core_mask = 0x3,
   271	};
   272	
   273	#define RK3399_DIV_ACLKM_MASK		0x1f

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--mYCpIKhGyMATD0i+
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
5hkUEuro4xnliD6VDwAt8Ydcp3ECAA==

--mYCpIKhGyMATD0i+--
