Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFBF1E0B7C
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151111; cv=none; b=J2ys5aDAk2GQgDbsnflId9aXOVbmhKk4IMi/Pi8+Gl+L3LkNLBtVdSafe6asqtRwOj+2s0zy9Q6ng8/vYAjIg+3nK4V273Cbf5X6laX1eslTK4hgVJed0Hqy3B2ezwvPGTztjGqiQmbq41ZT+ofs8VR6rvClbOupsjT1mFHpPWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151111; c=relaxed/simple;
	bh=rNP0697oEONMwff9ZdYnEmi/EdLyTDcy3n05qjVl4Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7LTPJb4PGqNAyKOu6MU85P++rLEzQUhCHx96l2rCEd7xMN0gip+cBlhm6TaKg4dHNxnW14zrcR//cz7wnQLHJIarIlIpsLU4VdFKg0Z92exfFN8FqZKfKnwzTNvNBmNeobxU6Sq1poi7uKd7GF3+Vw4bA3bWSM6FVnw65fD+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpWisS27; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpWisS27"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539fe02c386so5351157e87.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 14:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730151107; x=1730755907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcruSnnDqGq6bAgTm7Y7D6i6UOSc/pUqKsE3cNsrnr8=;
        b=LpWisS275r6O0pbR7jGzEiQwB2TeXVh9D52+4MKJcBT6lKTcYQHH+gptHCcWMdQK9O
         YS4ymorKsoKZYqAPfY1xyiBaU01huVRzluT8ABGymCq9QCUarY8hsXXlgtzWnTIDTWQe
         itPPn6qd/m+DrQzO9TQjZ2EwPCn4v0uKylhqdIlz41vQqtuV7v+p+kVqE/yN2hL8roFt
         Hph91f3zZgDCdO5/JSu0fLVHcPP1vsfztm/lotFRKJzu9kX7bSA3SXaW0kHfVPZeBTHm
         EaVvUKfQLSlcT0kJc5wcJTy6I2reZThFXfBCm60cLwIaQb0L8crf4CsWier2klr4k6ii
         17nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151107; x=1730755907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcruSnnDqGq6bAgTm7Y7D6i6UOSc/pUqKsE3cNsrnr8=;
        b=XOjQ3wirzJpyQgvdDbI1xn5KjGlPM+Yzf6FXMDplpFIVfULD16DKMbWflLfKFnF3C7
         N/oi+ZFwijBY/5KhndaU6Tcl07X9QiPY40PK7g91+lp4jTMo+d4z8n5GmRtUlh3r9Qra
         res/muZoO42s43zsv/n8VRDaOtFgd2rgIWfQAAOt8zvEi/cOz6Jv6rVqjer7cKus/uCz
         bK1bwXf7XQPBtojZy7f6E66NtVLijJDdyT6/jN11AKtkDFORbPHGk3gzmlLRpIrUmSV/
         1zV40aIuV6fx526mjHOCnYS9TMpAASyWYefwVnfUKvu4oUDyjvnbb65HRS+WVFrZghxw
         2pdg==
X-Forwarded-Encrypted: i=1; AJvYcCXoPuqGd7gStEliSX7HpPr855XDnWVhpCJWdHWjGifq5C+rjepx1/H9QTmA3tUiYI01D1IZx69FiW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JXU1a8Z+MKmvVjJAwP9b4biUA+ocOGRdu2Ksbu2owmjH6LAI
	TyvBIC8pJXc4awjaeoQ0lFfDbLSwRAg8QOSrPH0ku6PEE0Q97kZp5Nq8mrX4vKnq65pdyppzS1a
	U
X-Google-Smtp-Source: AGHT+IFh4I97P0VA1ZDbZn39ilOzI8Rz4sAHvj28rzFNZ87rzgBW0C51WC9ZejKJ44j7eqdIlt728A==
X-Received: by 2002:a05:6512:b17:b0:539:edc9:7400 with SMTP id 2adb3069b0e04-53b4745f331mr297876e87.20.1730151105186;
        Mon, 28 Oct 2024 14:31:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1245c8sm1186637e87.65.2024.10.28.14.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:31:44 -0700 (PDT)
Date: Mon, 28 Oct 2024 23:31:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask'
 from IPQ5018 PLL config
Message-ID: <3qdbri4ymlbzn7dcl3dxyggyjberohytpoq2qe3zj2lxwq5hj6@n5f3gkaqpsu4>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
 <20241028-alpha-mode-cleanup-v2-1-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-alpha-mode-cleanup-v2-1-9bc6d712bd76@gmail.com>

On Mon, Oct 28, 2024 at 07:48:15PM +0100, Gabor Juhos wrote:
> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
> those will be initialized with zero values  implicitly. By using zero
> alpha values, the output rate of the PLL will be the same whether
> alpha mode is enabled or not.
> 
> Remove the superfluous initialization of the 'alpha_en_mask' member
> to make it clear that enabling alpha mode is not required to get the
> desired output rate.
> 
> Despite that enabling alpha mode is not needed for the initial
> configuration, the set_rate() op might require that it is enabled
> already. In this particular case however, the
> clk_alpha_pll_stromer_set_rate() function will get reset the
> ALPHA_EN bit when the PLL's rate changes, so dropping 'alpha_en_mask'
> is safe.
> 
> No functional changes, the initial rate of the PLL is the same both
> before and after the patch.
> 
> Tested on TP-Link Archer AX55 v1 (IPQ5018).
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>   - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
>   - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
