Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D8A39BFEC
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760983; cv=none; b=mwLgjdI2E8bGs+ySE/LCnn07jZqp7Rewe5jp/wqO5rspMUtMtQh/Lt2ya8HmRJOENeGwlQCJyZNRppGGo60CyudEh7qcBrsN55+E86o6mvzJFvDzEZgPhioOwU96cAJSEqvJOzLX59Ug2DezJEeH14GeJJaWQwB8EK39QVPx/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760983; c=relaxed/simple;
	bh=x9pPgdTso6EIovFSVop2osdIAIu/Fx5ph/TfnxYaKtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Exf2dQJT7MvOKtwLCw0gp4GoIp+fFdzMqr9WaRcv9CVvIDbXyxaTSSgXq4df83/JuntCJ5huSAqKzI7i1Zwid2PJ+7U9L5+l009TCiYMJCyEH+QXtt3nyzunpRKToaoHvQ/rVRqEa45hgsa1noEMaKStltan8VVuF7qOa1ozy/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evSgZQlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nf7bxInV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evSgZQlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nf7bxInV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGJx243401142
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=; b=evSgZQlCDaNRTGiO
	/89s57dCAOIFHo75DCDMLqlFc1jNuvh8pm5HqhwiTQhQn6/D1hZxGoKy1W0f8LJy
	CfhLLxx9N/Y6aHKJwwv+iyFIv9yODoQFSdkOgr0cnN6lva+o1689ZXqrmQ/it+fs
	L+XMH5dAPvOYvJrKCI2kMKqD36WahXLRdrl8jjJW8z5L3QJmyY267BBPRPOHhGUX
	NnRkm+xbxct/mMJW4kZsFSlEP8/tIIlzBE5bZWLSgMPhWsZlHlQOklWtFkNpVEEp
	W9ZgF+6BjLNwK0pn4diHbl+7QbptZA5p20N8B+ObEsi6/73atEz1VSGG4eP0H1bL
	T0+RPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnwar6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 19:23:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so308079785a.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782760981; x=1783365781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=;
        b=Nf7bxInVLH3YZzcl78SooazP/WFn5jZLe/n7PbNMGWwW+6H2Knn6TDR5c68YTLvw4I
         2Um0LSThI4QQ/hwgSfAWIFu/Hz3ONzXhfS6Rxl7fF6DkoImHc1+bBXp/xhi+q76nviM7
         n9RVmLAF7WtRdHbmVJfZLjth6DKKLNd48Aq5E6hjES80+Z7H5jvevq6luAex710OOC2n
         2/kUeestOhm14KhlFO1y/xrb+oy7Z9KEU3+DRA/Jdf5mpMAmftFsx2rwmPnmJ5dTjRrs
         viQY2FaxiKPvlu8pK5YCHd2GDntig5rA1EHTaJsdg0QrDCNqtCNYAprQK7f8z5kXGqQU
         nITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760981; x=1783365781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oBql9gcBZhxQh7BK6YGOj7bSZ4xiJfLOpbPh34tULK4=;
        b=KTNBW3L2/BUTDC29dBGG2+fw3bWconXfylwuBY4UtNFeGfpUf84n2cUhJ95Vhj10xG
         IIXvHMVh4PShzcVJ7DMOIqaFccmJSTkwMLUy7sRakd/c2yTip+Pa4+ppUCCK0UN7992C
         Rrjg1UiqlaJGFZALHcHikLHxkpBmlfICXvOv336xC2qlaTKJUSSDUaZegOZNlDft33Pz
         ADojLbrttKa2MWDG8cSXzn+q6SPreweDm4hpMdhaHwV6yjFYqPsuu32o/tPvKU0xtvcx
         1TogpLm257vUnKuJ0jZx29anqRMKFiNsIqEtxpQb+PLmrkE8K4xEPrSRq7BdlSeqeGP5
         LYkA==
X-Forwarded-Encrypted: i=1; AFNElJ8JBcGspi9MFPk+ignWHVgDKZfmZ289iIVWIjy5nXPdZmG4SipID8trQggx+5K8vCyuPMfe7hBse58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYdYcTJYvKQ8eeAPQywloUmkmbvvHG6c5avloRl5Zj3JSDOfgT
	lsoLNGcuLzJ54qbJOwEm5nOWcRiBciPCeYYlOPnKPSULKvdMGXoE++Z94DAg9liG1O6olTd6Otb
	OyFwhk8I6kmRMiVHj9qV+zZhzHLFHELY6cRwOXYyGOETxT7BfuyfaJ31jEf8lcw8=
