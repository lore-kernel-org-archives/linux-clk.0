Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27C7263E
	for <linux-clk@vger.kernel.org>; Sat, 30 Aug 2025 00:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513066; cv=none; b=GFqwcAHQ0njjJcGm+SIeK2mNHV4MVYiiCKE6laeR7ih91X/XRoWhaE3WoqZI71KehKuKxcRKA9GcU/cHUzSGZQmvnSP68KFP4MGcKbtq8GissrxrGQkDwiLw6yyhFm7I2yGN6PY7+LL6ZoOGMs4B4cYhsnbmqu7GMDlwDgbmhUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513066; c=relaxed/simple;
	bh=z680PBSmglhmsZvf5jSNQdE0L4q1DSTf2d5oaXXykY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6tE1d87lBtO4vK99jg52t+x0ShodLEQ2yYWAlLuY4u/t4l5q26mKtOnSpUnTD8k+/lJ4KMEbj42K4N2Sl++JgevplpIAzr1LgdaMerT+IqOZSZud+HWYfiUTnkBQz4axjWa/rZLSKUjoHBBjwpOk7X1xubO+uC7ist7BwLOa28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDF6OqD6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDF6OqD6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFaejO001620
	for <linux-clk@vger.kernel.org>; Sat, 30 Aug 2025 00:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ueFZ451Bf6LufCZEO1QlwV0P
	A8vLmIWNBrWd/BzxeMM=; b=DDF6OqD6ySuw2qxMojAr++DtA9RqJUIJ9OpOWm/r
	/8+0qKiUU1wqAKHv576BHhFYcP8pDDAL752B4RwmzFbQTR4Ks+F4eALGz/81htHd
	hJuprOKEDjj3MS6UlrFRxJaavdhmOk1EuG/4FJaW8100fpPKt8Ucm9gu2Eqb2A2D
	eAMwCvZRx7k9nWfwlNpmCu8Rkj7URcJ2CPzgym28MtQ3cgMxQ7neSXxz+X/E4Bsc
	nEOFWlr+zGBfCtgm9AfGrv2WOcAfUY4yzGmLReUPYDAmhnYmhLIJ6ugWVLf7QqeK
	RYGUo4rWmxzpcxddgXZnbG+SogsJW34DQ55QJIC3xaFy5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wect9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 30 Aug 2025 00:17:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2dab82f70so75462311cf.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 17:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513062; x=1757117862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueFZ451Bf6LufCZEO1QlwV0PA8vLmIWNBrWd/BzxeMM=;
        b=Y7OWZ4fYuoLsK43EO/44pd7xcLwsYubUfK1eXUKIBv2p0QuHjmH063hNVrhG6EpxpQ
         8Vz7Kt17RFTUfaB0nyfWBlF2rWNjpZa0q8uOHvNiIAX03XzM0Lm6nrBHp4qBKCErTtxM
         OahH9Y8FCgrA3P3uN0CIEyApCUOrDNEMyFv+ti6FRl024KkeJoYRyWWd3P/F9USnVDX0
         WjyDVEul3g6MjR5fFEWdR0SdiJU5BZqrs3NsImgi5lQPCIlOru3l1tKT72rvAPStXoam
         pvNE0pzW1on+Y0N2m6VbyrPSXuBtmFazd49Tv/2LNU/OELU8UL1roq5WmP1I0iTJ9uj5
         hOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1IUQwNOXxHI0Udg8ymLqvgNkDSmarx0fSNm/cEopIFKopVkTQ1qf7BWE4irV83l6YSgvTJj22JUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFSJA11GxR4r6Rtb3itXCwfZ2/WmeyLph3vXwlW9Ztf2IU/Fn
	9ar84W/MMVBqNA3+qUOdiSWiioMFGZCExPGp/i0DZOKlNfQH/DBrSzhPK9jp9eBXEZuVHbsow1k
	H2grpiU+9d/5Zm0q07ehTyZEIIT8e62eW7IAnO0NKN3DTKYuchg8o6cnr9+AXSe4=
X-Gm-Gg: ASbGnctgEOjhKj/AbgyYiiqqcWsP4Irdoqd8EXtrY5obP+txJ8srg+uyoMC7yvX78Xr
	tctfz1j0qG38zddOH9101trTM0KxeeUfMDtD1+pfmVUKtiul+roHZWHkslYStGa+zq7/qyI0wws
	Nsc1dQE165x6l5X7Vvhic5T4xikV8A6HpKE4IdiXrS/yGCcG6G3I2zOLztAQCdPXX/PS7wIvD+D
	D9IMtWqx2KCLI3vxf9xmDAifC9ijs4j1tnwkiH+CXDf+rHydeDqw3WqDW0xRE9iCtBXwjr+LnG8
	5FvLNSqS05Ypj9ebXE4iSV6z1Ql4dE9VoZoV47gdIyS79Eb0JmrPLC5VfVlvXJ9LihXj2a0BSCK
	3oVbRXO1DjJ1l0Kv59Pua8/v3E2FvnTjfM5wYLD7MDscfHdOOfqwW
