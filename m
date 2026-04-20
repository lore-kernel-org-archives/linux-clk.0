Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430C352C39
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702634; cv=none; b=XHrJyLPa9a5oT2ZdJEZMyvB8qqy4OrR4d15AyfHNsCAaFxPnXsFohT1vX0G8vsI4REM9KE3ynw+E9VgImfsYq5ZGpyy7Opr8/t9/NroXYO1fBwW5SrOzsniONtW81lGtOU1E8Vxyp4RzKUC02eRWNx1cR5dX09dtvVX8qZA/r8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702634; c=relaxed/simple;
	bh=gt6Nb3naTJFNtraTGwDLi4SVqjUxxdEnDLsbiv/OeNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8oKxZXzNAGiLtxfIpzzwDFe+vwBIO21bUVl3O0GHUtCftt+hnzu70+3hR/9gADIYSOWS3JZZw/QsfeZsGiTCgiT235LbH7AfBdPSxm5XuB7JfYZksTp/4DnPNXzHrJE/jkJNJ25L/z+vMhkoPFfpOjHwhWKO1SMfl2PnCZ4qvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVBb+t9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fnt8NvIz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVBb+t9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fnt8NvIz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KG1htr785558
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=; b=IVBb+t9dBz4eELcN
	iJuAMEHUAr6bnx3Kc0uy37PtEX5XHk10eeeRS0viDxn3pxwRDwTLXR7y5/hNWEg2
	vhA+F/2J8ByusHP8VB89sP/+DJTitgq93dPB+mNhfTDBJNzvmGrXHlmURrCU7KYx
	ouuqL1KvMq96RzE7LRBXRWF5WLH86JfOvE3PptzquQrDkBm9eV9SiMD/Qlbfz/nP
	ac1o61hfZC9oNCXaAShnsphvv7rpSO0KiGhAgaDunebksayfc2SAbrfaL0TeFPFq
	tybsYhhji2m3mhXkVzs5FWz36i1hGwjPY5pC29xqV5nERjl6ItQtRcEAbbDZDCne
	rxNwXg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhhjfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 16:30:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso1101990a12.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702631; x=1777307431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=Fnt8NvIzkCejoTewsWQCk6oWMumwldVJ7hpuNgmh3bpy1Hz0k9hQyJLI8r4BbNDTSu
         Fl22RNKWTLKIxXPkEV6JOJsXtnq19MaRab7dv5OURqKvPiLnYjl2hL8dor/UfHXBKb5D
         QmvIfKqf3qQzp+88kNPDQ7DemcmqbwXspPgUo7IhgS/sgX5x7ArQz6tGmznqqKlXsbLw
         zqXRO/32eWPNJfPzfW/QFg33ca8nq9kQFgdM3iTodcb5vDEAEPGajbOn1iZMwOljrPUm
         VVHcMjm0KSLYv6/rofPJr4meP1SmeUXEJlLEI9LVtEQGUsK5tlJRvGNVpfRUmzxyb0fJ
         LOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702631; x=1777307431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4v1Vsq5+wmWBuK+4aUkGVPkp5YlvYrPjj2b4/mnlD0=;
        b=BnL3AT7KANIBpy3mM6sDPsaxP6jZjyFuAZgmV7NkjnCFdUg94TD6z9uFd05W1Mh2W+
         i+KvbETILNpQDOJKXkdOum/w67A/SThQ080rATg0dwb1W1lKYrJNvxHyYhuh6FFwOWm4
         ptv68jsIyDJBlQj/Yo54IERuXcQ5tyhcFy6pyGZSCcQFxpfMukcQs7R9TG3EuOTbGeFL
         rGhLSrdl6ybRlFzyRDBMQ/CAusEfOrpcb1Gez48oQRQAXux6nnwnvT31XQGad/Q1QdDc
         qIfi/WfPOMBKExQgYrHRmYlKIZshBhSEwp0wFtrTyW8jNqco5ESXcjmjd+V4smSeXvGS
         ZSCw==
