Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29F1AF68B
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896298; cv=none; b=ckb00fqvsxgLXoIl0eTFRL+4ahe25eAdu57bxiGopzzNH+bNw9LYFgr0emHwOHLCY6p4sRrc5ofG4Cj5owy67WNjEAxpaHBUq1H5jyAopMJkdbIM+QWs5uIdK/CYqL3Rl+pBlRsDUGmBC4mdEtuQMiLFraeK6mFU6GuUrdI9ns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896298; c=relaxed/simple;
	bh=bXi5AxhJ6BOlPGDlzlnhp/B19Cg5Fbvd0iajo/vvX3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiSI5Ob7mCWf3/plLxUAzG40xMbnZxIdAsJNUdH6luPur8gJ8P6MdbWQvm5diKqM0aXXcuS5Yo/QWgVU1dNC+qoVyCVK5fKwq4jEyD3FApFcZKQ9CRZNesTKrGbX4YetW7FticyPJx08nHom9cDMabRfAYXtrHIimfXMzjvKmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhvNPEUt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhvNPEUt"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec461d1005so7597491fa.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718896294; x=1719501094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h6oqRW/qdffe42UR3aCeVEd5BB42fceS5IJnJKBOSg=;
        b=fhvNPEUtUIs+2riN8Unpt5qz8zQWQqfmrmVuTSdWgCnOrFgicx+cb8QB/HazvRD1dZ
         9iCZIriFQtZWKRKpFEtNeQkUET4UuQmszb/1KSdWqSNGAi1aPu/ahGmJXYuIN38rDdtf
         MkDyg8WcdwFrtJ7rGwm42oA/bTosKLv9kmcwQsKtgofekmlK2drj8mCzrSIWEuaLBjAl
         bRgRp3v1ekG754XWWzg1o64MR2W+KqrKiFMKzV1bmtsDsHUXb68wHAy5olSSbWkmag7r
         twYPZYIwaxINL/xY7emBcB5S6eIF90fG340YnR8nCyIYFe5j7btngQEIt+QDcPOqCeN5
         AiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896294; x=1719501094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h6oqRW/qdffe42UR3aCeVEd5BB42fceS5IJnJKBOSg=;
        b=b38gxFpc59GB/s+oYLzg715udmep4pHgwNsrkWd2ZgcTi3dFhCWCsV6bsVNGBTlmvY
         Tej1aIE2Kck/Qc2P/VWNWheTSXGwDkKrA6bym0O1RofNK382c4rAGrj/mHc9mytF3+T7
         CBPJebwn7OqD8fE2a1rs8XXs5bJ1ToBxuUzYXYk/WL+nqBxli5IVXNtMFRKdnyHR/a8M
         TiTCwR/pBr7Fg4YQ96oNpZCvJouAwxZxO2hGJP3lnpAqamNSv84aP4rqYXWFL/Ynmm9f
         XNZ4SJHj9xofos1s3PS3mQpjfE3LY8CouIjMr9Hb7HbzTMYLmh8AejDxna58cdC9bs4N
         vUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz7/73DOE9LleJh343/q85mhRCl3V7KBVRm6/S/rBjQyFkDogHartvYl75+lqkqCmw+Al7XfBD66pY5EySchD+LxtbCUAW+Hg8
X-Gm-Message-State: AOJu0YxaRO74nC2vYL4nKUaxXv7aFfp6NmeZ5hIH6riGFy3QgNTMSEOK
	JCXeNv7i96VBvhRV27OvO75Ufgwy8B4JL0DXopPJqHhND/lfCINiobZ2PPHmY9gXXFxd9ZgI4tg
	BFyI=
X-Google-Smtp-Source: AGHT+IG2bhnBYuuNCUcW1g1XePnvj4eVOUhHtCKEC+de0GhrbLOlWQDOt226Xo64hud8Q/lYWQdHrw==
X-Received: by 2002:a05:6512:3049:b0:52c:a88e:945e with SMTP id 2adb3069b0e04-52cca1f35bcmr1702015e87.31.1718896294581;
        Thu, 20 Jun 2024 08:11:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282ee54sm2120259e87.73.2024.06.20.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:11:34 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:11:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	quic_rjendra@quicinc.com, luca@z3ntu.xyz, abel.vesa@linaro.org, quic_rohiagar@quicinc.com, 
	danila@jiaxyga.com, otto.pflueger@abscue.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 5/7] clk: qcom: gcc-ipq9574: Add CPR clock definition
Message-ID: <wadru6axfhvws74vcd6umdhnm6gl5poegoljvb7fgbtuz2mccp@hrclt6qesp6e>
References: <20240620081427.2860066-1-quic_varada@quicinc.com>
 <20240620081427.2860066-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620081427.2860066-6-quic_varada@quicinc.com>

On Thu, Jun 20, 2024 at 01:44:25PM GMT, Varadarajan Narayanan wrote:
> Add the CPR clock definition needed for enabling access to
> CPR register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq9574.c | 38 ++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
> index e1dc74d04ed1..7c8eb94f654b 100644
> --- a/drivers/clk/qcom/gcc-ipq9574.c
> +++ b/drivers/clk/qcom/gcc-ipq9574.c
> @@ -3994,6 +3994,43 @@ static struct clk_branch gcc_xo_div4_clk = {
>  	},
>  };
>  
> +static const struct freq_tbl ftbl_hmss_rbcpr_clk_src[] = {
> +	F(24000000, P_XO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 rbcpr_clk_src = {
> +	.cmd_rcgr = 0x48044,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_xo_map,
> +	.freq_tbl = ftbl_gp1_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "rbcpr_clk_src",
> +		.parent_data = gcc_xo_gpll0_gpll4,
> +		.num_parents = ARRAY_SIZE(gcc_xo_map),
> +		.ops = &clk_rcg2_ops,
> +	},
> +};
> +
> +static struct clk_branch gcc_rbcpr_clk = {
> +	.halt_reg = 0x48008,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x48008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_rbcpr_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&rbcpr_clk_src.clkr.hw,

Where is the &rbcpr_clk_src registered?

> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_hw *gcc_ipq9574_hws[] = {
>  	&gpll0_out_main_div2.hw,
>  	&gcc_xo_div4_clk_src.hw,
> @@ -4219,6 +4256,7 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
>  	[GCC_PCIE1_PIPE_CLK] = &gcc_pcie1_pipe_clk.clkr,
>  	[GCC_PCIE2_PIPE_CLK] = &gcc_pcie2_pipe_clk.clkr,
>  	[GCC_PCIE3_PIPE_CLK] = &gcc_pcie3_pipe_clk.clkr,
> +	[GCC_RBCPR_CLK] = &gcc_rbcpr_clk.clkr,
>  };
>  
>  static const struct qcom_reset_map gcc_ipq9574_resets[] = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