X-Received: by 2002:ac8:5745:0:b0:4b3:1a10:5559 with SMTP id d75a77b69052e-4b31d80c48fmr6085121cf.7.1756513061717;
        Fri, 29 Aug 2025 17:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJl/Af5VmCiY5OsG78su9IRmyWK/uConNdwyypxlbySz2t7lQqsItTw5Ci2wZDJjq+Xi6WYQ==
X-Received: by 2002:ac8:5745:0:b0:4b3:1a10:5559 with SMTP id d75a77b69052e-4b31d80c48fmr6084771cf.7.1756513061108;
        Fri, 29 Aug 2025 17:17:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336c2c5f1c7sm3531131fa.45.2025.08.29.17.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:17:39 -0700 (PDT)
Date: Sat, 30 Aug 2025 03:17:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: qcom: branch: Extend invert logic for
 branch2 mem clocks
Message-ID: <ecnfaig4uqlgvvhcadh6pofe7vmlx274gtaabmop6w4gggtjkw@ry3pudcp3hx4>
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-sm8750-videocc-v2-v2-1-4517a5300e41@oss.qualcomm.com>
X-Proofpoint-GUID: L8aHh1KHrQf24Ir5dhCMNomI0GwjFJBs
X-Proofpoint-ORIG-GUID: L8aHh1KHrQf24Ir5dhCMNomI0GwjFJBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyvC1Vp8OIVu7
 PAQjiAR9UbeyJqf+wCFF3N2ZQs90UzTTB8GnLKhCxx3IYa+naFswDFYZyM+zaHdOKoSdo7pwj2B
 Es7jU4KO3ZKeEE6b9WF0B+dkukCLQFO9bcySOUx00f6b0OM5OeP2y5fqeUAQA9In1Y6IN4wBv44
 5Eb06kVBiYu/pg6b0C8Ek1jbCFpksrIu73JKAEG5kJpPLrI5DP3BlFSPQ6vT0DTZZmLv0HUO83Z
 8Skj45a4cgnKxRVbUn3HMbYAGbpEju76EWNkOvAGprFZ93xAQelSVO9CZnvMqOML920/V4ZeuPT
 OXrtu8GbAuv5cglpPjX6sSQ/NO1s0PssxqmciJgfY798xgVVIHhpp1OVOifmgKPeeNBV2ol+/XC
 /rPfWOGA
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24326 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IOa5V0MNBbNQbul7L28A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Fri, Aug 29, 2025 at 03:45:17PM +0530, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> Introducing the mem_enable_invert to allow conditional handling of
> these sequences of the inverted control logic for memory operations
> required on those memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
>  drivers/clk/qcom/clk-branch.h |  4 ++++
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> index 0f10090d4ae681babbdbbb1b6c68ffe77af7a784..90da1c94b4736f65c87aec92303d511c4aa9a173 100644
> --- a/drivers/clk/qcom/clk-branch.c
> +++ b/drivers/clk/qcom/clk-branch.c
> @@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
>  	u32 val;
>  	int ret;
>  
> -	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> -			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
> +	if (mem_br->mem_enable_invert)
> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +				  mem_br->mem_enable_mask, 0);
> +	else
> +		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
> +				  mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);

Please check that your lines are properly indented.

>  
>  	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
>  				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
> @@ -159,7 +163,11 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
>  {
>  	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
>  
> -	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
> +	if (mem_br->mem_enable_invert)
> +		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
> +			   mem_br->mem_enable_mask, mem_br->mem_enable_mask);

This creates assymmetry. The drivers uses mem_enable_mask in one case
and mem_enable_ack_mask in another.

> +	else
> +		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
>  			   mem_br->mem_enable_ack_mask, 0);

And here.

>  
>  	return clk_branch2_disable(hw);
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -44,6 +44,8 @@ struct clk_branch {
>   * @mem_enable_reg: branch clock memory gating register
>   * @mem_ack_reg: branch clock memory ack register
>   * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
> + * @mem_enable_mask: branch clock memory enable mask
> + * @mem_enable_invert: branch clock memory enable and disable has invert logic
>   * @branch: branch clock gating handle
>   *
>   * Clock which can gate its memories.
> @@ -52,6 +54,8 @@ struct clk_mem_branch {
>  	u32	mem_enable_reg;
>  	u32	mem_ack_reg;
>  	u32	mem_enable_ack_mask;
> +	u32	mem_enable_mask;
> +	bool	mem_enable_invert;
>  	struct clk_branch branch;
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
