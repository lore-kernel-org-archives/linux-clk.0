Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5907372B51
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139294; cv=none; b=Z9fqO8ZDPotz8wD6pg+b6dFXJ/jubhO1Z7W0PJYGr7VMu5Ehnv+cNtbJvl9Q9xCT8vK/+f4JzS3LbnLQEdjsvgBlKKOGWn+sIjDYZZSNTwSLsu+J6u/U/eYd18anicJRUagg7CaRHML4N9RJzi20ldLZqXLGwjOfatZ6JQ4yehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139294; c=relaxed/simple;
	bh=W/lGeetqBRqSuBkNTnqfwM14gP2spHPt8/oMSLOip4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7T4KCcCyq3VMWSv9sYXbNMNqeEYEkd7KOoc+vKMm37qvnu4Xh7vvhitG0fSbWrtG2BcRz1P8wpRdqaneAoYnUkgNzUTrGKNDmFPQ0ioxysvpC9jehkczSbqlZSQXNyqEFHwJ95QOisbt5DOE+/ERolulk21isV2k/PlM6zzNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgsTs7KJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkOpDigR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgsTs7KJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkOpDigR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QIrSP92807366
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYF
	cBVHwnVA=; b=TgsTs7KJkL/7JbqO89tD0WnuqtfnhI1pJrSff/RGccOEBoEBycB
	Ku/XMWo4Mv1jZJt03PP6ONhZsAUf8E7I9NlK+tVMfxpy7GJX8px1+zYQiKhhZBDX
	KmOGp3Av7EIZ7wMR3o+x8lXe7HyogKFmxepN3ylM6Gv/JBv63XDFo5IPbYEJPcnK
	nNJLhMYx5MtAvhv2c4pI767OJLu7K+OZcFswAtT7GkIpHxGQ4sgyvg3SBETlkCO3
	pE/jnB9du1FhrcBrWuqXsGLapuJEmqzEreR63eANq6RuC28Syf8tuAo/cjQT9PA9
	h7Bwl6GPTU8PFTaNhQeppCg8RR6shcegZ9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur0bgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 20:54:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50336ebabe0so231433871cf.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 12:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772139291; x=1772744091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYFcBVHwnVA=;
        b=IkOpDigRzPfHjMDvpk9Sxr8HGa9BVTHHLjIFzzjClR3wseXI6Mh9Gkamni8zt/OzJB
         EDScW7l+KXh24BoJZtKMEU3ScMMQMrIp6v2DGr+Fj/TMXsYeYIYtuBBrQf8QXmot2sm2
         9yg2YAvKM7BIIvQEgiU3c5vNkZAzJhNRjBBG687VN7oO3X0G9BUdHr/RKFr0cmDINXFw
         6qB4OXBH++4TrdgdmC7rB48wAbo16Ry9kDuJWyV/jThyses4OTvKR3HHmuDgUNWFt9sc
         aV5UF2M1rUmQENDWbBIfM8qVon+mDLQ1Pvur5vsVSD3b3kNSIJb+o2qPrIuc8QVd+nd9
         cc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772139291; x=1772744091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZAO66lhl31RaxHnxMRQo1D7pwjnF5E7KYFcBVHwnVA=;
        b=RG6NPtAOKvm2MrVlTvTN2ghdoYM3Dxg6DzHttKrgXWzPQ5IrmMBUseNUy2bRMfUjXJ
         XuUtlRZXTivhrhue8SPqOVkbOkXQ1/KMme54qaTUbJcc6UqX2rp1RVYYNylM/2thFIdX
         XSwgyDy82eihsn2upe3VyEqAsHW8r6UBo9ntY4XvVAwPEbSjPHwy9EXiPRXh3Y1w//el
         CTappDZwHB51pl4AwMQP8evx3IvtB0/fIAiwjM5k1W/gwY6svk5wdpsALHnoJUXylR/0
         gn4vLSYB6kOe+d+aqlUN6zW5mVKEgufuTEXcgQTk3X+ajxkAQe5EQwHi3oqxPQJdwmjs
         ul0g==
X-Forwarded-Encrypted: i=1; AJvYcCVxVHpuJF8a7nCmEPygyTfRrfP8XFsFkxudXATglCx+QQ1JwelUMSUzBTrFgirEg/jqWeH1KCkm9Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNI8SVAUb3BM0aoqbMLO2XVrVC/MWne5wXjbOzTLigtIm5TnVa
	EfQW3h7iE+lV5nqq/BNmtUz0it7MRfs7eZITMaCfS5mm+RNTlDc+kM85oCJ+BO70hvLsHGNId1T
	Yn8kAacssMK8Jam27VSIt57Wb8oXqKvkTa4ZLMc9qTDGX/2XGcRFIm9E50hg1dvk=
