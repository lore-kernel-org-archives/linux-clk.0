Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF43B71AC
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605505; cv=none; b=qpJk7VJPb2u7BLmTCYkTHBTb0OpWbMT/4UJO46UDAaKJWbcXc7tdS69qUrlyxEp0rb8KBexqDNp/ubfrUg8IcfL2VmRaEz3wjgfjm5vkbKdJY+IIKAe+r5HPdO7AiQo5sTv3km1NQ4PP+m7poCOSmPITs+tyJQawF3djZjC+QYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605505; c=relaxed/simple;
	bh=VhvVwtAfDNuAg1qwvDZpBNLxWxfTOjzWnltsKFI4o3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=briWiCW75UjLaft/UhseKmIuZmxQkWxSRCKfH0RuKMT4h9LUWE8yrtELtdDe5njHSlETVKsaYJ8WAg6Z7SryWxQTC7mixJYBCfJum1pukQRldoeKZ9yJy0As663+UsVdr2Kdf+eEacsmTTpPjcOlzrI4f/c4d9X8v/4eUpUKKNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyFikqga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNvzWDye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyFikqga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNvzWDye"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FalTG3592168
	for <linux-clk@vger.kernel.org>; Sat, 1 Aug 2026 17:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oY0156pqRS8H3jydwb6JKz97zZkhWLsRRrSJJaTpaqc=; b=OyFikqga4oKbs+o1
	NYgcSACdyMAKdQwwJSbx5PeZmIFk6daZY5FHcstSrPZiaDRB5P5z6t5VWezbx17T
	sgSxYrnsUBrJekSdI2sSiHw2iGJh75um71xKTGcj+jtrlyQDjHnwfi2b1x3l0k7x
	8aJYmlI7gQzfnKqTUdmrqhoue4HAzWsj6VbH7Hwl9XhczgDJryUnA7ass3XmPyJ1
	C6Tg4cSsmlJJg4IH1sPhkP2ZXMRLhiCw1FG4ZvX7f2CYw7iKDnYXbN1dPGnlkam2
	4aC6LDnD6f7U4wZuCjvexwaliLFDiq7QkNVTefCJ1eUGbL6c4DFLJ2YSy3Q4giy/
	Fo5w8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx1ddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 17:31:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so2256242a91.1
        for <linux-clk@vger.kernel.org>; Sat, 01 Aug 2026 10:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785605502; x=1786210302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oY0156pqRS8H3jydwb6JKz97zZkhWLsRRrSJJaTpaqc=;
        b=DNvzWDyeCx+yUjJp/Xc7ncLRBWk48NNjZa5mG4O/ZuMcpWu3zMMFYtxV4K4vp6fIMb
         nOwLNFX+xH9Te4sl2k81SmOoCQAvLVsGv/MLQUIeQd0ji7ZE/VeuAy7Hzt+J8tTWujom
         vn7UII5qPwyOo9RlR+AkxCRcbDbzsrOTck9fP7xHu+hmW1yDnvR4ln5btv6wQX+EG0d3
         HQhooczciOccKpWrYeKAAf9Y1Lk68LgfSROKkLmzkwXOXEls2oy+pg9bb6UIv7KSDsIG
         9NBJKnoDuSZFrfmn/ti7sUaFiX9Hsb+f+iIVe9AFxwJkkbvmGAXfAApl/NU0Aq2t/34c
         eBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605502; x=1786210302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oY0156pqRS8H3jydwb6JKz97zZkhWLsRRrSJJaTpaqc=;
        b=jhqPZTbdLofEsh59QeJItaVqkhDycs0vuN4tekwu9RE7flW0zZvM/3UpXu8OzYQgTk
         yVMTOOEac17F2/zuyQ5Jn87kmSPxhESA02s9fp1zcwmqFnjYemHPZ63iIrDA2PZjx1wY
         bhYbQlxBrRhkzXrJm63id83z1Knqm2twGi2BSKZLM1FDCphmr4gc+hfHBH6QtRfazca0
         l8K+eLSKcFyf6Hv1w/GbnHKEqbjSlWbuyXLVv+Wm7b07vKdWTR+dQpID1ykngbhrh2ba
         V+KTG0QoaPb1iLdjllZCVZXFYppeyRomwCFaTciePppqBZ7sblCvYzVlqLNQ8uRiIMHC
         YW5g==
