Return-Path: <fengguang.wu@intel.com>
Date: Fri, 15 Apr 2016 18:36:11 +0800
From: kbuild test robot <lkp@intel.com>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, linux-rockchip@lists.infradead.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	linux@arm.linux.org.uk, mturquette@baylibre.com,
	sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	broonie@kernel.org, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com, arnd@arndb.de, k.kozlowski@samsung.com,
	javier@osg.samsung.com, kgene@kernel.org, olof@lixom.net,
	geert+renesas@glider.be, sjoerd.simons@collabora.co.uk,
	treding@nvidia.com, public_timo.s@silentcreek.de
Subject: Re: [PATCH 3/6] regulator: rk808: Make rk808 generic, rename
 rk808-regulator.c
Message-ID: <201604151850.X92LLQkG%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1460711790-22646-4-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

Hi Wadim,

[auto build test WARNING on regulator/for-next]
[also build test WARNING on v4.6-rc3 next-20160414]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Wadim-Egorov/Add-RK818-PMIC-support/20160415-172610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/regulator/rk8xx-regulator.c:617:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
