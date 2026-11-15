Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=42mdMPeIYhwAPUw7mzawLzU6ZIa85oap5oYt0bGiFIHTNyBimK61rkpiKor8eKIZtj8A
	 42S01/BrrllLGZFvOLrkMAqc+nFk5q/icV1APK+06a84tv5Eam2ANsNGkFZ/S7Ddxo6gk
	 U+lFgQivv4npSUxnJ6Ujy5+zPjEaUJSkRobBdozoWxBizXrb9z4H1tZe4tAQlIIiTuXoq
	 i5W1B4un0s+gi09NcYOKTvTmKswK1b9SjYJN01VG5SFVKFnfzqAIY9dUBfqtfSsbypZrI
	 j1874amDML4d8b8C9hsaiZQhxWddfoksyy6tXXSXVlkV8adGb/E1IsOo/3fhL0qLXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pAyFOMytrC+WHeplIQk/P9QT+U18pl2Kv43Ux7MJxzk=;
	b=WbpDp8/JpKMs0jvacncEG4H2kDE0zspX9Rr10KhXJM1mUL7nGtZ2db2LviYfYkIsAM6i
	 fl9yKoqmPcOjBQUr1QHzpiEgNVcL3hDZO2kqSW38TkZo5/zrjAtc+7gVqyWEHE0wcIDd4
	 yK96AWpIkldph8xdyZFNYz4tyv3YJQegNjFS7peSomdaWDFBKA5WvTLsS4+iUYDyHa+dP
	 T2zEPjOu6n7Keo//3sjzKVV0DTmOrjr6CsOJlCvUIPueoL3I0I0aXCjkmpg1aGiEd3HE/
	 dwMNdzvGuBS1LaPHH3KZc+Nj/RdXiXm38vYRHnNZCNj2bsbI24OY13UaQ6ABlC7PsIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16258606A323
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1421F000C4
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744451;
	bh=pAyFOMytrC+WHeplIQk/P9QT+U18pl2Kv43Ux7MJxzk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=QmryQVy3E4N4wEuCGP5CyTEkNTyKEYCUZRKbip0gcAAbNA8XjVCONvX1P27ojkmK2
	 7wlRSq6lkiWMj3EkWkwQgJdwRLGN7RGgtGvjP8nhcKGYuwoA7jYvt25xAHHvQj7G0+
	 zhaffkcEJHF9LY/5rfg8kj/dyKMuUp1emC6EF0WDhzRWkh8e8ehO6K2cwPgIPToN2w
	 y1nhTkR+Z2VIr1K7WGDrFwhGbNfmFstNZRPdMB3BL8jzHwGas9wcBEF0bxFKT6y3uc
	 /A3bifvu+XZpGDBD9fN14pMIu81f8POg8z4RcF0j/qFeYnsE3dJmsJc176FcysyTvV
	 rPFzIWhB+6NuQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae3a5d440aso10633581fa.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 04:07:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEbN207Ardbz3WO19dK0IjbEeJNPHJfF/IA7OKv2cMI/eVtyNw+mkZgmjUyBIFcqMvf8g1Fx8OVxAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nwWZoguu00SkrFfikhWDBpJjr9aFj+3RbEns+TrrpxX66iAts
	HmLu4B7vq71MKk4bYheXxzbYi0rHyl9KEV+/QC/3psBndcH0zTrIa6/2rgWQdgHKKw98YzHliM3
	4E1WxmdlW4SiIhlzi3JpzIRAUHFTOCWg=
X-Received: by 2002:a05:651c:b26:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ae2b52ecbemr25194061fa.24.1794744450062; Sun, 15 Nov 2026
 04:07:30 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-3-jernej.skrabec@gmail.com> <sashiko-outbox-215249@kernel.org>
In-Reply-To: <sashiko-outbox-215249@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 20:07:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v6544+a2Cv65u8ZCsJmP4d6DD8W2Kb3WOtvo8=Q2+snt2w@mail.gmail.com>
X-Gm-Features: AclHuK_eMLnNxsMBol5YFdkTkMTb1ru6MI-INl_vc-Xaa50KKeV9dybfAnsle1E
Message-ID: <CAGb2v6544+a2Cv65u8ZCsJmP4d6DD8W2Kb3WOtvo8=Q2+snt2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
To: sashiko-reviews@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:27=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: sunxi-ng: de2: missing select REGMAP_MMIO for
>   SUN8I_DE2_CCU

Added while applying.

> --
>
> commit d1c006fcc75e6e1facbfb7f265581bef0d4d672a
> Author: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> clk: sunxi-ng: de2: Export register regmap for DE33
>
> This commit removes the hardcoded DE33 plane mapping writes from the cloc=
k
> driver and exports those registers via an MMIO regmap instead.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-n=
g/ccu-sun8i-de2.c
> > index 6ec6c0dc4c261..f17570efafaae 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
>
> [ ... ]
>
> > @@ -336,13 +367,19 @@ static int sunxi_de2_clk_probe(struct platform_de=
vice *pdev)
> >       }
> >
> >       /*
> > -      * The DE33 requires these additional (unknown) registers set
> > +      * The DE33 requires these additional plane mapping registers set
> >        * during initialisation.
> >        */
> >       if (of_device_is_compatible(pdev->dev.of_node,
> >                                   "allwinner,sun50i-h616-de33-clk")) {
> > -             writel(0, reg + 0x24);
> > -             writel(0x0000a980, reg + 0x28);
> > +             struct regmap *regmap;
> > +
> > +             regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> > +                                            &sun8i_de2_ccu_regmap_conf=
ig);
> > +             if (IS_ERR(regmap)) {
> > +                     ret =3D PTR_ERR(regmap);
> > +                     goto err_assert_reset;
> > +             }
> >       }
>
> [Severity: Medium]
> Should SUN8I_DE2_CCU select REGMAP_MMIO in drivers/clk/sunxi-ng/Kconfig?
>
> Without it, enabling SUN8I_DE2_CCU when REGMAP_MMIO is disabled (for
> example under COMPILE_TEST=3Dy with ARCH_SUNXI=3Dn) or built as a module =
with
> SUN8I_DE2_CCU=3Dy breaks compilation on sun8i_de2_ccu_regmap_config or fa=
ils
> to link __devm_regmap_init_mmio_clk().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115061102.22=
9680-1-jernej.skrabec@gmail.com?part=3D2
>
