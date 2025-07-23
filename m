Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B91E2E7F38
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276177; cv=none; b=aIhQpGWjio/7/kmdtrjKRcrYl8Hb5uH8x6sKBasEsYjv24HLn2f75rq4k2wzARe9T/4jHQ1qS8e3OewvU6bKk5MNK+JqvuY0M8K+JYrKfHisMsTX4475s9O4CfSa2eL7nJXgp5j/bTrucWF0QcF7nmADot7S92VP3UZjS/AfWUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276177; c=relaxed/simple;
	bh=9bMIpxSp6P/2t9mAoqFS3nb+kCc2rNSG9SuI6TcUh4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Dr8i/9VT82tPDg8e1AEEYKWTwttVOEoVxRF8Kwq2OQOjgsx99VOPyG/IG3rj5L2Hkw9neJ4ywvBVwoapH5rBAVUblzYBFCEgvRzqxIRSt49vGolCR4N6z+ZYCDxnmbBIWOuPjL2IDDx9ys7fyGsRvM4azZfRbd4bCRDFkfFLefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K+CuX0ki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K+CuX0ki"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N98EDX016106
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1fE2F5w2oy/8xTtLiO5hyxrW9pDzDdrUHLDqce5e0Y=; b=K+CuX0ki4cf5X9BY
	AOGV4DBS00dKH/9foYodblzNrJQjknVLhVv/a0fhKRw1CxZ20xX3QwBDh765KtNV
	djkB+KBxXQEy1KGzRK27tozgbEdz7RF1uLYydzPw2OlRA0erip1kJQa2UT+Pye9t
	BBPwBbX68RzmzCc1Pu3OgvUER+CDYB8hM4RvAPyRrO3Me2Mv8yqwJ8veI97vSr6/
	dDHu8Oqz7HG/7rCsKr6ht1juqoAmNZTLX2ihU/lkGxvq6IdHyHviPJzSK1CO0D7/
	2NERgKuKOR+dwHKUtlz5EQ/hkZogh0Q8yTA3QUmTc30TK4nQWN6iJxQhsdbbzDL0
	0Fc92g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbjbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:09:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7df5870c8b1so90501285a.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 06:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276173; x=1753880973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1fE2F5w2oy/8xTtLiO5hyxrW9pDzDdrUHLDqce5e0Y=;
        b=XbsgllJGySHlhN3v0DS1KdJBU2nJO0LwypK+NqAqrcrVZe/6L95CES5m4m7bQ8MGwY
         R1ZKyWpMEgwRhWzPSi1PFPPjTmEuoZTB1FPwtMn51O6CsZHcKePamF1zynlASajpd1lc
         3FacynDGDO3InezMii2d4D4nHdGPtY3jgVLKsEVBEiOluVQSCXse8gGANZNmF2E6CBZN
         aPjlPyvBQetjvbUrFTlXwSBDKXnheuLeq4MLIW5BZTVjrhpacn4ThVykVFM7QlY8zc1A
         TsuL3WCQq0xFtfswCntFxuws/tTW86z1ECEpz7bcz2Ic4alJihUp/6gkaarDXlSU6uJk
         vsjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwOLKQubKOrr/+BPA7cWUj8TaEIwiylLK1DRp8bYnigz1/d5OUDn2ki1/CI6xilk/0eN3Nd9NzOWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2siFEvYebsM8Ap5Tb0O6XxubjNCldPO4VXJdB7Cc3VUDJ5Lus
	Z6jilhtpNSoUBtQr3y3RjHMBCcFAsJGCZ9GH7ZF1WXiyOzyB+/xMC+kuIOML1irTvgDdFXQYXWL
	Hb0J50DgtVN1Ssq1Gl0/hdCW+MHpnnh9vZD8PbIsIroZbiBbotoOtZOIpNy4GP90=
