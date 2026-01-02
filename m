Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3671A9FBA
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347039; cv=none; b=WI0O1dXn0fQRNL5/EwVFh3rHviRvNt3ZMKcV2HqpesCMHI5AkF7MR+GdES4TF9N9XMbsjUDXLWl8CdTkWeS9iPfRQrwbfBhSXvxbQb1qt7sOmrDFw95pHt6gmP+Q/E1FUmvhdYaKw8YcH6o93QkCfWgWItFSKazI/tMofkTHcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347039; c=relaxed/simple;
	bh=XOkRcbE8VNIcaH72U7IUKRFd2thHuZrA+nnkmZR8f54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTNbu3ZtinchcG6F5imkiA+jrcRVQWq7VwN6eNuhTpdknEFxbLLTI9g3NwksiXKk+XMEh+Lq6wp48L9Fgyr7BvQ23YY7jWzt5s4tEHCdst8MwRzXWDkV9/N2h0g5GJ966vvBRAC/ruoA0ww1FhOzk8zpp0kM1Lnohi6lI2TMHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PxQnKX3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvZnHEu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PxQnKX3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvZnHEu1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vxti637453
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 09:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOB3/Mj6YEEp2iQxLvfoYJN8gYJUopTS6O2MzTLgi4U=; b=PxQnKX3VyQiRuG0G
	nSnOLCfx5jkOruw24HWijrmFHmjdovTfpsWMRxbMIPK9khBflY0cGAT0q/C7cV3x
	sCrIxLKagRfLnRtEccmzAO3t6/za9hdZ3v1RKy8VhY0dep4dyT7XKnINcCe0bfVj
	6WNp9VwLnU+2/1h1to4i4NvhDMkIgwtmR797jgM3hkA/UqNWzfghV9EmU+vv8s5K
	iafLOXC7lo8aEnKWzYczVkCSrdjttdwU+LBCLWjBlkjgOW1QBPbZrq1PzzQQsWfy
	OW7Frw6Xptwux2I3I/3PzgAvSlXu7D4Z3zdliQAx2uQDXnDwLFnYbgB5InZ362U3
	4ro4gg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8ufuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 09:43:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso11167701a91.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 01:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347036; x=1767951836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOB3/Mj6YEEp2iQxLvfoYJN8gYJUopTS6O2MzTLgi4U=;
        b=FvZnHEu1xZKOvP8N8hMNVQwN2G1PbpC5xI80J0oEeGcHoYQ2oY7PuV84hbhv6XKizX
         8DfM1aLGWo19oMksjXzQrFEGRd7QK0T6iMEnhtwlT6ZF2rcHmudoqZ1LiXCQnfVMpU2W
         ngVz8BZr9Zw8AUsfrDLA1nSkBd4AmSUR5uItMQY7vddPQHUw5QtBQgCe7WOlOd+fnNX0
         JUnhWkrUPp38S3BProLIqW4KhHBOeotwmaqBtYNeKGCy6zGgy6L5h6jp7Q62jLQ33Esm
         QLz1NVTZFrK4FsSSOCXFn95MgcakRZr0iNtdGMkpjhquWJCzT7iq6czQX3N61SjfeGD8
         8vEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347036; x=1767951836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOB3/Mj6YEEp2iQxLvfoYJN8gYJUopTS6O2MzTLgi4U=;
        b=nnxbTm0hw1qMZn3Hdx8fffgXr6SoDX51kz67paAThPRiEKHLu56/Chvqa9LvCMz5OE
         HEciqMmkIzVlPsuSLVJD9P6ooo61O4UJKmrBcq4ODbp6P5wdUkMhy8IUHaakZ3u0Atw9
         FRIQF661D4Mgie8IF7CA6kfHIHTplvLW53A/Z5si055W3ZShmVZXJwjEDwC4SNQOEKRy
         lJxksTBVe2mgntwcau1CbEUEqQf/9M96cco51MKE31tAZ+wInM035fqW1QuKRaro53ZP
         qXJgfchJs1he35phjdjarnRO92i2nhRZpV3FqTE40CQOj36V1XHhM2AUP17px9iLMLv5
         YOUA==
X-Forwarded-Encrypted: i=1; AJvYcCVW4cvwVmaNDiyYxV5nqCO5KKh5nt+aB6aCIcWYwprv2EUKSd4qKkJi0Wlw+PAy1iuHjSr1ZNxQeNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQa9E7/CBvWD3bqZgeIMC7dfI6lBH7YwYUMYEelvwsj6ZwOhCr
	UmpiWxZdvMphnnaSa+uIrHelBz7RqA7huOwbO9oCoI3J0Gf6i9Safd6+Ckx57lbD16u09+DC2Nl
	hnj0dddY4/Pxa9pe90GVfoMt1dKPUrhR/WELRn/PJEGZMt7ig3E7VSFNPifhPM40=