X-Forwarded-Encrypted: i=1; AFNElJ9C/EHdklKfxQfGCve/2x98B10cqzCiPjulHFIIn4uvnfutCdpdiLzhX/qgXxZxjSySFtj3mDZU9NM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VozelB4QP5Cn7UfwIMq2jot6hiIGJNPpOzQnEgyQ9lQ2DOtT
	yaF5A792EX+G6BYDDA1/Is/0FC1TfSpWS4T2cOoNV3I5DnTpQETSpApcCpCehrwsoeYj6a9epAY
	ES89FniOVncNlTEFD19MuEhKYD3evLgA/RiR/uZ3F0fmBZ6R0Jp5XvdPNcU55vW8=
X-Gm-Gg: AeBDiet5ejhfsOzt/Co+7qqt+WiOjzGNoGVT+u8dH7fTgtJnoBBcaj6+rB2yNhJURXs
	E1hZYMDNNVCUXPXYfelUHeIQz5GNw/s98UjqB4IUiG2iNBD6XMAEIRuCpde+myHjrYgzbgLeNFt
	lQcq6Qyi4Pgphv6V3498N5RGUyJpGrQTvMrwY473HS7b6gdRk0rmQVceD1n8lzQ5uDOPPEA/36y
	M2sxZblkwVEEl3X3oFscB8+fEr7CYaqC8agvYHgyu4Fvd7zx0If6+CeqmlFyj/GmCjldm2/XDD0
	JScsFBNC9/vShKRGycbZIg7tnA2nWGuSvvTGI63mQIlIBQ3gPdgI/ZlX19omzjB1Ft9TgkI/XAS
	3I2qn+LZp9ljBEW+vn+69BwT5OW/32Ulcvlq+Ssjv+ifZjJT3gmDeHXF/Hi9668c=
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172731b3a.13.1776702631299;
        Mon, 20 Apr 2026 09:30:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2341:b0:82f:2d48:f8f4 with SMTP id d2e1a72fcca58-82f8c825655mr15172444b3a.13.1776702627534;
        Mon, 20 Apr 2026 09:30:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:26 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:00 +0530
Subject: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: kaTrkpu3crJH0tx5p_uMxGpAsS0JqMNA
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e654a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0acwFryUwAlR3FHL9NYA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: kaTrkpu3crJH0tx5p_uMxGpAsS0JqMNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX4fJbGdlRaKYg
 kY9s/Rb+52ipsrjKEvSN6nz2bgUU0OOgk9dxfP9/WeRniWAbR7noP9w3HBNLUSsqHJh/UhESRTL
 Q6Ttw8CCzzNdHX7qRmfgv8Lm/0ge7RtHfBfBnt0lIQ9Yn+MDH289D4yYa6JamlUSd5BDcv9JrPV
 JgT0Dqcd7D0ubSVCViVUmNZBPI/QrP/8pJprLSSBVc0ocexthATYQwsYXXX1F8rFEnDAinks677
 eMEPmlu+QXRZWpIO4MwSMXfPsZW9FKy9u1OzgEUgBOrwOWHXY/6TGSv3yZ++aA38TETryUilZqi
 T0iVkF4asJixa8fPLcK9BEYvvCVmaUG04Zf4oHrD7dH2Wn7js/YlOAl6idP1KHBAZtKu/WbGw/p
 5Kuhyv6uKl6714XWx75yuAbo350d3t6ayhmpcbTO6lhJVYckkcKU0AYwxyZey35JOdjMGh1ujSX
 Axk4+jKbdyBJdqbcjvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159

Some PLLs are already configured as part of CRM(CESTA Resource
manager) initialization. Add support to skip PLL reconfiguration
for such PLLs that are already configured.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config)
 {
-	u32 lval = config->l;
+	u32 lval = config->l, regval;
 
 	/*
 	 * If the bootloader left the PLL enabled it's likely that there are
@@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 		return;
 	}
 
+	/* Return early if PLL is already configured */
+	regmap_read(regmap, PLL_L_VAL(pll), &regval);
+	regval &= LUCID_EVO_PLL_L_VAL_MASK;
+	if (regval)
+		return;
+
 	if (config->cal_l)
 		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
 	else

-- 
2.34.1

