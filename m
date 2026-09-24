Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75049D5BA
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251766; cv=none; b=Bl4Lh4oTfHR3x1MK67Pc8RqQRB/WxKvHnutBXWTJwkB/1jSijQUNBOaWaTzGv4SjOxv6W8FupgJT0OwsTMg3fDBl/kNqpubdHHo2bzKx50iIzyerDAvXjTyR5T0OOs48agyEhcHU7WLt+PAUOm849YRjSoUUx073VomdKpAkbLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251766; c=relaxed/simple;
	bh=fpAqyKfFKWy71M9unm4jkKwXTIYpTZjdc2DJToIUe54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDZWR0MJYpzJ2rbKkMhFLiRCIJVZS1dQ7Wf7bpV9UgCvfXkFHnFiwp5jVeg/oHPs5WMDAeKePXtD1pKrJxMHJRi0J7DgcDoq5V6uMQMxKCvmh/OwGfzyGlCNCuNnSQS5XFGy76znW8nVXM/e3EMU+Dj/bUhPrBs9+WRT8WLTH0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pk0xdaAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z89Bpsct; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pk0xdaAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z89Bpsct"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ZQo2285548
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=; b=Pk0xdaAVrZff6v5K
	rqVDp0DBlVBbHFqKvMGEa/efjXm9u5SemevNc1qnurPEQimdxybF6FVwsQ5awDKR
	aNNMGz4Knlw6CY+hiXu22bHIN6KvPh1V9SZ1oW1lBs8xdaoA07MP99/tyUAQYxlJ
	wDMvu4B8L+OpTRctL6AdxLj2pwMaNLbkyHRlxM8u8YZEsiqobtSag71iBtmOdO0S
	DAOwEgzO2i+a0XdpnniPndLLZFu8ai0FRYBmAD32Mq72xWt1iVP13XeVE0DW8/Op
	zCMRwYgu5WtEtnMBQscESfGoYs11KMkXh+ZOxNOZW0IM/IZPGLSLNbqK8vq5T3h7
	yxvTAw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:23 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so593092e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251763; x=1790856563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=;
        b=Z89BpsctTdTDRzBH9x8SBOp9YVuIXJkNcSomVR1pBmQ7kOdIKrjY7aWIiIvqcIfZ1r
         mBOL0PZrvfkyZEaNT5iE0EYX+IZpmiIfi1L68EBdWRNPtHCiMUZMRi13jWMzrJzcK3sk
         KNe0JKSZww+l+jEOAhOneGki7GTK+7eHqGJRHyyl2uxKWKU3Eco4wJ6NDl/W9ZMbAeXq
         9Fq07DhAOhXi1OUypH3ip0QLycENTpnLcLrHuWa5oKCbXwyXA6lA7x8SIV1l4IaKFHO7
         JewNV6boC7XTG3VtDH6OTDQ/PAYuP8o9rrQ7Ch3eUP1U72IhwY86F+WbAh70PFjJuA57
         FtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251763; x=1790856563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLwGTbScYA+2Nkx7d7vhUGR21/t2WEvalslJyIBCbVw=;
        b=rBlgDqtb0TNjFz8WpphJhGSZ9qVnDQYKhH/4eET/VOJXlvXR2A+hNWEpemaUaxlxQc
         7cLXQ4pRt3mDOpEpKDWkUPBKLIGFc+dlVg8jsImAkYAh0Wt7oGhz9ALsF2uJCjrLma0H
         8yRnwrkyGsldnkqWer1kfPw6gMnJg7VMokKBHNbVbWqYQB7+Jb8CvYNz+tk9aNDQZKs3
         BxprLF3oQ/tenz33uc9eAuE5EMIYCMQ+f3GflFVeB9AotPLojzEKWVEzCybhsgwUFtTZ
         OZNcxpOkDIHwGYTpHmzNa3vvkenuJYSEBjDPZ9oEowRCWZFmxdUFtTLXWs60tTCcAlF8
         h1Iw==
X-Forwarded-Encrypted: i=1; AKwUvBx51qRJt4HOhtTUEQ/XBrrVz7Y4VE35gf4bDj5MPaM1cjIepMeHGg+9mkTVOQvY5ToQYcPQ3NVTUYU=@vger.kernel.org
X-Gm-Message-State: AFuF++kaWL+HU0ox9yvkGvtT/QgFr16ZbA4ttwJ4r1zFVgrhuxsX7pDM
	B/gLl+f1f1wwjX7U6R5wGfMeb2HAUe4EDImXAw8m4eSh9aMqQs2RVMHvtGbNBsjzyAVhA1KogjH
	YSwcDqTd2VxcZW2XLbDJaOb8cwEGwgWGJ3RFsJ64il45u2rRFoFwaAf78N6QPf9Y=
