Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307B32FA2C
	for <linux-clk@vger.kernel.org>; Sun,  1 Feb 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942963; cv=none; b=p5Mw8paApzDMLCO6xbGEWbnyRaAhdaG5RLykhaqTVySfyXXoKvd/dWf1VXkU7++4F2xfSbpzypCWdRa3wHICngcSYwY3KCChwSseny7bI3FA6ohoc1ZCflbsxjqFoYiRg92+lMprKFYOeDBM9oDb4Tbt3t4FD1rAWQn3+XbH/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942963; c=relaxed/simple;
	bh=9/cOYTOdE7RIJlq5XPHu/65ov7FyGwGpdJ1dgFh6bSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPcvJK732DK+cpl7OvkJzMvXZQeJi7b/Sg8vkniojPTGuAwtWyzIDGyumoTaHH2Hyx9/8secZmE6w58OA00g3WcwCj1g0o0//ucF+yvh5n+dHV8Kfr2v8+YDmJGKWMOakciuEo9tqI0wim0kw2pU/kKduwn+4pU6THmTa1pVJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OY/+1X4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fymC9Gll; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OY/+1X4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fymC9Gll"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117TBPJ057163
	for <linux-clk@vger.kernel.org>; Sun, 1 Feb 2026 10:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=; b=OY/+1X4HNXtplvFj
	hChnB/Kvin5UTQ9dCKbdkkz9RlxW5+Te70RshjCkzFptCqwat0pAIBrq2cjGDZeu
	+OmzPyYzdXIzycew2Eh5jR+Z44YbeJ1LvDicO9Q7SQmbwdHFpYiEnYtFlUiqiVro
	Wb5PKP5bYhuN1camYX90Utc+SeB86ILPsHe69vo/3vBD9QVZYPUyMtuea9/UQCjj
	xJr5oiqQIpT4SPOiBWi1fmxnwdPftm5gBC/4lRjbL7gf/2pnw/KORPspkWSAin3L
	XfoUaVW8F0JfMo20XnMjoAkAmIWY/YefDSrWYhtvXbMHF3JltXFnQv6YP+/YnYmX
	GYuJVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnjeg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 10:49:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5032e5d8a78so42223641cf.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Feb 2026 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942959; x=1770547759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=;
        b=fymC9GllA3N19HDOxYqRFhElKHz8O2USChUkpHMBxkCpP57j1/HZmwb/xoFU+S9weE
         +6sZXyzkJfBywNRcceLdTx7K4OsUZxs8ljRFoKr6Eaw25Ts/IQwbsFJU9DNIF2ubk2Yd
         szzPHF0IYZPFv87pD0tFrHTp1Owml/afiDTwrpgy4CZde8D7CyV1SXdZAvbfHAAW0SaO
         xriyDPFGXk9CRLntoANPZ5qUVOKFXcgxT87/qrdmF7+LhrGNkRY+TgbIpcYdF661yg4A
         PJ8vbG6ImBvapVdixlm9iWUaCL9t44i+OusBZuzgFtjSAuBGwnIVauakiWPCPUxfwsy7
         1Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942959; x=1770547759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3n5ypMdwtQxYQvKmZ+905ulr73tGxrA7J3ngVV5Xb6E=;
        b=OC0vtXdOXMp9Bonmf5UFV8SYmwQD9uAe5vRJS+Bk5/kIzLyTwBJdJX8dtgWBv1TqGB
         RMZsmD2wD1xf4R0+iGDx0grbyGXJdcuIp4NGVrbdwFOr5A7FcmXlg/EE5twbY8mMotpV
         ounQc8W66VzDRPFFD8l5e7rC3SMOsOdH9gBHJBTIS9CtmUTz4DWQ6UnePe5+rS7ezWz7
         ivbGjVwGjadEFqPefLxqWe28B1xbr2cn6xTPGQTi+1rlMKkm94+ThekKyWe3/vFioahg
         fWw3pkNJqoYpplBoCoQ43TW34WlrCQR1vpJQCrA562Ji4yNKz67RZS3Ea3nwtB8rD/Nk
         mPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTPblJXok3yvfnEhqbXUV/cG8KqmNnGpRNTA3twF4VaLYddY7Tg+2NlsNJjNNWss7Pzn7hrTNJmho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmU42So993SKI0pd9z6zqZBl7Dl5EyZjbvmJ81zwhRTGBgWWzH
	F3HiICB00fg6cFqqlNTG+44V9T79FpdyESzvsnzeETL5nqyzWY0KZFX6zIhs8TcLbSE8djbW/jj
	5XO1w5EcVoD4AWjq3+mpI3y5s26C3jwQjvDLEEB53M1wvy1SZWe7D7Cn7x7t4otQ=
