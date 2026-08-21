Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD84C6EF3
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328582; cv=none; b=dYUfWs9a/nOxAgLq14YEEMpx8oPle2fGqgjg9jjAVJsJet+wD/HjDDtxC51E0CXdVOrS82hpiyR+E7zbrIQKsY7vyGIex5Uyea0iZLqLu5axOtQCxFJ1TjxGWA038uIIV72NWnKGIo97csr7zlI/qXapxcznwTeYU7r37EFCJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328582; c=relaxed/simple;
	bh=tzDqNTEhoFVwtAYNfXTfFhwNi1y+wzNPDmbGPl082TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyXyZjYb8ix4/vCQqZDrn2tPsP4pq9B53WKn4wBUTRRNLg3v2S0QSP3ysVOIOYiyp4IlmKoG0lZj5b2NwfisRd0jvhrGHBHK/LODQnEYbdI+DQmNsFKEDwKDsJqKTyN1boticx6kIk+fLJl2FUCzSzXpEqEZm+c3OyXIUDvVm5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sc6ERies; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDJqomlL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sc6ERies";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDJqomlL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmRuE2404364
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=; b=Sc6ERiescPJxMtCO
	q20LPtHZHJlYliJPC77R2myg7VPX1FBpmh4j2CABvdp866c6hagoFGYJ4agPu2BL
	vhuH2Qt/fQNe0U845R/0llDR9orG8AhBhR2/xqVZhhig74LdNwj93FIduXHCM7HG
	8cEjrAGJZkHTd3e7Zcc+gNk4sBPCJPg1npfC0byjo2aMc2L1NrkeSLrNu5PWXixF
	SxZJjlTbhBaZhUfTYhzlKA5NBbCS7O+AhY/xXHi0M3sKTzo+aZ4noBrb2HaorCbI
	AZbB6X2JYUhK4UaCQ8etsqNRBLvGhvx7YYsOEgZlGIz1JdKD5xsrToEKl6xTObMo
	hiVlSA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d06b382-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:40 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28db6c77aso1995330b6e.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328579; x=1787933379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=aDJqomlLqKvRianifF4ErXJ4addT3KkyNjBeHh2DzIkJmtEIvW/OoA159q6md35MI1
         4EaA1dD9eMATE0IYX2BhxMvrw8eCZpN76c8Zia1rIsp7A1BDqkWFtTn/d5K7XqrYwsov
         3jKUsVvU1wSvWu8KdtHKZLP1s/9dwECNsF1iQuvAVkwbEqRh5lFLlSAquzoUtN+5WGTM
         zMVt6hq2MSUcvkvFIV7nvHaQWooCt6ewYQFBzxNlfJcM1VASAlVPV47uRUZOp3/PnExI
         73kySQMXxuIfYIDObCZ64Iy38O8kQ1jhU7p9zX4DzvbS84WPEytVYqgu2thlBdEm1Xqh
         I9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328579; x=1787933379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=WChqorUg7GQ4cir+O9CQOy7+TrKbNN5SVzIp77FXmUOcVQ92iKnVUmYT88AEns87SB
         3gUoT/hFwqqzUhOoGsL5Y9LOM94Oyo5aAAj0Wy1yqGq7jodRtT6l1eJD10db/6EsjbVY
         +Wp+5FT/ilzblw+jCuIdHnbsWNzSQCWl1LRpXuokQ7FMOVcuVb4P6uSvbx9iEwdS4t0T
         dqoCrt+bWdd4c0S4yi9JBUZKEcaLcmucKSeC8Q1wzz4JT3iz7blRvmGEX4vbUFgDic/H
         unpR7evFih0osM3ADTQ6qSsDanApcI2VgL/k1xosYILrr3kYZrbkereZzL/mb+RTD9Ym
         CXxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaeXJQYIUrVTorU7Du3yLWWRt1icm6foPUtzw+L4F4B+0ZopHkhUfYJyeBbKE89M1OiZNHracOBs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGv8Ytp2QKyLmCZRRcUPXoBY+pLkaPHCsFqocNQ7Es2Eq8Igzi
	ol6XHYMG9ThU3fVNWvhuVCPnTt8OcdimGsNmejtAGkdJjfgYVXwsaDJsAjAHNpZZ221Hxj3mHs8
	jRG+i0/e3vCC+o4UZfTed7I9AuTOeSNfACcap0OwFaMYJdbe5Be+vUuT1CLPjbgY=
