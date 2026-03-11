Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F43C9EE7
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240631; cv=none; b=YuGiI5hN3lFq2KguygfWpWlIIP+c8ddFw4xG/mLaLsZ0FJiVsNVOQF1knVhXhJYlNv0b21RIORlxHV3fAIUoMIs7ZKftIUOYg49GztD6aqPkmWFnRTkcZuJCJ9qAPklfUcUG21EH2JvIp5VwOHJThiDDNkS5s/8HffnBN/7YcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240631; c=relaxed/simple;
	bh=sqSC6+/K44mssFzse64hRisr9Lwqqa7dRnsrkspm/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGu/F5liJ4Qma9QaOEllJAAWNmlAmghd74bc4XKqKEUWMhAK9Vi661nsfs2b6GHW3Y4TW889MlusW5VpDydiqhjKTBbOL6RjRXrrYPs1w75AufV9606pY+v8rpsdpc3MZAKthsNoeA4D6UFQZcPiPi0AnrvTDqyiuhlqSwzfIJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDxadHvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DA7xQc5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDxadHvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DA7xQc5S"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BEeSb91572930
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YvrtAHy/lbnLFEN+e13f6AZn
	kCjI5WMhkOhjmIeICPw=; b=bDxadHvIawOHnBUjjGeNuA4s8/UiVOiZMhoj11U9
	Ug3TnUYZ09Iq1vbDY+ZRpltmngoQy94Oqthi2RBxi2PE7xjkZrBm4DkAe6hXjLFa
	CLfGNBHNxv1qLjdvdTE3I1y1lcK/4soESX5xfWchsJ6CRldW7OlijRuC2yHfPdv4
	cereTc03W2fU4JgoulCEnJMEloTHPtnLFkikin7YEI6qfU+1vpfWaMzni9X7ROM9
	3pXC3dlzrDsYyDtUP0BqKhYy2SofV4UOUw+9/sDk41MQZmqVq2ne6AvF34710jez
	AdlojjzleXYPgOVibnoleVsdrPcsTDeh2Nr+VguKmnWxmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkc332-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:50:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so1756462885a.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240628; x=1773845428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=DA7xQc5SntshUHnvjd1FvxUk5rLbX6ab2rJu+QY7YhTZXc7Oa97FUb5AUysUUCCxnG
         wujjqJmjLPCT+ArmjcTRM1qL+dn6repgvu0RIS+ZV/uh/2B1l2TVafZSem8vnIeJC+Nc
         Zsb94Y7kE33iij8d+TKEQ9sGHRDj+XYtW4ADjYzk6HlMyYcEY8bTBfDLFer7V8fOr7cK
         bqpK7gvVaZbnurzKCAbNJYdZl5mndQoe7R+fATJZSw8vQ/vlNcs+ZXftjT8mrXny/zs8
         R0exVzuDaCMm0rQAnpiR7FjeCv+n1jd/Pg0KvwQH73UFSZDR8iiCjgKDLHMNcGjzs9qI
         QZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240628; x=1773845428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvrtAHy/lbnLFEN+e13f6AZnkCjI5WMhkOhjmIeICPw=;
        b=ZcbY37IoueWIv5rTjtc1b59iVrHGvh1nPH3e91Xb5PbaVnaa0V9IUYVmbknVAhxlsF
         3jJtQF0yVG7GJx8E4o9LEROs0AWa+dsDQCiHzYy4QXANVYcvaRS+jwBRiz2+xO2FcyC9
         347k85qhq541BCblLcE+C12q9Hgefo5FV0ElrjkE5Z/gOql2lcZGIE8hPfaex/2eKyf9
         /vb7HyuuW65I/xMBTId5YuClj0BFsYgiLkgcsjSVq9iF8yVsIcFgflv85/slzJYeqY6H
         uvrcbF8t8yaDoFhRV5mX3ih/FRD5oZHBi4Yk2yamOVGNwq6s7wucDD2w6DblzN3xpFh/
         szJw==