X-Gm-Gg: AfdE7cmDVSeUYJzoxKivYGymgrlI1ApVXb62R65GV+UOlOlwdtxus/ECr+rIz65TbSZ
	PMHgQkpQUoPAwEtOlM1tdW1x2xdnnCjMHa6vjH601LA8OKHydzbWAhpakh+H3GtRB85lQTZi7EH
	FxVsiMUuysDbbColKmDY9fOTHCRk0q1q+kJYXqRhq1SPg1zKoPpd3PXvLavSDEJlCbsFaVAg6iY
	JEZb99OdgPOQKLkNIQ/0PL9tY94ghzDL+foBFTpBYPcxgTkQyu4ToSjwhzhH5YvT9RFd7X0w1T5
	qxiF3WI9SxfVb+kcvXn04hVpGHhGjFixxzI8dxB33mAnQ/KjtHk7EQshe82KfPqVFIapzwR788j
	qe0Dq/mTLeu/x5kpBf7ZztsWmEPSZI1fzAVmTb99Q5Q1iL/1cktRhhQS/KKQZLUcgu/VJYxiS5G
	E6C8kM+sdMDnRXsU559QuidwUPSbsPsKAoYua7gKQGmorkT/6ApdmDXzNImkZdyB8ubq2AuDTEV
	mu1XJYtyQCyM9vZwIIv
X-Received: by 2002:a05:620a:4706:b0:915:b9f6:719d with SMTP id af79cd13be357-92e62785bc1mr152056285a.30.1782760981111;
        Mon, 29 Jun 2026 12:23:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:915:b9f6:719d with SMTP id af79cd13be357-92e62785bc1mr152047085a.30.1782760980374;
        Mon, 29 Jun 2026 12:23:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475674af239sm308506f8f.30.2026.06.29.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:22:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:22:55 +0200
Subject: [PATCH 1/2] clk: qcom: gcc-qcs8300: Use retention for PCIe power
 domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-monza-suspend-v1-1-b601d8a2f2f8@oss.qualcomm.com>
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfX5kt5wiywGfq5
 DdoJDUjrM9/nM5ZOYoW+pHw+XGmZXT29UT5FR2riNTAnhF25VuKscQ+z3v8dpEQYLr9/cL3tfwi
 wCdWpqH1UwnfG9yPEgKpBvvshndzdIU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2MyBTYWx0ZWRfXy7yz7XX0QVD0
 7S9gvntKfIiZmk3UtFlweOTXI4w/LNl5JjUTUcFRRA0Fop9XHuMxtGRljAhuGSO2BVEF7PUKFHN
 O3xDbQiwEa21ykQArJDXHlDPt8Ks06klfxDrSoxdWRvxXlOIrPoi8ZK2R9ZFfWb82InzCrSGpXB
 Or+K9f6rgXa47h1NxQPA9vjSS/k6INhv2xRXHNmrf1t+vbQdH/HVH6UeC8zQniYleP6vI0xXbi+
 LS/jX+wpzH4bdcElil1stDYvJku1bvHzJUwxDEQjhzApaXh3bAJgtfFZq3OKdeGt3Cnd7mLRc8I
 dFYidOPb0zDICe1EhhgCZhiolzOBKZhkg1gGkG8MAHxADJi/BAVaAdWfMthl+V49Hfzl50mUV0o
 KFADRmWDVYQF1FFr8BnIusyvK0NDIQcB8TrYv8iM7Gdy7XChVDqhJwsKvYspsNJlM1MKqVFza/A
 ILe1f7vEa3LjGatw/Nw==
X-Proofpoint-GUID: 0tLjmWpr0lwiqJymj0G8W8Eou_PWiHjk
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42c616 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=K4BkOEyOW4MAsK0yrNYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0tLjmWpr0lwiqJymj0G8W8Eou_PWiHjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290163

As the PCIe host controller driver does not yet support dealing with the
loss of state during suspend, use retention for relevant GDSCs.

Fix the PCIe link not surviving upon resume, and GDSC error:
  gcc_pcie_0_gdsc status stuck at 'off'

Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 80831c7dea3bcde0ced46054783df02b07a985db..009672b75fb9099cb0c6db7af3863654f2fa6648 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3268,7 +3268,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -3282,7 +3282,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 

-- 
2.34.1

