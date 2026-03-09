Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A9230BE9
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018184; cv=none; b=MVTrXvqc2E3EQaWIqsuhon04g8HsN89XGvnVDoFW0oSgMjI2RqgwkWyy4ArCyAHj6llpTUUitHx8GHbOKK5gyORfBk0ce6u7YmZtJ58rn5sl4aHDSB91uWktteijwAcSZnatBeDwKKLrlujkq7m32W1CwcpSnyjVNjCGG8vDIys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018184; c=relaxed/simple;
	bh=54FySdoCpMc405zPMaBhJGkJ4yy8qJFATdXyg6K3oJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVKD5cP8wNBGFz2ni+r8YXjwCXFRsqemp5U5uB3RKuvMfvxLKuxk9V2Mn3QAC00RH7Gvpgmw3Jba/+hr8HWQ6Nk9y4mnmb+mYjFOQCIRfCbBScqGgYIb8CqQ45/w0rqdgfe/e3WMfVqzsulCnmNpDOM8P6pq0kxRzmOkeDi5zwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=O7DCEhmr; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="O7DCEhmr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Skoy8XaDcb6s+Vf65yWfKfxO3TZvtjM9gOL278AiLp4=;
	b=O7DCEhmrC5nZCRFxd2SxJY6Rxayn7OMVCGLAeQWvfigKl+bN9e6dTzp+AUjhNMtirLKNaD
	LxcN5YtGnwj5pTb4hgGEktKeH1wajFSRhYztCGrzyCMidBkr/n8WDfXHNDar/qkmx/PjdL
	0qNA63E+LSNjvD282wjZ13gPhTHlCKWjjFMqu5F+G5O1CxqB9Zqq79aPBaSzEU+GhX08tS
	YNjwdeo+jat+bceHanVMw/g62w2xRpjdQxez5ku8aY9FnZ0KW34u0+IQhMptPh0oI7BjZ+
	TU3iT8lMAjHQTBdIibilVVbnT919+sDehNBzlamHOugleLy1BJ1Hv/vZml+ORw==
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
Subject: [PATCH 3/7] clk: qcom: gcc-sc8180x: Use retention for USB power domains
Date: Sun,  8 Mar 2026 22:00:25 -0300
Message-ID: <20260309010214.224621-4-val@packett.cool>
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

The USB subsystem does not expect to lose its state on suspend:

    xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
    usb usb1: root hub lost power or was reset

(The reinitialization usually succeeds, but it does slow down resume.)

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 55dabf6259b2..b116a9c0b2d9 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4172,7 +4172,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
@@ -4190,7 +4190,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
@@ -4262,7 +4262,7 @@ static struct gdsc usb30_mp_gdsc = {
 	.pd = {
 		.name = "usb30_mp_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
-- 
2.52.0

