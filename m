Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF1E481B1
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166806; cv=none; b=SxQA2mUmOXZ+We2KWhgZLmaE7UN67fyzySLe539Yo/vMF/yJBCD8/Lxx0aVC2qZNrRd8z7+DutvbDIq8upV3ZchcThYFI8Od/C7GVcLtXB4Gi5S1oXt7HpFS5RgN/auJVNKVZJgrda2faQkuRpD5ciP99z1rFcS/BelpLYVIvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166806; c=relaxed/simple;
	bh=ABAeNOEtKJvCjwEzCc2bFtrzPVRQtiSKmtXjdfzR86c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SENYmsna8+n9lOdoDrTE/+OPA0licN3d+mMWfwp844GiB6v0M91SFiEx74WDdeHlS411F55RawY5naTXaoxf0JsBwmxl6AePmT48NOOXEM4dYaIAaaclyW/OLy9CdpgtiYe+dKbvo7zgU59vOEDbn4DIQJOQnl1xsj3SM7SQXBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ni8BVu5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8aayZ4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ni8BVu5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8aayZ4A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilw1M2154655
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 01:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2IB+IR2UuWp21Tk45qIX1LChnDbhkna+IWtmumH9MQ=; b=Ni8BVu5aKMCoTFoU
	IbrnSFGwoAFf5sq2CEfwq01NLlcwod+QHVHcZL/YJosM6ViR57bG8GGtRKwHGerk
	43UsPedenPhAgQHioOiIbo23cJ4D2iAdAKmn8nrX2CR51JtREipnA+xOSMmnvc13
	s8N9/QyOEmHhRP8c7KPETf7jKvC2nvmsgCSiZw+Izktkgd3MLJ3m8GD/UkI20/6l
	nEgadkbNgk6Azims38US/mzez0379ZaCmKJ8qkbdm9r4Q1Az3EZ9YOeR0ZXFxHT9
	XZoJBDiemwtma6sxO7kc1tnV1xB2OO34MZ2WuayevQO5scS4LSAhrY0z9We96vD4
	1tCPIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutjwx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 01:00:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71304beb4so1436620485a.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 17:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166803; x=1770771603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2IB+IR2UuWp21Tk45qIX1LChnDbhkna+IWtmumH9MQ=;
        b=M8aayZ4A/xXfXhWWEYIwaUMsWLB2Fevhf6z2NiG0ScZmg4Z0PhiMQQGY9r83/FxvsB
         167CVCSFykAFTK4YwyuLaeHnmh2vTqj6FQ5SKCJj2cQ8amNre9WhT134FHPv5JHA8l7C
         g1e3t10YrgNalc2R2eLueYs/+7OhfE6ZI+AVUtv2lASGRtT2VqzcptIsXmqadh0hb6C3
         BNNCsjYZdrg/VJMlzJVM5j29f8c332WrroA/m8+yj7NRsoMKOmUuQLBNCaNKwcjx8NyD
         yJ8qeEdwd+NepkMGyyma4zaQb3eiTUodyQEHcwQtGJQ+x/OGIh0FIHHyqERx5AiiVNP2
         8Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166803; x=1770771603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2IB+IR2UuWp21Tk45qIX1LChnDbhkna+IWtmumH9MQ=;
        b=rGkCIhfW/YifpunnhRPzCtGMoZCKsSCZJDRShpKiN+vi1pWvThUtK+8DX4LfwR8G+S
         fItmY5GhRqQ9rPNdGOfxqA+A+ZZosz4uPHNA4zq/2Yy8GTP++QC3G73uuRxOMuOkpgec
         DOJJS04QSNt7JPcgoSnK3Hv7qHC1pt0ACr9lTqQqp/o8nxyNz+nG/MNrg17NWeyVrLbT
         xMCIWgZSnfEoO7U6f8gt5CfFYsvsXv1swcPU+BUxUqOAsyM3t5DmAeiIU7bMfOK71vpY
         oo9D70IJ62fiE8Fn/qsIYTBlyi2yCLQlfEsptcodM4MGMe4rd+Ctr70xXWXGw0KrPQT+
         mqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDpNl+HpiRp/R5nihaAkcYi9UbzlF/heM0DpduWHN/0PSYc/EjRK9z6nGIHdJxLog+dUuqEVFnv2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzljNrHYJGOoRTjrudq2w26PhmboE1Zki/+r5KG+uRIZfZbeouw
	WvuTHnsBmZwOduvSFV6buZJqL36D4CNOdA8yfKz00af26/eArOEV1XurV1owfHZsbvqImEVf1P4
	LkkDp0RP/a3eiNVFh9nEdGz+WvjTBm3LMYnTjr7lXzXFc6eP6J9aubhCq4zkR9mU=
