Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEA25A2C6
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958005; cv=none; b=MxmjypPyWEC0+uIxT8yaBPRUa5otcZQogpcMgRKMKT/J/dAEIomEWsdV1hkGcmmRwXfJIzTpceUJ3pE2WImMtq+UDnInlxAOFI5RkLWSscIDVsC/+N6ZHFH8Kh4GD37kkzTtyIIb5Oh1ZhmU+OWFK5O3kuEdBn+cGWRvhv/FXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958005; c=relaxed/simple;
	bh=14IBdIk0VWgOI+eCkc53st4gjSAtuHjTlT42n1vEQwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl3ejvHuI8vgKxPxjqJ5DFu9c/fq+z0xBOnlNegvNi27iO34hOZ9hIHTmhr9D0YchnIAHYaSrT3EgZXawpkZ9wam49Iv5bdruENZFU6Rrcpdis6gCbxaTvxskJnLhjLw1l2jSz6GW//sONMp7I2mfNLrOv6O87/laNVfM4IIRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTAHstol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTAHstol"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLs5gL014855
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9z3Rdc/B4X/+lumDyrvl1D4/
	e+rPgF8EjJhDbz0wnyQ=; b=MTAHstolc6eUPrq0Rv4wui6J8qUera4HlBzcxo1m
	nAH/JrmV23OkNMh5TA5+TPFsmRUSy6q6J/u7hwKFX7Bc41TcSa6cn/ywOKt25jbP
	fF4+8iANCSnUf4r/NPD7qqLMaYHZb2CBnJFmv3Maxos818qo+DQWNR19kWxGGvMX
	336cOxNgGlBoRhAFEcU++7xqK/NsYKJwZ03UXHvII4kibKEzTrnKpGP7I8doWnUt
	ujoWesrIqHjg+gnNykKWmXgGeDRCYuzQiiXntz00tp+HriDQh91g4+1vTvS5fEVK
	/mYF0Ze4g4pE8yGC6Ps12bX3GFMjSTMnaZG045XfgrGS1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcrrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 11:00:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e91599ee5so976319185a.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 04:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958001; x=1761562801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z3Rdc/B4X/+lumDyrvl1D4/e+rPgF8EjJhDbz0wnyQ=;
        b=MKfnfYRwwVuzRKvyL5PioxtIpuG1HHsI0qDIt+tmAjUGHB6GRPokWUBMgjNFsvkLZF
         4sjHnEns9L8I1+VaGO1HN90oF6S0pDlqTnl/dATfznB07rTWV9Sf/dfJJGDmS+76401h
         0Md9gmT/zl1AQqjqslQeYxfBuTCLVx7Is4lPvx1RwHLRfzR5mmpYyKExvh+Bm1efjD6Z
         NUeRh7IRagI8X3iJHL8ahKtRCLb5AYk5vUxZzdUkHH21DG9p8MjGZAE8CIb6OAayqhmT
         KWT2uMRxdnFyOfgMkDjOfmArxUEOg6TObU8YDrJnzHCbJtn8mrwmMZpygQW8HuCr+WY4
         oDvA==
X-Forwarded-Encrypted: i=1; AJvYcCUnhfuRClEmBLaPoF4ofY1s7XN98z8Ckcpoq9oJzlb5f7779hBZ1cSO3estJHPn6bJZ7ZYAq8hWczc=@vger.kernel.org
X-Gm-Message-State: AOJu0YypS3IhyVUn6R0qSfJkc7tm0SgHH63sUE1LTe9kGrOD9xPoEEEW
	rPY60ri5R9Gtxmev6ECtd+vZXtN2uEoVXUiLuOaU43E1V0jJK3UwQpho6xRgXzSXjviwYe6jjrT
	p5e8FV0RptVjb8MrHcc+qUcYSXdkvKALeF9EKy177g0pv4yjOovQqNEe67rOlhe4nFFduIJ4=
X-Gm-Gg: ASbGncuBZ9JEHzpevcngPobt7b8wws/JyzClGlpob+7R4/8WBKckVbeocvO4o5rCab3
	PFmNdl4IOObzzCHwjZ6amaHwtDtwOPqQTqSmO8QXvaU81odT4+W+WYqZxT0lzHsfTqygM2UFcBB
	XSpQgsAYd+1mPcQyDKA03eLKByxLqnnTkeFjQNDo36KZ2zioNNp7I6VeXYA509ejoHD/IrymKyv
	cdvC7wwdxoH92fbC8qNpEenMWf+t7DEP2pZ3t9Iz32Odyoj0N82DltxLt4xofEExW7t8z+0LVPi
	LJ+AnCXo4FMMI/HCJXx8o4Wo2Zjz7S4PxRpG7l0tW1x1p8d/VKHqCCNznzvd+v0s69Ram+SLvzt
	dbLTBPB1MdB0CsLXiO4i7fDeKgk+9dPCWPJSVjH1i9bfVanpk1PfjZtNKN9fnU0WU6G/XFY5vvh
	574IIlbP7V4jo=