X-Gm-Gg: AYBFou1gF6uVaAsL3KCbxHCqTQvPu5XjyiHtL2zFNo4N8+mIfkENQjF56/mm9caNovb
	rl7DtaoqTvV1pX5xEl2YhBCvV/5+V5skszF/A/6YAEDuGZHO1o7Lytaq12ZkOiwqnBRgfNWWnAK
	BVcGWWpvzZogmHaR/9Mf0e9qlAuR1UowI9to9NlHsGlTWRD1/BNqG9hFYeFbckFINUxx7lbCJEX
	LVf/xYmlGWV41qqC9z0XfgckmFQkaAkh36uuRfB8rOjHJ8MaAzsv9O6aG4nOPMx0msm7GCPTgRx
	7vTbhHFeWGZcFb4ItRTEmi1Kgms87gCCGHyvJSibfIif37g6LcXKdFio9fMdej0ow3BQDYuIkAn
	wOALWt4xt
X-Received: by 2002:a05:6102:50a6:b0:7a0:eb10:76aa with SMTP id ada2fe7eead31-7af1c7a07f0mr1109249137.2.1790251762637;
        Thu, 24 Sep 2026 05:09:22 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:7a0:eb10:76aa with SMTP id ada2fe7eead31-7af1c7a07f0mr1109234137.2.1790251762049;
        Thu, 24 Sep 2026 05:09:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:59 +0300
Subject: [PATCH v2 47/48] clk: qcom: videocc-sm8250: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-47-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fpAqyKfFKWy71M9unm4jkKwXTIYpTZjdc2DJToIUe54=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJvto0gM6txrFaI6aQsh0PS7s8e6iv4ckNQW
 i30X50y+vKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbwAKCRAbX0TJAJUV
 VnU+D/9thqA7exHm/mgM+2LKawqDr76G26Jy759bIYvgb7kTbHBXHmLXSg5kd3DjfQWrq58OAF0
 5iKebPsXpnFEdI/5/khHAA3KYkfuUJq7wycdrRtdoq2ImAcRZ/WFhvdLK4OgyGzpeWj4d9/weS/
 HWLfNyYbqhigYGYrwgzG2L/faYs2m+2GS68GV0VMdTU4JQ/JS/HihrYTB0HxnFGPv+cpAn3QSqJ
 gDy8SPdgC5e7CH+TDPeci3fqOnE1u1JWnaXt/Qvrr/C/wVB81lEYv+YsLCum71HkKV5/vv1DjzJ
 awQAX5zQyCww5UWQ4E78grN5bKFoBfb1Oz4126EAQLY/9417wxrK6WHzNGsjHigYDb+UzkG7zu2
 U2GaXChlR1DnhjKxj1H9s7Oh2tSIIE/t/cr109xQs2K8z8eUf/KbgJ4M478c4WZF61L2W4YhjeS
 F5lIA9/q+MGewts5JnCCxn0r219xwcjiEHNmbRwVEkXj8PfS0XF3WK6rAXMoT+qOGidvRUwig9K
 RHfHpM45tOvnDqzfCez7QmTtpq8Ey1L7t/Em0c3Dwn4ek38ZNTBO7Uvs1MpQ3ugvyR3jbAlppCT
 mbAvKKh8A00pQhtjqEV/QTsZ8XWfdIkkwlEJw+nGiTeeeTiTQxkTf3AUoA8tjXplU1GXB0qdELS
 732cwwvcNHfIyRA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7THalVbtGi4v
 hftgQJuJbYwe14yO2RGLiBMKNE7mUOoJiP1yXsScgAtbH/w87BIuK7Werle3BD2MDIl33NBZUsv
 o9/P+lkGi5CX3vL0lijg8sesz65NlYs=
X-Proofpoint-ORIG-GUID: aZdDut-0ty2Oj0asCb_ZProLx5HLdDc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzYkQF8KauH2Y
 /PDV/EVlbs1WiIaLa2l/wnBdBGdJ77C52SBIZ10D89utf+XyMJvojFi2pp7tKzVF2eosGPnvL/Z
 EHGet0gTTD9uLfxH3R/77TASDX3+u0DoaPQwnF+YWFXnhJjlmlUOvxSA0YY55uNDe4S0fojFdKO
 r46U8ie99DwjzDL3hZ6043Rfup4cjqlRYujIgMoBIZ96HqmCvjz7G0u1scR10idVAaIV6CiCxhb
 N8m9i2ECPao7uFhFxOudZPyFrciCmmcLok32+nN3IG1eZkFg0OMN7OOtyvMi7/k0SvONSYvdSVH
 5rHK9evm6T7mzR2U9QN5CviOOS0zFfVy640wnCy9RbUO8KozGjPoex8O7iCLXMi7IyhYQ8t5krq
 aNR4BQux3AFce1vIkDb3wzcN6LMez9IrqYwbt7mQzJEpvzU5P0vERR2QmCYeN2Vmf2+kEptBMn3
 Rjz+rqg5KulePtS05zQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512f3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w5mbRZx1dI4nJrn9fZAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: aZdDut-0ty2Oj0asCb_ZProLx5HLdDc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm8250.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index df479a69cddd..d29d64138508 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -345,7 +345,18 @@ static const struct regmap_config video_cc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8250_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8250_driver_data = {
+	.clk_cbcrs = video_cc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8250_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8250_desc = {
+	.driver_data = &video_cc_sm8250_driver_data,
 	.config = &video_cc_sm8250_regmap_config,
 	.clks = video_cc_sm8250_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8250_clocks),
@@ -383,10 +394,6 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xeec); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8250_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

