Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BA525A2B5
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958225; cv=none; b=fnpDUv4i6y13W+AuVQm1C9IaJWIkiy4RR++qwU24060JatTmw3tPO2L1F9jfBGvEF6PW03HeP0d7oPtylDWT1JLs5//xgdTvXOk+tVVFUPnCkNZcqFmazlTlWerVyp9qAoLsH+O4BuHvMQ83n+b+UwlZ37WXC9eASWstbbIa82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958225; c=relaxed/simple;
	bh=GwE8FjDB4hgHZTroAXgWDyHg5DjY49WcxEpUMw9oLvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfWrC/5m5r9eqRENBI2CdoDzsQHcsQZyCC927E65qa999lbPvBHiorP1TdW+XWJuAsFqyO0KDQ6oGJ/61MOeXxw8dOi9KpuhC2hADSYz4tCLdIquFERo4llP6S9IHrB4TLj/3bHeg4hrURqMDgLu4IsXIV0Y0HOUZc8RV+VBvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl5ufinM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl5ufinM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMURsI006065
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWB8h5H0hYMzjnnlPftSrbIL
	TIoJkun3efvv1qjHRHk=; b=Wl5ufinM7COLLnxZ5k8yozvYZX5Pvp684nsk7B0x
	f7SHDgq6bBGSvoNhsi4a19kPrgs9F/o+YyvVx1HBFkBV9DLD+9IA0GZZrB0jpwPX
	bmkmL/xDdRpTkyi2lwaB6IUdhMrhgmb8Muwo1oFO+SGKtuS9d9ZDElG1jps9wzek
	5GxZ4W8/rAc3NkI9/LiOYmJ5pJ5E9pZqWoN8x/sSiZajuZg0BVhg4IM2nZ6MuNV3
	fXj/phgyFoLB2vA0m1XoUB03AdvmWCJq4mlKqsVn2eK/MIGzY8HTqS0j6rzsrZcx
	90tnsjrZqNg2ftRTEXJiAEF0wGZayiQCYAFEpnteDX/7lQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343vhf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:03:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-818bf399f8aso216870586d6.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 04:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958222; x=1761563022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWB8h5H0hYMzjnnlPftSrbILTIoJkun3efvv1qjHRHk=;
        b=ix58BW4wg2No6Z4Ffnx+jvQ5giPkFnAE3IKQVFPQ/GbLQ5HzpS9/aJA9a/Wq+mrHRr
         Mw+af8NVD8e6wJMfana8oWTOIL53fGUEQaKHzAnK/OmL7gGBrRdSaqZgYI+r5S6GthTM
         yte9IM3DJH0k4s9tSGMHsYRF2GsRC/Aq1+X5Ya+1+UiuIP0yFc85f+jv5Uw7Dl0eZwqq
         /WQcxNQtjFoK3rejvqbzRGdThrxNk+J0encEaeK6DRYiwRWo34rj5UeGA5IXq/kVFZhb
         9bLE+yM9SpMNKQTaUI1wC/vipmGTyKviIk5eb2Ew/HUZPpAORzZhzP+PdlSDc5hMNVeC
         Ouug==
X-Forwarded-Encrypted: i=1; AJvYcCVuKt/bG1ho0ipYrKF1AsXFfuSxfmRAQivnv/xd5EiWSCiPU6lyUAcLoSKO1UN5di4fGfpj3+q/6P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuCux6eadgjaz6RBrSBVXc6WFj+3JyOD8vM7DGc6OYTT/iexG
	Yi5xZB2esqLaUI/5T9fs1LTUBEOrIIhbVbZ9EDcvxVofLMfqODzuOKM0BHVKo+dGjrDU7i6bPH4
	oEBbKOy6fLP/lZvaR0L+NpHSceMLn2ScXuoLAoVJbT5EEDPiKvfvjnK8sh9AozHw=
X-Gm-Gg: ASbGncsshiJMbOyO0ia42lMqKHHo9rqg7BoLjQYMX1wvSMkn+FGkMOiXINhZ9cyC7io
	PRFSQZ8ZSRaLRxJ5LO5QG3D5TJF9jXg9nIwIqRl5N+rA7vlDq0N6l/No7T3XYxoYLlQQ3II2DDE
	01d0QfIUjS568PXCGXC/dBj0cO2UUeErEqEiUlnqG8ZAHF/9b1/yo07G+FPWJa/jMzQcG6YAThv
	t89WT1RJHuGRrlopXXOXHWAaIJliDMQNTtnQmq0bC4tsUWK3eK7GH8TFMgoxwLw0TSSjLTjoX/J
	DbKvCvHQ0FbGm3QfeSkARlwjPlOZXE3fu5fS1ydGq31BlfwZ2ppSUOhTPhFXfNlNVn8st+v79g4
	qDRgxLP/1sXvBQ8amCLIBZNdL18imhmjK1xpnz/eLfbFsL34SLasytNAQ1KdOj1DDiEPkvlciIn
	+CktgCmLyu47Y=