X-Forwarded-Encrypted: i=1; AJvYcCWORQgWbPVsn8v/6A3CvbfI8rLIpPlSeWDz2tAev2l5ZUv2rRoRboocrIaLIod48CoXXtk5kTbBnhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytCyfbr0dxkVXW7klTduy9fC3se70+yH7jzrBlEt5Ek91OGifp
	yq2Dg4XQbPG/R4Uawt8nXUdXQZbpAoTPTzoqb5OBEx9nUKLrzvRLlOlNP3hyAFf/fyJTHvYp4LH
	/M7wgAScWDwYSeiGL9iSf7byJeLijPO5oxkCRcklx3bPXT8QXGFY6bNe9w7xlI6k=
X-Gm-Gg: ATEYQzxqrpPSGngxqd82w0beWeLCTn1o6gHaIo8IoB9UNvFP4JercleIDWLknWLULZ9
	t5wb9d3L2FB9IMJq+AxfLsacyEGJ/oaplFFNGpepOUcY+Z5hsTLpVo07CSc181NODyN7pMVBLNe
	GOH+SepGeQ4gEmcDrL6Q5QzMuctK9wGk58ZP1GxtOpKHFggraCQyaN9JM9lJYm3s7jifQWJi/tZ
	z1Ys8KCTp16t+DGsnSAENEODmGDN/+UHnmlfM2NbVznQD/aku/MjKjfN3j0u90Pj/VX/9B0goSf
	lGJD+23md25zl0hQMx0+WSRDnEUzGGM/5mXksyT4z2ZfGkS4TkrtlJhfQvbDt1hJ08mowTggw41
	SiMlmrhwVArIxKacl8OH3SvjHFlwo6qWKqUZBOAfKnuKZuPI6f7mZy3V9YZz4tDTIU2IpYC3Tmb
	VAZImF1Dgx5ona+h5YXpJf+OyKEqStgmoCvtA=
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339026285a.76.1773240627813;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2942:b0:8cb:32eb:e02e with SMTP id af79cd13be357-8cda1a81d9emr339020985a.76.1773240627283;
        Wed, 11 Mar 2026 07:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1560348e5sm434123e87.39.2026.03.11.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:50:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:50:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 2/9] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ5210 SoC
Message-ID: <yzw4ruhxaznndpyzlrqnxlbrveenlpl4yp2ebbshyh2yo7te2n@64gldqqmk3nb>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-2-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-GUID: CZHbZAsN8fueA6w5vxa5ycEBlUx3gyO_
X-Proofpoint-ORIG-GUID: CZHbZAsN8fueA6w5vxa5ycEBlUx3gyO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNSBTYWx0ZWRfX0DteAQyE0+69
 MElgPUw3nMAbEyey3lvHm5TgdaIvP5RfBzaAFGFX1KZdPmVBfH9RHi/13KvEWjvjxptF3kOW+Gq
 NdezL2TP36U/SHoN0lNJjfTIDax88S53RD7Dj1/uY/fmJg3Gyu+mbEe+uo8EKMOPFKVX1MDhD/O
 TRxRvadSOAd588dZjSIUg3sjJP5C7C20IwuZdejIiNkr/zaOT68wM04SEMNFZiBBLTBRf8KkH8t
 GogzDRiMhyLNlyrGvVUCClOatpRz/zhUaZrCRkPuCFQmyZEs4zF8FSYpDl09kppTd/sq7MG1oj0
 1yaHKnxkwU9tjx+Rx1AA/sSmseyzj4M/Rh8VhlJPBjqe8EeUxjl/ga3774Cz8AGudsOeBFeP3ZV
 77m657DepRnUN16TcXQlK/6TaOQiibxumpINiVaqIqleUPvAf4y6mDKpIV1/744fkMoOsHhut0A
 6QtH1OghF6MVnYitT9g==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b18134 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VZZ92KuHIUFcEntCV44A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110125

On Wed, Mar 11, 2026 at 03:15:44PM +0530, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5210.c | 2641 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2650 insertions(+)
> 
> +
> +static struct clk_alpha_pll gpll4_main = {
> +	.offset = 0x22000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT_EVO],
> +	.clkr = {
> +		.enable_reg = 0xb000,
> +		.enable_mask = BIT(2),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gpll4_main",
> +			.parent_data = &gcc_parent_data_xo,
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_ops,
> +			.flags = CLK_IS_CRITICAL,

comment, why?

> +		},
> +	},
> +};
-- 
With best wishes
Dmitry
