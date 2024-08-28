Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853EE1B0132
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877868; cv=none; b=GVVA4jg4MN8cSVNCDFBm4nDH4yJIjK6v5mpcm4KWUX6eMjlWUwuXCO/JynA/aEfh8FSDDAtb8Bm1mKZcFqhyiHfyKjcpCKoGcRbQbI6RGMz1KEGC50dqoNN16nsZsSzPt/lZBvUn2TjD9RB1GUg7ADHRkKZklo8/Z2j14a3wtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877868; c=relaxed/simple;
	bh=2eoefR7cGl72xKUr4g6vFurnaajnZ4ZAp6xvGyEtOdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9567tGY8wN0z50SLG9N90RYktKz23+5JW2BseW6OaHleXonLAQw8Fi0fStqNnEJFYMqdi/iYeeEaV3WeKOVkeBz4lVTLLHiKrSBw8ObcDb69RCyF9V8wHghlzq2HNXPGVQIYc9xYUzFHLWK+7osPI/VLg/ELeSb5Q7r3B7nldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXKg5E3e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXKg5E3e"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso10044349e87.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724877864; x=1725482664; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ouvwUzqpqqEKUlkh1CpUkYbdJmGHqky9KCVychiJS0=;
        b=eXKg5E3eyFlOKjKnEk/tDSfley5vvgL26rrv83yJze+Kz5dXKQrLK8l95nJ8sQe05l
         i4Ae76a0yXsSxzI3kONEc1q/MYRzWOQQUZcnuFqUMe906vuy+oHkaf4hxH1yAMsVEcm5
         zB6KJp0dVG4yQWS9I47Qc6hNR58cjuKvqk8wUCgGUwCAI2yZrURlihZgcMDlRIpZauXV
         99oiVWn/vFAmiRlSogxBEIOxpxstuto/PrhicNQYrmISaR9GK8BGujPACaG4kxwm3G1I
         QB7VlicpHotvHdfWh/Mx8JlYl8jznTtgyawaVxDhw3K3yPMoB4cigTbskktPV6GRlKs4
         T2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724877864; x=1725482664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ouvwUzqpqqEKUlkh1CpUkYbdJmGHqky9KCVychiJS0=;
        b=RyGQCF9axLGjExbUH4SoUu0CjNuiElxyBHad/AQsHWrPcjVVK2SQilOOuS0hemJvYa
         dD+/ZRspZbE5ZB3r9i+/ihBrsPKEgFZz6U6o5jL51b/OnN1j71VYtO3VzjvBckHEtb07
         O6SoT+E3jGvss/TVQE2SEl6gg55GJPPiAHFvy4GLug3aE6c/9zostlIjqkDsyhCPJU0H
         3Ic8OdW9SsAtrWlIWx3rGgNAJMW/9VdQHQHc+o6suBQFdYdLcIifomZWjHFY1GOU9Ny1
         oZH0OSHa2abqJUh4KuSIUxmuHFXc/jaeMFjIB45GK4Oap5GoE/HmHJGLO38VR388R2m4
         9Nug==
X-Forwarded-Encrypted: i=1; AJvYcCXiBjSlhSYkztxGIfO8bs8xsZV76DXV/hnNmWYxm/BxxGd8TOGq+W4ZvWBO7gI2bMVvSCKiqv/NdDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0kwl4LtEOqQmr/BEe23jS0IM9dbAetS8i7M7VDlboSBwREXV
	8RzLokdtdzJ7rOiDkPlAKrGHc5s645rw81VifqocDl8EFbKcPC3VHSE4q3s4A/U=
X-Google-Smtp-Source: AGHT+IH4zRQRIv6Lh7T2/GNqa8t40UFcIfzpQONZac2DDCKlGfTbLoKbr9iAWINSbxj2G3srq82BTw==
X-Received: by 2002:a05:6512:3c8d:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-5353e549b8cmr356750e87.22.1724877862966;
        Wed, 28 Aug 2024 13:44:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d2dbsm2294656e87.195.2024.08.28.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:44:22 -0700 (PDT)
Date: Wed, 28 Aug 2024 23:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
Message-ID: <kh4diauo5u63mldchmd66pbnqxwnbqfoqcpxsw6wwocbadygvz@3diccu2xt4kj>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>

On Wed, Aug 28, 2024 at 02:47:05PM GMT, Jon Hunter wrote:
> Hi Satya, Vladimir,
> 
> On 13/08/2024 21:01, Vladimir Zapolskiy wrote:
> > On 8/13/24 12:40, Satya Priya Kakitapalli wrote:
> > > In zonda_pll_adjust_l_val() replace the divide operator with comparison
> > > operator since comparisons are faster than divisions.
> > > 
> > > Fixes: f4973130d255 ("clk: qcom: clk-alpha-pll: Update set_rate for
> > > Zonda PLL")
> > 
> > Apparently the change is not a fix, therefore I believe the Fixes tag
> > shall be removed.
> 
> 
> From the commit message it is not clear that this is a fix, but I
> believe that it is. With the current -next I am seeing the following
> build error (with GCC 7.3.1) on ARM ...
> 
> drivers/clk/qcom/clk-alpha-pll.o: In function `clk_zonda_pll_set_rate':
> clk-alpha-pll.c:(.text+0x45dc): undefined reference to `__aeabi_uldivmod'

This should be a part of the commit message

> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/

this Closes tag must come after lkp's Reported-by. Please also add
Closes with the link to Dan's report.

> 
> There is also the above smatch warning that was reported.

And the Smatch warning too should be a part of the commit message.

Last, but not least, as it is a fix, there should be a Fixes: tag and
optionally a cc:stable.

> 
> > > Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/qcom/clk-alpha-pll.c
> > > b/drivers/clk/qcom/clk-alpha-pll.c
> > > index 2f620ccb41cb..fd8a82bb3690 100644
> > > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > > @@ -2126,7 +2126,7 @@ static void zonda_pll_adjust_l_val(unsigned
> > > long rate, unsigned long prate, u32
> > >       remainder = do_div(quotient, prate);
> > >       *l = quotient;
> > 
> > Since it's not a fix, but a simplification, you may wish to remove
> > an unnecessary 'quotient' local variable:
> > 
> > remainder = do_div(rate, prate);
> > 
> > > -    if ((remainder * 2) / prate)
> > > +    if ((remainder * 2) >= prate)
> > >           *l = *l + 1;
> > 
> > *l = rate + (u32)(remainder * 2 >= prate);
> 
> 
> The above change does fix this build error for me.
> 
> Satya, did you intend this to be a fix? Can we get this into -next?
> 
> Thanks
> Jon
> 
> -- 
> nvpublic

-- 
With best wishes
Dmitry
