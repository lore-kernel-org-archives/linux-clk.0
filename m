Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEF47DD71
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251662; cv=none; b=Qw4JIMqE55mIxWeXc4qS7GFw6N/KjDgcGv0uIuB0DEQ4K6UurNd7gSlyz1TFCazYWvDw15gCSoSO8s607Bxs/Ung2s/u9bG6P78k9+IqmuUHspuDKxCOl8gfyQtMR1py6WmHmXGLBGqTc5h90T/dd22jClUdOOa/wkV/HqzLxEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251662; c=relaxed/simple;
	bh=UdtBhyBneBr/MOKYYLbb8D1/sWQ60iekzTd+9v7FbFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+rdGrOGzHpaYHQFiLzF4hzitanzD3+r0IOg3iXfiu+5Tu+lNkKdXaya8cryxyXRB3fpXDOUGFToLLi3XH7daxcVgCTOmIjo8XOgGKJmia3W2JmF0GPoHmQstp+obAnqOviqOGwE8G0Fnv62D43nrAubtCFiKiP1+7UMmfVPrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Wm2Bse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLdiaArn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Wm2Bse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLdiaArn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4t3F803928
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=; b=m5Wm2BseN3jQA8Ws
	lt9+Zart7R3L6zYx2MH4NJguFYqCEcl7xNNsyovi3kto8W96HUmPn/cRDWAx6wcN
	eP5STNcIcOTG7p74MdWSuPR4lTzOxA56v0Q+mwNBpPrftCo91WKXgJJKddgS9fJ8
	66QcL3Qnx0O8qbYsace89hxZX9bDzuYy4/BZUdmDP1TqHxNO+zJRjbJFifPfwIUK
	Qh84hC6omvTDcErowB0VUtE5PrkFhaNn+WYtlOFvIcK/X6j4ArltXKW71nbIR4Qf
	+vgXQEL3xMVHOi2YNp9hyqAIg+VbcMUQcPLqpsLPJlnVYXmGxi2hZhP7NA8riU0/
	UWpaJQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8ey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c83124d530so2436774e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251656; x=1790856456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=;
        b=eLdiaArn54RZ7/lhtcSqGSxxX9EciAUjPnmZKTgGqq/noNKg4YFgtWSqEBIE1PfYcz
         EJ9pIfeZl60MEpFjQOp9UHFAs8Vxy//RUOYR6WK3DVEVKBE3aBeor60+7Mes2Bl8+id+
         6JdCa7jvLa2HSdzCy62vnWP6QuUu/pBTF7wOi34s2FhvFoUQkmRcYQtmuhV32hUJgpnx
         XAVWr+LR00I/FCYunAPpyManKAuhsZ+G8Mj2vnrs5xl5ho/xHd2i1Wf0Tx25YTdpxP1I
         q13aybt/asQT+x7Whb2Ve7yWoLM7kWZRqWqE0UJXduDB/0tuHGy+sM2R0P3NrBJnIzyv
         PQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251656; x=1790856456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h40ZxiQTUvyvswbhdN5FpRTz11Cxy0kBEZ+g/P7iQCI=;
        b=e7DIl4txWMGIZiLjl4f3n5pojdkES+DYdPb/BvrhYMsNXpCn+N9bFRe/MKYgAZUrQu
         SKxNu0XA45v/TWnqKjP16+vxnPaeVrwy82NTn2GesaCwdUGoTBoTdF6k08qVoOwSPNc+
         OehJPNbPjuNUqam7dgIqIkctGL3VjTIlhwLkNtF9RHGud6u1lfUWYkLE9K57Ouhn5Bxh
         dYjeQaERqkBvEv6LvHImzfphJsDG4TQpZrNEHSXsP55c/SWMK6mie3bSXgIEc892eQbD
         G+iPpoeswD1TrI/kxlGQtILr7BCZAuHT8TOrtc9/+5x/1qwuQwPQEHBqd3qvC6JOa+aO
         pWqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3NXUI+2G3BtiCDjSSPqEdnJjW9xj6UGB+SctirDGbSct/jN44PMkXT/Vlq4WyhZs3KhS12JHAF20=@vger.kernel.org
X-Gm-Message-State: AFuF++n3f5nAXmd0q15hzwi8GSXN4I9xZ3r7O8G6p2EMoVWEthZyEucs
	UQ8/xoKJo6UVoh7LNl/Vn7Yk9OFpUT69RNvJBWjGmc34hOdE2vxs3mCJhYD63OGEVRQcRnrSyAi
	HZoCpjy98DansT60/8J/wGflNwOC0hUBve6Q7iq9SHzkCbMERjHNsxb3ezblK/64=
X-Gm-Gg: AYBFou1unYMn5ZgczwcOJE+WZKboNyMy0reT4jlUw/lKptTQlk6bK3vTi+JEkNiMVuV
	/p/ek8i8+LFaV5XjrDeBsOhA3xp2IyA+PGw29aqqinkYiPYAZXg+gfVGj1vxNsvq7CKMG5WxPPN
	hYbInFWKBElxwufZpDMFH6PxPndD0ZRZGrCca2lXik5UQR0vtvpMItVIoKoc5rVJL24Ny5M0BJ8
	Ceq/VtjxPo/W+DzFTSZyBwnvkNfWsmcR/Oa/ABR/1o2JVCOC9ASR0+TCDhcBJXozDg10+31Zuak
	JMfMGshc0eggmXIyeCs1GuFfZH14GYpMqWsbeREN3HC3MvWLb32LjTOV0NSezgwuirhjNNOJf32
	dUjD50Ps2