X-Received: by 2002:a05:622a:1451:b0:4e8:aff9:a7a8 with SMTP id d75a77b69052e-4e8aff9aa38mr85571751cf.52.1760958222009;
        Mon, 20 Oct 2025 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3ulAC5BvhoDz+6jrsrwTh0BMNZ8/dl/jE+ChosHXeyCGiP54CwsbF4BKvdsYJ7LNOOeCVAg==
X-Received: by 2002:a05:622a:1451:b0:4e8:aff9:a7a8 with SMTP id d75a77b69052e-4e8aff9aa38mr85571321cf.52.1760958221575;
        Mon, 20 Oct 2025 04:03:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deec11a7sm2433662e87.47.2025.10.20.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:03:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 5/9] clk: qcom: Update TCSR clock driver for Kaanapali
Message-ID: <jr6qz23acm2ipspsvyxjpabg3b4bspapia2pqd7b2grrtvnct5@v7mjwnr5o6qa>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-5-29b02b818782@oss.qualcomm.com>
X-Proofpoint-GUID: -qszcr-ujd9MKLindZYMecU9F4vAU2_J
X-Proofpoint-ORIG-GUID: -qszcr-ujd9MKLindZYMecU9F4vAU2_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX76Z4RrbPNFZP
 tH5qhcKUFFq9wH+f8LP7ihPhbdB2CiOJmFRaqNFJggVKNvO+15aODDWAw4Uf5LvgJy17EPl1gCU
 JCUkZtMzXpd0FGjXd9cXM9xEiyQNbDXV8qVcDa6r1p2eVrqNDOBa+oxx4pBfgZ566sfncsOVKlh
 HbrwBonZQ4GhsGQWMG4aBJ0H6hVogcIpoQ02WKwg0TYvGDBp/hs6CheBnWHysfAnfBlQjxel4Gy
 NFs8II8Bmyh+cFAhyi6cwp5NQGRtPqiNPNT395jHXxT67zRFwwtwiVB+7xXT6ypF6ukzZrpeucB
 b4Pd9bvyp9/OYjVE3CrSVXwgPfi6JoaCBzgGxHo5A3AeQQZF3WB3+QxknHPku76rxGcjJCRArT0
 JpDbMYlJqcZ2nTQKtqsPlfOxFtS13Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f6170f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h2OAjeu8WJ8lyUsXYpwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Wed, Sep 24, 2025 at 03:58:57PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The TCSR clock controller found on Kaanapali provides refclks for PCIE, USB
> and UFS. Update the SM8750 driver to fix the offsets for the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/tcsrcc-sm8750.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
> index 242e320986ef..f905f3824d7e 100644
> --- a/drivers/clk/qcom/tcsrcc-sm8750.c
> +++ b/drivers/clk/qcom/tcsrcc-sm8750.c
> @@ -100,21 +100,51 @@ static const struct regmap_config tcsr_cc_sm8750_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const struct regmap_config tcsr_cc_kaanapali_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x18,
> +	.fast_io = true,
> +};
> +
>  static const struct qcom_cc_desc tcsr_cc_sm8750_desc = {
>  	.config = &tcsr_cc_sm8750_regmap_config,
>  	.clks = tcsr_cc_sm8750_clocks,
>  	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
>  };
>  
> +static const struct qcom_cc_desc tcsr_cc_kaanapali_desc = {
> +	.config = &tcsr_cc_kaanapali_regmap_config,
> +	.clks = tcsr_cc_sm8750_clocks,
> +	.num_clks = ARRAY_SIZE(tcsr_cc_sm8750_clocks),
> +};
> +
>  static const struct of_device_id tcsr_cc_sm8750_match_table[] = {
> -	{ .compatible = "qcom,sm8750-tcsr" },
> +	{ .compatible = "qcom,kaanapali-tcsr", .data = &tcsr_cc_kaanapali_desc},
> +	{ .compatible = "qcom,sm8750-tcsr", .data = &tcsr_cc_sm8750_desc},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, tcsr_cc_sm8750_match_table);
>  
>  static int tcsr_cc_sm8750_probe(struct platform_device *pdev)
>  {
> -	return qcom_cc_probe(pdev, &tcsr_cc_sm8750_desc);
> +	const struct qcom_cc_desc *desc;
> +
> +	desc = device_get_match_data(&pdev->dev);
> +
> +	if (device_is_compatible(&pdev->dev, "qcom,kaanapali-tcsr")) {
> +		tcsr_ufs_clkref_en.halt_reg = 0x10;
> +		tcsr_ufs_clkref_en.clkr.enable_reg = 0x10;
> +
> +		tcsr_usb2_clkref_en.halt_reg = 0x18;
> +		tcsr_usb2_clkref_en.clkr.enable_reg = 0x18;
> +
> +		tcsr_usb3_clkref_en.halt_reg = 0x8;
> +		tcsr_usb3_clkref_en.clkr.enable_reg = 0x8;
> +	}

Granted the size of the driver, it doesn't feel like these two entries
belong to the same driver. Please split it to a separate one.

> +
> +	return qcom_cc_probe(pdev, desc);
>  }
>  
>  static struct platform_driver tcsr_cc_sm8750_driver = {
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
