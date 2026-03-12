Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E5A3B894D
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314660; cv=none; b=WoU8uTcc+oHmZw5RTbfcPqiw9cnIQmJ8XvNOqBbzwh8vhLaehn+2D6tPosuSh7PHkjMDOpY3s2f6T4rXeeH5ScURTklCLpXRb1fH96LwoXScr779hBPg5CO+e1NgyHnnSlyugPk9cvF4r6xPjfIyQSRs71b3raLLgpfeZMzjFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314660; c=relaxed/simple;
	bh=/j/Ambs/rTjtGg1d+Jw/qA/S3EU/8rQakW2oo8t7n1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIQi1GDH4n1wvT28fODZJJNGrZpXo93azVBGBmvack+HjV4eZKCrGAxVRlPJCnjqCBNlnqKmbbCA/jxM6crBgvGAV0Cd/utgnb7Lh4gYmrf3TMtbL4A5jCp4htoSVZjjCvJ5mv3g55uFVR5YKR5HmhixALwGxZD7SgDd93sFoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=vLR1kVut; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="vLR1kVut"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYmcpjf96fKpETw1f+1vsmEXvLg+reOV8ikWblNG5mY=;
	b=vLR1kVutshNofmpimaaqEvaxrbHQuwQXlcWQXHE+CUZpa2N/IfjNTSOViKHJU7SNz9FktJ
	YMDjabUFc+CNd60BgdRMa7R5yiBriqdMPj0mbkxhcB9IxfdnRlVqksCdwEAyfxwe/C0ljL
	g3b8CgyPQ8lxPvtWd4GU5aQ4abpl/nP/8N4XXg6M7nQlaw8/7onyM4vPa+HwPtL500REU9
	XkwfU6YhjNc41N/YNq9MxSaT2lH12Rv/ppiVuWLTH7ns7KnbQrn/djpYo6zWVmuAMRBkgx
	AYt2at4NuuCkATJ23vf4dDoqOdHV+LejAVNrMemhnnH8INSlCaM8qwPxe+EZUA==
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
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 04/11] clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
Date: Thu, 12 Mar 2026 08:12:09 -0300
Message-ID: <20260312112321.370983-5-val@packett.cool>
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

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, use retention for relevant GDSCs.

This fixes the link not surviving upon resume:

    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    nvme nvme0: Disabling device after reset failure: -19

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index b116a9c0b2d9..4095a1f54a09 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4199,7 +4199,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
@@ -4226,7 +4226,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
@@ -4235,7 +4235,7 @@ static struct gdsc pcie_2_gdsc = {
 	.pd = {
 		.name = "pcie_2_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
@@ -4253,7 +4253,7 @@ static struct gdsc pcie_3_gdsc = {
 	.pd = {
 		.name = "pcie_3_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR,
 };
 
-- 
2.52.0

