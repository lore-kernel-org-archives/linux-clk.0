Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16002E7F0A
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151054; cv=none; b=Hc7YyB7A7ljPAS+fhJrK38CGB+xKLHVougxn0KtctDg4aMo+iTIHPt5Eubh+iHxI1z4t3AUPqNQLejjlK9bkXeR5faUm0qsLaWd1jDUaAW5aUBk+BbibeBaFw/mVUN2m5JPrhlmkgECuO8PcX+/OLkCexEkpxrgo4o2Fv/uTLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151054; c=relaxed/simple;
	bh=J0B678eDVu9Z/duxSEgjxiQ12Tk8QvyJ/VlAMbBpPcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APH1AxHLsiguoaVjtuLYh01/1fgzOelTdhRpOfbbDJ0kNRLZ8H09fGZmjRd/ochqmyprNJgjQwJgZAw+8ohYoqnM9lIZ/4nhr6LHL9kYqTNnQopchTaTsN1n5o0m6i5Bexewcm+nZfLAU6MXidWtgVqXXcwCCjxaFYOujJ8ePug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr9/oc0W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrQBCplb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr9/oc0W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YrQBCplb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ1Psno3317316
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=; b=fr9/oc0WWJLR09E+
	2YXlTQgjb4c+ewWEQpcNTlUyldTKbaGwQevN8C4gH164ozjTgHzMt3W4Eq5gGldr
	P5NkATj0Mc1xN9GZxegeE0eusa4nIglgMnV0EXCxEotE5R3JW5PRZhTTqM/dncIF
	fC6ldZ07pjVklJClG+Eso/T+9C3FwyTrpQ/cnUUcB/jZh6fBRSe8xUsf9kNjswpR
	bNhj7+L/hUuZamacHCSVMHdUdEj1gc//dqB/D+59mwWwB/P58pB+xPj5m1IUw2r4
	UcI8G5fHL6Y3RNZyBlV1VUXFQG07mufEJlCPurOps4xMpI5JoB2PRfelBoRr1F0e
	A9vfqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qk4j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:57:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343e262230eso7565851a91.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764151051; x=1764755851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=;
        b=YrQBCplbBSU24ls3QXd07PdAhvLDhNVwPPK6xwtTBhFkrXnDF7vY8zpIMoXQwRBQQ3
         IC0/C62jJWCC5fD4J4elx8kXVytTygZgkH/JXCdUrRy08AziW/6okcOzQQDgXw63VLi+
         sDEu0Z60IPmeYFuHbEUfCroKudKEdIuLtpAVPcN1CIjsh8714w9EdSV6/UD7eXt4C/qk
         B9kmZYEZ6ovsxMCzdeqVKQhdu4n2/puj83GXelhxoey6qDaYzt8PRG9lAiWIOmWEOIMP
         j7z2mYyLprfYzVoQPRgj+EgN8bJ+oGmsZFuUbL9Mt0ulFoXYkfhBehJwEKTq4frOsPU9
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151051; x=1764755851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oD7Bss/wt/d5pIxNED5lppCxDd7MsL8dbk9XzcwWCng=;
        b=A/6S6qf581Ixs/GhBWyACLDK36wfpe5fE2qh+f/5BZgz92SmLH0xQQsiqLnqm/81Ci
         P/NP19UcE8q6oETE4DP/eMuETAhuj2lKTvL5h/tBQY2EQ2XNaOMXMExemEFxwsVrFUjb
         CYeyLmFc7Wk7weWWxvdbVNVx/t1KJlJykpOW8MZIEyeSoTlawW6PKDHVykH4kfZLQzuL
         REkl8hUojpj4xXv3ay0Yoclg+NZfRiIWuMBJEk0VnSgp5Ub/G44u2ov9bQmkMNbYPywU
         7xXvJS3tPR1XeeEl1yV36ZanYbnOU/46rv0uVfKrj6rXGZ2BW4Z0uM1nqe05xQjN4uk2
         PsyA==
