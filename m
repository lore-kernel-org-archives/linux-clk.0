Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AE47F79E
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788943308; cv=none; b=OWWPj4za0zJOgFvFqtTlan6+cR+NLK83jQ+IP+dhJUaeZP0aaWs5Nlz6qKQJV+6HNZR6CASo6QzIFZ3GYAq6/whXFDfZLGaxGJ/aSzF9Dz6ShEMVfpC8TLdE1KCLo8C4uLVSvrax8O6/zib9voFGyDC7X+m/5R4GL+e2kuHjR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788943308; c=relaxed/simple;
	bh=yMeYoI3gL67QsRHm0HrytmolF2Qtv3QZSef780QwaDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YokdNGqpJzhL/T0g9QlDZUVslPwVMyzsUs3h8ISxtWQ6rwCgrpSRj9JxJ+Gk20VrOmDone8PAe5rk33wodW7xoeRq0OIlXHo3XHiJFuijY15kxQRXzIPAqhtVyFcj1f4HFIbfpzQ+cDwP5q2KHbbI94caqEgg5+QVuWfbzwQowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0ZhmV56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfHp1r9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0ZhmV56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfHp1r9Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896SGif482224
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 08:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CumJvAud2MHxLpwUjYURE37a
	diNIKPRh05A7+dSjvU8=; b=R0ZhmV56Y+Ob+O9BuepKrxSvANvZ3YtnYgRdsr0j
	Qvr8R4lvYucRWXwYw5xgd5ZlwQYrSw4r2+fju8I4mkNj1QBEoMluvvushA7Qtohw
	OTdcv+wgOGHqC+nryJlzewWkQkKWeqp88KYhHrzDJEImijncAvEVYVJAkS+4bUxk
	JK+Os47K9g36HM6WqhY89UaKulz05GtTrG9coPhMdiKzLecVStl4A67NI9Olgo++
	wd0xOcG4PNSjTKVbgqQPE6V4n4JUP3EFi8O5vedVT2M3IH74CDiGJbDbB1SvUA+v
	XzGdVORu9nibqjMxTV6KPLV1O1+1BawS7WHcNLv82b+CKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1k1ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:41:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso6104534a12.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788943302; x=1789548102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CumJvAud2MHxLpwUjYURE37adiNIKPRh05A7+dSjvU8=;
        b=hfHp1r9YAqxnIDEPBPf5IylQ9lsRx6ivf9OU6lmmvQE50RQS8fDG/2jj7B1d+qnSl9
         pKJrlVEU0e3VeUcyoqNpPsCNCStqIjPU31FnGd4a7Bjt4wTQV9fv/RN/cIP91VSABSFi
         Sfej9uErymkckU0b5V5mmSJa5gHSOiuAWrvIvnaeG8m+6mthhkdDgzEDKuDBNnLQQy52
         pVo3xHOZ0kus8ummQzQNE2mSkAgJ66NKm3JeH+nF+dyjuHZcjJm1TKaeHOx5dDTMMNq6
         nAbLH0P+U1yAnnYUb3Oz41C7JtFNMDADDb2PmmzK4nC/A2DgkoyPxAbnH4ILuYwDEVmC
         LURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788943302; x=1789548102;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CumJvAud2MHxLpwUjYURE37adiNIKPRh05A7+dSjvU8=;
        b=PVIds+DS2j3bA2ztW5337/vTnwATs3giRxNzyKcqzZUwmdK0Whop41kwNMpyhFExe2
         /z03YLisChBFshC/I070iU8K6dpRc2zXMm2cfJiU4wLNSj1oyEIsZqYJt3dWODuLPjuS
         udSy84MIMolN+3AY5CY2JLS/fxDB35oGx80vRLUvV1YkoDDQwWsU/b17RW4sLF7SKa3I
         q+q/HMUYOX6ecmxpzlHgvP+9tCub404x4X/0Bc83OnlX3TNKXy5bxHEyQsafVdvICto9
         rXAF537/FJaU/T+n34RmY+F1xhqjgDF5IAcdQ3DRtb6QF0ZG/I76mHwlc7kwK3pg+Zvp
         8FEA==
X-Forwarded-Encrypted: i=1; AKwUvBzPITKItpBzdGy7+B+RAnyNfaqPBgQlqgxrD/qd5FLk1KPhIOX0JnjDQ4ub4zT4AioEbOQHPZ98iFM=@vger.kernel.org
X-Gm-Message-State: AFuF++n+17rOzLHog1CfJQue/UUrBO6CE/zXa9ItW0hALYV8ffUpXdKv
	//U9Ae8LRbFIjlhpfhQoqbFMyzuwHbJ1auh5pWOiRwYvWzInJaH7wEfuaemONZ4O7B2ejBbAERY
	UQFlcNNiDhk8QYU1V4MdaDF85wUhBHBxuYoXU1G0vEs5Y3ZcHnt79/wbx6zOkgaE=
