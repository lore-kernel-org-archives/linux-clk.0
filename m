Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8C2238178
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018188; cv=none; b=aCyD+WflxNh/3wJFpkC1zekPWW50nANF/8QQWXG3K2vzpcI3TN9QsxHPuqmxsPBEBx8RTqGgaC9T8HYtmVbXlhwAt85fIaD7UaAx17/Cg7fMtkB50NH71uLpa8hqkVFbYJfv4b8UJIAoQqcp+b/4maEoyxenUWa+02KOaSlOSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018188; c=relaxed/simple;
	bh=1gflYDgP3JJy3XDGEY7mT1YcroKlO2WFBTsIAW5MLa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqZDru0tQ0oGTySlrjCf+fbpJuHvtkk6OpPlmMPEHaDwy4gzyvh6CeYYKA+45n6vgk/xIWnTFwd7P+6dSyS2AtPEcXa98vAhea4dJtMtDyMqsvyE+6udy2HJDR/DZKKsxIoO9jziORqugHRRgnnBCxp5l5UYTP8PU54QBPbAhIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TaMCNiZR; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TaMCNiZR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDtPkp1DF65VL8O9lNO8R7JXpbFJd5I/n79YglPPSDU=;
	b=TaMCNiZRBJgZmWf0m/sn/U1YznnOzxHprYN6y4ahYcffd6ESjoVhR2k7W/TPbeEApNtX81
	HmWsI55MolXFy4EUQWwt5C4KJJBzJMT5fQo42t+Vs7tHYm35/BDGqdECLuHwFDQybYKrXO
	58VXab58pcBNVLOSV7baIqwc2Wx2QUaKR7LSaR7yWLwmWM9oYVkxOgkAP8dJjYpAOcNS9R
	4JeQk2kpMPyi/YpUHqTQhOhGbLvVKsV0sMgh0IvXE4p2rX4jBk/WWdrdD6PYcq7fiHXH5/
	B6kM0O3wyeYjTQqwiNqIFB+lgt7yP7h/72wodznU7Qgd2ZvehTSGDtvoWqDHng==
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
Subject: [PATCH 4/7] clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
Date: Sun,  8 Mar 2026 22:00:26 -0300
Message-ID: <20260309010214.224621-5-val@packett.cool>
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

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, use retention for relevant GDSCs.

This fixes the link not surviving upon resume:

    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
    nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
    nvme nvme0: Disabling device after reset failure: -19

Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
Signed-off-by: Val Packett <val@packett.cool>
---

In case [1] gets expanded to cover all SoC including this one, or an
alternative solution ends up being implemented very soon (looks like
it's not going to be [2]??), I can drop this here.

[1]: https://lore.kernel.org/all/20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr/

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

