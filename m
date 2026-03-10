Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D0345CD0
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149612; cv=none; b=BoC6y3jIjJUbMHtN2gReOtfLtkLDyi/sLhXE0OmnAzynORm1q8EvhmPN4c8hrhyUma8ipynuOTRqRiJDr6KwtTLi1zKiPnQXxEALUjzKzBQz9tcSRQbh8HpQg4jN4o12BafBlyxsjMObIEgpGMdhmwhCsCUzI29R1Ws+NjXghuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149612; c=relaxed/simple;
	bh=WLjR64FMtcy3VsqCFrk603WYJEIRqZ6RCJ3BITJRJXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5v0ums3XcKJ0PiOGMZwSn0uJ4ykKcbNdZbI8q0QaLSszY/oO/wnGb1bY+fiwtLKMB4SE/E25n5EzItipaHPaKYemnKIbbQvf48Wrd6gnNbkvi9T0jkA7V9s2KcG3NsmvvWXbwkFTLsge+4MZK5cRC0BBgjFK1nrofUaBZZnZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYz55cK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzQWPVPH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYz55cK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzQWPVPH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACarcB2863148
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aat35daTUCA7fI7ldoBvesOF
	rR0W8njGOSk5Cw5Amdc=; b=UYz55cK5YBoTH+YmZvfb0d5D0bq2XOHUIFQx9f41
	T2xEdan4stEw0TQf1+JaqWTMsO5juQQCfvxYTF2YVLiZ4wtGCal9swuUZNeU2cj3
	M4E7kq0kb2N6I5H3S8olqIg499dAyBwf6MKbB/uu6cC6FEpOEOAs9LLbTeqWqnjv
	79mqUlvDbU0xR4rC5wqgXizH2yvXD3V+b1IPyDu5F+kB75KWukm+pqwfdhJc+zPm
	3Y3kEwHfB46igbUt54/izL0jn8JJwmsK9FR8zImxKwYb4ddLgyo6D4+WyHY68Ixe
	QZihryv3eLgai1cDaOsurpSFuMW+r7ssH7PgZ/PZ8/nU3g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9hjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:33:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94ac4a7230dso19659053241.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149609; x=1773754409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aat35daTUCA7fI7ldoBvesOFrR0W8njGOSk5Cw5Amdc=;
        b=hzQWPVPHTmVwlK0AmlnJV0cnw8rk1Zc8XliPQQwchJJa+ClFA8XgPrVLP734DmiAAF
         soYwpOOVoi3xygENd0nrQFwqbF4B2GXAlsk9WfYz+TAynd8bnPd2B6kOGxkaccZTI3P9
         kDbI/my4flsmEVBHksKFhAgs39JY/zJpD4aDYd5+NZ/dtnDSMVD3YrbRLQ7hsz+/BJub
         LlLcCom0E4wMrjJ/wrjnCnLxh7bFuBtS1TE3aT7RWK5qtZJOp34chYDL6rdk1DckhjRB
         5QItTj9/s2/2eAnip4rvD2kwjCm2M4or7/Kmp8CGQQmG92XGIigTVp40N1KcpJrJLoSS
         Q9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149609; x=1773754409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aat35daTUCA7fI7ldoBvesOFrR0W8njGOSk5Cw5Amdc=;
        b=iQC2lRwT6vIfsXDndermis+m4EubH+DqC3SBEMBNlNvdKy3fpkfBUbCYYPLYMcv6bU
         o+PueXOxwqspElGygyPROsDhNnlLgu9k+iUtaiigyJq6gkyvlcP2KJUk27JRhoAiCFe2
         Nr9ZPJu0gxGHn86UHWOCHBbkX8uutqDUIYaixhB+EM7rThvwHaJNjTnjEhRpV7vm6jOm
         q/A/qVEh3oEQTrVZE5I2gRVGR7KMSLVxCdJ+VdAkga80AByJXtdGwNO9dkJaWLpPpkuI
         XQ1qtSFF2c5acgqN/d0tf9awSArZrHPcsg58j/a1MDp4eLp5iG5H1Tr3Mkuaiv6WXq/B
         X0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnpvIacAh2xh0EvM2FiQPqRdKFBL1vmlY9CzT7QpDziFytc4TQjhCclPD++77h2hk587jgYsclnAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuA/7orNz05AB0zqerU6HFCmysXzZphCWybroEVNDqbbPMk81D
	+i1/SR8D5rVWzA6OkZd6WUDlhXwDN+rT18j0Ydv0k5lTir1P6PdT9qy/91/4gXWi6wxe8QA1VTX
	wgp32fiS0oDxf3/EZPLse7niOyLjFNzFu6oiy1UOjPtFXgHhWtdldN1TxPrBEiyk=
