Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226905;
	b=VgcJHCTpPkb6aFkWBlTaR31zTYYalzuuuBWJTIUGHbCIc5s2dOmEkq16wb8RKAhGnbfK
	 UsGbN1agnfcwyLPkVioQUNgjnqRrMGoTC8vM6nBzjXHzIdW3PC3bkWSj462DTqJGz3ztV
	 cTRIezD0Ci+yNJF2TJ3GpWu47+HQIeajUuvQMwVLooXruCQteCqJ3XZUu7JW2SXk5dXiZ
	 MEbDjzmATMskm8PrLviKOrMkBd25lIGUn8sWKuhJcgfxIW91X9Jpt+LVbfusccf4RTITF
	 SxXOwbGJY21CalcaTz33vjkkyYH2wgRSEwjooVjiA2VGV2z3a2bWnqwZ1hh+VwRwi/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226905;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=IKT3fon1/d2i1xCKh6MuLfmxqe3zW+ARzjd8XukPj2w=;
	b=aekZtFAAh2R1+LEmT7UCN2QnhbcKAiwi8oiS4B1Uf3C3OgCVd22zMXvij+ugD/A+eMfI
	 JrfweFDxWa4GKyxxlMYrZ7pQ6VTw9pQW2t39fV12kMdcQPEHnygrUSwxytfzK13wFCNLA
	 uIwiPqwEH6tHeCMxM2ThOnDtdofZRMxkRxRMUeMsftYE2+4nJiqpXvkIM6ApgnElhr6U2
	 Fy9rZjzkwFOIOHFgfiITNoR4QnsXxeMVvmvHZtHqW/pEVDUhweLX6VbS+4WeDDYLcaql5
	 TshCpVkekC37z+jfWkPkMrtYNK7B2qigdRTnv3DNrTEe7pspneN1J6ehq2/7qnYdwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uzgUEhhN;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6C606A31D
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 22:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF6C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uzgUEhhN
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261028223456euoutp0126ba8f3ecd1903582e877fc60ebd4ed7~i0lxuWEIj2793727937euoutp01M
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 22:34:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261028223456euoutp0126ba8f3ecd1903582e877fc60ebd4ed7~i0lxuWEIj2793727937euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793226896;
	bh=IKT3fon1/d2i1xCKh6MuLfmxqe3zW+ARzjd8XukPj2w=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uzgUEhhN2VPvwWc7NCk977UDCWc0R+7u+3YrjcvLkdVWAsx9TGwmfmIxZ6WHGJyBa
	 Tfzhr+KwybuckEPex05F6nwZuXSSs6y2UOa4Fg4yrhySSB0vwF0f2MBbH3WjnGR4dG
	 2bHzXTMbYUs+Egio1F0OgioVsRKYd94GZ2BWr0TA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f~i0lxdtLPe2611426114eucas1p2G;
	Wed, 28 Oct 2026 22:34:55 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261028223455eusmtip23dad5630755bebd4db06b58c16fce3fc~i0lxDv6z01026810268eusmtip2G;
	Wed, 28 Oct 2026 22:34:55 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson
	<andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, Krishna
	chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH] clk: qcom: gcc-sc7280: Use retention for PCIe0 power domain
Date: Wed, 28 Oct 2026 23:34:43 +0100
Message-ID: <20261028223444.2683120-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
X-EPHeader: CA
X-CMS-RootMailID: 20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f
References: <CGME20261028223455eucas1p29b3028675c392f6c0ee012f08963ab3f@eucas1p2.samsung.com>

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, it keeps the link up and the resources on
when an endpoint is active. However, only gcc_pcie_1_gdsc was switched to
retention by commit 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the
.pwrsts for PCIe GDSC"), so gcc_pcie_0_gdsc is still powered off during
system suspend and the controller loses its state.

On QCS6490 (Thundercomm RubikPi3), the Renesas uPD720201 xHCI controller
on PCIe0 doesn't survive suspend to RAM:

    xhci-pci-renesas 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
    pcieport 0000:00:00.0: Recovering Root Port due to Link Down
    xhci-pci-renesas 0000:01:00.0: Controller not ready at resume -19
    xhci-pci-renesas 0000:01:00.0: PCI post-resume error -19!
    xhci-pci-renesas 0000:01:00.0: HC died; cleaning up

Use retention for gcc_pcie_0_gdsc too, like it is already done for
gcc_pcie_1_gdsc.

Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
Fixes: 1a58ee1330b2 ("clk: qcom: gcc-sc7280: Update the .pwrsts for PCIe GDSC")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The issue was analyzed and the patch was prepared with LLM assistance.
The fix was tested on the real Thundercomm RubikPi3 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/clk/qcom/gcc-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 78399993cdce..9e141a7ac424 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3101,7 +3101,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE,
 };
 
-- 
2.43.0

