Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C038757B
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 23:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594946; cv=none; b=X3+blVhUqY0CKtB4qzs7c0NnUO8L45W3Bve/lTaVNCzDJ7L8AAJ6tQ00uWTIqRKgn7lebYidRwd22nePALdlvHr9X3BzXshzVfbRwsY+TwQTEQDZHDLMStzUQzKq396B6SXxoJ8HAMD/kQO4c08VxYCi8hG538QvXHK2wDApA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594946; c=relaxed/simple;
	bh=h25ZBfASMsW19qNVMheDiw3xoIbeq4Li9u2pU4b/Roc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhEguCasXpJ71foI8yzCXYKZiPAWBhhhU/yzn4tMct6zIaFDKBgFPVoLGwih0o+8noQglKW3tjqLBCDxZ2wu/IWUQUXVE9sTwUwNWmNT7A7dpNCTuCGmtcRLKJBAj81MqOfcdLnfr4G83XPnR+cjGEj6FQSnfAN9toqgXus2Q0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlKsEjMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgIhEodk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlKsEjMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgIhEodk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618MQqbh988179
	for <linux-clk@vger.kernel.org>; Sun, 8 Feb 2026 23:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=; b=IlKsEjMHZe9TJnKV
	S/sV/hA6xIXf3avXaTZlanrU4cksr6iG2fvUpF7zhRqzNaYZq+m82Dp0brIt/wEW
	A+tDZV4Fbr0EEkLjqBMl8PQ8+KVuwWohm61LgKeBACmnn8HK81SREPWVJDDuPeDl
	uReUh2qIg0n3h8/92gTlqX6FsF6X0vHaZ95KPZvJLXemciaNRfKXK6rvdUKqDPtH
	A0zpUJS5rnu8+d3NI8QaR5Pxg7Z51QckhVAaFfRemRIAWH5eNNYmzL0zcdfJkYhk
	8fgMFtWnVtDSiJprHmpnQXJlsNon3OgTN6NGMOpk1w6mF8hG0sn2vGlqfSsqwWlg
	FLodOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xp7k33r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 23:55:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50336ebabe0so180200311cf.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770594944; x=1771199744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=;
        b=QgIhEodkhfaJBO1i2fcPDvO+5BcK+M+wTdOKSSnhsDE4lC8Ezp8CbWSzkhHfgBi9rQ
         SiVkvDS9VKlG/51mSNq8b2EEWvL2X6nW9eivXxvC5xTnBRNpBswLYn66+YY6SVLOssVB
         /B07JYNMN2D6ZUC5D2VUwOyoOXOFQyTSHvSFDKQpSb2+AgpkDVfnRKEletQhUX7TB81D
         8p5g+FatKHCzyqMeNNm4IT7MUoq0lYBrGl2zx5xXBXxLDHZ2koo9mBdVWpsZ7Efp2W8Z
         ELbH0iIlDOo7vNnYcKxY6HNedapUZJEhzSG2bx+Rh9n2RIIX9wVrCN96GXyLuM8qchF0
         8ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770594944; x=1771199744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOV6wa0NpJIqPIMLpFjeBC8CWBIElaVmu+G/psZIY1w=;
        b=q0fcykprxmG0qIT6HwYNF3+bYrMfeaiO005Y6KHjo/j/TbmtLlC5ZHZYw3BHJHaR8d
         sKY0UB9djv30ua8kSyq87bGp+cJio7tZuvaMSowDln9QeZDWnBq20picxIFibP2cR2D9
         ZlKH4oRWkywyUoMR8274AsLUMj858Jjw8u3PiNx6CtI3AKONjeWUQ1FFbGuIUjLhWU2y
         JyQFNMFHvwVWQBQ/B3fV0oJqPADZyCk8y9OSgzvPKmtaAJm/juWYFv4lLn81om9bomLM
         cidF0nJsrs98OS6TQZDy/XleGcMv/Vsbx5FJtB3qbnNzFUY8AYet+cGSwPU5bcgXaTdP
         fNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAbicw/pZpjhoVwSooFcYIpn0AiExYuE+TPy3GnItWE2jgVbRn8rtWDLspINEY18bzgE4gDtQ2e+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pGCvabg7iPfBo2wwFgYJRM4EVK85EBqq2MiGLtgXAGyCRWW1
	e/s3Ad6307tZg8vGPy6X9Fel3jkgQ6JWamhhzYSgd79DbmNJQktNRBR/5VhuqDS5pX4TzJLJPVo
	ZRw4vyClcFqodIMPfaezRyaWHOb+4/CSdttiKyU8kk0WE4/Hg87hOSYKil6ykegc=
X-Gm-Gg: AZuq6aJGNEI/uCtVViIzZKG8XBmWzrY8yTJRtm2j4uTZXp/Jx3bwv4f367jE+vOR+EO
	G7Gcsytq9LiAOo1N0puIq9BY8e0PuMMYRbZp4HTeopXMTG4wJ/h5V4JfLUcJPuXoFoGO99QMcHP
	8nKc6AfoTRV1+VhpAfZ4xOOjlEqzupOuV/UhGFtCll8IEEs7rXJmCqM3hHT5NIw6nAVrTgRBevj
	nBXBnGmMpbqe5Ynbzwk2VKxrWus56hNBw4tdQy6AMMFoc2aA081KYFUq+FihZAiLaEzFaHoOObD
	hkhNATFl5DZJndAgKJAqQIz/8gKEGBtq1a2W/gGl1dnxIXnFGZgMohaIx9jcdyc/ghGc735JLaT
	4l6C1rVcGX6Usfs9kDeONq6zjukDosjkSOhshMvsgW2E5EJ3iVNtsYTeqkWt7RcPe6noa9RnKVR
	A6XBtdU/b3lbQRCFd+loS8BzI=
