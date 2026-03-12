Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEA3BE649
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314684; cv=none; b=HHvFZvdgmHJvlMC6sSAUKYNWuqDV7giCZEWg8PuwuBpByiKyk2LvxeWNyH20DDiRrmCVyDYlb6tO388rMgdr3TCcvcHiOXK7nDVWGhw6u4M9D7nKGrN2oEfd3J1BGvKEwiCYV3xWuagf2yn/lX0WRwMHBsCbhDZoiPgn1hGED+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314684; c=relaxed/simple;
	bh=h5l7xTESRGG/9LA6K44BUKx7xT5XlvcESjqI4YstRtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQIfkJUc60tAQet3+wn2p+c27SQGFNk7kpNwNcq/s34zJXQ5waQVucBOrw/ehfFtaY8KPGqOGgcKDN6/gRNGUGYTuD53x0a4Gd8KGU7uMFU3x3MVXxo3YBz4N9ZMRv5GMcr6gyX3reyq1zbRAkL9pKbiK3SSgiWeqhZZE6Y7WBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QNxjmAaW; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QNxjmAaW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEYw1hMn+rPN4lG8dtzxXDk53oCQisDbgFmhbdO9lCM=;
	b=QNxjmAaWGLM/ajhmOBbHnVGrHTO4RpU46uCQwUSyHAU2YTTcUkozDtHhJSvtuKqmI+rwmQ
	I5S4XPa5KXqw8q1Y0/wbdsSeGaO6p8MaEYWBchEjR93WsSQBLimJEs6o70iQA6ZhA3Gs2J
	77u6ePlYLGY7kOWBFfokkSR1IIaw37ucAVkwcBSq4Cymswy6rBB5sgHDLTEXv5aA78w9+S
	9VJRWfOzA10NKMjUqFvhav3WC8bq6nHGowq/1c5ddPfiUxjPln7I01qjq9L27y7y629oVe
	428ODD02imj9SLVkz0nbsO80HLQShi1hJSjPPQ7saVrn1bOApKwlMxA2ElJnKw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for Titan GDSC
Date: Thu, 12 Mar 2026 08:12:14 -0300
Message-ID: <20260312112321.370983-10-val@packett.cool>
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

These values seem to have been copied from newer SoCs, but e.g. SC7180
and SDM845 do not use them. They seem to play a role in causing the
"titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.

Remove to fix.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 388fedf1dc81..cd4c40a81c28 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0xc1bc,
-	.en_rest_wait_val = 0x2,
-	.en_few_wait_val = 0x2,
-	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-- 
2.52.0

