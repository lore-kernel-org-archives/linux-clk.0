Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41512 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754769AbdA0JKa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Jan 2017 04:10:30 -0500
From: Jeremy McNicoll <jeremymc@redhat.com>
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, robh@kernel.org,
        arnd@arndb.de, bjorn.andersson@linaro.org, riteshh@codeaurora.org,
        git@kchr.de, ulf.hansson@linaro.org, jszhang@marvell.com,
        jeremymc@redhat.com
Subject: [PATCH V4 3/6] arm64: dts: msm8992 add fixed regulator
Date: Fri, 27 Jan 2017 01:10:02 -0800
Message-Id: <1485508205-1904-4-git-send-email-jeremymc@redhat.com>
In-Reply-To: <1485508205-1904-1-git-send-email-jeremymc@redhat.com>
References: <1485508205-1904-1-git-send-email-jeremymc@redhat.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This regulator is not moving anywhere.  Sit, stay...

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 44b2d37..13fb6f7 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -68,6 +68,17 @@
 		clock-frequency = <32768>;
 	};
 
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		status = "okay";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.6.1

