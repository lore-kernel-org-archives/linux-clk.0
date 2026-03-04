Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD637080D;
	Wed,  4 Mar 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632160; cv=none; b=HGSAKulvCbr2974908TwZOnclph4nZH3lH2Oq2fPneeaeV6Fr9BjvbLta7JqeNdfhLIjAXlWHNoglzE5tsxgNqBXvTWicI7TT8P3UxRNfZFm4BR0aQMjMkjz8Bt/Fj4QsBRSmp+VxjjbFtHbDlj3sHeFp7QpX4MXrOyFT7+LLjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632160; c=relaxed/simple;
	bh=1d34+Yly/nC8wD0SX1hTAVOvXfMo2MjYJGnARV4R/GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HsINe1zXOYo9EPhILKJ+0qL7fYC9sLOOuvS0VxG0Cc8O17zlu0cB1cW1RQto1gRO02X6sHgiH9r8G0pfAStZDIRg944cQVWPNIQdKNF/X0baPwOw72L+VuXEM/06gOKrmAN9Gb21jV+VZ0FStru6N2WScHZ+9pcJ2A9Y0lLLDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiGYFin3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiGYFin3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0A5C19423;
	Wed,  4 Mar 2026 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772632160;
	bh=1d34+Yly/nC8wD0SX1hTAVOvXfMo2MjYJGnARV4R/GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fiGYFin3dilAj1lR04O9UZBgksNah2KJBpsu19LNaNg/KidSQolElgnGwNC3eFPrj
	 SxRHg4Iy5878+UHfLmxgzHBCIOAQy6kuijUboaqU0tTan9bMi49jjiyy5K8DQnx84U
	 JxCAMpb1Dfl+6GV26lQbtcy4KD5l8ZYParapr0nw3kHhhzHYPpliSdBLY+M+BUvNOF
	 458ISEVBgOVNznoeycbjvUu3oUTMEcEnWsh5GTDmDfpYGvw7INJzRLQcqHSOhFfU4X
	 HMHEBaXqz0FDgu/MAcqYZWJRNUE/vt4uAypyCQqo8Ehe3nekaTDZOpFiV1IgRfszhO
	 l7iBpYXP6JGxw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 04 Mar 2026 14:48:28 +0100
Subject: [PATCH 2/5] clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate
 setting
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772632145; l=1520;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kh9a965RiZDaMq+xJBTBHJIKwlkkIHQYu8/VBDgz1rc=;
 b=N7ZjRVpbPEWd90O2G6h5lUBtTZnVHywfKGa93LkY6NgV2IAaUtf043OwDV2ALLM99+Jp9ZBPd
 uinO/uyg1WnB7t6PiaKL2JvfT2hI4+Ux4lP5cgFlPw4I6iJKMO2VG+4
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

Fixes: 6c6750b7061c ("clk: qcom: dispcc: Add support for display clock controller Kaanapali")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-kaanapali.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index baae2ec1f72a..c1578cd07041 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -800,7 +800,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -815,7 +814,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.53.0

