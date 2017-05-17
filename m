Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
From: Leo Yan <leo.yan@linaro.org>
To: Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Guodong Xu <guodong.xu@linaro.org>,
	Zhong Kaihua <zhongkaihua@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 0/2] Hi3660: enable sp804 timer
Date: Wed, 17 May 2017 22:46:30 +0800
Message-Id: <1495032392-19102-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch set is to enable sp804 timer on Hi3660 for Hikey960 platform.

On Hi3660, the sp804 timer co-exists with CPUs' architecture timer; but
sp804 timer is located in SoC level but CPU's architecture timer is in
CPU power domain. sp804 timer is used as broadcast timer when CPU enters
idle states and the CPU (includes architecture timer) power domain is
powered off. So sp804 timer enabling is prerequisite before we enable
CPUIdle on Hi3660.

This patch set is to enable sp804 timer, the first patch is to adjust
timer regiseration so ensure clock is avaiable for timer. the second
timer is to add description for timer in dts. Have rebased this patch
set on Guodong's dts patch set [1] and verified this patch set on
Hikey960.

[1] http://archive.armlinux.org.uk/lurker/message/20170517.083733.8207a50e.en.html

Leo Yan (2):
  clk: Hi3660: change to register clock with CLK_OF_DECLARE
  arm64: dts: add sp804 timer node for Hi3660

 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 11 +++++++
 drivers/clk/hisilicon/clk-hi3660.c        | 48 ++++---------------------------
 2 files changed, 16 insertions(+), 43 deletions(-)

-- 
1.9.1