X-Forwarded-Encrypted: i=1; AHgh+RoJKFpqYtkwvBJ2JzecUXtQmRnICEjlwxRR6sApjMIPjh/nYuJ1uzYnIuVv08KRSdKyLsbghK6C1BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyowpuHQIDtjKceOkRDIe+cqFuvmZXpZtTb3j6912wiGGtAKVOa
	o3c1797zz1IR5hG+Jf8gZTmijyHUE7u+Mt4u4MheJmd3ELRpU+qMg+coKZU6MZ3f4CECXIfYItj
	nTbYE91pyVxnQ0FjjMvFw/jTP5U3Fj52GnMQ2V5NbqAHoZ4ksJBpkJ6PbzzD6IF8=
X-Gm-Gg: AR+sD10HjD81eshzul8iaFkSudCCgNHzwMi8e0CTMrq529zz6pLIKorYkGmRS/3hPSr
	qWoGISf5hL7KZG9p8OxfBSo7rIzAFvcwzC/meo2TuR723hR9KOdPEGW9d6EBrLgFwin0l02/55Z
	HP1h2Z2MywBcgLKxvuuhsWrnLi9nqHIdXlUyb4YmJNwMrNgsYQu0KcM1ajE56L7sH8zQfprMGJn
	T7qRVGe+yItKsZs1PTbBvcjxoZTRYuFmzcI9zh4jYSUyL8Ub0phOFOyFB+CTchMM4iFLGSSHESf
	UeV4IXCTaHxZYA0pgpgDhzMnpYp9AjAagITxF96nAsYwkhfeYOa1SrnkOzz6KxW3GVpretdiGYz
	pHZZ612TWImu7JYZlKhhStNeg
X-Received: by 2002:a17:90b:580d:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38fbc4e6e79mr4079122a91.31.1785605502263;
        Sat, 01 Aug 2026 10:31:42 -0700 (PDT)
X-Received: by 2002:a17:90b:580d:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38fbc4e6e79mr4079107a91.31.1785605501803;
        Sat, 01 Aug 2026 10:31:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm21865553c88.12.2026.08.01.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:31:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 23:01:17 +0530
Subject: [PATCH 1/2] clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as
 votable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-kaanapali-gpu-voteable-v1-1-fe804d24d2e9@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX0kpa7SuyhqP1
 pYFggINtS28h2JnBiERw97VqZBUViQWj+aUIWxIDz3x6MhLhiRQbe2RdrNXf6w82IFXbMACRRvZ
 6OGSOxBGFxmTvExN6c8lwfzayspVoOQSJjdmjk/bfind+n07Qj1N4jX4Dm8ZCAyAfEUyewc/1xU
 ZZXwek0mBue/Frir6x1LJevgexBZ8z0vuzRw6TGtCMwI1UyOZCyYbo0xvq3xjBrvN02QfaaXXFT
 numfcJE+tACXE33IwZRdZy9QEO4v/8XvetswLer2b03NRRfEAVVRHX298Qf4ZwHbdF970L9TtJy
 wDkZZ78h3vT2V/YVHodBX8XsMnTTJZtyrtBAuv2YDmzcB6pUiabFVKr/YLHJUnMA0BjAqsF8Rze
 7ZfcGZ5NWOF1DSW8zQMLh+hR1QIBeY9kTu4nmTavyrvYc0vGpE/5ofYYpW9eXnVh892U0fJcU6K
 akJY1GwFSQHZ8aZBjjw==
X-Proofpoint-GUID: US-OG-VucXJru2Qb3Yjq17CRwIN2mmj2
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6e2d7f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jRw_QlPnGipwSP_GHmoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX0cnZs8uyF3UD
 9K5wuHPV4DEDjRHbMFI8M+AeV+g1jCq9XZ5m16wJ3P2UrXPqHKVHbWinLfWcsQ6R4W/ZMW5hHAG
 cvAI/iP1ywidl+abMCo0woJHlkgIE8w=
X-Proofpoint-ORIG-GUID: US-OG-VucXJru2Qb3Yjq17CRwIN2mmj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010141

The GPU CX GDSC on Glymur is a votable power domain and hence should
not be polled for power-off status during GDSC disable. Also, its
power-on status should be read from the GDS hardware control register.

Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
Milos).

Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 001b2454786a0c0d63370b3ff385ed5a2bff1b07..cac51de20b2950733d6d48ceb14e60d6181665ab 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -510,7 +510,7 @@ static struct gdsc gpu_cc_cx_gdsc = {
 		.name = "gpu_cc_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct clk_regmap *gpu_cc_glymur_clocks[] = {

-- 
2.34.1

