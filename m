Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D2B269D18;
	Wed,  4 Mar 2026 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632164; cv=none; b=Lse4WZACY78vaazZOrg7Wu/cYovR0B+SfDbHRy+mqv24Sv9yZGhFGuM6lR0vE9V0bDHwUlo1Y6mggL9uXgEFSAy/VoiD254hPZWUzot3o12nLa2OuFqeCFn2xn1m6Z/fWcMhqdrjfga2D0XMzXGw32H55tNLg/QdLLluwA4I5Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632164; c=relaxed/simple;
	bh=vdYSfYe+LY9za3MB3co5bUMVIiBopfdC/Z3KkpRvdaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv2340Zm8EIkml+5Ul1cTIJmZAG5bLV2P0b5vlUoU7ZqNlbzDJZL8a4eyPHU1PHsOzZ0hGWZcPrhe4rXu9gwvciPPBHGHQXt/xDoqhZ6gCeSR27a64CdZD/n8LOMDJQ/llRHUj8u0c9kPh7Apn3flx1AkQU972D4JP702hDM+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzbY0BTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzbY0BTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF498C19423;
	Wed,  4 Mar 2026 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772632164;
	bh=vdYSfYe+LY9za3MB3co5bUMVIiBopfdC/Z3KkpRvdaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MzbY0BTmTuplRqCm0bOoOT1HfCvdDRceRiIGD3nVCeEMK5SK10kMbVWfV2Mi6M2SI
	 +eoBQ+iVQF6hItLJWzOihWVf+LQ7d2cosoaTpJadaXu1IwpbvDn/cw8X5uEKCoWJDc
	 KATfkaCnnza2NjjugMU/McYI/cvV8wo7JkHcO27VXb0AAqxerSmqTmgZmh3TpjwIU3
	 +tukt7J40BRmFFFQZfwtY2QTjBLfwtiB8mo5m3jfl4XqqjJSiuWiIQzeaJ/IfBSNNY
	 qXT3yz+Xu/MUyOXNJBP4IzwpBD4rg3IZyXi1gwKHLNhBELqkEoLTUw0lTSAcLo72UZ
	 sgOCCv6FSzEGA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 04 Mar 2026 14:48:29 +0100
Subject: [PATCH 3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate
 setting
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632145; l=1261;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MF0JanTEWxNV/9f4S+Pk8kCafN/XJm2+GOsaJMVSqXg=;
 b=UZ5YCWXGwUbb3exjQ+pczZ6HMtnXaWWlPxhb6Vq8EvQS0dtDwOTkNjsC6EYJu9I8UDMTQ+ZPb
 7rHPTGN3XgTCE9/Dn7fE5L3HUv7gKy/HMPR3FuHVVZDQcg+ZcoEIa/l
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The clock tree for byte_clk_src is as follows:

   ┌──────byte0_clk_src─────┐
   │                        │
byte0_clk            byte0_div_clk_src
                            │
                     byte0_intf_clk

If both of its direct children have CLK_SET_RATE_PARENT with different
requests, byte0_clk_src (and its parent) will be reconfigured. In this
case, byte0_intf should strictly follow the rate of byte0_clk (with
some adjustments based on PHY mode).

Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.

Fixes: f40b5217dce1 ("clk: qcom: Add Display Clock controller (DISPCC) driver for Milos")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-milos.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 95b6dd89d9ae..339cb1c63ba7 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -394,7 +394,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.53.0