X-Gm-Gg: AZuq6aKrtFrcsd6qpQCa19rC5e7pZmCXBdxoVbGtKMyCExOV+Wu47VdkH2ML2MsOxiA
	7LyC5ZafHcq8omJOdDMGKfxI6vB86oGZ4GYh1bV0WzbWY012A6HQ37H2WoqY+QBBlseXD/omcyj
	kV+ghbKufxbpP5gy0x+mybXWhxOyg97GS+IWJelmnZfCEkCzA10FbHj+T0sZHYjkaPyI60qmP4a
	wV4zUV/Hgk3lH+dVOLXEEL5Wfn7Exvgq5KbV4uCA37ibSu7bcldmw5bw8oa1D9YA7WEAsysQ5JH
	0ISLKMQW7m1ARv1LDPbixZG5lua9T6/cSO0s8G7Nd1AByhUTUtOJ0oOGpY3fK+KW4ZIhRPKHZPN
	6709ewUqzA9WTmwCFGMem397Tf2PZi7+GBEH2YSOZ95RwlojXWzCt9kVb+qk47NGilLcEgPlud1
	pyN7sN+eyJILc1m3LN5LgRQA4=
X-Received: by 2002:a05:622a:181c:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-505d214b038mr117498801cf.13.1769942959320;
        Sun, 01 Feb 2026 02:49:19 -0800 (PST)
X-Received: by 2002:a05:622a:181c:b0:4ee:2984:7d95 with SMTP id d75a77b69052e-505d214b038mr117498501cf.13.1769942958883;
        Sun, 01 Feb 2026 02:49:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:02 +0200
Subject: [PATCH v2 5/8] media: venus: scale MMCX power domain on SM8250
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-5-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9/cOYTOdE7RIJlq5XPHu/65ov7FyGwGpdJ1dgFh6bSY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2a9/tKtTVX39ff8a7MvTV8a/DvEuPflJ7mO9PWbTmcHn
 vrx9MDpTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxD2bg6FlwfyHcxd2W29o
 EfCQ8BQuYb/Zbxhc1r/bajpnGW9cT5yoZYora37NTi/9nQsEf/MVzX100Oie1BoFm9PrhVvMn3R
 NK7s8f++xgk/l4SbmP2fEV6zqjq0OvDc9wCZhwfusj1ENHvWl1e+9383b8j/1MY/N83dnKwsvua
 3vWLxJPWZX3Qzdvd7/xJrfv5m97cPFIkbmmTss5rP6aqZGP5xQXRlop3HERvRIbYLKTK+FHYnHp
 s01DwsreJ7AdJDTPE99gtxfw4P5HwwCnhxuPGL/mONSj66NeZlOUsuDlJ8K9cIJSmYyk0+cvcT2
 +i+/MC9bijtf269d4X7GQkdPOXQox19xXdV2/t7L1rgcAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fqEWjCzTsBVkBsuLm4T4d8Mw91tu8qLS
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697f2fb0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xbrBj4A6o8sUajtV048A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fqEWjCzTsBVkBsuLm4T4d8Mw91tu8qLS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX5bvF1xDI/wEb
 L0MWM6b0Cyb9/Ha7t1ozqadmKRcTuMKbahQYbtjDGeT37+PCHuMC0rxu+OxgnARc8mPwjUrw9WV
 bBdpt9xvIni/cxJS7d/60iBB6hp6YUWNgKKJHeqqkmmGRKA3u1TTAcuSF8SSrSXTXvCRUolQJQe
 JhuEHJJrxE1oYQWU2uSJpzfUgTq2Ma3vCrngIGFcA8AvHZCyV4K742CXPAsMCk/uYV/QV7tfezD
 YjfQOYrq5OvmaDFP/+J6Y6dZdFRPk3wbfGd1hir+fA1rckUUup0VDi/vSLNgXb851Y/A18W5MXM
 W+z5jkoGKE146ERvOVQeLWPABwRp/QIdLGtzvkM1vjZDA1Ilg62xr6lTGFv1opcb0nSlZw7W2nV
 TSa/T4LItLy3XkM/x66tU64S1KC3HOvASfv9Tp44eggXItxSp5zq6EYeaTtvkzuPCglSqxj3xA9
 B5evCp6K6yYMs7ZiYEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094

On SM8250 most of the video clocks are powered by the MMCX domain, while
the PLL it powered on by the MX domain. Extend the driver to support
scaling both power domains, while keeping compatibitility with the
existing DTs, which define only the MX domain.

Fixes: 0aeabfa29a9c ("media: venus: core: add sm8250 DT compatible and resource data")
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