X-Gm-Gg: AYBFou2IPyEA7/SplqqSJNzz6ARoT0XYby7laCkcQhxCaZ/SeuNwmBTRAOj6SWRnPL4
	f6YEKcwmq8ZOjboBgDx+dJR1/OODWw0pS05hZ3fMm48qun6af7oOVzQEnWzVbV6SggXN1WH5Tal
	7/0tF0ACpPARcm3GnCW2/nnW6R6Uag1KXpw/z5tKQ7uqiwudhfHfFqIfzFBPOe8nmNTUmfsxJ4X
	kmr+DMv9eA7Y815n3suAhcrOwVav0h7VTTem6QE41OW7VMFgNUM6/gj3dRDQmaghWS+hpotN+TT
	xYuHkaJHuFgAQvazfv5H+Ny2fMozG+qI3938peGEAmuZ/cOIhl3DMQt+AhI8kYooLhfgJY8mi0u
	zM2s4cENeXYtS0PlATEWbvILOHrrA4eHRrZl97ptaUXc=
X-Received: by 2002:a05:6a21:9204:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3da39b7183emr56815512637.5.1788943302380;
        Wed, 09 Sep 2026 01:41:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:9204:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3da39b7183emr56815446637.5.1788943301935;
        Wed, 09 Sep 2026 01:41:41 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm36413401eec.4.2026.09.09.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:41:41 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:41:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
Message-ID: <aqEbvx0Q8X33XE-O@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfX5X5nf7WUdVgE
 l7qT6XZPIL1hxjGmKuqitEEW6TjUEFm/hyRH4imkZ+6HiMf84upDUVMmXz1i8TSOf/B9fH5LWRV
 7M7eveOvISrn2ZFOsHwAV4E1kgOomfc6zDK+ZFlYtifWU/7DTWNkNZfh5Z2uEZKn68Q4QXFwoPD
 mKY+eFSxhxLjJmHWlxjeGyiMsapNyESk6gvFmF4tBjTppi1av6va3UM980KE+dzGTog9Deg8me3
 naDE5AEyp6wzpEhX4gVJe8vrzVUnFkL0B4HJJdvJveqdjYyxrOolQjg4w0SERgJHF/14xrLGvvw
 JzGy4tpjqpDkBE2xg4bzAbuWlfhGGslygJ1u/p4997giUvzUDebEi/dT7PBK/CJqI5RiOiHEd9W
 90qAbnoXPvmCEL9IScxVAWdIZo1zACQkd/nVXhUbwaZceG/7lVfbzJYwE3eq1LXxz9R2b875H+A
 3nWed6SYaDePZhxv21Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfXwz6Jdh7EJ7UE
 wYOhFtOU+HezkcAArMWmRRKRJX1UFKd2hBUClUcOYCTSri8qlzZue52SllmkneYRkHqFuI2218g
 35bwkuaQ0efkpdDgjtIRt8h5byt+8NM=
X-Proofpoint-GUID: pbQ93j4qgqD_MFOm0hqtQI6gY7nnzE8l
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa11bc7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YV3RISIrYtFRF6gnviEA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: pbQ93j4qgqD_MFOm0hqtQI6gY7nnzE8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090095

On Mon, Sep 07, 2026 at 01:56:13PM +0530, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 7 ++++---
>  drivers/clk/qcom/clk-alpha-pll.h | 3 +++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 60173b076cc5f16bb55343a1d1136eb07f3c050f..981f973da02f379832fdc0cded3f2b4cae5879e4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -382,8 +382,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
>  
>  #define pll_alpha_width(p)					\
> -		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
> -				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
> +		((p)->alpha_width ? (p)->alpha_width :		\
> +		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
> +				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))

The inner ternary kept its original indentation, so the two continuation
lines are now misaligned relative to the new outer ternary. Worth
re-wrapping.

>  
>  #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
>  
> @@ -2290,7 +2291,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (a & PLL_ALPHA_MSB)

PLL_ALPHA_MSB becomes dead code then.

Shawn

> +	if (a & BIT(alpha_width - 1))
>  		zonda_pll_adjust_l_val(rate, prate, &l);
>  
>  	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -86,6 +86,8 @@ struct pll_vco {
>   * struct clk_alpha_pll - phase locked loop (PLL)
>   * @offset: base address of registers
>   * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> + * @alpha_width: optional override of the ALPHA_VAL width in bits;
> + *		 0 means derive the width from @regs
>   * @config: array of pll settings
>   * @vco_table: array of VCO settings
>   * @num_vco: number of VCO settings in @vco_table
> @@ -95,6 +97,7 @@ struct pll_vco {
>  struct clk_alpha_pll {
>  	u32 offset;
>  	const u8 *regs;
> +	u32 alpha_width;
>  
>  	const struct alpha_pll_config *config;
>  	const struct pll_vco *vco_table;
> 
> -- 
> 2.34.1
> 
> 