X-Gm-Gg: AR+sD123xp29zoHt2J8ww73JUJoZBHGzQ9hAj8imWVCHh1Q3EaIJQBLUivJBV6dKlRK
	KChwUE9WZdDZDpWscNJdm2zbSZID128zU09mIj/brqoeDv+Reuk7/mumQ9UtbA9JSLYwsVrujXx
	D96QAjkamYxq5ehbJ1ULZCNzenSZi3h7r7tpq2jMpPnObwHeejB1M3V3OuLgk6nzjv2q1e6nY1a
	bSJIsOj9m8P6BsOz8RFDr4HHNYBxBUv93+J9sgZmymxk83VMOInKj7+4c3nHLsXxtXkC7a6MTyR
	Qqo+ni513jWDkvD1Dth7xiTtSrcDAPh97KpA40UlTg6V4uste4bUjbbBbNZzn0EyB9rEY7DsOOF
	gTSflfzLtQhrhrlZSaBkfpCqESWH6xdZAXfJApvHWGOysoPL1jzEgX1iHWLfFAL8RRYL3bXmERx
	0mLMwFoJu8dZ5yC9n6Uu4dOgo=
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079734b6e.18.1787328579320;
        Fri, 21 Aug 2026 09:09:39 -0700 (PDT)
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079658b6e.18.1787328578881;
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:56 +0530
Subject: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=1748;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=tzDqNTEhoFVwtAYNfXTfFhwNi1y+wzNPDmbGPl082TY=;
 b=CxsWXOKtJP6Cvh3tIteifLhUXNDAbb56aoAXVsLa6v3Cfb3Hb+XK4dUrRN7H+p4kVAxUL64uA
 XGzbF+q4je/BNf+gDCsy3Rm4JwOd+U8TlxfPvt0d5PYj3u/qV6owX4L
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXy5jfspr4eWGJ
 WcLFNmZX4asub1LMpG22bUzLtrBERaKMNi71e1pIzgdOn0RPWLX76hJ160eSCIMB/2L+PU2FNQU
 NvOpyhlYt1yyJHQc56Dt/uRNNhu2nBSsQyCfqOHjVzM7ba7RIMcCsFeH0OXcpzTVAPkJ+CyH4Ed
 /U/mIHwSMqxOeFbEptLpbVsJOVvaGAjO3Dg7DpqX8uvw5Rfxj/I++hLFDHfo8TPSUc2crlgzjK6
 t7iQ2MZYVFwvSOu64bRqi8fR/M4bdhEj1VymaA8MWMWt7gYVT9OUuqVDLyMOoa+aLwv7pv9TkJo
 3T8nvIU0oUNUpqU1jFv63VSMkoAO17mXQ5+IKk2+DuEbhAeRg2+thAqszIqqMcFcQYVLW27wxy8
 GAvu6c9OZa4rNkwIHBFGCcRFeb13+tZG3j3HRZgxHjkH3YIQUyuVqyCE8FBJae25YsdGIGeZnNN
 FUjat3buSKC4Sm6e2Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX/BI0EvPLVwlg
 nmZAFUHv3CVHTweaBZ4wbfq65OnhEwb+VrhTJ9E7d43lCEvwi8T/BBtJRhVPN1/7JdkI2fNEhSZ
 XzEnugq3J4gv0vf3pW1T+0dZx5+Pp/A=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a887844 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: t8ybn58HvnAo507MXeZFjl3aPeRxp01O
X-Proofpoint-GUID: t8ybn58HvnAo507MXeZFjl3aPeRxp01O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..3c7755735dc9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -685,6 +685,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -889,6 +904,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

