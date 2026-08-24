Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3A439F9C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581581; cv=pass; b=jrwzSv2PR/OAMvklbZFYFGpPyIOhbbLnvkbS3aN8fg3piVOtC9RGfKVA6wkyuzCMmNj/oeXAY0iMgeOXgNSBkekcl/YE/FfbY3z/YAZcvz4qu4Mx/ZbI6lmwm4jl0VUzTzjFH4XYjpTieSsF4NJEm+HB/qK+6ja5DRnrKr4L6UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581581; c=relaxed/simple;
	bh=g6YG7ebYQXB3bRpGj/OB4nhiGkj6yamYDPhaSzTu1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1tey7S+wZkJLxM2BfMbTVRfJje30MEAtt5g5pOcIupHFfL7cgMhWOpWTTQ0usCnr5mNRP4aDUgBq6abwS0Ivt4LiAmj6hUk7bM7mt2FD+IplY4DkbxI+FRXfmFGVJzgxBmCyYZI60x3RRps7O1meEAgGLjybTmwG3WH99wng8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1oYoH4d; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1oYoH4d"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c26d7e951so529668666b.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787581578; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9O3n8LnIYLHXcEzYFbyOggNKEl9WMF5eYva/9mYyj1iGTXzbr+iWWaQ3ccFBEujPQ
         eXpoOlZsqKE1ufj0d+hWEifPQnfXeklzpiV4pp7JSaVc0G941P7ABijfYqSGwo0cVyxm
         PO4kEuyloypVuoXuAAGl8k94qz+YfrdgEWIvm28+HjdmVC79KkFd7TJ+wuh8qRtJFzYb
         dUNuSwdtdXXW5ayZJ/F4jsnecibiT1+uNUgHKRVb84RXcWpb5HdoRBj0Wv9+tNHTo6Y0
         CkCSisHVCDNhbU69DWl9MOX8rLPD9GgPqqQOq4ImQgHw8/YaiCntB+l7QMVYvXqPi/7g
         PnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        fh=EBhn/Pam3YVJM6g2RLS6EyGPEeVeGP1rYTBOUJP4K14=;
        b=M4JzFwG+7EEaD/zB6045I2UbxmupZuYm6mXbL2YHf/4yBLL4vrips+kgOIxN9+2U/5
         v+vbwkUw6rjLNOOm/vtOM893+saCJonplnJHwGAlNuIPWknwgSx4vgUwMYA/Jsj4fhl6
         hNbVe8W42frhukoNFfIjo7xTcim/HoLsMAWf8JQYfMEC0uJpmnbL/AfK92aHFJWvFX3a
         kefcJNA/Jd0hwYK2WPp+ohnxezwVL5wsPd+njGbwzuPrd1ZEFHQKowSBJEPlJae11Gu6
         g6UnplE9p0Pw9uyfEAATx2vcJlT08AONNkeZl+7v85ZgG6iHvr5rZpCPoUt6afoVrorR
         pZeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581578; x=1788186378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=n1oYoH4dUCRj3F9ZgC3yBwfZexnJT8/KJhMCduQEU1+cJaA9tU+5SvkjfbWSTe6a+U
         +fFySSiAmkV+2cbe0eknWQ2nmqO71qEFOlZ/JEPOAq/jT4NLmdPnGTSPZuD5EGwliEHq
         o6w95odqn4McNp/DtoWDr4tLSS9/0VZWgLUq4YFzx50XPKsr9QNIDCNlYlwvHtK55Fjx
         TMkdcmJfxBqdqX+0ZxWdOXBOMUk49a4nEYpQmG7BE1YjncK/En3+JBapAukgCV/7zE1R
         GLRpOmMG61umcPPFDrePpyN/sKrMg2Fv93hBC8d2ll106GksjIdZvW86EM0bfXqfE13+
         QMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581578; x=1788186378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=co4q8/gE6FO7odq9rDSLFCKb5zoVwLbSvzHMppVv7zsvE2YTQGHNQjlnQP6XWgNu+k
         pI91bPR+Qi/jsxTI9IZWtZU1JKzjyHd6V/0x8/p+hWrb7FVKzHORhtLJORFMFgRUQrTU
         NupmprR4JQBgPsGOr1VA0IFmin78wxlI5Qww7DtSirgHPE2npHbXO1Y8IAON2QUePjww
         4Z9m9ZRYtWK3tx+kLDFrm0YLocKPLqWw224eOPJw2Nx5/Zn1zXMt+WIoxt4m1DnKdtrk
         gnjgCeHxKkWzDGWo98btAeJXxnIdl3JedxOFdvkgUAd17zlJ95oe5sZAA4amSwjqMkV2
         rOwg==
