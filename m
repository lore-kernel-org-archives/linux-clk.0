Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0473DE421
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245561; cv=none; b=niHSjGZHEbdlhAH//Zgq1BhIPRnhim5BAnP79rANZNiMkMtug2JnlWQH2PfBFgOIr+ND6HHpZ0CS+IZuxgX/6RpB/lx9c8ZiJBH4Xt7o3UaoUGDHpjsFhZG3k+OwXIlBgMi0SPvSCDwz0rtjvbH66yhXLR7QHQGwWMuE0aSl7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245561; c=relaxed/simple;
	bh=kriQ31pznimK4X2P3ovzVVed34liQBkD34H6iVN9D1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk22C3l4jILLBnkZRKoPNdpxsXXyGfhpI8oAxdb3JroRiAh37j90yB3CImiX6o1c5NjriulViLNGfloy2hhOCU8uWNw/hB0HmLCCKGc9ssYZW6VACRyFGIuaDccigjV+H8qxK8x994Dva6R7vIXXui1OSmczPV3YpdntG6IoKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso87779e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245558; x=1773850358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TZQnjO7g8xVtwDHS6cEDEA1/Z/EJi3b/CK0eN89lxs=;
        b=mIPn1M+CvglCk9inpyyJTc++ne20JNATklJapo1V5Yz41GtIo50qH0eY/W93Cb9A6R
         yCKOy0km8mqck3bZy+DqLR5c5nm96YPme/yRugG8pPT2P02svHDlt2FE4/FyuVR5/hdP
         fMav3mcqrbywm/HSMwcIZ5RIWXaUsM5DR+KwOU1QqJY9tCOQlJDu8J6LcALuXbcfMXq2
         MTyiD0FicQ9GfpvCgVXsJXHn7JcSgvthc93D58Cs/GxQK3mKIYvSdBiIZiKVTdVljOFQ
         f5FuUj6Lo098mODeeOg/FwO6gcw+IE5rwImAJvHlu/XnJYf6NUynOrpEg1G7+zRH90xB
         d9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWF7lSf9bhCFyozx5JjTCukKolEcZqYe5ffoEyprVw7gJLDpFMtN+xlBwPmpOgpjEtONvBJJwlF+rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOSEX/MM5FOqqOIR5H+310aIzukXZ64CTKRTp31XQ4jxzkhnB
	lL+In9uout/yV6zn8qYavBlq9rtln8/OC3d6fNrt/u27uSd0QYHmFzNu7d+NaWUJuK8=
X-Gm-Gg: ATEYQzzlD1XbiGlpvmPZEMBVTOYMptEHKQ0sinQ26xRGzxwLzV4OZQimiZCs8AKcvat
	wuBcMYrcosZ/dbgupme2yDaEcH0f0LcmYrW3RLawXX9RpEoKziTAA9hM24G6HZr885LBtS+9sJR
	8YrPqJMnbcC/v/Ads139VGq0M6v5Y4f+UFM4pU6tmmPObl3VswJ1ZSRzY1mM3qA1uwtxOKLyOUg
	ILL4wAjBeT6XrTX/+QqpOxNeVbR0Hyu1rPoPEjcnWp1y5qSfAjypdSdCfGStDWebJI0NZFYcCNK
	m2cZ2l4zihHJTAWNEW9zMdN86bNU+r/zd1HvOkrx+Rw0RqYyOOOEwlvWqQ8Kxv9o6Eq3oiuqWIq
	cniJu/DrXbW0j4l1Fm0PyN2xMsYwbkTrQfUELmSZ/vjpolPSDlz9PgSmIcpOBS3YvFay3qIm3n8
	QH7euZD8KuxdZE6IFoiBOgVO8bBi9CIlLqrKC7DUY3a1Zq7yOpKcJ3afqh9wxH
X-Received: by 2002:a05:6102:374d:b0:5ff:a8d6:b810 with SMTP id ada2fe7eead31-601ded0a1c7mr1338771137.18.1773245558405;
        Wed, 11 Mar 2026 09:12:38 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601de74a9a5sm884358137.5.2026.03.11.09.12.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 09:12:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffbcfbcecaso4950137.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 09:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCrbd0qM0+FGqOVbC4RDVnYGZuoRSWHWyYeXKdvuAO7d2EWUBu6HHfXA+/Au6JJ/sj7om4QUNyvEM=@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:5ff:d192:ff22 with SMTP id
 ada2fe7eead31-601deec1db1mr1359334137.19.1773245554633; Wed, 11 Mar 2026
 09:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com> <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:12:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
X-Gm-Features: AaiRm50HgMmG-2Hd3S3CzPU1H5WBB19C2AdyrH6AqIP1ufq9nQI1hgHf7Jj5-NE
Message-ID: <CAMuHMdWMCqPZC2o8GMaRkJVTE3-FAtbPB3h_aDjpND6s=FWbZA@mail.gmail.com>
Subject: Re: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be, 
	krzk+dt@kernel.org, robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org, 
	magnus.damm@gmail.com, biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 6 Mar 2026 at 15:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -122,6 +122,11 @@ key-sleep {
>  #endif
>  };
>
> +&pcie {
> +       pinctrl-0 = <&pcie_pins>;
> +       pinctrl-names = "default";
> +};
> +
>  &pinctrl {
>         canfd_pins: canfd {
>                 can1_pins: can1 {
> @@ -167,6 +172,17 @@ rsci9_pins: rsci9 {
>                 bias-pull-up;
>         };
>
> +       pcie-clkreq-n {

Please preserve sort order (alphabetical, by node name).
No need to resend this series just for this change.

> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "pcie_clkreq_n";
> +       };
> +
> +       pcie_pins: pcie {
> +               pinmux = <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
