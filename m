Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25C525BEE3
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810172; cv=none; b=kJgoDfMs29Cqig0zLUsEKUr75hwnQVOMk8k421TYiPBFNYshJT2yiKwA+1+wVZbwZg4gssp5iUhovIgP4SnUfQS0VoYMFZsS7sMS5PEFICwu5ZjlfGQli7bu1vdypJ5rcZWxGCB1d0NtTLIz2dfQWpzHG4WU/8ZEHvYNsMcptMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810172; c=relaxed/simple;
	bh=/ko4VAc7Kurm9pz6j3wyhtvEDMT9yyBb22sJ1k4+hc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BIolTZweMRDXA23uenAjpArIc+VmVWolF0jF1ny2lEIxbmkp189eRefoqNuEGw2qzzsSSmgiIHZfoSBHG/1gKG2OAapTyiCcolKYSstrv+hmntwtNe3w7uJJi9FocLSkW9ybGQzh1cPAqXDfVgk3guRXJMVRZLxad41kVsSf34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxztKpoe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxztKpoe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9JqkJ015480
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=msZooW9TzMJG9WPzjMfynLiq2c/zkP7Sde1
	TD8zgASw=; b=jxztKpoeUn2d7iIhanyVXCNkqDIQBdzpbpOufVSNevt1iKlaQf1
	AzfiRGjtEmVYn6aUUNMr5cCW/kshemcW/Z8DY/nOA5jVwXZPJRuHXh5V6rgyfS9P
	nvZYksQDd3OqG+Tn4fuhlK+a3z/3db9jUONx8H1NBHQfqtiu+F1CL2DkvbDLQDh8
	lYzlo0d/z3lPEbatOWdhiekyYKtLNwmGhk9uIln6gD6Jj7VNgjJH0v1iO1+s/ChH
	6y1jDJya6WGCaK6zAklHX7kqc1xQIdzcrOAJNRbFDoJz9rvF+wFnNm7UbZZXG2Ic
	sNd5Aq5kUzXEDq/T9196HxIcxpKh3t2qfLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8kr473-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 10:22:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad9167e4cso37684806d6.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 03:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810168; x=1750414968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msZooW9TzMJG9WPzjMfynLiq2c/zkP7Sde1TD8zgASw=;
        b=Jq/KS4gW1ld7zqF7B6ThQ4nfnes/ByGKV5wl2B6HU6cZK9zB65FfQ0qpYgZL9VXJuJ
         VGRULAA1khC6D2XtNe+JjEtC5MfXeFcFU9M62ZN/2FpMZGqJrj1x9tRVeRJzTw2WDiog
         WAewXYUZKGs/qdXNsMXbUna9Th0tpDTVWXttJCBQ9BS58x0dEYpZ+1Ijzka3CAWSvaHw
         UJ3gh5PqDOrABaGDLE9v4N9jnDdGFea6hVpaQA+a48kzdSZfhLwAMm7k1k0aYJkBuvNK
         KssgJZv7vvJ/eAf1gDQht92emlX1IxpggygYAuPVz8Lo0eVQfxgsZYgNpDmBFO8aqzNI
         zqiw==
X-Forwarded-Encrypted: i=1; AJvYcCVdc6a+53NqA2hWbCGYtRXoIEdkfFmBvytNj8+7Nf6wuM/ly+kfl1vS1NCxI3sG8M4NvQQVJ9BzmJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsyhQyvuP5lnHojHLOK/CUCTblzi9JZLeBypVE3+xUw+++lHks
	hM/czEpho6zqHekBcAi/7EQO0Wxw0KyLemUtSfMTAn6T6fAZSU8aHQ8155naIS5cuYAnIU99JNx
	i1+9i2jYndgaT5jAIKAdvjTJbfuozQyDpIiaYfm5VVnDI5yhad0V24GnXwZ7knTP1lKtQJBQ=
X-Gm-Gg: ASbGncsPlTOpVBKYWjQoxdwP4NMfSgyHoAFNDf9mOPcFwlO3dmyOe2KebUj9LlkEhdZ
	Pof/zms4DBaf2Pu/bZO7AXOC/ZWEHlLxSsUs14SAKJ+eaagcxBtqeDjhk6zjdTnSeHACDt+6AAj
	hxmiMlegJr4Bre6uBLPd7DLF3I/5fASXLl5CHvIo+wWKubCenMbJ+a1tKPy8hSugmm5kTIfATpN
	d6R7u8opJv031NG3a3+Am70OxREcIN3J87PQVlY6XF5ayG56J5+YwDQh3mG53wC5oluMu/XXatk
	aDHH8LFQyAGaisR6vDUGIs67cETuaXXFPZ6s78MRxYh+6R1OqhBw5EWJ/A==
X-Received: by 2002:ad4:5c48:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6fb3e5fb201mr35148616d6.20.1749810168627;
        Fri, 13 Jun 2025 03:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2q2JVvnbS5iPOysAEEnqmdOpxYa+UWuG3YVGBZzT3xI8naze6tKauWBsDr+WbLoFQM5TEvA==
X-Received: by 2002:ad4:5c48:0:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6fb3e5fb201mr35148126d6.20.1749810168186;
        Fri, 13 Jun 2025 03:22:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:6c94:78f6:53eb:105a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e169d90sm48764415e9.32.2025.06.13.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:22:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: gcc-qcm2290: Set HW_CTRL_TRIGGER for video GDSC
Date: Fri, 13 Jun 2025 12:22:45 +0200
Message-Id: <20250613102245.782511-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p4CxR2DBK1rar8ZDsSHHdOI4Z1axTCMs
X-Proofpoint-GUID: p4CxR2DBK1rar8ZDsSHHdOI4Z1axTCMs
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684bfbf9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=jrCoHfwh-vQAHiHKchkA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA3NSBTYWx0ZWRfX19Qv5RFrQ5TF
 tT6iL35mShVg6NSQ16UnPT5mjBP27qxD6I9+6jnNoHNKP/DTB5txV3ayayRkd3rjhxJoG1ih9iH
 nn5gHSnTwjpTbf1u5z85iRMkXH+zdcZM7zGM+BSYBhjffeGZ966Hglb9I1ANwXIcfFF7uXugZEj
 29eLFtD+wZDy3FGTbERQdAnNQRca869xCb8fo6Ru9mJIHdPDh6122o49NKgenHOqRceiLv1ocmQ
 8heCymuTTFcQ5H+SwyzZq2pw1uVYdW9iba7UfUvkTrfWIP0x+babWzXfCODnNDFQL9XbeEOxqRL
 ukM6KDvr85rrXhH3QVI56zv5NXowjSedu1uzN7gtBhR2WPB4vytqVzS3MA6IfB3btVVur98lJX1
 8J4pvnrgX4J8O/T4Z0DUu1cwOhmYsYpSlt3ioqVcsrqS8MfDqkzQA73kF4yzQSAMbIXFHaAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130075

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 9a6703365e61..6684cab63ae1 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -2720,6 +2720,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
-- 
2.34.1