X-Gm-Gg: ATEYQzxCl8cuHFAkASRqLPG+kV74unk/yFPvZXbyxFLkaWkzmQg1UQ1dacPWQUxgOjH
	f0R6x07KgtPF5jtewnKl4kfUhpp8TSRQTagAvjzfa/39h8XEtOreJ2ggYnP/ghE/u1yY/DlVOrK
	4Q29z8o99EfG16/Uvfn967UWgZU3YHKyoZXULZcoqWx7NFy9GhnuxZ3c7L5Dtup8KSG/MAmAEtd
	pOI4luuclEGZhHG2fM5PO3WdwwOs9k5yj8qQ30Y/Qzup6R5lGb1SZwI5iLhWovxgJGWqs3/VJvQ
	SzNE5Lebq2Ts4T3bl1g5peVrBdklTDzINN4rJ1bHbNWF0l3JBFDVcFFnBI+GCoP7rgQb33Cm4QE
	+7do8+Zg7754kap9cuh8pF6wU5DF3qIGpy3/36sH+REGCuGUhZzSc3nvE6C3Rf6LOM9bce59E97
	wO/i0Cy4wHRF482p6hqU8WUYlYbipgpJQJ6OA=
X-Received: by 2002:a05:6102:54ab:b0:5ff:1cc2:aa8e with SMTP id ada2fe7eead31-5ffe61e765cmr5432093137.30.1773149608550;
        Tue, 10 Mar 2026 06:33:28 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:5ff:1cc2:aa8e with SMTP id ada2fe7eead31-5ffe61e765cmr5432068137.30.1773149607980;
        Tue, 10 Mar 2026 06:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfc545bsm5014381fa.13.2026.03.10.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:33:26 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:33:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] clk: qcom: Add Global Clock controller (GCC) driver
 for Fillmore
Message-ID: <eeonr5ngacwkkuph4p3vadacklqnh272y3wq5bfrkvmrqootg6@wwg7anuexnaz>
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-fillmore-clks-v1-3-976d9a6bebe7@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfXxDSLSrNzJHJN
 IlJb9A/lT9Ncf9bu31AbrpebSBLF7c6aqBft72/sMWNOH4BJLZFBPlXvdz4K99LrgikEqctZZze
 sWZ3IFcJ7WCOIlbldBU1ptNjAdtGmuy8DrnP8vQa5urZivLHo5UUVqfiVAIC8kzs+gOWHrKukkx
 2YpAvMJxMpVTWnDCkkmj/xsG12ngLqfrruBvhDJ2t4TC+K1OnZY+lZHwpPqYDboOpknJTaJIChC
 eyF+tZdBMr3H+8r3jzQC4Q0TNSKCq9VCUGdTsXo2tNkTNZQyTL5QcSD7Fa8wCvkCau0kHpIVB0o
 12LGXRs3/K3wZVum91nDvUV2PNDOXefbPilcc8UXXO0bPguxlnb01wN54rwjuqFsH3Dh6ilXVzN
 jc0WesAd102w7Twfyu//O44Mvax3lKt1xrC7UVrAmUEvJy10qKK8niwldFtEFaxlirrl79tubxs
 dGBAGXj+dA06BFEWuMA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b01da9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=OuZLqq7tAAAA:8
 a=Nn29QYLWgFSKcfegRr0A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: mLY8Tjtz5_FnlQHRYBUu0Q2Nu5YVFRRG
X-Proofpoint-GUID: mLY8Tjtz5_FnlQHRYBUu0Q2Nu5YVFRRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118

On Sun, Mar 08, 2026 at 01:39:29AM +0100, Aelin Reidel wrote:
> Add support for the global clock controller found on Fillmore (e.g. SM7450)
> based devices.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---
>  drivers/clk/qcom/Kconfig        |    9 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/gcc-fillmore.c | 2714 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2724 insertions(+)
> 
> +
> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> +	.reg = 0x7b060,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_4,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_pcie_0_pipe_clk_src",
> +			.parent_data = gcc_parent_data_4,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
> +			.ops = &clk_regmap_mux_closest_ops,

clk_regmap_phy_mux, &clk_regmap_phy_mux_ops,

> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
> +	.reg = 0x87060,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_6,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
> +			.parent_data = gcc_parent_data_6,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
> +	.reg = 0x870d0,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_7,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
> +			.parent_data = gcc_parent_data_7,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
> +	.reg = 0x87050,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_8,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
> +			.parent_data = gcc_parent_data_8,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_8),
> +			.ops = &clk_regmap_mux_closest_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
> +	.reg = 0x49068,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_9,
> +	.clkr = {
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_usb3_prim_phy_pipe_clk_src",
> +			.parent_data = gcc_parent_data_9,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> +			.ops = &clk_regmap_mux_closest_ops,

clk_regmap_phy_mux, &clk_regmap_phy_mux_ops,

> +		},
> +	},
> +};
> +

Overall this driver looks very close to SM8450 GCC driver. Is there a
chance of unifying them?


-- 
With best wishes
Dmitry