X-Gm-Gg: AY/fxX7oJe7cIToxlGTC3hm/28vNuwXaxtbkDhuHx08SxBswiY/UsarIxY0OBtLr071
	gug7JRF7At0vGgn46RrJToa+QeL8PgLovU7FkNYvyA0L3E23y/hDKjw6Ln7k7+GxbCuslaJCfwl
	2gSAGqXbDA4iz/PIFD7VywFdTgcupJrWGNsuF6ho55Ml5cPL95MTa5j3CvIVouzWGsMmthUwk+V
	/3UDYFcb+/sb7BVMFTnrHlPfC+FcwKQqs1iueRxs5OZQthqaWtWJC3auyxaFIBILVOhmxGm0adW
	OggWJyzBinWFRYJSk52u1dubxVPOjuoC3sJxrVo5hPaUHQfrdjUDzXvzo58tvylcnhsqmIMBvc8
	fpqy1srKufgvPvSIRQwiYSwypfXr5g0WmrthbvhGhE+7h
X-Received: by 2002:a17:902:ce92:b0:295:99f0:6c65 with SMTP id d9443c01a7336-2a2cac808c8mr473754985ad.30.1767347035596;
        Fri, 02 Jan 2026 01:43:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEke919yfCWNZoHyxZwMBFBZAVTXKnc3GjZ0LA3ZosF28wiOBSbRO02LbB0Gbt21fRWjNr44w==
X-Received: by 2002:a17:902:ce92:b0:295:99f0:6c65 with SMTP id d9443c01a7336-2a2cac808c8mr473754745ad.30.1767347035105;
        Fri, 02 Jan 2026 01:43:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:43:54 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:06 +0530
Subject: [PATCH 6/7] clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-6-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=2890;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XOkRcbE8VNIcaH72U7IUKRFd2thHuZrA+nnkmZR8f54=;
 b=0lEpbA+NtXZaGfYZfqD7BMu6USHFAdGSoxKy6fsm8Qv5CX5UPMkw7AeRdMhwVUuKINcq+KX2V
 3Y7ItxyFdHBAV3D28EafXpNBRIZANTx7XWom0Hc4uuwcP5TDNbSu/JO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX0F5q1tkaphBT
 tMekQVOMvI4VohPTTijePu0RGaq3uYv8k9Dd5iK1+95L7zjBC0WP7Bhq9pIs6B3rtxWCY7oUpa2
 MTuzZsB9dsQ1VhQnjnnBtAKXUERpV6SbW2ykWHIuxAcwW/aVsQkXAtJVqiJ6v76dRzHACjj6Rtj
 hyInYikVhbn2GF7ElxpB4em9GQLM2i9umyBYRXPdJAb4hqxbFdrDPPGWew2Cj2UsaGRLCTjrIPa
 SK5teZoy2Nn9ZRITYoBUcpYXPcUZnlD/bk5vheT9nFV+Va5orPXQKGTiSir5FWFbsuabkNp6Pcc
 QR0hBbDZf/xgRU/xn4nYlOhDKTChLgl4HjHYHC8c7KIHde7WqI2lMNXICaZCOExpiOEXobpUoCe
 +0wYOjKeK2EL3/17LDgxTZR3d9WeUTtm8jEY8FZG/+ji1gZSh9iXZL/xWPTiILVeeeYscALJI0f
 QW/VX/eSciTuLlNSrqw==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=6957935c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=APsdKiKIpUGVn09es9MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7A1lwctX-XfodsXzRgdMftMvAjasZ-k9
X-Proofpoint-ORIG-GUID: 7A1lwctX-XfodsXzRgdMftMvAjasZ-k9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index e46e65e631513e315de2f663f3dab73e1eb70604..d659d988660ea5e548fcae6f9f2a9a25081e6dda 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6490,7 +6490,7 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6502,7 +6502,7 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6514,7 +6514,7 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6526,7 +6526,7 @@ static struct gdsc gcc_pcie_3_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_3_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6550,7 +6550,7 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6574,7 +6574,7 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6610,7 +6610,7 @@ static struct gdsc gcc_pcie_6a_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_6a_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -6622,7 +6622,7 @@ static struct gdsc gcc_pcie_6b_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_6b_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1

