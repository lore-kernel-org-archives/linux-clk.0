Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Andy Gross <andy.gross@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: clk-smd-rpm: fix rate for branch clks during handoff
Date: Tue, 21 Mar 2017 10:12:59 +0000
Message-Id: <1490091179-4348-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

rpm branch clk rate should requested as either 0 or 1 but not INT_MAX.
This patch fixes rate request for branch clocks during clk handoff.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 3487c26..d990fe44 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -165,7 +165,7 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
 	struct clk_smd_rpm_req req = {
 		.key = cpu_to_le32(r->rpm_key),
 		.nbytes = cpu_to_le32(sizeof(u32)),
-		.value = cpu_to_le32(INT_MAX),
+		.value = cpu_to_le32(r->branch ? 1 : INT_MAX),
 	};
 
 	ret = qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
-- 
2.7.4
