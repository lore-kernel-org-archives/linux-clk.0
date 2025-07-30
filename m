Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4528505C
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753874715; cv=none; b=ArN0JZuLrhsJLFB+yoF/cg6L5geA1xeGgi15MLlCYYe0ERTG5XD7I+Rd0Se8vOG47v4bkbRLUvS4+TZGhv6uC94du+tu2Xc8zGbNxNIYrMNEUqO5Rfh6dtDCTE6XVV4PHDcJaCAqLSbhjO8Vq0ADtTygaELckV1nNZklYHKqkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753874715; c=relaxed/simple;
	bh=AaXLhjZNOuZ+t/gYKYez9Mw6H6FQBgt8vwLmFSdxjLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehRtvwMK5I2TkM55dmrBPu4cHK2/GhKaB4E6Dx9U06pMdJrGtegSM9ZvaUt8KyS2DiRREgYOHzlNDcUuCWu6qxQ/QmojxLiAsY4iUlOUEXSIKCtzqBrNOl4BKHWdcgRwui26rFqH6cHgt8+tQmXPaE67Q0peFXkEpdm+oeEk7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROHC3poY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROHC3poY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b7920354f9so1638238f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753874712; x=1754479512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qWnAgYumacwqqXMAwkn/jSAKd2nQaF00yjwz3QS2yE=;
        b=ROHC3poYJfjmj44dpKbRbnCQUqpYIxEOrPlr+qzOFIG4otBK5vEdp91b/r4SnhgMIm
         kgC7/vCPrQuUvqgPLs92gqlHhsrgh7y72DpeIE3RDLQ0KvdZpUDo1jQ8Ql4pQImqhnxO
         k4UBNKitvcWMK0sR5Evtrze66F/K4DP7dhUZptsCkL0QYgRo4Y6f88aKOZv4oCayp2HM
         pWfOy+vu6m0yh3u751Q8MTbaOHRsXYGkiXIkXcHAdRrsPkPU6BzcjKM3QCix8WgS6EuZ
         VzSIHzk8cxLU3QWBFVVP0FuGHWYWNiStk+nOptyj1KMG7n5DTZCA6lJgVoKaUgeaYE0s
         MBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753874712; x=1754479512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qWnAgYumacwqqXMAwkn/jSAKd2nQaF00yjwz3QS2yE=;
        b=kR2hF2vMp63qg+ve/PZg1KTTgDgQW0QdQFIHUtiUtlzZFfYJGmJcnoPm64tRuU6kZd
         ItN1/dOSEw2fxJmGM+swdrOEnRd+ltHbtj+PR8E0uOhnWXk2VVbM7dQ5JAMFwF+rF0ow
         0MSiLXOMYhcw9+hq0Jp0eMxKnpshuaZeEU+FEywsvhK7BvMWHWlyGctNEdtH/MGQc3BA
         +9LLv9stc6wKfyGGZbGahAx1RJ4jd6owwvd8RSuWv4KmosZll6b5EY1RgE5oKol9CfKc
         FRmJDalKDPhKplhww9YBFY84XBwaxQyQkyQY9gUI1VEq9mitid17YWv7xsvmF7Dj9PYq
         9bfg==
X-Forwarded-Encrypted: i=1; AJvYcCV8lWeZEQakedtziY/An0/W5Od3qjKRUSaXx64Xle2D6tNw3YsxuUOj9OTVUAkBvzIzwoVQ05cX55Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9z+bEqyNEEwhffUVqkNLpOJmh6pJAp7WG3aKGDQ3NkwrpAud2
	dbDJYwJTdmB9jGeKTeuEJZIPGHyvbZXkMrB2ZG/eLhK4pc6emLKq3VT01I8cvQuxut4=
X-Gm-Gg: ASbGncuNjCFm2pTXiZ8gx5cgIjg1c6x9yI51Z8QkhQZjNXzguhxt7sC6DhP4OlZFwLK
	5PXCFlmAduVTfkChOFgx/VAhThKHiIKQDjk/Z/N1FlGarhKO8QRNdPteLVgnrxr/OGzIOD90y6E
	dE9MSYMZUA+qk+eKfAP815z1AlM2DV/iX6/YqO+mrR/nCdj1nldfkE7SP4TWyO2bu7fpj6/N2Xn
	k5JQ8t68/h3oQ+92g1bzz0rUhM0e3RaHd9U0dcxsM1eYz3VWdfwXYzroA316lc8xcH0tvr/i9et
	Ze+e6UeJrU7mIvAAcD4zlFzYXJ07sG6f5uzIc/zQlKH5Ob0u/ny2X17WGQCTigqxgHuoBJl6P+G
	s1sQ8seVCbb49/P3wt44tc5TEKu3MdQ==
X-Google-Smtp-Source: AGHT+IGQQWsegZemm4F84iyOeDGl9Tnw8iV4E/j71ZP2nFqvNfy276zfwZeEv0tcaCBJzz3K3Y6agg==
X-Received: by 2002:a05:6000:22c1:b0:3b7:8ddc:8773 with SMTP id ffacd0b85a97d-3b79503cb44mr2603491f8f.52.1753874712030;
        Wed, 30 Jul 2025 04:25:12 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78acd884dsm8352303f8f.33.2025.07.30.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 04:25:11 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:25:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <aIoBFeo00PPZncCs@linaro.org>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>

On 25-07-29 11:12:37, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

[...]

> +
> +static struct clk_branch tcsr_edp_clkref_en = {
> +	.halt_reg = 0x1c,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x1c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_edp_clkref_en",
> +			.ops = &clk_branch2_ops,

As discussed off-list, these clocks need to have the bi_tcxo as parent.

Otherwise, as far as the CCF is concerned these clocks will have rate 0,
which is obviously not the case.

Bringing this here since there is a disconnect between X Elite and
Glymur w.r.t this now.
