Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983315E5B2
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442128; cv=none; b=vAimM8NNhMyJgGs6iMW/t83p6PsCiHrlrGtc40Ir7OlBQDKodgZi0XQLvTRl49QfD1YEb053hfcn5j3u7Cc19xCVZNSz3HxnJFP9Jiyl8nlAXeJf4Iwq+G2eyM5GcAj3JJ+olsd3QMV8N25fWcmWAeEku9+AAPF4yajJBqgXhLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442128; c=relaxed/simple;
	bh=EivacNFq0/5fLlwKTYEmDnsBy7Akbb2iAEHMxkjmh9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li1A0X55EI8tokyoV5cPb7csW1u8F/3liAwCTGs+qmPseS2Vz/X8Fj0pj1Bs6BGuZpysFk3Bx31kJfZiOT3jGhDnOR/X4Wj8MnBDKN8SLFMC862V8wJbzbHFoSQ/5uBt3Du5iHvlNOPk0zBoO33X6kyP0v3Vx47kHmuXrtt/A34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RguN3ynB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RguN3ynB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-347c197a464so539236f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713442125; x=1714046925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IrT+pz9h242ho6h5cpwp9QuV44kTV1V8Z+LpieCcyow=;
        b=RguN3ynBfax/qkBvrCX1uyQho9papzclDb1b2QE6hQQR8mzuqxaCzoUl0PqME7l0w1
         U3iGFzx0h60XvoxSkES0lx5grKalOlDr+ex04pm6Rr9ON798mfptw1eUx7x6DU9ll9KE
         NaBkVL4Ds3abKw7zj7oud6hiouLqGVHdqKBjVcJwaY8nNU0mIiUlxJGkIUPGPZLA5pEL
         oZg+2FCFk4Xp2IrQA7zVty36vpPsWlq5P1Ba0BIU/Tm+eEYoj2JXQvjJahPDzw2pNmls
         VBYv9F+trIFySbzvg+QEVSBHvqxWhTfyeXwMvrRPqjxgy92RoaDRWMuV+BKS8Bmsh9TF
         blWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713442125; x=1714046925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrT+pz9h242ho6h5cpwp9QuV44kTV1V8Z+LpieCcyow=;
        b=i1341CLDsAppKyjaTI75d5Ep/H4W5h6bWviegDT02VCBYFxU8zd3cF7eQggnZkB84b
         SgrqZTAK3JFSDOk3R2ngD1u2X0ROTBD1LB/X+EJSKn+15e7flrqxdwVdfm7ZHVE6SIqf
         hH2MELdDTn9QI7hsoQquko1Kde44YC3hiBTpBtd3xr93VbmAJRZK9oKJ3fsUmVXatBwB
         C5qkLsBDpBNSf3UThf/UImIC8w+sUT9QCUUpxzCGCJsdUhaHsffHFQ7PsfE8+puiGRSj
         CtLYYlKyhcvDEUB3iQMYAwFClKQS71nAAohsjRGNSHVzc79wFHTk7vw2fzqN9APBsJ0R
         VxBA==
X-Forwarded-Encrypted: i=1; AJvYcCUTv/ZEeQuEZ19LfF902Q7fcV2jWyuLbyeNFS+iBnNKyWch7hkQ86DnBC4rL+g7nwOtcvkPSICkk9L666GTocaZ5vrP2YQjityq
X-Gm-Message-State: AOJu0Yx2aKWicQykb5jtui4iHCDm98kSJl3Mubkg4sMTGhlB85c+bgXh
	aaE0bG0BDkDvn3GwqcAX6Et0lqa8vp+zWLxTK9Qz9pzylNge2zLp33inLUl2JQw=
X-Google-Smtp-Source: AGHT+IFv9y8xJmg8vyenO4cu3YWChH5bcQzke4eNsa1YJO6Z2ciuRugVmRYh32oJHG0tFBkXehpvbQ==
X-Received: by 2002:adf:e60d:0:b0:346:f830:8a5a with SMTP id p13-20020adfe60d000000b00346f8308a5amr1520817wrm.5.1713442124561;
        Thu, 18 Apr 2024 05:08:44 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d4a0a000000b0033e45930f35sm1702163wrq.6.2024.04.18.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:08:44 -0700 (PDT)
Date: Thu, 18 Apr 2024 15:08:42 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: Drop the reconfiguring of
 PLL0 on probe
Message-ID: <ZiENSp4nrLNHlAoZ@linaro.org>
References: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
 <e5c60b6f-3cab-4265-87fc-7eeab03795ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5c60b6f-3cab-4265-87fc-7eeab03795ec@linaro.org>

On 24-04-18 13:33:19, Konrad Dybcio wrote:
> On 18.04.2024 12:51 PM, Abel Vesa wrote:
> > Currently, PLL0 is configured by the bootloader is the parent of the
> > mdp_clk_src. Reconfiguring it on probe leaves the PLL0 in "stand-by"
> > state (unlocked), which will trigger RCG child clocks to not update
> > their config,
> 
> Sounds like this is the problem that should be fixed instead.
> 
>  which then breaks eDP on all x1e80100 boards. So rely
> > on the bootloader for now. Drop the config values as well. Also add
> > a comment to explain why the PLL0 is not configured alongside PLL1.
> > 
> > Fixes: ee3f0739035f ("clk: qcom: Add dispcc clock driver for x1e80100")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> This works, because you have (at least) partially configured hardware, but
> we shouldn't assume this to be the case.

OK, I think we should be safe to follow trion's approach instead then.

https://lore.kernel.org/all/20211123162508.153711-1-bjorn.andersson@linaro.org/

> 
> Konrad
