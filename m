Return-Path: <fengguang.wu@intel.com>
Date: Thu, 22 Mar 2018 16:41:52 +0800
From: kbuild test robot <lkp@intel.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: kbuild-all@01.org, Maxime Ripard <maxime.ripard@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH net-next 09/12] net: stmmac: dwmac-sun8i: Add support for
 GMAC on Allwinner R40 SoC
Message-ID: <201803221625.KPVYTBFl%fengguang.wu@intel.com>
References: <20180317092857.4396-10-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180317092857.4396-10-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Chen-Yu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20180309]
[also build test WARNING on v4.16-rc6]
[cannot apply to v4.16-rc4 v4.16-rc3 v4.16-rc2]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Chen-Yu-Tsai/ARM-sun8i-r40-Add-Ethernet-support/20180318-161723
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

   drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:94:24: sparse: symbol 'sun8i_syscon_reg_field' was not declared. Should it be static?
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:101:24: sparse: symbol 'sun8i_ccu_reg_field' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
