Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F73BC69B
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314673; cv=none; b=BihKYUjCZL2NNPTEPqigQQPMFzJxcWM3kPQw0Y2YNFTgCe/yNN7W/Vnu53iIkMpoFv8hM0dgDQm2SuXQg52Z4OGNUm38fg5EdN5dSeK6IXkalLYV8Vf8TKKqh2/L4hbAWCvKCAGlWT1me1neoznU9paUXsC3lpd5Gq6DLR2jlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314673; c=relaxed/simple;
	bh=/tmKxqWvNYa6MuUMQn+keyh63vEc8tPLub4G+YWIYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOcdKIhzPiFNzoC7RUHoyKLdpLJqITA6Ly6tdCVNP9C5PufE9UbFMmKdY2Q8M5e+BPLz0cpU1P8DR/77HQIKRGY+U+b4HiicUflLQi0r/qRwpDYlF5YGKzChou/cd4pSdwt37yCAlwCJ4qKDGkesvbJEw+c+hwHjfyv3hgftOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=epMDnH1M; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="epMDnH1M"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzW6GgYT0Hq52fgkX18bHoLKVtz4DvDWuePNOqfPfZY=;
	b=epMDnH1MBr9n2q5qyz6OUtR5PLmPfJKXqHht82KSgIV9rMPdn68oqjkSukJIenyrCp5mTL
	hx3IjIvHHG6WZ5GqIlGavqdkPjW5RH/SfyyCdwk5lix6RWibJIZOYFcCXnz8/xLBFRtXtq
	+sbl4A2EPZpdEIwJWAtq+x01fBPkAvgtN+zgLR1k0J3aNTn7RBEEtwABtVCmHcdo5RZ3nx
	lPoBIXdAf/xWvolCabVsfRjwnwDYoExjovcjXbs21ehO+3CIaVt+nHnVsXd4EjfweZoi3k
	mxuzQoZ1VhSZMZm4w1UdKldKGMVAwoR/Yi+Fa8VeDG2sCiK4Cg8cprkyTyhNKQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
Date: Thu, 12 Mar 2026 08:12:12 -0300
Message-ID: <20260312112321.370983-8-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

mdss_gdsc can get stuck on boot due to RCGs being left on from last boot.
As a fix, commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration") introduced a callback to ensure the RCG is off upon init.
However, the fix depends on all shared RCGs being marked as such in code.

For SM8150/SC8180X/SM8250 the MDSS vsync clock was using regular ops,
unlike the same clock in the SC7180 code. This was causing display to
frequently fail to initialize after rebooting on the Surface Pro X.
Fix by using shared ops for this clock.

Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 8f433e1e7028..cdfdb2cfb02b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -632,7 +632,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.52.0

