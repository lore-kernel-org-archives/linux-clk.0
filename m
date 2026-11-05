Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887424;
	b=gzoTD1I+QZzRibRoWJW2NSJ/VsrwWv5knzwWFOO/MuxMdkZBTBqgLdceqtKLl3dBcpVH
	 PZe+P2QhTtM/suGiV7/SB8SrTSLZKGUni/QSwQDCHqBXKqo0xSCUhiRXeBinwwPJoVkQj
	 4+nGmLzchqY3kU3Z0yZMNnrD5pGSWAlLgzxfui61VPxDIFQNAacpgWvAKnYe6l46J7A4F
	 VVLhiDN5iNY5B/AfTPzr5eLDzOy5PIXpSHSAgxrl9EvkPbUHY0q2K5jsbmzY0VR2kpYDh
	 bf3M7+GHeJLTLgExBXiyos5RbtN5+/BNt4bPKW9kWgsrciE9MPdISy+g785hzw5vY5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
	b=kHQb25SrwzvSfpv43MhGO4LSmEvXWPh/8jvLyt0dnrmto1Iq9wEzUMOKbYJ3XqXEbV4C
	 1qQLTyKywze8bdx/EgL67YwQqBaUVOQkmSlahvNF/AmokBNxk6aKL6cP8RbRLc9Cuf9sx
	 9lDYqJU4Z3lKuXwPy9JMT076dGUuK2nc0ySbR5UEicRqV24zE9RHUpWJeYx4u6qUq/x1S
	 P0q63Mfl/dkSC+XSPN4WJIQ36nwbUkI9h1OmAYNpz4TiqJ0k4IH5mtROw93GOJi4dJbuG
	 og64nl25MRWzCo2Ovg9WVKQU0eYSAscqEJUeZoYWYcbrTuEOVex2pk4IZUzqcATvLVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D66606A31B
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D66606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17156795e9.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887423; cv=none;
        d=google.com; s=arc-20260327;
        b=eFC2n4vZ3D6osQfY+xx7FWxQ8jilCpRxZhFUT9oWsum+hmil43ZLit+xVS3g6ETcN7
         SlK/b1C9VSkM6HGvn872a2TdgtsY347BuyAHKVDZcIK/vA0j5DceFfKM+UFk6G84hxJF
         jZr5R/Yl2o5/MkdD0VNr+Ol3CauAZ2lkKcFoCcsJ9R5OSYOUJr9A3pX1wR6K+EIhT6kG
         ZVQfCUTJMOSr+IgcNc/2tBaCOxENl0YeEQvSFDFsl8xFK3+5CjjnwN+Cw0TDXtK4+LEz
         tulH0YyIGV9iPh1OPS/s7zt0/p7lAQ+qF/qBznCE6rp3gZnwzzm0ATs2JhhlM4+iiNXU
         4GrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        fh=qYcxUsNHLy9WbJdX3dqF9mSkc2Ut7a1PUGu4F4+nJsY=;
        b=DB4sVvGMItiwDoFOObjkbjSZKpyGKUA0U/fYDdEKlSqHdvkCm8qfF5a3R+yCnxOO7d
         Y316CtVmM7OMLcJnNklYJWTMmidOAaXFdZdbBWOxWb7p+1pJqMf8dfHsWuqlvMzCgF6Q
         igb0I76zJjdCH9LC85rA5eUKL9oF2V52JksMX89KIn4WzJvr8XHhHE4CoybtNrSdGZiV
         l8iuqHTNm7VFMssY5+2hWr3U2o9pICC5+D65gCLYmYf2wOJDDHyQlhXVBp66yGxWGe98
         k9aW2hLzHzGep4B4cmqB29UXKUUVhmFLn+QxIX8OEkEw77dPWLgKbVNpwsukT4EMVefk
         neLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887423; x=1794492223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=W0l0ZNbQJdLMoD4eiZMmnkoN54pHEVybxhqzG0UpQGAVs+252K87jW/1q3ylhKmNhW
         ozZzwwRgKor1DX8p5OJFXGyvNHYlhHlvUsffaORzXhMRKPsI9hRZOBwSfT02nLH9/z/K
         momGFCm5/qMjX6u942cqwrTYC1kf47c+qDtmEhIUn1tU0kozUxXn45TgCpBZg2+fgLVf
         k4Lsxucl8yhcnDs1uN3TFQMFPP31uyN51jN+HWDqdVtGBEiVjtwZwrxuICCFoizafgGO
         jTV3CV/77YwAcqDcO9KdWxKFZVcsq9gkc4cY7kQ3fznVeR9h3cCGkBl8Hyu/Cl5bG3LV
         ugfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887423; x=1794492223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=Gndc9exyORdr8dOk5pUi+Du29t7eRNBlVl3t8RAX4Li9PiRtz6p0WpbtNgw/nFay1e
         5zGR34fwOOjmPht2YNjo7FWuU4iBvl3jaLjar6ezJEyhKO+W/BUFcJ8V6RD1tqBYJjkX
         f6tiKDWEH9QK98klLr7t5NosREetg3s7I5t69oFtLvjbs/5rSf5Anb2+SqePTYawzsF3
         8BhNh05efhHmSvpWcx1I8Oscmlf4uYZx47zjLHBP3tcdN+WMmWVVTx7vR2cnAWS07s6w
         6fJQL6d0d9DsL5Nt2zIpfq3TfW2VOWEXvRBQJbeGrLKseDuKavwMhXO+r6bJlsDDoYLq
         ahHg==
