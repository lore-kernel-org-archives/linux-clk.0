Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BBC383990
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379436; cv=none; b=J/R5DoX46AQoFv2hTSYybD2YJ2E8/aLxIN72lMuUvtlcoxgs6q8zGGzBkZIN13OoSnI87MBetKwwUCGiJhSrF8JFSWHCAN3tW/rDZSwYDJpeZhco0T0CbV5wV33hjli+lEImjQOxXs8zzGZYEZz/fVTqI/rn09+iVKIESfsf+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379436; c=relaxed/simple;
	bh=/jTDJO9KspNxdxYq4mtRdVNu5us04CJIaEmoBmYE69E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UE9xnn6Kx/BvEil5yUCkM14l1nO0wwW6FYLwnJQDwh9Dl6jHSagSlQqRTYWlcMC++76BEcJpuziidJIZY3pOyXMOWm1nt5hIy9gBd1lnuHhM3qBsAo/uPwkuKY6KGZggAkbF31opUn3U2GkUfiR1t8jPXhdK2toJFYQ3wTXL96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csqhf6+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCz8wb6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csqhf6+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCz8wb6R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHGjg026833
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=; b=Csqhf6+rZiEaiw7P
	kqeW7q9E47mFHVNmOCAxSUJrF7GnsudI60jnMM0cxQXzDzmAEiZXWQZu6kSKz+cc
	5TJ+BUpRsKr8/LTqLYjP19UESiOh04b8/CWq22N8KY5ssV2T1nv0YIlTacc9FbRg
	64VoeEBadMRa1YHqKI+SD9Snev8HeNW4g5Ejho+4biaK37imF6JY8U+Gpi4DlSGC
	bMnLBWf+b2AR5MpODFVGiVzACT90fgTQ5+AE8PUD/xe+joZWaCLQC6tHs/pwIzWY
	hlk17kwy1zcUHa01tR5o5kDrq97xCpgVgZaBWXzMJY35tYJkEGPHvAXVyqHpfbqI
	Bdl4Mw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgqs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 12:57:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so4987051a91.1
        for <linux-clk@vger.kernel.org>; Sat, 18 Jul 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379433; x=1784984233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=dCz8wb6RmzEAgl08Vw9usO7iM8ZpixsppyBLYhpAV4OdUt1Ibm/FI1wJp2LNAd/vOu
         tTRS5lHkKlD1Z4LOr8O0qBgnxJDBOewcSEbh/d50e+SwuxbybwK0DJ0nrTHaAL/9qBz7
         +ZiPigjsM1B1/5/IDKuiUZAgCBW5r93zaA6l3YTq8UiXXdR/EIuD0PvD+r9xqJnVslTa
         8IRnRjxa99+a5JkGVjHuZ2fOYoXsgHcMbFoDc4j4Q2T8ZNDU2xEfakqNaoaSI2AsWAUL
         DHGKsJKlm0qV3P+0XXOlIxlxXqOCvP1EiMV4esc5dyVvHuCSfHejYCP6N6AiMCMTqORV
         b+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379433; x=1784984233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0KMHDR2aiF0aBEdbSdNagjZc6RJmwinGEkBwK7ConA=;
        b=sQuxz9qDAgfYXUi/80h5VInpHRfvBBmZBBU6SzY9Ueef7a+W4WXPbXcgx5M4r2OPs2
         1s3vHuiiRHuGn1I60VX8odNAj4XsgvGyvvwd7tVnsfF02O5qo2YYjwwwLN0ozqCw5LN2
         gNmHZA+oCWDvEMtHEew4WgnCqU2I8S437MOACxhta8/J8f7hBUr2tmQ7wEPy5d+tSGJR
         eCp3VssV23V9g/+HSqbDWMtlwaN/SO9/O1WlONf4VVbfMOho6uGq6HK1rSjvBSbhVUmI
         Im48xQeUKm9PPbkaMdnNZYiZ3CjbgmnKia93BOFEG/QudonjceFgAhedCPggJfTm/HeN
         RZhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYlwhPx2U+/7BDRPs+FqR76OVvOOselsRZXv/ML0354d6aJDNPCgDhe6CqdIJ3nfSZdGnRXAEUn0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LB786kvpwuS6lsJFLEW0Q0CHBNqCNhywaN4CtwkwkvZQZyLx
	35Qa1zgpzTGR19yRci97dagI2qXHizNNgmvqzjO6MXPl8XoEgIoujV0zZSsExoXTWBlzjV4lXIu
	xhxR14FcbE0n5l/e7ZmF+gE+zVC901kqLT7gaYUF02GIASCmdMCZw+dUlM6Mim1I=
X-Gm-Gg: AfdE7cnC+/FU+ZqLVwgoPqEehLFqx7l3gcHM/Gl4+wNzOaRMtg9W8BOO1zP+1L6IOA+
	MsoAmD2PZ5NAa3BASNo40eNBPjlt8D+lvtweC2x10dhW4pgNWQxWu2JMGOQhT0IiMJ8FaiUjY5h
	i5ld7K6IR/OqQiYDF32gNlT6R6fHeNbSlDnKUAGYiIo27aORxiYt00QcZEH/QTWZW0OIKs7h1UC
	TijaZDJRu6So6b3zaYeRro4sOVwvwpl6jO/HW+tFsntgUvcpfX76KVlDlsfUvrxK8O50dJsja4O
	LczjY7nLj4oMDWzc86Bs0xA1GzsFI29mwDrhLxMumVHCIXQhMVCAx9UBZZWeMumaxk2eHdU2m9r
	1YXbtGQcuJlLf2IWvNfT8Lo6udto+0/U=
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562502a91.22.1784379433562;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38e6ba9529amr562457a91.22.1784379433125;
        Sat, 18 Jul 2026 05:57:13 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:12 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:15 +0530
Subject: [PATCH v6 08/16] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-8-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b782a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=au4WXa36JUhwBKN8UdYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: yihkQKQPlVikg6qEGNRsqnkIIoB2N7yr
X-Proofpoint-ORIG-GUID: yihkQKQPlVikg6qEGNRsqnkIIoB2N7yr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXykBga35/H51h
 W7m1oXSBPzzSWNwi6U+VMdfEQ2ZOAoUFviFYN2AAzFZUCgyLW5SpWtN7vXJXhZuhAAZXO5jTMOX
 pkiu47Mg1wEbXpYZf9jP6iI/hyUkCZm/xhmsHbHqwc9URf/ap/NWnQjNmHH3yPxPIk3EGxN/0ll
 QXtBWPFOd4XYa/WUHpZaRuf1CIouKpTYLDtRdBxZ6I69+4rPYNet87kp4UuOydsPdwKGHM2Hm6U
 DzTkG6RimwmwjYpBHF+n1lRQHAgYwW8x1WkGNpB7n3UKSWbMRL3j716cDAFoH9E2C9J559C3NQ7
 mv00x/5JCpiOUIm33lZUnjcDibWi17B8ghLN7EmgZ7BgAqiUjsPy+0nN+6p46TU11qJBtQmOi8J
 N9UWn8WepssGVcjAZx9wiVlM7o6cNPuJI1p+weiRQ06qpjVWTsPtUddhw5t0DC3eEcZmPCCGQt7
 3Apvw1wTnxXUZv3g2iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX39ob8GPpDCYC
 kvy7OeDRlTswP8KucSlr+xrTlKa87hTb3CEP5bWOUp2luDcrVdai5GhftyUbsBmJUOslVbam0OX
 8bMu9VOtizcfq+K4RBDYqNqEuoWujr4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
clocks are kept always enabled by the GCC driver during probe.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

