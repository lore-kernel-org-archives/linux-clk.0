Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AAD421EE6;
	Tue, 20 Jan 2026 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907997; cv=none; b=mrmZgg04TaypXW/UhxX8C9XgmAle7ry8BCHMlC6JqFgC2GGgd+hLON9JQUc4qHbs3jCH8/B7YGm9OkZ0X8mN2Tkjeq6OtoERAIElpJFFmBgtIrjUIeqGQu8dNO1RSFoj7+hu/rDERt+NS4ftH+KC0mizFPpcW186n8t+/uieMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907997; c=relaxed/simple;
	bh=goKGK1LGG+MNlqbM0Sgh9lkoW+uoM9IRy49fxa/8P3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bt8oD75MgNkbyWJUMZucgMfQd42LO1VKUy1ZwKkotolmz6Yfn3K3q6DBeeyq/MQk3dyn0gU9jQPuMlAuMOFpHlsuY2vml4DyleAmJ7UttsrLZ7mP+G7lSsmOFVRdGZYBVMD/FLaJ8muRbGX+XQq7SlmkOe6lPwJnkt1GRZx+PJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISLRi0OO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISLRi0OO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F95C19423;
	Tue, 20 Jan 2026 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768907996;
	bh=goKGK1LGG+MNlqbM0Sgh9lkoW+uoM9IRy49fxa/8P3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ISLRi0OOoediiMygI2Fi3wDlj1zAwl+4l6mcwIwLa6mgDHfbwL85objfTRFXkBZ27
	 arPuHGD8Nktszz1jwG7xGXOsnNq0u+LsrVC9XwABpaImlPqbGgsrrkJCOQ+NhRo/Aq
	 jP7hCe1a7YqJzTXe3E8qwSgxUTnQBXKLVjQpizNdWTqqScejRvEMoEPlYVW9ZzCE9r
	 kjhwg5H0fhN+wLCkzRJUs+wWNkPWvADM5xvjuHQwCMHbMeRiuui5x2IWN6Q1LwRWgJ
	 3ToIgqmDljk2IoQ/YMYEQrsK207U5oIoayAamL+yKzIiK169FIhyQbhJJTJuJrqYt5
	 fY4pK+yJPksPw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Jan 2026 12:19:26 +0100
Subject: [PATCH 2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768907983; l=1364;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=5uioIRX5bNPGEXJdAqjegWWAkYww9nYj6t1Oh9jO/1c=;
 b=6Jqee0Y1Z1DmVLI92TbHkYsSH7bhZvOETJGTdZ4GK+gHDRKvnNhLmbbpI9ebK7hm6U4CbqqTV
 6dbj1baPOmzBHped3k0ti9iYtA/+wEJsgfb3vSpa8f2q2aI6h8BXrtS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The MDSS resets have so far been left undescribed. Fix that.

Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc7180.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index ab1a8d419863..d7e37fbbe87e 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -17,6 +17,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	P_BI_TCXO,
@@ -636,6 +637,11 @@ static struct gdsc mdss_gdsc = {
 	.flags = HW_CTRL,
 };
 
+static const struct qcom_reset_map disp_cc_sc7180_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0x4000 },
+};
+
 static struct gdsc *disp_cc_sc7180_gdscs[] = {
 	[MDSS_GDSC] = &mdss_gdsc,
 };
@@ -687,6 +693,8 @@ static const struct qcom_cc_desc disp_cc_sc7180_desc = {
 	.config = &disp_cc_sc7180_regmap_config,
 	.clks = disp_cc_sc7180_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sc7180_clocks),
+	.resets = disp_cc_sc7180_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sc7180_resets),
 	.gdscs = disp_cc_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sc7180_gdscs),
 };

-- 
2.52.0

