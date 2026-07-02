Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3D364058
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017246; cv=none; b=VfrDApUYUUk+TrYVwzGZCKNbK3LDLyoHcG8z3MLElQ503dDfPV3K0cHPZ59nyXIH/FVVn36/vqrEYHCLaNdLeZ3fKmA4t6kp4WVJAYh6vYyy8Ham6OkaC90fIKpfx0OLpuD8gwDnpQUQpYtWSGGfZkAmUNYKrOrXLJD2hy2qknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017246; c=relaxed/simple;
	bh=fxW+iu9BUPCZXeQFvC+j/ZitcPQfoyI6TpduPY3UXn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ho4u9h52ePKUoZmsyz6O+0CGanbvQl9fl/cKD8cDQjqz2bobagl7FXnNhMt3BnteKlxSVxOlDuWe9hDvqE2NQ8rr/fbBS71qQnWW1HGL11hMRker6ambjxTvRC65jRCsVwa0Djp2lKG4Rvp7rPRJf+BWxoYbZOi5+RiCxcJKI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAsQPQal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdZM5Gmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAsQPQal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdZM5Gmd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3OD6666012
	for <linux-clk@vger.kernel.org>; Thu, 2 Jul 2026 18:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=; b=CAsQPQalx6/1PUgN
	b99cC+MvSzQy5FFHztpz6bwVVE9BVwhW9bTAsjVF9U9N7bS6TbrBy9UaA7kIdXgW
	yHPlix60A/a6PxQubeJqQP8wuRJGLFwNUnqrvTDZ+6Wmu0iGNvR0Tx/tEZ3f/k2d
	Y0Q9+GTvw6s9hdDkY3dMLjNx8ucaDYbh4L/9gfSchXAM1UWUnrEHBTpmJUfw92tV
	nHsFZJbgxDtC3P4KSz1wowaUkBEoO6Ph6LmRGPkDshZjBc3rXGeXMLR7Bgnmu4gy
	6BtgAbzXMVJjq/yReZEG/MUa0LvOsV0tzu8PIgcy7ZJgGRCrGVY4X7PG/O9p7HjT
	J5JSkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc2qtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 18:34:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so1233532a12.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017243; x=1783622043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=bdZM5GmdLmNhFfQlIEWR0Ff5N6ovhPdlwOO0IgM2GHYu4RwLd2q4K3MtsezwAX3kdt
         KrmDFKYen7Ycdo+As/QY9iPNvPNGLoAEs75RNAwQG3yBOamA60O4CPAnXKxabCNuYZz0
         eTbKQqYW33h6wUDtOjfqF40k8A3XjZ9MEacvCPPsNNihrScPRUD+0fZJrHW4daw+04av
         GmND9o80+ull5tOzCUf2F3EIZjWC298aewx4bRpyAs2tHKsZbv1IqTznCy+f80UPflF0
         cPUYC1SJ0KNd7/JVLVUuPI2Alsr/TozbF2qO+hZUFuV63mloFED68HJHSC0DFZuSuRkS
         iSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017243; x=1783622043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ee2FPXxrwPb2CXHUr1Seq75adNwVKOEJ7OQhb6iGK4=;
        b=suzzfZ/5TACz+aH5I/O+cdjg7CEo663btSRhqA9HQ3iyeyJFmjtOp/k3GSNHeTF54F
         EAs/6d5qL9sFBE3rL5JTHyNc6vJJjWZKxh3j1ar+Hg/EIAyqXfhHyiGTBHwMz0IBpzsw
         0Y/BQ1hSmljGqsSpXs/wK6SlXNyeqOK1fCIjdGbNYhk+9UNQSA/Vhhjf4lVn6AeKNN1E
         8/vb/lsDl2ledMAnuLJT734BPOW5Z8JeGbV1RvYzmLt8GDoD4wgAXZcpHeglJ/xx2MU3
         XvLsGDVOlGC5O/0tCRkxjm87MhU+Gn183mlx40ieusCgRDdWEV1Ur3Oa8JLE+/9F0Fru
         QsiA==
X-Forwarded-Encrypted: i=1; AFNElJ+98QfCC7afYy6HZtjFRJt2woj4XEP+PqntYtEbxShZyAs4CnwD09ILB4ovoH56/UHTF+zuBRL4z2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYu0Oxe0zQCeqTuAUwoJBwFt9KY10nL2+SApx9xwpOAFYy8cNS
	dUDl/PRZsZ8QzV2y+JRRN10/8wOCeTHTKAD9VLHrFL453ShibKsXLB4HS6D3qwbUKD04QbnNOY6
	54mfGUE1SB75+QpUPgrnuzYnmRk2+x27K/rKCR3XvQOwWTMnej/MUaaMi5vMJJAs=
X-Gm-Gg: AfdE7cmOzp+4y9Lq4pJMKApDMpmCzwBqHd7KTANdNMRaVQhNaRcZHddiptMszODCop8
	T8932prusnFyI/GxTO7Uo7rJZ15EXwoZqX3SVkUZQkkUVmLEF/O9Wd6QbHm97jq/YlbeVvgC7he
	yVsidwnEMlgXJlrU4J/k7PsxTsoZbj9B2k6cvcJNs2hSEY4wEGwTEeaCfJMaTso27yMhzq8AyWw
	J5WIr6dvq1RWw5getO29LbQewnM7lslnELH/+RqgH0n4rat5LRX6lZhNDhKmBgjupVEbh8F+n91
	5xajdqaw4wrSgIHZusUalQhUthfC62Q5ViCDabfv9CfBbZaog9HvI3Ynv+c/Io5P50tQ/l6BE87
	gM30csOMIDnZDTJ9YbKzURmmUb54VeL9botP/98bpng==
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946298637.17.1783017242956;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c01c8d1863mr946268637.17.1783017242451;
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:02 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:34 +0530
Subject: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: mspNRXpCtboP-t2rcLDFue6Fq2HMgP-6
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46af1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXwSuBlax/IawX
 5VH8UCK1w2HcDuSXwM8tKAjrSL9af6Z1dgJc2BZSgDinsQgdrRU6qh8nLJY0QtD5xbMUa6OkS3P
 51VmXK+DKS+v3MQMaU8MqMXl+bJSwGUHFAtwd8iB0aI3HfNJdE4uDu4RwRR9Vw2u7kkgbvI7oMD
 Y/jOveL+WkAVc4PS0LspitjobF7EdvCjEOjx23j/p3DSh0ravAzxilZEZVX8t0hUou4p3fZZXSd
 8cAZCS3FwsEI4kytvfzjcXXWzWXRzZITes2aO16uoatYj3h3mX1j1MlzwuH4VvXwKHtQ0kyks6t
 QIeUq/IfFz3RBiamaMGwYKbsxsRcptW0dobwFW675YTdjWntpb/TIU+0oIlMSVzIhQLnfClTkyv
 wnYYyn2LFO3Ek+jEKwzdKYSdx8ykzb2M4jthf8smDDEUkukPCYDRoPHGz02SvuMVxfTXzjUYsds
 +wBXHfnnyc1LU8LX7zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXxxVVu3zzZhtT
 iUiiKHDKAeUW4CtxLQWpGglqe1bN8XORMQhU+DpqfONIwNKw/Qmpy3765boXVZfPCLQmbSb0bJw
 cbdqxD7CInoF2FO2gKlSpt1+IBCO+0Y=
X-Proofpoint-GUID: mspNRXpCtboP-t2rcLDFue6Fq2HMgP-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69..f14b4620090efea139316ad833e034536caa5199 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
@@ -385,16 +384,6 @@ static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		return ret;

-- 
2.34.1