X-Gm-Gg: ATEYQzyo1c1BNCPpiVovT7vwAAJghFrkTg7+jCOLe044rtzzm/HOTAaIHjYahLjEFBm
	cQeTd7O9cpHjLvVEYV7Tl80UmsrYiboawRfg2xUQAJt3lfty6wi85vsIZYBuuib8Li6WPALtTRl
	wAD+kZNRQEvxfn5Yn/hqvOUYJQV7qns8+9gQ1WJAKuHqgkdmO40NTehjr7+tlOrrD2tVExUD3EV
	BaPvk6QQmYe6niu+GUXn7hW+PJDYikCaCyDpmra8j0nm/6JKvPy5QPm1QFZBqPF/W3WtzWI5pE7
	0/nJr+Ev0FjUHPMSF/HOMCaTcqQcNBco7vxQNOuZiCC4hrBbV9Q88HwYl1p9e4rFOGC6UQ3AVCU
	iCcKVr7OkxAK9wqm13l2WUQNmd7due447mc/uEQ==
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr514894485a.37.1772139291022;
        Thu, 26 Feb 2026 12:54:51 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr514890185a.37.1772139290505;
        Thu, 26 Feb 2026 12:54:50 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4a121sm60248025e9.8.2026.02.26.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 12:54:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, GyoungBo Min <mingyoungbo@coasia.com>,
        Kyunghwan Kim <kenkim@coasia.com>, Ravi Patel <ravi.patel@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
Date: Thu, 26 Feb 2026 21:54:46 +0100
Message-ID: <20260226205445.336839-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=W/lGeetqBRqSuBkNTnqfwM14gP2spHPt8/oMSLOip4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpoLMVzwqcEzMmENjbnycrffk4ydA14/znWE7WM
 5+8k5s7gleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaCzFQAKCRDBN2bmhouD
 1wHVD/4nhxwpfpCu6weoHqEiTHxxSJh38YCcer7Ic843JZhhfPeLlStstrAY7vJD9zKd5WmW4g6
 BK2fSJKrGLxNQ4vY9vX22/ceXF33nYUFAI0ZfW9SiPcelXH9UXLM7iUxOIWQy+nwXh7dVfhb6ES
 I81S9I47BzC0UrMM8hNrz+mt/uWBqVFEwUwIZsTGcB8KLPqodTHsYOtNe+sNbNAXCOVdFDa7Qsm
 mM9TSN7k4LiNCt7niQ9nzbSqXcOwCEr06zAmS5FweqF2ppklBoUu86aozV5KeHNOOBpF44rXdoL
 Lhp3vhvwFuBgbMJKzIGpN2spyJV3L7FLqvVCweg0cDJXPmlne42xaFrlO/cOP0mGtZYIHFyKH3u
 yZ9+sC+cksSTesPwU0MGPhRTCsJUSK34LMO0vS5kopmiXWOe02kjOx5XcTWGveMsaCIvB1i0EbR
 xweLFIt9i6UP5qcqORc9OxD9KP4gaeBy/9Llst3zz9zWcp8lj1kmLSLk0kxx9xQY7FtLrdF8Z0v
 VBSeFsumrM3Vx85LA3PM9Ec3g2OxqSxIsE6mLH5HcMbluFPizWEWQJKTp0nOdaN8GQ3xXGUNlYB
 7ZH55w6st8n99ORhGlwD0uFYxQNRRCp2orvCsgtNbnQztBUWNvvNGZnqpdwZbeu2c4pjkER4egW 5Lx3uilNN5TTB/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4o6J3iwLzT4tM85AQ-P99JZJvBgaznTD
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a0b31b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=TcISmBahSV9dqvZQcQ0A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4OSBTYWx0ZWRfXwslC6piPoAM+
 MJVHd/QW74QBzwzPvFUTSEecE8NrcO8GDW2cU8yajq6r/ZmA7zePWkEAEwJe/NxmvlWNNmdg+ob
 54tnoy8fsCbWfkvkHhkjHrlHWgw+owwRDEhEI6Nww2Swid1NZI9hBDoGJJ31fM0w8IaKXMhc+Ig
 wxO369cZCWtBxPGoKtzJhzDZGraQDfZH0FRh1dWWW34YlGJHvdZsmG6frJLrHZJAboB5YRhzksQ
 Zokt7wkL/TbfNBwDKvpjX7xYn/3Rjvro7d7o/ALIwR8eZy7zYDGcEXibYk+CNWQFZHy+gQhvqZe
 okk+4eJjuhCp2uznjmcbRONZjOy/jL+r/2R6JGCgo3zC/E1Uijbny0Iiqjpp7YUgR3lzcoOOzlf
 1IErECth8m+8GXX+07GoFuA73Hwdf+jGi/zJiTu9NUdNC3rRaUfe8nlNvXwkv/Gpc2Tjm1u7yfj
 Dimygo6dTynotltUAOA==
X-Proofpoint-ORIG-GUID: 4o6J3iwLzT4tM85AQ-P99JZJvBgaznTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260189

samsung_a9fraco_recalc_rate(), unlike other functions in the unit, is
the first case dividing u64 by u64, thus it should rather use div64_u64
to avoid possible truncation.  Note that the original code did not
use remainder.

This fixes Coccinelle warning:

  clk-pll.c:1489:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602250053.wEU1hlpY-lkp@intel.com/
Fixes: f051dc5bc8e7 ("clk: samsung: Add clock PLL support for ARTPEC-9 SoC")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/samsung/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 0d0494927e59..fdb84bcec912 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1485,7 +1485,7 @@ static unsigned long samsung_a9fraco_recalc_rate(struct clk_hw *hw,
 	/* fvco = fref * (M + K/2^24) / p * (S+1) */
 	fvco *= mdiv;
 	fvco = (fvco << 24) + kdiv;
-	do_div(fvco, ((pdiv * (sdiv + 1)) << 24));
+	fvco = div64_u64(fvco, ((pdiv * (sdiv + 1)) << 24));
 
 	return (unsigned long)fvco;
 }
-- 
2.51.0

