Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C35382281
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406480; cv=none; b=uFDEy2XapUM8esfo9x34UcxfnT2q72IXWaNf36tMgvlUUlhmPycrFpGm1AuN9jorexsuh/L87gAdF5rCtfKT/1JoOmJtSYdJ+oqITPClcNoiaDCX6S53LbwSaBlkCNaDLakLX+5WIY6X/90r3cFo0tRq/SSpWOLQXYQlIWChtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406480; c=relaxed/simple;
	bh=jQS5hWOdYB418CAw1PuBt8maqGMZdsbdkaYVXTrqH8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndTcoMpvw6+f1bYbbTFljGccvt/e6OacQ8g2qIoVz3ksbB3QOIas/IFVwulOLMVWGZ6MFTq9YHZjldCok2JwGX8Nng58L0qxWMkgsVgNlXFpE05RwIaIFowHH0yiC0DXn6eFRpzyRR/HzGkfiALewROWY8HbMOkAJeUaEAA8IJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjXFX2Dx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgE580FD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjXFX2Dx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgE580FD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8KB481451
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=; b=NjXFX2DxghTuYEVc
	gkLO9DchOlg6Ct64GA/xzNCBdaCoqS5x5lb8bzKR6d6gJkCDoUtNNA8+CDYKWkZe
	J6ROl4bWcC1hOPZY2+FPRonOGLycVeRCPZlV2xMXPYy0dFsVcCmPI2gzDx/5KY6b
	uBL+cYO2rprRA8gSl2kjlMEdHRNb03i3yV4YoitdXaXyWD1wm2QTyl8SNoYM+Loy
	6/usSWLgOBLr6r5zpKhUbyZpo4EB3vGM1JnmfmTeU3XgzVEyTVzTxQP3SJDCqqdq
	QpHsJmMfNwGiszMJ9bAWxcUCdnvYx9V57LB5JZ4ZUqfTiooWovFhx6CAdAfqAoNg
	a3G4hg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rrre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:54:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso105510585a.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406477; x=1774011277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=;
        b=YgE580FDHF0xVVmM2L58r2beHUuXjy3mt6SvZjT0rzfV8ex2CnPx7cRzlLIthKTo/v
         MjOBXvXWpvZ2GKfOd1uhYCaDCt7LMmJSyi7syYMQ3tSvFzw8W3y4EZdkOFo2yHCSi7Nc
         W6+GpTASnCeAwanWNeO2DvWsRc4INGAdEOqCPLTdYNpDsczJEDblnKla3a9irlrIVbS5
         0P5pA3uVZeFoXFInATCr5R0JMTNV2pgpg6BYGoiXYht61sK0g7lv1oNQ+jhDbeaXT3kH
         MUBgnprFCfGleOoodP7XexEw4WUYzmXPpYEhqINrzic8OiKNY577hjABUJsb/OvyeLV9
         IUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406477; x=1774011277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrWQ1YC99XSo/kzP4swRrD7onPPXsUnNzZTfAflWHlI=;
        b=MYbda1OnAlm42EBnmCsEaNS1lfX0i6RpOlZ87KAr0OOTavMR1WIhdwWZrZNSONnKhV
         dEbEb+Ae75CVyzi+2nJV1Cv8EV4sTNdCHrL0zFfweSvzpH4KgoAsUf6tWz7BsJE47xZi
         Wjc5T9NwCFbh7VWyJ7ocLhq3zf3YPyjNLz8Ncx+1IpSRudDctIOLuBBK/BiB+xwQb/NA
         e9H+rjigYwJQ8hjLkHQRqKvBz09or0em423znWL6XpVjsYwtPDLKY1bi+vJhVXD8kASl
         bVG6MpzEI+QfloqHVBSdA5cNUI128Tri9CCmjzyWIzGqQs05S3MmZq7UNoLglLSfQrja
         ddyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgh3GxENcP/igcLx2U1uwrFjEq5qUzjS0nIFR2jLQzy+AB5VlIL/kHCf/PvmXB7l0CBqhvnVas6mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrCU545Ye/jIwS4xP0cqVReIb01xox63flnMX1UGEyz6uZjJN
	hVGWuYfaLhdQx22eSVXLEZzoQzrA1MMpFCYAyURGxHYnhsop2SEf0gZ4hpjlup02rbEmYh8ZEUG
	mC6euY9VH74zGxt50qQMVv1KvLRFcDArlfZO2QYs23nzmm+d7CTh44XtyKrh2u/o=
