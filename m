Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254136B07C
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867072; cv=pass; b=cqMY/0Go8cXa9efe2hDI+N7JtesGsdvQtHwRt05lGviYw7UfiLOGzmj3ImHkFnEPm4LY8WMOl+PWzxmWAdBHnzm6pF8pnt74wnJYUJ/D7+BpDCChSsB3Sjwy/4xqadZWqRqUlBDRnxIn74p+zJrL82r9c4Ok1fzyqOFwJAVVwQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867072; c=relaxed/simple;
	bh=6P9xFqHU5a2/tPBoxIWZcIkCxbGqSw8qlEwtaFY4nAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6GIHf1cOTqKXcopkX336Yp4fO8XGb7UjNlXJ5Y1kbUi92E/R5TgtDPKIYwdtcL6wy7zn3qB80yKFL+f/D6BVNgsdZGyVcvQLPCqIuhoVUHHSiwBy41uCaDrxaLVGUnvf4XrDGIvzOo71mZV7GjzdAgeZEqGsYj9vq6AcvF9Qls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk1r4cd7; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk1r4cd7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so180709f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773867070; cv=none;
        d=google.com; s=arc-20240605;
        b=Kz3KeKJQcp2kft7YAsR7l16YlkhY8KvInUSyc3dft/6tP8EnsMapKmIClXtl5KmBQQ
         Fa8ke047E2e1mcYEud+MHiZOAmJAdnS4d9k+OkYSB035uz5q+hCbx/oAg2ReKf6HfFu1
         ycGpfis3lEGXQpvz+MvR8EkBV0ClODlqf/1wsK1QqBU01su1bxUP4Mj0wgxCT/S1XVK9
         YVNvf7cc9Pq8oAlsUkEfQ3jAYhiuUncIZSF0lP/CFoVu6JdayPKcHiz7DX/7juCzU4jx
         Huq8kvj1eklusjlWjWV7F7haOfzVx234QJMV62zaSjI+XbVPjEiz7SOyZ2kDlLcNLA0R
         bQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        fh=tli78n2M/UQyrFg44rBUJBtu2usiQP9OQR/DHCeBcQM=;
        b=CF5GOivm7TW37TvM257Kd9m40U54tXnGw8H/PHZWGYzHXcAsJjLFsm45U0lWpOngZ3
         EDSYYkwJlYOwsjxR51NUjaVm4rLe79a6qR2n+VtxXHmCflmcprluYFHy3TKtCgfM8/UM
         vfbTsVGnqyvFT+izBwgXhiJdNd6Kzr2lUUxlq0xsKqLMhDZupTHiI/Fxrs/l65QjgAkq
         df21T+ZlIRUZXnkldKkcp/MkuoqH9C5tvap97u0iQNqx3ng4/i+Ejbo8HJkRgvTs8NQE
         8Pbg73xXSKILeFzZK9pxl7iSwu8Bsiz86+dWhJw1M+SK7YIXhvq5OtBvM0uHYBCBSVn2
         EFIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773867070; x=1774471870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        b=mk1r4cd7uO0tbzoaZHDIAfJb3YyhnHLTW9l15juwN0ZLxS5n6RSbsVf+tlMLUPsjV7
         u3IoG9ACA5iTiUhlpyW0QwBl3/qUudlovajJti8ztQAxu9RoubKBlSmF3XMxqzRmQqRE
         TlpZzs653WTq/7GYOM+x+++vIanQOnyw6/fWs95LDC89a3v8qE16nVNcZULxjiSi4VZn
         /IbdGAcBspPvssf3O5/PUAI9Z8a47ht+QAHgizuZ89i3K3l5zNVjZvJ4dlbSM61prhnl
         VKyhuaUywQpDWi06zARYm/xTIlcGflauX+NhaaoaEDjZ21xCNK9cO3xz2jtnAsYfiSbs
         iVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773867070; x=1774471870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4o4o3+CQenCbsDaxrtVeBxdUmIUvAwrnaajaq8ygDt8=;
        b=jpaxsdy13rwQQuySVGQqnNwy0AhhgsQ7He4LGelVuNFibxgF4x7Rp3Mvd4IR+fE0RB
         e/sDvqZoX0HzZYW/LTiGfVANog2fyOoiRN/qaipwOExYvHh8sJlAJklWQHuXJKYbgAEO
         mk5TF2ZjdXQieu0nV03PDFwq0y0CawFJAdoIjMaQp8dliZAjwxeKboN+BLOXJFbJyhxm
         o0mHwpezeOgrovYkuodNi3QYaNzCrfIGRAlDiYr/bTZeVphENE0k+sQulqMLCU9dpB+b
         bJu1sYlkdMddBMFBwRlhMb4v55DbCpGAmHJjhBuMePEESPWkNABFSgCNBREHTF1ksBbu
         P4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1zihSJU/C47Gge5Dj6FKaJ8osnmpo0EhUdWy1WPY03IWfa1c603X0B25nbqsOrHRG5tmZESP6Ols=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCFdfG3OXfNkUsXS1iI+5jv4/T3rPwGP2xHqIUOty8KW2f85yV
	x+RQEn9AllrZ0NlOWRHcc/u6QbhFsTOX1caRJa9DtK0wWfrox3jxWujNj3b34mUS8tS0RCyIDDX
	HcI9iVih6Ux5pM5iSydExiYYLIq3t1tA=
