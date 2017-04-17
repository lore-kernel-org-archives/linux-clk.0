Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: arm-soc <arm@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 3/7] arm: spear6xx: fix spaces in spear600-evb.dts
Date: Mon, 17 Apr 2017 14:46:41 +0200
Message-Id: <1492433205-13376-4-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This commit fixes a minor coding style issue in spear600-evb.dts:
missing spaces around equal sign.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear600-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear600-evb.dts b/arch/arm/boot/dts/spear600-evb.dts
index 375eb61..32a44b6 100644
--- a/arch/arm/boot/dts/spear600-evb.dts
+++ b/arch/arm/boot/dts/spear600-evb.dts
@@ -55,7 +55,7 @@
 
 &smi {
 	status = "okay";
-	clock-rate=<50000000>;
+	clock-rate = <50000000>;
 
 	flash@f8000000 {
 		#address-cells = <1>;
-- 
2.7.4