X-Gm-Gg: ATEYQzzvTGs580YJBQzG8/f9qZEtmX6rHbbaJUD8bhGxvz92yOom0+vBNFTlvlmMR6b
	N0WLR17uMronNjTlq6VwxjIwbZ26uyMnHP6B+YKUxovv7Ym1LUGOejszRxvbueYL9263u2UXB0j
	qZ5IM3xkPrK0dHyRLmolGvNy5wVTWq5GYhTcoH/zdwia/zefo2iwIKAnE114Cm892ku7cu0MD3U
	3wgqwDaOG7Rc+upcbjVg8QqzxEF3XxC4muqx4op78bnGUGSTk21nMCoJrX3Q+YnthBZlaIybvkd
	KbhqLxsZVMstqJ+UWvXmi3014hpFwA0Vhtz0a2CJraFToKkPvywFmPyRat1F5bFRX9DSJp6vEtf
	6Df1D+cVifxJj+blvz+dhZT84cgDoNcB/T9rFfUM8NEVPIOuQ8ieZzkdI8j+qpEVMPkeJDoxPCh
	1b344=
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr314016085a.3.1773406477432;
        Fri, 13 Mar 2026 05:54:37 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cdb5a7e0f1mr314014185a.3.1773406476882;
        Fri, 13 Mar 2026 05:54:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dc9csm794503a12.17.2026.03.13.05.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:54:35 -0700 (PDT)
Message-ID: <05a1dcfc-7df1-4b20-a504-468814a87b3d@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:54:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oyMQK0RsEbbL9REO7pRc4blwVqcfEmsX
X-Proofpoint-GUID: oyMQK0RsEbbL9REO7pRc4blwVqcfEmsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfXwRnUw8G9lKuH
 TqOKpUQRXrovs8+TQZdox+LxWytDZJ9CdB5T4Ltuh3YqCTHp4eSchEOGU4UyYROKJcewQxsEiGJ
 lYoNwhQxYj7tyaO12So/2X7QrGECCLfzP2bAYGFZ6Dh9T+ZdBPXr9y+y8Km0+ABgS+fRRM257u6
 km9wECLlYVpxpYKb4tKQpWyUXS1E9l5XuYcffDCZKgoFu3vtlVO2YPuMO8J4ziNEX/2I9TOV+ON
 Dw9ENvD0pBHLA1UKexRQdXhz4fraBoQZe8rhaKrJICoXlEdjuxNhIWiLjYAgbhVbXDwipA3hiCc
 RY5QL6GgVbSjfIDoEVmPrsoGX7SxD205JY1ml2LzDbTcc0R8DByleUGPt//28SmI45OTqMHhGtq
 PmBFqI2G0RpQeFjQgUSxIDKtBbzEZesHOlFurkk7SoL4v84JEH0Wxs/P1Qedq69lOgNMOEtKdG3
 pj6CcWI3NjncFeoZKtg==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b4090e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=V7fxQ59pePFiGF_lOj8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102

On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static const char *const Led00_groups[] = {

odd uppercase

> +	"gpio23",
> +};
> +
> +static const char *const led01_groups[] = {
> +	"gpio39",
> +};
> +
> +static const char *const led02_groups[] = {
> +	"gpio6",
> +};

What do these 'ledN[012]' functions represent? Are they muxes for
getting activity/status signals for eth/wlan ports?

Konrad
