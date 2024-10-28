Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBA31E00A0
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151135; cv=none; b=o4ryH6sDYBMs4/nkC6YAyFqk/HLJNyk7svC7RTDqBcQoVl9QmodE1M3HQRepJU74IIOaNMAqFS3I18O+RXktc+XtRiHR+gxTygZ4VnjYnnA2xjOTEyRyAiuUnYGROYL39g+q6OgzEypU7XFk5yDq+r4uBNzjKI29x8bA/K9Xan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151135; c=relaxed/simple;
	bh=I+y5LBpxrffDHEAEq6J8VBrLt/nk3//KpfGz0Dbje8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szL8CvCkycUhzVTf9Xdpkmlv3e3kj0KgIc6zaBNFE8VSX1M529d9Nl8CW6paLSBJgpXQqH6YHUD9oulGrYf+fZnzIcRpoAmGXV+v+OUUBCHtuIcrbBHUo86/jHhf5cTB0/GRMy8llbiqWzCrbfQO0aQBCw6Obj6LvJEsrOYhXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkJ3j38u; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkJ3j38u"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so41862791fa.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730151131; x=1730755931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viPeucgoHGdqU2xPgIzGF8IdpMPlf0xB9aPmUtP29kQ=;
        b=bkJ3j38u96byI7ye03Qx/mn+UWN4E/Uxno5Mhwvj7STiD9XLPiWZuUIrgBRfLftXZd
         ThxOWDJ2fFNc8MZjDdSUNPaf0JrUDRf9AXRxO+cQjOxPqWvgGvyiL87MEF/rgs7LMLT/
         9lEwD1bVmS+EFg0elgwF9H5FNm/s0tvrrtOMaMaBQXE29NnO7js8JuQvdswm9P/3XRPQ
         6qz4H0a7oU2J5xU5HNbf/8uX+XEek6zscaS4rf0KBvf2j6aTtU2JEfIBJatsm2CAAXT0
         BBRqAcuMrE2jiSb/k/23uc9RhOn7Yf63QlF4he2oA5sOQ3k1uExBo/GHRKzz/KZKtdIV
         QSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151131; x=1730755931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viPeucgoHGdqU2xPgIzGF8IdpMPlf0xB9aPmUtP29kQ=;
        b=aR6rV5rRn6YPf4ZVjz6ZYKrv7WvYbXIa9IrLynT5M3YN9wZMpsk3gLTAVw9anxgfib
         +SiqQYWbXKCjnhUY6k2yiOgNffFHa4ziPr51e53kyF22CFVKoADd5EdULX4EmTNReBYt
         hjwEXrdG9KEIMe4zyElhYdYRSBQk5VbinMvlIPXveSD4qNxTIpgZTkcfAR40GYXovoX0
         e4Clks40XJnsoWCK80V7kSQqJ9ruo2u8WMpIP/bS3vK5sdIx6RqLTdNZzJNuImzVQS2V
         2x4O6KgWZOUhl+RvZOOnHQ+VY6ucdFLsXmFJiomqwl1tCnggZPzy6Y4d3x3p0vQuCZKx
         ZqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi3yLx9FFemy1mpC44FnhPWfVUSXzqfS8iCJ1UMg0fCjfrcwRHugHnYvFgoFGT3eG0UADOVSf+Ils=@vger.kernel.org
X-Gm-Message-State: AOJu0YzezRMzx/yZqakQY/sQ0sJGKIB55OKe9e+5wkGQvhYNrwAWKU2P
	XPELNAiEfmq1zjxh3TUwRA2laAF/VxTn++C73QNL8XWVlRPjrSf6p31bOQwHVs0=
X-Google-Smtp-Source: AGHT+IFseX4y+MZS55htbXkdAVgkAAMt7Ah6+14DsNDpRvuDzxxDHaTtXbPKoP8HoWMOW7GlK9wDVA==
X-Received: by 2002:a2e:bc15:0:b0:2fb:8de8:7f9e with SMTP id 38308e7fff4ca-2fcbdf61197mr38090101fa.1.1730151131078;
        Mon, 28 Oct 2024 14:32:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d19d7sm12775221fa.96.2024.10.28.14.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:32:09 -0700 (PDT)
Date: Mon, 28 Oct 2024 23:32:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: remove alpha values
 from disp_cc_pll0_config
Message-ID: <7vvnfzy7e3sbjdlscwf4lutit7p43j4fmoy2xxkfs6ndkqgsqd@dli3uktvyhzu>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
 <20241028-alpha-mode-cleanup-v2-4-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-alpha-mode-cleanup-v2-4-9bc6d712bd76@gmail.com>

On Mon, Oct 28, 2024 at 07:48:18PM +0100, Gabor Juhos wrote:
> Since both the 'alpha' and 'alpha_hi' members of the configuration is
> initialized (the latter is implicitly) with zero values, the output
> rate of the PLL will be the same whether alpha mode is enabled or not.
> 
> Remove the initialization of the alpha* members to make it clear that
> the alpha mode is not required to get the desired output rate.
> 
> Despite that enabling alpha mode is not needed for the initial
> configuration, the set_rate() op might require that it is enabled
> already. In this particular case however, the clk_alpha_pll_set_rate()
> function will get reset the ALPHA_EN bit when the PLL's rate changes,
> so dropping 'alpha_en_mask' is safe.
> 
> No functional changes intended, compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>   - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
>   - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
