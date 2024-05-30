Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CF17B418
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113377; cv=none; b=XOVX7Y9kYZcTLZ3/YjshwMeU1TpSNjWuojIDmC9rmsMT04hjoiV4iuY8pM4or/vgvc/SMy2UNqImELCnIGYRYiuFdVddpKw16n7M6AbL0YduL0nAnsjGRetZeMzsAuskOhdlzegBLnOQSLfuSYpn8dArYl7+MdWL9h+Wo3nbNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113377; c=relaxed/simple;
	bh=u1x9WGaWjdQsG0liwfIZehg9z7MUpjxN/JdxyprkMzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqwsIM6WsH3sZxvwLQ/SW7UVEZ5llxMEcnxJAr959FAStOYNfkCryxw9b+aDd6E2js3Fppldua3FXLOVSooGaE4x6ze+5p30m32L8cGggp/XbNxNMyiOkGuZLJlwWHgHS4mJ/F2kU/l1CfMsj/y2nhqdkDkqalDnmoSuiAR9C/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oUTW42Jd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oUTW42Jd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e95abc7259so15716461fa.3
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717113374; x=1717718174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck/4mU0LZm3Pgy4D7+E7gErxKGmzB2tn/qzM/2E7y9I=;
        b=oUTW42JdTHDdud5F7HJMmn7+mMm53Sa69cTFcJ+5zwkAInKzOf4BMWHrVHuMp9XOgZ
         gj58JfBZUiwkEsjRlSq5Z+1Bm9bKum3mrbTJX2eYTNty2H0TD1ADs1TU/m6cSTAluaRt
         IBoZTZGRCpNoX9wBYzQPtNRxVZY9R+ISAFEqWYHN/v74Q9kT2yq1R6jQZpRlXOmZNuq5
         taihEDfy4uitbxrqN2xSNW5x2/3UfN+euyEcvpbYxtCIJDE/jXyA9nMM8Q4l56IlVvJz
         PswBWBxbh5h1tjQ1iem/z06Kg1ZAYAbeDak7Q/f60Scm4feiSujZBv+GVsbuIXygVHaH
         KiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113374; x=1717718174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck/4mU0LZm3Pgy4D7+E7gErxKGmzB2tn/qzM/2E7y9I=;
        b=Lgw8G+tTAh1QjLLuYYCB6XIjtRJ3gaLYQtjwFD8fm5qMR25v2o8CsX4zWHqjXsoDnz
         D31Hs5aLlNxEDt5LMwvd/K69BQnLj+PMtbAX1ccP8Fn1ClGTE8IsSN8l+gHzfCqHXcCq
         +jJXIu+V3WnWYXMM1SQiiaoEEaMPvMQ5OivbPuRJRBMS5URFtuzdf5uuKL0rWYicOuvs
         neyHzgdfksMTbqdOYLTiXdCjJSTGuUF+6gIhVruHS/So6/UEfoPdshgogjtVqJHbsftm
         u2gluOJT3lE97rFB3tP98r4+0jdwquxPEQpABAmoDzZLE8+XD/LLhOEVKCLl0zO9EmKk
         ZWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA14du2bJP+p79quFE7gyDNcIpa7oLNxav2tjHqocLZCULMl6yJk6o23SOFIF5tA/JzadW4C6N7lB6faVuWzFbRLzSYt1xjC3e
X-Gm-Message-State: AOJu0YwJPvqSq9Se5N6zYslkbhPuhE4xsYCLd4wXxQjzZn/1JjBkpdY9
	P6x7EzbyVx/J823GoEE5ylDk0Y4lWvhEx+udS6PaAWK4eBq5U2E/Pwm3rwW/EuA=
X-Google-Smtp-Source: AGHT+IEUTVqHon41x+1SSS+K+W1Rvwpf147hdypOX52i25HOqsLrwvRahXwTRl7mrNyeUkY3JvtrbA==
X-Received: by 2002:a2e:979a:0:b0:2e3:38e0:54c7 with SMTP id 38308e7fff4ca-2ea951b60f7mr1955031fa.38.1717113373865;
        Thu, 30 May 2024 16:56:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bed98csm1206671fa.70.2024.05.30.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:56:13 -0700 (PDT)
Date: Fri, 31 May 2024 02:56:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec
 and tert PHY pipe clks
Message-ID: <3ukguewuqqm5gmbd3afl62ihysdzkk44j3f2nuqht4gjuf5ruo@zu7jmmnbrpdj>
References: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-v1-1-7b2b04cad545@linaro.org>

On Thu, May 30, 2024 at 05:05:24PM +0300, Abel Vesa wrote:
> Allow the USB3 second and third GCC PHY pipe clocks to propagate the
> rate to the pipe clocks provided by the QMP combo PHYs. The first
> instance is already doing that.

Which driver changes the rate of those clocks?

> 
> Fixes: ("161b7c401f4b clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 1404017be918..8c72fdc99fd9 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> @@ -5269,6 +5269,7 @@ static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
>  				&gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> @@ -5339,6 +5340,7 @@ static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
>  				&gcc_usb3_tert_phy_pipe_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
>  			.ops = &clk_branch2_ops,
>  		},
>  	},
> 
> ---
> base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
> change-id: 20240530-x1e80100-clk-gcc-usb3-sec-tert-set-parent-rate-420a9e2113d1
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

-- 
With best wishes
Dmitry
