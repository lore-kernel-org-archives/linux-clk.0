Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E441476072
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326028; cv=none; b=l+c2k9Q+WHTHbYypsfNgnBv/KN6seIckRDjJud69ht2VeBYKrrFPTlZWgZ3uBO5WDlKERdo/X00sFASDnE3043t7pNaoU+Ove5toNKU4vOMHyJx4KzIzb1hwc4h4K5h1kSCLhpZwY9YoGK1Ul0wPMRdQ8LlJFr1LW20IJdOYBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326028; c=relaxed/simple;
	bh=qZl1Q5bwQ58gN3uKiNg4+tTdTPKtZZZ4CCEo6LH3/Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXY/uvgEuj8bst0JrDfwyyYKYRnCXw01mYKyvkopPZSIA7eZ6GHY197BN9xemZsWpMF3f7HLXwif2xU5ekTJFxx1+tUU2THUgYIv0TpfSTrC2PZUng0i7sbmoNcoKWfblSJqSRLXS9/N778UF+pp3DrcvlTldp94r9TQONmpmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaEl7h57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYQtZV0Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaEl7h57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYQtZV0Y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J5pJ756810
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DP27l+sS5LI
	NTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=; b=FaEl7h57P63nm3L1ZHNi49+sycY
	tGd28w+8kMZQzDj6Qhcu5B6GP+ppY9sdPLfR8bheQY5jp0OBv1mL+iTqu3Q7Ople
	zThS6PUX6HXE8lAXNRif0re+QGHIWscMMTXR0i3YRtRpGPkl1ZDBjNC/Zb+sV4AW
	qSMRvh8TCjWgHR6WLPXl8AA4tknDs0wTtqGVmn7dvB1iIBIBoKV5DQhu4TcMGXja
	OEPU+d1xJWHFTupDOU6g1buNMYmX8/uzfj6H3zQhEzx84EDFcyLpszqFb1YzBx3Y
	Dq59IWFUg6EuR8FTzA6+BcxW9RjEDuiiO6Yenc6fdROkCj/PO6mkFxjQvbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08krf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:46:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so155252085a.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326013; x=1790930813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=XYQtZV0YrxuFd0AhrmwAoBb6CZZaTOTywS5W2DnX40nrFmKIzueNlyspYs48SO/9L9
         Yd3v2tcVUw/mDIgiU1Il4oELJbAvsBA4LkOqs56cxr9EqACKykbfUBUsxVxhFBEWq1zN
         WhVRG7F7DLShhLaQIWGhwse6xTRu9Vm8HPg/Eq2FSU6EkPVWgawpvV4ecRYxsMgFOtWE
         A65cS2PoPBfX2tMdOjIXjXdN0OMvVTi4IcTgUB949lwZo3YSwx9EvcY8U7Vz19EOoImI
         kVFFtd65nn4xgm1MY2LzYszIw/QR4patRScC9IH5VPJlSQe48exo4CDMSlCOX/PQeF8F
         sHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326013; x=1790930813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DP27l+sS5LINTYJODTJG92GSpYoj0hoQF9DkzSOwtAo=;
        b=z2z08vgBbtmh90f3Hf+8uwMdrypd9Ti7XB+PvGNZpVV7Z+eF5emvH3EAX2GNQdbKiW
         /+bVQJaIYwCngowYcCwaTWGHETYqg7jaHxe+iq9iabz17JlUAR8fIF1kRCQ3hIP3KfTP
         +MtSYWTqXeB44naZh5IZXMdxRlo7bDv253QBrwfyEjOukhwVnAIbHYp9meBDjJ1tTar0
         yF0uLRjSc4igytBe0LrJFbOLo1zz03k2OlL1K+0xRE+ZfqwXUQ6D+MssWbGgM/iW6Wek
         w6yinFmc4fdzlzNu8YDA4TqQOT8f8rVNPVEp1fnMgglluZ2nQIh3OlyeyGGpl4tAfKtY
         lbQg==
