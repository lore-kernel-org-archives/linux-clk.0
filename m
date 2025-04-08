Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7808F1B87CF
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109427; cv=none; b=B/d3dzWmtv29kP2hGD2K9fsg50sHfVwNRdockoSLR49miQDTAPlgtC8BM5Mu/dPirH54UL+gsqEyfDJnFdQwzE3O1s2fkM8CnWbM38a9+8QaXHKRP/S/Ujr0AXNGLvBooZfYdl0+D8ZTSrWwVenBaEkXRnZXU4WieYuUZPlG/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109427; c=relaxed/simple;
	bh=y+KHax0lQX0Y05q/AyLMQamMUjKyw5ewXJJKxNUOLf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2AwP0iq0vPs0ZoGeViCODvqoOKsI+knc16eXwZxjh+fJZtDaj4iqAqhV8TZqzf2uab1pfos9vTPTyy4Ot2S2JOg/avFvfemY72k8xcVlEYXauSHJAGoZetf0A9EJ1nBtW6lzB0rYVVDDwEZgirBaHGKiVLW3Qkkd2s7uHTxFOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoYQ4/FB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoYQ4/FB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3031354f134so4011800a91.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Apr 2025 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744109426; x=1744714226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3Q51sZ60y2IRit4uwnvdvwQuRZcBvSxnxMj6vQGFPQ=;
        b=RoYQ4/FB9WsKrbOJNapuyYaeUXOaqpYKAPkRLAXDztsMYcuV4KKCxbn//5drclbLeJ
         K8xZ10fG8qn7J/3Jl7yfU9qcANmolTybzGhOX/F5/PmogvRCs9oujXuwVzfeX2knCyIO
         oNfHXkus1tQWj/8yHh0/WuZyQE9CPF8fxsYFUtDd6p7qzh6m2p8D8Qib7g+peklHMEDn
         UV1fq43xPi7hEGfNVr1S75Z552Rat0bNF7A4vvR23k6UqnOw4BGENVDFGfnVZB+LdxzV
         Vkvw5npHC0SECDa54quPn+M3Z3VsQ8mHHemdk945bhznRe0qWuSTXK8uNuRP+xzvkedi
         A49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109426; x=1744714226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Q51sZ60y2IRit4uwnvdvwQuRZcBvSxnxMj6vQGFPQ=;
        b=TFPWCz7OlVQn9OX0JivKsxuxo9yMc6sQnxIR88RF+xAiPkET2puJtY5BIbHqt7/PXU
         KEmGWvVUEEbpZAC/RuYfG47w/rd8SnBpbifVvhKCFmMpKJpTmhjg+6EOoHz+SamDVtUm
         XzL1G24OsgoRcVSkAispWqpMQWwVeWL1QoSAgfSgkZWWvaM7zzRqH1nUy9t3sUpfGHyC
         YmLUGc8QIz/xLPBEB99Vg4ocFxFd3FepxwAqZiRwfy2fCNBNNcKUhXMb8jAdIhteAtMw
         LM/irOayrBuvQigoaAc2GwAYQB4KiPS54d3pudCuupcpaPmLBAGKkWyrodUdtWLHelIZ
         r16g==
X-Forwarded-Encrypted: i=1; AJvYcCVW3w2wnIEgyvRq/pShtl6TG96maH2HypS+XvJpKy+zn/I95npDacb5vNOLM9c+jXpRutEzEHnO0ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5AAwoxxyEiyDyc+GSYbsnJybK6LYzJmn/2shmFTs0GEKH+T4
	yia7redjukSCMAoiNcssB/Ohnz+jEje4+6oXTmDlhvvM/C/UcBhV5XV+fdnJqzQych22Xv/50bX
	2SMmLaF7PwZNNl/cJDCRVw3t07ls=
X-Gm-Gg: ASbGncuVMi5n7jsRnxu2X0yq1H4njWX/pG14npUKh0n94ejtPF3h9tIB5RdpnjnLuDA
	7e8ldRJD69m7B8kon2Kinf5jZOnhCzVCWqrAcHuiqd8n+5f2rHL3jneBVLfVvDVc/q0J+PLa9oU
	WAlItxO9C2Mj6tsYzOz6thMuCKgoMXSN0NCMUogQ==
X-Google-Smtp-Source: AGHT+IFSFb+27H971KbXVzz4EA/pQ4KZ6RM/00kknTpi6QdSo41B8akPVUKL+TDvHdXUVTdc2mjINkgXv5Uk3yDpFHE=
X-Received: by 2002:a17:90b:350f:b0:2fc:ec7c:d371 with SMTP id
 98e67ed59e1d1-306a60e4acbmr19761690a91.3.1744109425696; Tue, 08 Apr 2025
 03:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408063126.38904-1-eagle.alexander923@gmail.com> <3871892.kQq0lBPeGt@diego>
In-Reply-To: <3871892.kQq0lBPeGt@diego>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 8 Apr 2025 13:50:12 +0300
X-Gm-Features: ATxdqUFHAHiaqii7LVTJPA3SVoeUA4jgiLCR4gVUptoIYcrxzRz4O4py-gVNqIc
Message-ID: <CAP1tNvQtNY2GZ3HKUtaqKeMY-g7ie2CejDhbTZNYuipgXwif8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

Yes, everything works as expected:

# mw 0xfd7c01a8 0x00001234
# md 0xfd7c01a8+4
fd7c01a8: 00001234
# mw 0xfd7c01a8 0x00005678
# md 0xfd7c01a8+4
fd7c01a8: 00005678

=D0=B2=D1=82, 8 =D0=B0=D0=BF=D1=80. 2025=E2=80=AF=D0=B3. =D0=B2 10:31, Heik=
o St=C3=BCbner <heiko@sntech.de>:
>
> Hi Alexander,
>
> Am Dienstag, 8. April 2025, 08:31:25 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Alexander Shiyan:
> > According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
> > (rate-k value) does not use highword write enable mask.
> > Lets fix this.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
>
> The commit message doesn't say, but did you check this on actual
> hardware too?
>
> Sometimes there is a disconnect between the TRM and actual hardware,
> so the actual real-life situation should be checked.
>
>
> As for a test-case, any write without write-mask to a register that
> would require a write-mask would not come through.
> So with your patch applied, does the register value change after
> the write below when reading it back again?
>
>
> Thanks
> Heiko
>
>
> > ---
> >  drivers/clk/rockchip/clk-pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-=
pll.c
> > index 2c2abb3b4210..77ba4d6e7b5f 100644
> > --- a/drivers/clk/rockchip/clk-pll.c
> > +++ b/drivers/clk/rockchip/clk-pll.c
> > @@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct ro=
ckchip_clk_pll *pll,
> >                      HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK35=
88_PLLCON1_S_SHIFT),
> >                      pll->reg_base + RK3399_PLLCON(1));
> >
> > -     writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK35=
88_PLLCON2_K_SHIFT),
> > +     writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON=
2_K_SHIFT,
> >                      pll->reg_base + RK3399_PLLCON(2));
> >
> >       /* set pll power up */
> >
>
>
>
>
