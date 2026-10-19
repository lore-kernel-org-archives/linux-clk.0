Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1C4F4039
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417280; cv=none; b=mEGj79sQW5CTZdbdspTJ8LHVwFA4X690gN+gao8YfoxWAGOtcXk66SiYEOvWi7rh6oOa4okHBnm6r8CCvBKET9x164/Nbfj/p3D/QtPSnknBO+6nc6di9JvSkBn9MgWNzXzL8DhOXg3WpibfyUU4KmVtym1JZfAH6oW+E6SPlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417280; c=relaxed/simple;
	bh=joUv/Ln9rJRVnea/bPvLfbIskfPwA9Kc0p0uQMC5GvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqgyt6RCOG3I5BOw57mpedQYWlByKXpG+U3+VkszGo2Y3aeaDL4MfLOeDDmZZsRidBMc23kKZp6D3sFoIW8NZn6L25OIp90XvmjXf78IphKlFVdjJoVpnEABCadOG2WgH1g5UWaYDaYHfLJtR23fjSYnl8wkYyeU+wfNUZDxhLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0GhgCmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doeHQMIN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0GhgCmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doeHQMIN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1No2041974
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDcBRomfQLnAdi5Kz/nLvOdCw3zA7wWf+bA4tlUXG34=; b=B0GhgCmBO7WQxei6
	7eUUejvrvQgXMBuLOLH8skc4lYWoRCNBKolu+ggYkBpfCSi6yizowrgoVsHGhVgu
	oMf1IJDyTVfcEyfu8xFmiFrQUHjHnK0/lwkW6QcN9RFtD3s+gTfNC4FiMfAHbQj9
	Tr21Vr41rKQKHkn/b+jDRWjCelcl9fRlNLfJL9fV/JpXr8mz1oLRLEdwjf2M2Lus
	OoA8GD1UXaJoOrRA8A9YCTST+aHW5iHC/STzWZ2jJlRHWlXwrQ0HY2RI2Ql3PRMb
	J7xxBAG3gHRznu3QpYiro1bTXeAvlvPQ8U/xWG4fo1lGvlM88dh/SacfMNMXfZQ6
	zkaD2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2y3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 13:41:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so434503685a.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417276; x=1793022076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDcBRomfQLnAdi5Kz/nLvOdCw3zA7wWf+bA4tlUXG34=;
        b=doeHQMINWtleRGWkejY5R7nFEw232Xa50dX24VAFv4kNfxiCdF+Vtnz91F/9VTI78z
         TN/0Met2uAs82nYI3nk09D9ZzLYlAHS5MlPLruuABDgFv9iF/Ah9h1qGvbRK+pWoGsp+
         rqJAbPepWCAtrG8fpAvEMRmrPYpJ3NsCyJdTwuKXikqqRaVeSxPe7l43VqwXDWzHkMbp
         dUzzfM5BUSMW3wPHgx8VIUmJmB9sixGftkno/Ga9m8LtO0tuDhz7077jIpFeoeC/eBGk
         Yck0GliEe3ljYahhhlEiDhmiKEWGFkaTyK69C0nfyj1my31M2hOZKgVqJM6SKMHjKx7A
         fctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417276; x=1793022076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDcBRomfQLnAdi5Kz/nLvOdCw3zA7wWf+bA4tlUXG34=;
        b=U0hyMapUzLr1Hl4eaf85Lg+MlJGXoYlF2djMH3kBQeVSwV0bI3QEFI0tQIVF65sQ2z
         Q67SWYhDkjIccjIq7AoAODIFJxlWb7yN3N9hSLiqPKmM9WJbXc+hQ6N8MN+TrZu0a/pu
         F1LS819pyk/JkKi4Q4mpfP2We1ors8yiP0xHgwVsWd8U7wvlns12P/7jXXgFtVTFULtR
         dRuCTtxoam68XiZH0jg40in1dOrkORV+rVwxboTwhmxWkIQNB0yqv+tlgp3i7Mg7+hNs
         ughDDolnznkb7nmp5w/TBJ7IAOg74CktNnPpnzMr9RnX8y378sf37KG1vreHgdwn8CpC
         JspQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFWP3Os+hhivr2KC84CqwOrLUJgtw2k2qHhwRetJQ6SOAN1lo1SrD5ICXeGzi+IH5ahjPSjocnNVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI13hiDQLm60275wwFRBqbAzSxeuj8aUi+T6B+2YpRLPFm17lQe
	kp7dfWhJ6bBaPZizeUpWUCajPSAPvNxH2agFTlGGReXHp5SLAvvDbnMzHV3AYqIRdbDsnMyXIpe
	rwgZ6ob0cBV3/4MBN389v/QizNCyWs0/XQQ15tevOWyvpU7vK8YkPoqYXLv/VeCs=
