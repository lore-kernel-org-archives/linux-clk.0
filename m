Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093C7242D6A
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018193; cv=none; b=fP+xvHRkImXhOvaBAsJk/2cc7FqMDYlAObKgz/pEI8iidlHL1n8kY6crFU9RcnD3KO4CybYf1d4rzq9ubmUks6MjgT7RQgykey1GjglaawQAlFkmzXBiVldrAq86aJodR3VupQJHOKxzuvvYgFW/uPrBURR3W2ioItc4pRbbRCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018193; c=relaxed/simple;
	bh=4XKDL7/f3y+v0PqXInCYEFuB7xNjjwRcyGFHrczOXVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOKofCFq1SUSrDYg0CHzlticZJHmfNEas6tIZpuNd3qH9XxyCfda7ORqxIZluuQ0154jxToqyRiGodZQA52iZNJBCD46SW1ogeToFQ+123KZxlwKLJHYMb8dUTkpghlEtnYXiWR0CsHZTk1LHKa3sLkN0QiNHvyPLV+lIINgyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=XFj/qWh8; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="XFj/qWh8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=izTakImvKyjjGPCZRwPAdwU7D8IgjDbDL3fvc4uR8JM=;
	b=XFj/qWh8J9RmBHws/C55BvTQYaPXn8eQPR3JlKYmdeIS2qk74Bs4YUmR0ShGK57FZZJcCU
	x3xstJeNHj8hFpXeu+ZZjI1np3JsWESbTp++S2wmjW4uCMIqlA0Lv4lRzwWHatH9EEDyKm
	4zue2/G5T+ksBp3rrrLeuyo9JhxVjhyp9peyj7cf3+5h27MhWqfbWbSMvdFWN9GGu/kdAB
	cY/ahxWVitzQYyrkPkwswvGME7V+eY7Hyonsw+HppnYMXb6lHoQM2htsMXg3IcrVj9k576
	GhCRvLxYW1++4w/7O79Vq5PMfXncxcHbzakPCT1tMfPzJXJH/DMpNQydez3yhA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] clk: qcom: gcc-sc8180x: Add missing GDSC flags
Date: Sun,  8 Mar 2026 22:00:27 -0300
Message-ID: <20260309010214.224621-6-val@packett.cool>
In-Reply-To: <20260309010214.224621-1-val@packett.cool>
References: <20260309010214.224621-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Similarly to sc8280xp, the GCC GDSCs can and should use the retain
registers so as not to lose their state when entering lower power modes.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 4095a1f54a09..365943cd5278 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4173,7 +4173,7 @@ static struct gdsc usb30_sec_gdsc = {
 		.name = "usb30_sec_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc emac_gdsc = {
@@ -4182,7 +4182,7 @@ static struct gdsc emac_gdsc = {
 		.name = "emac_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_prim_gdsc = {
@@ -4191,7 +4191,7 @@ static struct gdsc usb30_prim_gdsc = {
 		.name = "usb30_prim_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_0_gdsc = {
@@ -4200,7 +4200,7 @@ static struct gdsc pcie_0_gdsc = {
 		.name = "pcie_0_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_card_gdsc = {
@@ -4209,7 +4209,7 @@ static struct gdsc ufs_card_gdsc = {
 		.name = "ufs_card_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_phy_gdsc = {
@@ -4218,7 +4218,7 @@ static struct gdsc ufs_phy_gdsc = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_1_gdsc = {
@@ -4227,7 +4227,7 @@ static struct gdsc pcie_1_gdsc = {
 		.name = "pcie_1_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_2_gdsc = {
@@ -4236,7 +4236,7 @@ static struct gdsc pcie_2_gdsc = {
 		.name = "pcie_2_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_card_2_gdsc = {
@@ -4245,7 +4245,7 @@ static struct gdsc ufs_card_2_gdsc = {
 		.name = "ufs_card_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_3_gdsc = {
@@ -4254,7 +4254,7 @@ static struct gdsc pcie_3_gdsc = {
 		.name = "pcie_3_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc usb30_mp_gdsc = {
@@ -4263,7 +4263,7 @@ static struct gdsc usb30_mp_gdsc = {
 		.name = "usb30_mp_gdsc",
 	},
 	.pwrsts = PWRSTS_RET_ON,
-	.flags = POLL_CFG_GDSCR,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
-- 
2.52.0