X-Forwarded-Encrypted: i=1; AKwUvBzslX/hoaraMO0F1jWnXTxptQ/uPQVjktA4dis3RjbS7u3/f60GjvfdO/Vdy5O3ODLIPKOcH1zBKYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/940nvHqTEY2RfUJRzEn3ajyg8huabFFOgdFPQtjajr754uSod
	RVm9OJByUf9FyhnYKNHp/zPDlzxel6tTUR1EroCCL6+eMuBnuWB9YHxpZNBQJEtRLVc66UZeXOo
	F7Hai2jWrz42uCEBCqU2qv9UulErJSVo=
X-Gm-Gg: AYBFou0sXTMdRK14x5T38apJa+MNb4MdRjiTCq3TvQUJlSLxPJMDjR236VE+JHG5HEF
	LsndSuAak95iNeCjNdjtAQVjMhULD8EUYpNb/kulZ2ehTlWJTMALvfxraDSN0P/dKFHJQDfmmSN
	Iu40wEz4XQa2/KPHpDQS+lYRqsS/kFbJdyg6uNeo9tTuz5zdNGNZlebGm064jPcQ7ez9qAp04G7
	tZb9n/OjMxgxteLgngudYavHV7waw9E6Xa4OGjiTfwXHyY6XY0kHA7isGPpSiU+nGJleEOwZiHd
	wRLNqIN17Ms4egBF2y+AP0/rNWuvQ6hGiXZgDXdInckzWDHhq78y8QP3k2GaIT6lF17AiiyPnsx
	Ae06nn+I7c7EC1RcwzrWsIWoi82llq3Nd3WwD45St68rFQVoGNSVPHj3kVw9Y1FnILSGSgBbkrL
	zHFlHPVXKfRcSSlRq6aoNNxdniOKlgisoSuuBGlqyYfQMZ
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr429355085e9.11.1793887422595; Thu, 05 Nov 2026
 06:03:42 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
In-Reply-To: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK-GdqKV4-tANS8vahs3lcw_PvOtgyZxhigPFnTBJ5wOeikqaIi4MNhd1_M
Message-ID: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the ADC controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> clocks and reset".
>
Ok, I will apply the same fixes here.

> > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
>
> > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(3, BIT(4))),
> >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 1=
5, 2, 7, 18,
> >                                                 BUS_MSTOP(3, BIT(4))),
> > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DI=
V2, 16, 7, 8, 7,
> > +                                               BUS_MSTOP(3, BIT(9))),
> > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_G=
EAR, 16, 8, 8, 8,
> > +                                               BUS_MSTOP(3, BIT(9))),
Shall I also rename this adc_0 to adc_?

> >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9=
,
> >                                                 BUS_MSTOP(5, BIT(2))),
> >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, =
10,
> > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
ADC_0/1/2_ADRST_N?

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
> The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> there are 3 sets of clocks and resets, one for each ADC instance,
> but this does not seem to be reflected in the register bits?
>
The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
shows single clock is shared by all the three instances.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