X-Forwarded-Encrypted: i=1; AJvYcCViOPvheiUY7dgFnBQT7iDktUMUdky/HxjdnrlkjP2f9iQaBT0kmNKtVEV654GAUCfrAvP/VMC13Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOricR0ps+H9CWmBukK4X9SqH//JmSUOcKvSjwXnZQXfnzH+gn
	P6IG+KljnwSLSPCo3gCtf0OKEi9x/xDfLsfMP2RXvF8rVJvm+xbvsl2IBaVzWWZLykFYoPKpwkr
	th5RkaaOshZIrZObtWVv0ROgHyalkXdeF04+5EoEhEt/H+Rt85AFExDElVTCqj9A=
X-Gm-Gg: ASbGnculfAZoD01Nz50dcw90Ou/Jme3Ltmuq+GtUpLdSM4N5S7EmX8+zLu90QzuNfq7
	rGlUmLvQSvxyXErSzXpShCmKRPkBKfZ2MGovPzcDM0iVj2g2cPIVqGSENHhXZ0OGxG21arl8Yua
	DEsyVKMEh48f6yAyhyi3meNu1xZEsM0jAcz9dd4JiGtQwTSm6VNEvu58wEAG+9T4G33fhPcHL3l
	Z+oLtw9Bnnhl5evGdARyM2wGmeeUfO/pR4zrv56rIOkAEu1TnMEbIhfILAGuiNPiZgDalzQYyyX
	0Cb3pMu3ACf3hm4MREhWvSRSrOOdUqB0RLE9zA0XTfYPIzavH5Bj/9lW/vKYXZVwVILSPQDsO3X
	udsVtS3YQ/kip8GM/33UridrO7eQiDYqkhA==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr6413852a91.31.1764151050687;
        Wed, 26 Nov 2025 01:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYLYjAb16u7lfLQLzEGUwap6QEXfCaHnDl2Kn1tydEBupv0aFqxHUA1v6206gT3q4BJ5XJaQ==
X-Received: by 2002:a17:90b:2547:b0:341:88c9:ca62 with SMTP id 98e67ed59e1d1-3475ed6a904mr6413829a91.31.1764151050178;
        Wed, 26 Nov 2025 01:57:30 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a43ac07sm2042843a91.0.2025.11.26.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:57:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:27:15 +0530
Subject: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for Glymur
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4MSBTYWx0ZWRfX1kVv6nmqA+8/
 7dyGXxx1ZNRmiyW//sD6y9Sdpa7yWsCmVBrHRwZ9P4sMYCkWFS26Vl2cBL09sV9ZttaD27+Fmwe
 4fvM/WXRzMfMiE/rVdNjIz0Dzb/pN+pWhQXayOd3xGn8Ot6l4J1BsT+IIaGXddIMssWSZXxqCLh
 efSUmXJN+673TMdbFnpzxykI4gjebTuxP+LhRgIU4r6wIe/066s8u4NdTlAQCOaCvN1wmndLPPu
 2uNkb6xxpFpi598Nurxt2wSN7zpH5CjBTxR/+ZGPFB+ikyLcvEux6dUfv5pT9NZ0OVG76KyeQPf
 1XvNtzuh6hZPKo2mnXw3/jcpvULh7eHJnqRRCuE7R/2EX5mTJ3O7kLf5DcmrnFCaWKxXdJL68sY
 iWZ9qQU3/4/FLc0INUEAxNGXFcReEA==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6926cf0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ug__2KZuwjXutcTiuykA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: iCcsNPqiTF9lei_thyPnoQg-sF1zIWmt
X-Proofpoint-GUID: iCcsNPqiTF9lei_thyPnoQg-sF1zIWmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260081

Update the RPMh VRM clock definitions for Glymur to add the suffix to
indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
C8A_E0 clock resources.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..a2185a6f321fb60ddc9272582ed67fa9ada6535e 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,10 +390,10 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
-DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
-DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
@@ -888,12 +888,12 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
-	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
-	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
-	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a1_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