X-Gm-Gg: AZuq6aI+vQkDf09Ue+fdT2mBjzUl7SliaBUItPRqex7OyI84D3NE01kETuAU8rE/Uqz
	hic+ct9RNe62L7aDz+j2A7bBXQBcMZp2f1BRQ4Pnws8yj+LeZO94XpE9YPaKnPEWSR565JAqHvB
	8YRWHDjyHNPs97RGifVz3wUARIAt48Ui3aw6K9vztbTqSEOzIvwb3W7Yfpl2fNtsHqE4gYiiGEI
	6gCgFnsH5FWNbh1jYP4rMSacO1fyOgAhCjPbqP84wTF1rTzhPGrYAU4azjUtHewca63M+5C/h6R
	XmInARBoY8OpbjHKnohwJduXTuo5RER6ioBO9QleoJYl+pNb0JfGGzd9V5L4/aDW33xI0sUj71u
	bFQMwbstCQyeER0LhOP+09CI8KTCzTiKJu86OBx7nK/CLXN2xilHKBd7wrnXojAXhH8eqRSX9B9
	u9i3X8uJea3xp2BgiNW5iQlUo=
X-Received: by 2002:a05:620a:bd4:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8ca2fa8b807mr194333085a.81.1770166802589;
        Tue, 03 Feb 2026 17:00:02 -0800 (PST)
X-Received: by 2002:a05:620a:bd4:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8ca2fa8b807mr194328385a.81.1770166802114;
        Tue, 03 Feb 2026 17:00:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:52 +0200
Subject: [PATCH v3 4/7] media: venus: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-4-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4318;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ABAeNOEtKJvCjwEzCc2bFtrzPVRQtiSKmtXjdfzR86c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoHbqXjJplNTO9k64LEzXaQioxNpJdZpA3KD
 J0MUuTQ/2mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1Xf3CACrtc8K+eNzcOqJDdl/SIgHWIG0P9ux16FreJZOUPwZrbSkDXxAsmTZ/rx1QKewlYbP0eu
 etPRnxrSaGBsTGAdXuC4Tqm6CqQk+BF9s1p5F7Znd1IDi4X16E28XQroSmMeqwoLTkqJaySlomh
 mBW1zzSL1c7+/8WXIMDp8O/JodIVgBPjnKDLXhQ3DKwCURiD7oC5nfGvXXvnwAVy0p7lXe0NhdC
 bzbxozRlnx4zQRcCXWczDcsYVem+YF/UXNegu5H2Q7nq20Q6G1BWcS94dktCCWJTUoe3BQK5jfY
 QnGzZgzg00faglA0EbUUIUWqNNYnToObadSHCVd1KaaiID1x
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX2upHiLprH9nU
 IPvSOAL7jlkvZtoLOsZ1jCmjl98vZpitmWR8fJsgnVeHbN2j4KdHSIPfphR6Jw7Hp/TACwGqVcl
 BMluxdPgZ+ed4xsylbevbDL5Pkh+DO2sweYBYRsFwdRBP2FZg+f1S/LJoiXQ5d9mK2VI7GrQ06x
 JXBMQKTrQ7cDlcAEe36zTKF/xCFqhALt+95XVu3Fk1ZSfFWobadLq8IdnRyGf1EihzjNJjgvjYA
 pMF30Thp5KzbioSv4BxkbOgZbVP8XtjqVGmUnIXCMlPlETtB4GlW29kv7WPPFZNkLPQRivPBYR0
 BLvNmcnA2s7Kcb1/5npWNHs480vUuxGt52Qfd35iGvUW4zrvgTNwEXhEIoCSXM2p5/IgufBgfYy
 6VtwM2YoKyMqaeIf4sRQO5p8WBt/4nvgBh7tjis8UylnhCfbUqixXlf3IMjED3s5pigwF3yfBI8
 RTiwfuWGJjzp8K227FA==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69829a13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xbrBj4A6o8sUajtV048A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aRcRss-CAzWSM5E4Kr6Dt6wJ99LEnDao
X-Proofpoint-GUID: aRcRss-CAzWSM5E4Kr6Dt6wJ99LEnDao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL is powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibility with the
existing DTs, which define only the MX domain.

Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