X-Received: by 2002:a05:6102:5707:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7af1e4f2ae5mr1178715137.22.1790251656333;
        Thu, 24 Sep 2026 05:07:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5707:b0:7a1:f951:664f with SMTP id ada2fe7eead31-7af1e4f2ae5mr1178695137.22.1790251655724;
        Thu, 24 Sep 2026 05:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:20 +0300
Subject: [PATCH v2 08/48] clk: qcom: dispcc-sm6115: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-8-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UdtBhyBneBr/MOKYYLbb8D1/sWQ60iekzTd+9v7FbFA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJJh5F+5q555tffDippoLKfeTD9qcLFZEQBV
 746V028rSSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSQAKCRAbX0TJAJUV
 VqmZD/9VhYoR+igOJ7LL/cJEuGJeftMry8xdDa/wQxZLYX/D1QsJ8zz7c32e/Osos7f8Sod7w1/
 lGWcotpdQf6qF0ktMzhlvFnbb0sofPuduoewJham3zoYooWnWpsjC3MgRcmwIaLfUGSyldgaK/2
 HBdsukCMIXGBqmc6fNMYJnEEBiUxCRCxGSJQXli0fEvrbVjP1CIqHxY4rtqLC+L0zFcdGsq/FJ3
 DwiAKiIngJdevIhdXUyHPg6zgbRFYSaP0xDn+Pow0JgGFroGd4xWZ2JPzvzhIZ57obau5YGAXUn
 Uq7HygoIRjeD/MGJHFesu1OcXbMJBS/o3Hqfu+0xqpeq0xnu9zC4hNyQZlF+UX4Bs8mpaLiqeyY
 1tvFc6nIbWYG4+yI7Hp7MC3ha6AoUhBYdve/x2foMr4t/Zombb7zdL0ncBlPfBYr//Uk5B+ADuB
 PsmXYk/Cdyu/FBFTFJZP52Dnoy3hfiUt4rkH9ebSvS57QzB4t9CyDnPwEGvPili9ar6TXzu/xuH
 DOajoxxbF9uQbx2MCVYrLoDSrYdK8AY8EqyyRQKc0pc1Z4h9ag/VUSidtJIjuDYyCkoC5T4OvmJ
 rll0MfD9SI9DAN+fWTWD4VKm+lSK1gD+f9vOX67rv1VsJFrOQ2oPEycNNZAo/Ih1yjL8TSRvZNd
 46x26+p0tkMukCw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: -SdA5X1p7oyCsd6q2L_w1JXTpl-IkF5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2hbSj8WD/rI8
 0hsqtfKMk/MO1bkqC2BQ0TWz2BdkQ74CeQ2ObyoPtzn54Dam3INQ0gh3onr5dINgxJtL2omA39h
 fANzmKGiAb6D4G3XWkAa2YLNhyytgsMrHAlnJWfGzqL+HXfDEUf6yqNHpaJJRY8LnY9cY4wv3tR
 4vhCVIP9Puw++vcpDXkft6mHxTJChZAe72PqvvPHOrDqLuc3sDai5P1Dbtv3FcV6Tpr3h0ZzWoT
 SbqwFFNOz7rQgEg1+sYoV1o4AOs1PDOV3tVZ6BUyekk56FZt+prVdPzVC3LFykgsZ6tgliz0sr/
 5xaGEh2Kn32zP/fSsVv1TXf7ZNhm9c45l3eNcrrPtZvfZb0yLb6TthX2EelC9+AmMDUV2KOXxfH
 2H0wqv/poc1+l+V7Z3MPwE69g9Al8kF6669nJxxmyu5XssJpRvkq6Q/1PL2MPmArWIK/I4pJ3ok
 wCUQ20zmOcINOCMsKXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2ff3YxycGtm7
 cfshQhNw/n962fd/8TeR9R8T92//4e/urSV8bYI/VxXLcrEFLnt+wqhFmXXuYg1d/8/9TH/ee/K
 l99NOKXS5y9OzptfTO8NHFq+V8GWm5U=
X-Proofpoint-ORIG-GUID: -SdA5X1p7oyCsd6q2L_w1JXTpl-IkF5I
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab51289 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zyovT9EyBzSEY6lazxoA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm6115.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 9a7b8ad646ed..f6f5edf07f03 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -561,7 +561,17 @@ static const struct regmap_config disp_cc_sm6115_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm6115_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm6115_driver_data = {
+	.clk_cbcrs = disp_cc_sm6115_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm6115_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm6115_desc = {
+	.driver_data = &disp_cc_sm6115_driver_data,
 	.config = &disp_cc_sm6115_regmap_config,
 	.clks = disp_cc_sm6115_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6115_clocks),
@@ -588,9 +598,6 @@ static int disp_cc_sm6115_probe(struct platform_device *pdev)
 
 	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm6115_desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");

-- 
2.54.0

