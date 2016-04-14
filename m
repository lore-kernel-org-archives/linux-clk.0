Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andy.gross@linaro.org,
	bjorn.andersson@linaro.org,
	zhang.chunyan@linaro.org,
	georgi.djakov@linaro.org
Subject: [PATCH v8 3/3] arm64: dts: qcom: msm8916: Use fixed factor xo clock
Date: Thu, 14 Apr 2016 17:34:49 +0300
Message-Id: <1460644489-11310-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1460644489-11310-1-git-send-email-georgi.djakov@linaro.org>
References: <1460644489-11310-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The rpmcc driver is providing the XO clock, which is the parent of almost
all clocks. But during boot, this driver may probe later and leave most of
the clocks without parent. The common clock framework currently reports
invalid rate for orphan clocks and this may confuse drivers.

To resolve this, use fixed clocks registration until we have some support
to deal with the this issue. Removing the generic rpmcc compatible is
enough to switch back to fixed factor XO clock.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 96812007850e..0054a3264ef0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -552,7 +552,7 @@
 				qcom,smd-channels = "rpm_requests";
 
 				rpmcc: qcom,rpmcc {
-					compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
+					compatible = "qcom,rpmcc-msm8916";
 					#clock-cells = <1>;
 				};
 