X-Gm-Gg: AYBFou1uwEuSbjg22DqIIsYn1xEn1vRSH57v3xC9lJKepmjNRCSS7bi6DbP91dLx9xN
	jfB3msRFpMjbzwFiUiMKgWfYw/y4vPMGIjKbwUnCCQKh+N2cDNsH2sLdea+QZHiuRWL1zozB09r
	A7hdnq6H8O0PxC5pVladSVFlkRWNWveN8kXan0LjxKMQdb58pdpnwPFYoPuc6RCOszBUABPT+dF
	RlGfJTkLBrCiIe0ZU95r9VrdBHV4TwFLneEdij9Yv5x8wRUvhAyk2u+BjHHbAwqzX4wCoxcZzqx
	/L400fracQgiA38rhHrtUfP1m0QqKa3M/j39XStkIIW/kRqYre0xPUrJrHQHOdkzsOHR1FmtO3D
	vTwCMGKhj63PKtOKGYb+h4cCxvBkoCtXiRK3cM2lDJlf9P0QEprBWy/qrH+RYvKIt66unfUUt9+
	wo1yez1rDnuhjy
X-Received: by 2002:a05:620a:2601:b0:93e:6394:5e37 with SMTP id af79cd13be357-93f29ceeeaamr1384448385a.14.1792417276032;
        Mon, 19 Oct 2026 06:41:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2601:b0:93e:6394:5e37 with SMTP id af79cd13be357-93f29ceeeaamr1384440085a.14.1792417275392;
        Mon, 19 Oct 2026 06:41:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:02 +0300
Subject: [PATCH 03/10] clk: qcom: gpucc-msm8998: set the droop detector bit
 in the right register
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-3-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=joUv/Ln9rJRVnea/bPvLfbIskfPwA9Kc0p0uQMC5GvE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Y12Q+J4jeTQphvPG6uZ/i1NUvLqSXIIOK4g3B7/KHln
 ltjmXd2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAikp3s/6sOTbwV9D/QeMWU
 FSus63ivlLpxOp71cjr8U/dRs+Ncm8/dQXvP5a3tlGibEK/fEmR14/aqfQsDutSLJt/Yf0Lr+SE
 TYVft2Imz/4mEv1hTz30s6+PFW4kmHv9EOBUyhU20E3O3fgzhkTdY/dwj76PHsaYUnddX6tji2t
 YY9i1Lcp2n0VcgM/GHkOhJC+PbseEvDjp+FT6QLHRru3TP8ouup7IWxM45PWXvcv549U+5So5bG
 CcI209r3i93uMapc9XEuD8vbsTUy11aNDVdn/uZqKDKYVGnMzvkUyKWLJp5Rm/9icCkTo++syKq
 r11TPHqyVI/UO+6qiO5PnBF5RFi4hKev/kVkZ9PjLX9MAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX1NW7ZnFYKEYp
 Fax2Q5X0zKUCimRMkYYlC7frrVYA6F56iZ75m/JHTC4raI3/alp30O/jp/Ke/1ezCJ2cd+5pLpy
 KOndvKEPRMOe7dDlAnLhWZWBSiFp15U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXzJTt/jyD1YW3
 n+qsm6fBd8VuaNOyix5zIusoEL9OudQdJyD3HP8sDeIoFuGgLqvtz9k5jqjjz8zy26tJmAlZ3LQ
 T9NzaFta4BagTHeBS/gDgEwUlXrytJMuo+6/p7ElnPV13uOQVz6ZPcQIoBEKc6K0lAYrgnBoU46
 j4G7gXWNg3yvPs3GzmP/YcMHmkMzkCK3BRveHrUw8Le4G2UhfBqzhKO2sPn6g/bRUjX+nivvtV8
 m1w7ne4WXLemHztbiZ8ugEFqgq9Yx5jM+Sf0s8P41RaJFc5YrkYhok/IOr7Ud1NxBXcYu2dQB4j
 r2OC6JG/cagrSRDMdXzAhhIbQeEE28BzINWm/4NM2s0V9uMlOP91++b/t00RqgO+Zg4Qh3xZo7G
 6RW0XcivBfyzhbXAbb2tGwML14ZG0vZKWbVv7wj9QtskgI6U7FeHtXNXWCtzFMrDM1BAJJwFZTO
 mwT2NebPT4Ph16kCxsA==
X-Proofpoint-ORIG-GUID: lejys385qgKx-jS8xoS4SOx2bC8hYnck
X-Proofpoint-GUID: lejys385qgKx-jS8xoS4SOx2bC8hYnck
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad61dfc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IVk8QRzLKoR2IJ0CB2IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

The probe means to power down the GPU droop detector to cut the leakage
between the graphics and CX rails, but it sets bit 0 of the GFX3D branch
register instead of GPUCC_GPU_DD_WRAP_CTRL. That force-enables the GFX3D
clock and leaves the droop detector alone.

Write the bit to GPUCC_GPU_DD_WRAP_CTRL, as the vendor driver does.

Fixes: 3f7df5baa259 ("clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-msm8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 066793e47f79..8da10027f1f2 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -330,7 +330,7 @@ static int gpucc_msm8998_probe(struct platform_device *pdev)
 	/* force periph logic on to avoid perf counter corruption */
 	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
 	/* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
-	regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
+	regmap_write_bits(regmap, 0x430, BIT(0), BIT(0));
 
 	return qcom_cc_really_probe(&pdev->dev, &gpucc_msm8998_desc, regmap);
 }

-- 
2.47.3