X-Gm-Gg: ATEYQzxDzXxGoPMpkRI9Kx6AHEyfBbRURQARrSVcn1adcQOJnFkF70FW3AUlUC6Pifu
	IYvbZsPQALrGzQWmvdKU3Qf8VbA6ngO6NJ9xDM47tIalgTew2D2dltQ8iGcQ3990Gg2BuXNcNWi
	IRH1xjBODQtnoA6jBBdeF7VWOTvt1aReZ6LzD6TlJWxhEm6gy5yO0ulKXwQsLBjuiBoGpGjHSmc
	C1qmxeq8PwNtQRjODGYBR58MYNnjHwXllm3sgLS0dWeQOl4Ft7k/b2+NWhlLWPczm3K1grT82tV
	c7Dj9Mb51una45UrQW7sfx35OBwCBGcRWCUx8Njg/BvH/ltEiYnUuhfWVax546ScIUo=
X-Received: by 2002:adf:9d86:0:b0:439:ccd7:cdcc with SMTP id
 ffacd0b85a97d-43b577233a0mr1349825f8f.18.1773867069762; Wed, 18 Mar 2026
 13:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 20:50:43 +0000
X-Gm-Features: AaiRm52ceqKOVF2U8UD4sUl-gOqPbxnvdZRSHZUybMzo7SEQ2F0ePpHD9LutimM
Message-ID: <CA+V-a8viuC+jwnWsxKHO0Fud_Ta2k_iFLJYcQx0tZ1qhRDJckw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Mar 18, 2026 at 2:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the PCIe controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(8, BIT(6))),
> >         DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3,=
 6, 3,
> >                                                 BUS_MSTOP(8, BIT(6))),
> > +       DEF_MOD("pcie_0_aclk",                  CLK_PLLDTY_ACPU_DIV2, 1=
2, 4, 6, 4,
> > +                                               BUS_MSTOP(1, BIT(13) | =
BIT(15))),
> > +       DEF_MOD("pcie_0_clk_pmu",               CLK_PLLDTY_ACPU_DIV2, 1=
2, 5, 6, 5,
> > +                                               BUS_MSTOP(1, BIT(13) | =
BIT(15))),
>
> So the PCIE0 and PCIE1 modules are always stopped/started together, oh we=
ll...
>
Yes the clocks and reset are shared.

Cheers,
Prabhakar

> >         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 1=
3, 2, 6, 18,
> >                                                 BUS_MSTOP(9, BIT(4))),
> >         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3,=
 6, 19,
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v7.1.
>
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