X-Received: by 2002:a05:622a:1a2a:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4e89d3ae832mr157357741cf.70.1760958000909;
        Mon, 20 Oct 2025 04:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9kgWQDQxssxXi9g79uzGEY8tRPOM8E9DkJHZayEc3eZVMwNKfchjA2PDtn+fdHPDEn54rYQ==
X-Received: by 2002:a05:622a:1a2a:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4e89d3ae832mr157357491cf.70.1760958000412;
        Mon, 20 Oct 2025 04:00:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1b37dsm2416453e87.87.2025.10.20.03.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 03:59:59 -0700 (PDT)
Date: Mon, 20 Oct 2025 13:59:57 +0300
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
Subject: Re: [PATCH 4/9] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <thy7r7my2i3gfuy723rrq36k7hjobzqcnlzbggpagg4fgfvvzg@g5wzzxoppja5>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-4-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-4-29b02b818782@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX5vyExc1mYLUh
 EGG9nX2Dk2jXJu+RHNGmDM9nGnYqEOPtr2sT5Qkirqvyy1Ivu2ZPakC4oDbo970m9QmZ3nQ4W1C
 hzYs6r1luy8AJYMz4mIE3rxEeXtf7Wmt5ZVNQGmmLu8Uyo5d3xV+mGw3Crs/y7CEozers956sdw
 Uo5TUwWFaFwv6uTrJxEOoo20MbajQJ8PHPuhX9+ziEz9tleAj/iaiDleP6VkvP9ffNzhbYlfe7P
 l4xeLyD46Mal73f0xOvlNZ0RvhI4qrqDEPok6zJOooM2q2NLxpGJYapTlx2wS43IIn91EymyOwW
 J1Nan7C4BWvjbNLn0huzy4Pg4cWbg3xBe8WAEzeUFfZh3NdYWBfhldqKm8OChpiiJ6l5eQ/8QNE
 /Y83HBd9Xg4ogw84bCBTUJXK1aNzfA==
X-Proofpoint-GUID: ywgvizGvGdIL1gaXnZVXdThAgLIsMFAo
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f61632 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=1BWIhq4ta8SIVIyFiOkA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ywgvizGvGdIL1gaXnZVXdThAgLIsMFAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Wed, Sep 24, 2025 at 03:58:56PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 63c38cb47bc4..6b1f24ee66d5 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -395,6 +395,16 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>  
> +DEFINE_CLK_RPMH_VRM(c1a_e0, _a, "C1A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(c2a_e0, _a, "C2A_E0", 1);

No. Please make sure that you follow what others have done.

Why are these clocks named differently from clkN defined above?

> +DEFINE_CLK_RPMH_VRM(c3a_e0, _a2, "C3A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c4a_e0, _a2, "C4A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c5a_e0, _a2, "C5A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c6a_e0, _a2, "C6A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c7a_e0, _a2, "C7A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(c8a_e0, _a2, "C8A_E0", 2);

And these should use the same pattern. If the old names are unsuitable
because of the clash between clock names, you can rename them. But
please, be consistent.

> +DEFINE_CLK_RPMH_VRM(c11a_e0, _a4, "C11A_E0", 4);

> +
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> @@ -900,6 +910,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
>  	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
>  };
>  
> +static struct clk_hw *kaanapali_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_DIV_CLK1]		= &clk_rpmh_c11a_e0_a4.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_c6a_e0_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_c6a_e0_a2_ao.hw,
> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_c7a_e0_a2.hw,
> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_c7a_e0_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_c8a_e0_a2.hw,
    -I$(KERNEL_ROOT)                            \
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_c8a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_c1a_e0_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_c1a_e0_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_c2a_e0_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_c2a_e0_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_c3a_e0_a2.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_c3a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
> +	[RPMH_RF_CLK4]		= &clk_rpmh_c4a_e0_a2.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_c5a_e0_a2_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
> +	.clks = kaanapali_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -990,6 +1028,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
> +	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
>  	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
>  	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
>  	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