X-Forwarded-Encrypted: i=1; AHgh+RoRwu/IRdR1jriTgCVzfsvUPO6PUrWzDGa9TmRVwejrK+h0f8OYYoQjf8tt3LOd3dh923dgbeLZ13k=@vger.kernel.org
X-Gm-Message-State: AFuF++mx5yROnTnpUqkYWwEbyTa8RfadNqttguNZiCK3CahSe7TjnmUv
	BZ++0mx0hmcSNkTn1nm4/3C67UGSch2Xqf+Ghudfu2KOvmzaYs63DGYO6sd/jAWm+1ogCPxuCBX
	IANtOQGRKt0mM4dWJ6je9Aj0sTjRiZJ8=
X-Gm-Gg: AR+sD11uNOKHcBwd9WcNgDB+Z58JrtV2/UXQDCmh90MWCmB1VoR43V7+JIF7sSQC2Yt
	8HVY8lYhgIQRJRje1hC0OvOY15cVFesQaAWXwLc6PYHIBWgCTENe8FLdQWiOqv+ZY///eRS5tT3
	jnDKPwrtJjVlH09z4x0Dmn5SehKXUKbz4FxuBelThmflPkw20rxnj6Jks67DT9/XpYlK4YRm/sd
	CvUSlvwn88X9cHRhs+4V/Nk3hskcB6Jcp0J3EUjM3+gkt9+gfEOHTSVQGu2wAjxbYfbkmwTpHyg
	iM2leXBalQsvuuZ+cP288vMGxMsolxMFK+DJ081aX6CUD4QJgMYtaAZfjbwmallitmmobtkre0F
	zMtU9dVfKRn0i
X-Received: by 2002:a17:907:97c1:b0:c1c:64d4:5ba3 with SMTP id
 a640c23a62f3a-c246a651d39mr3008695466b.20.1787581577574; Mon, 24 Aug 2026
 07:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
 <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
In-Reply-To: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:56:06 +0530
X-Gm-Features: AcwNN1WD7-RHPqzMcCh82DKazoZZTBj7FvE-P3djUsyLE_onjNfXG89rO_KrT4Y
Message-ID: <CAA-+uk++=6z0Ri1drTEKT-geGDU5ZFv2aQusC7ZLs-Pwf87B1Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	lpieralisi@kernel.org, taniya.das@oss.qualcomm.com, danila@mainlining.org, 
	davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com, 
	linux@gurudas.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 19:45, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> Thanks for the review.
>
> Missed that, I apologize. I will send a v6 patchset with everything fixed.
>
> Thanks,
> Sreeshankar K
>
> On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-08-24 13:04:28, Sreeshankar K wrote:
> > > Add support for the global clock controller found on SM7250
> > > based devices. This should allow most non-multimedia device
> > > drivers to probe and control their clocks.
> > >
> > > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > > ---
> > >  drivers/clk/qcom/Kconfig      |    9 +
> > >  drivers/clk/qcom/Makefile     |    1 +
> > >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> > >  3 files changed, 2285 insertions(+)
> > >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
> >
> > [...]
> >
> > > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > > new file mode 100644
> > > index 000000000..bf75c8ec1
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > > @@ -0,0 +1,2275 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > > + */
> > > +
> > > +
> >
> > [...]
> >
> > > +static struct clk_alpha_pll gpll0 = {
> > > +     .offset = 0x0,
> > > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > > +     .clkr = {
> > > +             .enable_reg = 0x52010,
> > > +             .enable_mask = BIT(0),
> > > +             .hw.init = &(struct clk_init_data){
> >
> > You missed my other comment from v4.
> >
> > const here and everywhere else.
> >
> > It is always a good practice to compare to other (older) drivers from
> > upstream.
> >
> > > +                     .name = "gpll0",
> > > +                     .parent_data = &(const struct clk_parent_data){
> > > +                             .index = DT_BI_TCXO,
> > > +                     },
> > > +                     .num_parents = 1,
> > > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > > +             },
> > > +     },
> > > +};
> > > +
> >
> > [...]

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K
