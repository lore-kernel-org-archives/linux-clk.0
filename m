Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36562F3635
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764066106; cv=none; b=WpKoRMT1SlSxFZyxzVL4SOeBTxxW4elXqvGgx3rMbxU1lsMRUDpeBfvLkYSTyD/qSl/2QUOTNClp62xpXInTLY84Dk0ZYq83qiqgYavRRqnTtoGkiuUgbUCVtV6K4I1tmDpbeRPgcZ0VXTXv0TiGHVnlv+wR+qUucOyF74vclYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764066106; c=relaxed/simple;
	bh=Nl+s8+3VqFL8i/pvXYObJT1n7cruxQ9Kkr2MdBYPQNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNOmswnOQEmf5CGb0itSq8/9lNCm6EtsnSuu5c2J5miU6gz38oZ5qj6+vgb2sPtYGwCYYmKZrFtTXaVz2mBUT6glB4O6dqghJyBdxSlS0s6bJGJoNeR4lJjjogRgqadGsu46NK8KZxSk2k9zc5Z6ediMtcXpVj3NWimRRNOXHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLc0uZz2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLc0uZz2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42bb288c1bfso3094583f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 02:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764066103; x=1764670903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMAa1PahDcZGGFamJpPR85zyctP0GPcnw67hHv9HjNU=;
        b=GLc0uZz2DvejL+9fdSJGkA1QRga3m+XsED20aH3XZIMmTBSjeCSuqVasEzNk8Pvscp
         8eZb1rkWsHK0989pDvhjHUUMpLf/9MwW3Y8kMNiHpOGzRdV3JBHjUIRL9XfTTu1VX0ON
         tqQIF80HRtyYJQPqDfavxv0m5xq9eNe+Vda3FSaKIGVoN/KsGWRGMz+hQ5RcidTAZ1U1
         rg7RAoE6XyPOOlLJuvzsDW3DrWpAGF8mJUGz0q26WOKnGJMPYG7jff1BQue2Tf2NFHYs
         YdMlYalvYn9ENaJ45K1NUM+3pvBIGM+iOjFbXcvj3kaeDaFdhbpOycf825LtemlGZ5gn
         hHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066103; x=1764670903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMAa1PahDcZGGFamJpPR85zyctP0GPcnw67hHv9HjNU=;
        b=CsxO0MuseNf7jZH4FvQQ0cz8xS9/ageEuvi9lTmDQnmTxZg1uoEw4ir3F7iai246wo
         nY0kxYGMRaxh84eULn30Dt3JMZVMfG77ECRxmTGaaMFNRstI2QYAKLmYiCC+fS7JqoMf
         xIbNuOeGSzJpwVVbr+bwvgqRxqPunvsITbZmgTWlwse1YcMR3BUX3le6otkUSgp/W2ga
         gSqTm0vnyC1NKWmpSCVPDu9F2dPoIhC77n4vZ1GbpMza/52zTzucvpy68icictWZI32Z
         8HGh48NO+aVLTlT8pUexG/kijEIv6voYFZskyfZJ7R8+nFY3qDyo9LF59JSh5PSL6gLr
         vc8g==
X-Forwarded-Encrypted: i=1; AJvYcCWdUisrOeQyKqTFRJdgg4WwWzyrt026CaD+F2qLaMeka7fX1UC4AV5PJjGRJgFGc0VTtoB1k250Tyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7CAVdwz6/AL0WIYxbR3+Nb46WDfLUJjnuag2LlB9qStoqv9bz
	tu1gQrPAID+Hkj1xCgXcmIfGvh5bYDN0fXxBqPWaq7XR+pdTK3gdwMIzsglFiJBcXtl3RJ1ZpdW
	h8omzZ0FDzLCWYH5syfLcdVRmEUkG6M8=
X-Gm-Gg: ASbGnctapez4iqbYLQZm1rX//Xo0FIAtPC2MunAn81OGRfD7Z2Zo8r3+LpUlvO08KDo
	rtaEs9/b26+1843dHhWfB0veua27si8A9+uN9RfhnpCrTceJuOvM9a7uqfm0lxBx0WSBpuORbdC
	kXz0oIIA/9D3BX02/GaZOJ/42LgFNbScAJtgbsgQE6xx1uWJuXO07xvxiUUodlb4oFhW1Ytqaap
	6pnIhDFxl33QLFp8g7cxi2RF2AKrf7ynojvfHrUIb6rOZ3exGvXhwzETag4Og6ZKEuILVrG
X-Google-Smtp-Source: AGHT+IGs/n3s+ljPxhnH+g77kzWfSIpoVvX9+gmjeFbXMAeiCC1KIHbqdKpuwES2cbl9f+HwXmh2k55li5DiqVgzvXc=
X-Received: by 2002:a05:6000:420d:b0:425:7e45:a4df with SMTP id
 ffacd0b85a97d-42e0f1e3540mr2067660f8f.11.1764066102844; Tue, 25 Nov 2025
 02:21:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915080157.28195-1-clamor95@gmail.com> <20250915080157.28195-7-clamor95@gmail.com>
 <175847725338.4354.4145979844570539358@lazor>
In-Reply-To: <175847725338.4354.4145979844570539358@lazor>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 25 Nov 2025 12:21:30 +0200
X-Gm-Features: AWmQ_bl56LuUHLPnztGhAMdmRur5Ggnq7b6fJH-NAjFY7Cca_zX_XBphsvjf_7k
Message-ID: <CAPVz0n2xtmNRvawkvWD7FJbfTU0y2bD+qsFoJ4VLmivaz=K7aA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] clk: tegra: remove EMC to MC clock mux in Tegra114
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 21 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 20:54 Step=
hen Boyd <sboyd@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Quoting Svyatoslav Ryhel (2025-09-15 01:01:52)
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index 8bde72aa5e68..6b3a140772c2 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1321,6 +1309,28 @@ static int tegra114_reset_deassert(unsigned long=
 id)
> >         return 0;
> >  }
> >
> > +#ifdef CONFIG_TEGRA124_CLK_EMC
> > +static struct clk *tegra114_clk_src_onecell_get(struct of_phandle_args=
 *clkspec,
> > +                                               void *data)
> > +{
> > +       struct clk_hw *hw;
> > +       struct clk *clk;
> > +
> > +       clk =3D of_clk_src_onecell_get(clkspec, data);
> > +       if (IS_ERR(clk))
> > +               return clk;
> > +
> > +       hw =3D __clk_get_hw(clk);
>
> Can you just use of_clk_hw_onecell_get() instead? Then we don't need to
> use __clk_get_hw(). Or is this whole function used to return a clk
> pointer to something that isn't the clk framework?
>

I have tried to switch __clk_get_hw to of_clk_hw_onecell_get but it
did not work, tegra124_clk_emc_driver_available fails and I get
EPROBE_DEFER cascade. I will keep __clk_get_hw like Tegra124 driver
does since of_clk_hw_onecell_get did not worked in this case.

> > +
> > +       if (clkspec->args[0] =3D=3D TEGRA114_CLK_EMC) {
> > +               if (!tegra124_clk_emc_driver_available(hw))
> > +                       return ERR_PTR(-EPROBE_DEFER);
> > +       }
> > +
> > +       return clk;