X-Gm-Gg: ASbGnctWfVkEdKIp9N2TwoobIBjivBGlIuAt5pVnOpb4SNb2Z/XyUdaz5/CdW2DnwFe
	1D3t/znl3vr0uOt1CWqWunpPXc9YE/Ti2xSdVdF0I85PsEL4nVnmfUQ+7DPwHZSzutKPAG6QaQx
	tWER7aRlMNNd/alhLQGY+N9oDokGYKtpME20mLF0UVQy8MNHND0UrgBupwdx7Yao4qRK61IRA2g
	dwZjSbUEDLJ4O3bWU1UfPzsLTMoDNg0bVxD0NZGFU8e+0yuKbYjIZiEByP23d5d8uw5crn3OshU
	zdqMNN/+ZlVZXG3w1+Gk2cjq4qPrZ4fLHFK7uJG9GnxZARo7nO2O6v5+WJuIADB6HFY+ofgrqp6
	qEZLBD7HLkYUzKabQJA==
X-Received: by 2002:a05:620a:2727:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e62a174a0bmr158140685a.12.1753276173208;
        Wed, 23 Jul 2025 06:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg+9k+t833aHUHXP8ePI1nQxSBGAeS4mxQTKC61GZLuKY579K2Vn6dySszIzHD/n1n2LN2ag==
X-Received: by 2002:a05:620a:2727:b0:7e3:4535:4f7b with SMTP id af79cd13be357-7e62a174a0bmr158137185a.12.1753276172434;
        Wed, 23 Jul 2025 06:09:32 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7c77c0sm1045393666b.35.2025.07.23.06.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:09:31 -0700 (PDT)
Message-ID: <75a1935a-b6c1-4339-8b4d-12af9ead51e6@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:09:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250723110815.2865403-1-quic_varada@quicinc.com>
 <20250723110815.2865403-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723110815.2865403-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oWCOLLso4kyATuV3po8X232cC3iecK9x
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880df0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=osBE9IlwIbL1kcFus-gA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMiBTYWx0ZWRfX0iH/99FZ9xjA
 qOnNmABVU6tyh1SiBQ1t9LmlWxAPLFQS0VzbEiiw/XWc7xukp+gO/7Wss46GSw1A3HUGBULj4SL
 7Jt9nwgfbOj2/NzNPWjroiu18JRzCC4qYBbwv8akMy1sNWv9pNuLC39M1/RjrlY/WAhitlg1/4j
 6QbHP21USGtHuXm9y/oVbe4XDv/utMEb/y+e+d2dDWn/YDzHTKYQoTKKcmsTK3whz/EMByU5BYw
 km9Tr/GWkZKFoIYnpJ8nEQsxUVuysr+p8stF5XHKMflgf9gHisnugrqnafvO7w/fueRJDHMQ8gl
 gqejkcmIBWc1lQ8dxbWQf2rlzjEHYA6imlyUl+KBPGtl/63OPiiwyyYb60ilVABWcOshI/pbjjx
 IHM3gikXNI7AD9+3lC4CiPtup9m9FamZPKbDS56B0WC8F+SZ/FOuJTLjl/TZH2mzf6akF3Cb
X-Proofpoint-ORIG-GUID: oWCOLLso4kyATuV3po8X232cC3iecK9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230112

On 7/23/25 1:08 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Model L3 pll as ICC clock and add relevant structures
>     Use CLK_ALPHA_PLL_TYPE_HUAYRA_2290 register offsets instead
>     of duplicate ipq5424_pll_offsets definition.
>     Inline clock rates.
>     Fix MODULE_LICENSE
> ---

[...]

Since the last time this was posted, we got some additional infra code..

> +static int apss_ipq5424_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &apss_ipq5424_regmap_config);
> +	if (!regmap)
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&ipq5424_l3_pll, regmap, &l3_pll_config);
> +
> +	clk_alpha_pll_configure(&ipq5424_apss_pll, regmap, &apss_pll_config);
> +
> +	ret = qcom_cc_really_probe(dev, &apss_ipq5424_desc, regmap);
> +	if (!ret)
> +		dev_dbg(&pdev->dev, "Registered APSS & L3 clock provider\n");
> +
> +	return ret;

You can now replace the entirety of this function with qcom_cc_driver_data

Konrad