X-Received: by 2002:a05:620a:2683:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8ca40c67048mr1555272385a.41.1770594944493;
        Sun, 08 Feb 2026 15:55:44 -0800 (PST)
X-Received: by 2002:a05:620a:2683:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8ca40c67048mr1555268585a.41.1770594943878;
        Sun, 08 Feb 2026 15:55:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm2188074e87.4.2026.02.08.15.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:55:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 01:55:37 +0200
Subject: [PATCH v4 3/5] media: venus: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris-venus-fix-sm8250-v4-3-9662a0471d82@oss.qualcomm.com>
References: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v4-0-9662a0471d82@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=h25ZBfASMsW19qNVMheDiw3xoIbeq4Li9u2pU4b/Roc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2anUtWO7fe2uv3j3X5K/v497qXyYZGaz0sCpEqfmWRG/
 HMvuhfYyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJyMWz/1N2e7E5ocfn3tkf
 4eYil4qyDgfNDU/VskuI36XRPzcy4vaEz0yxRsvfdd4OW+xtnlr667KdXbTP2+tntAxbXokZt/x
 q/3ODZZ/EB5a0AL87z+VDmJh0z2RY5Gc5q0p6Lp3WKf3MvDzuUams8qnk1VeLLmdkPdu2LTvdZr
 ldaIny4386k7cnXjU/zxZ6JTTx5+GOB35FUVM7A/a81fIV9Pm853Fej/KWm2W/AvtbupIKfms8X
 vHx/4ZfEs2/91bkd4ta5bkr3XMJ3c42KfTpe5utN5irlyXrB2tp/H+zlM+9wP7g11Q+n7hfexfw
 CJ5b7nA6g53Db7J55M5+5s87Zs7IiF2Ym5xjL1jSPPcFAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VU3ZXvjwSfOqwriZbnfG88Th5holL3cQ
X-Proofpoint-GUID: VU3ZXvjwSfOqwriZbnfG88Th5holL3cQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDIwNyBTYWx0ZWRfX9o9Os0iUqUzS
 UR5W8zIjrK2hdbUdixcvYOV3Iy5dDtasBYO39ZhpOwV34asAre9GzANC9Qufp4C4eYPmI9LMug8
 aZk+madoXYYcDgFf/w/7nQwlO3XPxxY3jJlbaEUlKJFTPQK1X8gSed/xgRnLc4dIE2+5aggMzSN
 OCFd3FzqritGgkCUWKtOPPQYBOPMEz5U2OMAaUIxFbZXtnp3MZ6vHQIkuHz70kap53bGE1R7ayb
 GAcxtF5zw3vmw7cCYrU5/lRla41Ae5Zl7r2dtq4SJ9pP6JDUAPmaOi4ruab2mQdcw+tKE0t21aO
 T8DoXm0Nav/iQ3DKOiWn5jHwPR5h7ZMWDofl4VG40OzD7ttdnKQnElt0Dgs1sosz0ibU/gBHjY7
 X9pNx29ufKTmeRiMOwd95QrotBNFfQjbHGTAc+Fn3heN2rRgj+1vsNly/ip64i0QTmHISluMmxB
 RHjoprO5e3WC/d3qB5g==
X-Authority-Analysis: v=2.4 cv=LvafC3dc c=1 sm=1 tr=0 ts=69892281 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xbrBj4A6o8sUajtV048A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080207

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c       | 7 ++++++-
 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/pm_helpers.c | 8 +++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 646dae3407b4..cad2df84ce60 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -882,6 +882,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -933,6 +934,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
@@ -992,7 +994,8 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_clks_num = 1,
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
-	.opp_pmdomain = (const char *[]) { "mx" },
+	.opp_pmdomain = (const char *[]) { "mx", "mmcx" },
+	.opp_pmdomain_num = 2,
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
@@ -1054,6 +1057,7 @@ static const struct venus_resources sc7280_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
 	.vpu_version = VPU_VERSION_IRIS2_1,
@@ -1102,6 +1106,7 @@ static const struct venus_resources qcm2290_res = {
 	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
 	.opp_pmdomain = (const char *[]) { "cx" },
+	.opp_pmdomain_num = 1,
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50_LITE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index c7acacaa53b8..62ab747291b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -85,6 +85,7 @@ struct venus_resources {
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
+	unsigned int opp_pmdomain_num;
 	unsigned int vcodec_num;
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..14a4e8311a64 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -887,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
 	};
 	struct dev_pm_domain_attach_data opp_pd_data = {
 		.pd_names = res->opp_pmdomain,
-		.num_pd_names = 1,
+		.num_pd_names = res->opp_pmdomain_num,
 		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
@@ -904,6 +904,12 @@ static int vcodec_domains_get(struct venus_core *core)
 
 	/* Attach the power domain for setting performance state */
 	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	/* backwards compatibility for incomplete ABI SM8250 */
+	if (ret == -ENODEV &&
+	    of_device_is_compatible(dev->of_node, "qcom,sm8250-venus")) {
+		opp_pd_data.num_pd_names--;
+		ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);
+	}
 	if (ret < 0)
 		return ret;
 

-- 
2.47.3