X-Forwarded-Encrypted: i=1; AKwUvByeZhzGL/fJZTSE7xhynbQPLe8eu8qOR6z96WXU80ua39jmIbIgqlGtF9EkUuAP3r+eWO/26oR0+uo=@vger.kernel.org
X-Gm-Message-State: AFuF++mP7x1mHdi6ea1FHEfrCSZldxZRU75tox4v0N+QrXCt/A+TN1+Z
	qovh54mb7p4FfDyfHoSjA6p8wHbEz8zL/r4Vh1hVUV4qVyVo+5r0gRH1xA7EVG8+Gg/eZn344Ig
	VlGGUHY/e6ao+lmXBKXSk0Ig9OSjM6QYbDPmIkcpk7ZuDWZYiZLFneT125U5uxaI=
X-Gm-Gg: AYBFou1yVqZ6AkPBdZ9bozvRulLF0/1ZzmZ77y56D0yaNAAa0ooFnPN/D92HmsxrwW3
	HS6WGpwPtC85shgveRyKAoFR0vTjm1V8TY5jqJ5sbMm3JFOZuNWnS9YDeA56Vj0wLm/H8uNmy1O
	Y8Aoc3RDnIcB+DjuFrJP2nkTwH7Yb70f+E3PDnntfAsZqwg4PrSXKE1gZwmpX0h99O8+bp3PiAT
	VNfiX0s4LKPH27l2DTOJdtQY1/a+ux4DccNXdr9f0q8ZVYuxYxtaKVj1jCmqbTVm7LhdOGCEELV
	ur3whqZMvh3l/sh9IuUNuevIxpkQHPkJ7pRyCgJqoy/UVPzE0gB5Pqz0R04u54O4XT9p8IlR4Ea
	4FJCETjpHZ2te
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309131785a.57.1790326013255;
        Fri, 25 Sep 2026 01:46:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2843:b0:93b:d79f:d944 with SMTP id af79cd13be357-93c43e8a580mr309129285a.57.1790326012853;
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri, 25 Sep 2026 09:46:35 +0100
Message-ID: <20260925084635.112399-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXzyxiNZ0lnAlL
 CbP1Kt/6ivxR1BScwxpXDR6Y9EF35EqZW6a5Nt5Nw31JklKfjY7FnS6JjBz//mC6cUiQrJlx9FO
 j8MFmCmFpMXin6s5E+wzJtyJFihHL3g=
X-Proofpoint-GUID: z3zPh_ezDgPlsIS3XiiRpt6JtUOsJhE4
X-Proofpoint-ORIG-GUID: z3zPh_ezDgPlsIS3XiiRpt6JtUOsJhE4
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab634fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXxtawZy7EGt9w
 kHSRc+3WiXtY66uhXYhYA1sZN5GwIcubhHhepZVMJG2mlt2jfLWM6TkmuthYjiayE3+SlVWT38a
 wjm5gYtF68wXbp8hkW7p9qQmt2FdUTdHJGfVscJk2ceDmgREXJfGHUfoWnHID7SCXCKlXakEAIh
 mgrOgYQC6bjYbrPkL89l2pOo0LRDBRWMxdsplYCCLQA21DifZm1IAre/xs80vucBymvUr/RQwWs
 TEixQLejRTcyefHfYjIbuApxKWPfwEJHFe86ghK0/0zjNWNNpAUZGOOQAz1owvdxGZNFLMG65eG
 en0mg2wnQvbbn+21cBIERjF0P9jWSN6urLI6cybACrC33Gu1WYA0AZateWNAXjly07FXNIa/qdX
 NwCx+sYoWdsO8FmzfZrvXa8DdAV875RpLjzlGFJUIEMnu/G6QASSk8eopseYGa3QrEc5K1mfWp0
 P8MJddihsLIg3tRZIEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index 356625dce99e..eda13686850c 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0

