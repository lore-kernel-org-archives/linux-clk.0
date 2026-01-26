Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C828D84F
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444759; cv=none; b=n1zsNlWC/bnNtOWwfu2pYpQde7VDFLyO0tMU7bNHQ/YbvSkuv9yYviEyur+zDfDVrbgf3bGx0jrub0RjW7M+G16/ELLeqUczmsO6tp9aiGfT/p8nS0PR44WBIJdjvxjT3ScYqbWD2QY+KMeWNUnIcpX7gAYCi7mmZenRgac9JEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444759; c=relaxed/simple;
	bh=jeHSu/0rLnErxu+4kacTQN7/ETAke1VzTLPnHuzsYbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBVhSoJm0SFTullJ50Pdg/97x/f2ZrV0srCMRGIH522L4laCc/Kh/uoZARqzl/KRxMvKcXYK5cOpjdqfeeW/U0lI2BnOOBdIDq1YqjvfpvrAyglu0qMYNl9kBN438m22Jpp6ycLLDveciBHZhKE5Hc9w+hhQSo7hr7GiwMNsR5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9480ec9596cso1326607241.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444757; x=1770049557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3+3G5DpRreCC8uJSTxge0l/WrGM3k8EjLKp52pyAPM=;
        b=oQ5OSefBQjXZUMZzCiRfl7WahK3vOu4rt3mUfA6zU14+NUps2EzVUapFe83ADy5/bn
         bL2t8p0dDbf7vEB35mc9GHCsDVlca8WFzux8V4/9U5vEX4NHEauu2RDIjWhMEFw/iE5h
         BJRJr9P8oo5nNh+B7GV0rvS/XVFrVIzUja36/Ze377juYe8EiG0fY0nxAyrmeIlyzSe/
         1K4tMlu7gPiCQJLOB4dtjJJ1R1Yeow3VxzD1RgKmo4Zx47FRcQC3Nt0ASlRpr4eWmuUC
         w+jrv4nWYzskSQuuqtkaekU4MVJLu1KClSquXMI+BefRdWZGmWxwimYZ20B3/bZ5RrfI
         IW0w==
X-Forwarded-Encrypted: i=1; AJvYcCU9jBEWtVBoziKm2fqDVxFM9jOT53BmYc7cMl8S2WCN+mO49jP4h/giYPaN0BDz5+wjEzIwYOPZx5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuSbL2replvOqPId2nutMKC4huByBL4COaujFmyVuzE6pcoMk
	F58J6vZXhk5gmEoDxgtWGFXzKdU5/3HwnyofKUs+oY3aiRYil0qQYr94deO3vCb7
X-Gm-Gg: AZuq6aLbJQXJpDAX1zD0HRkr1ig5sBfOTCt1j322dG2LU8zN+JvepDPJQpO5qBcJKnb
	AZm+MpSojv9ZZpAWFa0jJLnwhAoZeW8ZIErv4Ub6XJVxE5ma8lJ5ckMFFJ1uPrq8XdHyKKz04K9
	QxZyuOq3Hb6nnsNKcSPedS97gSpAMZEqYFt9KYVhPdS0RrWuZNN+wP8GiQ3gWHKKUlmqfjtpaUr
	ckF5ch4sybC60XpOj2zn//khdeh7k3NTiDFIlDY2/lgTU65czZHH2HPMwgPWz24DqDK2pmttfhy
	/Z6bIa1VieRn/iwDao6C0S0sWm+UshTIQod10I4NSEre1ZfKLKo6M0LTtjl60fu8qI2GBzDwHYA
	tRRAiDPgBIrvjOe0HgF4BssY1C1T+0Gh9m5RukGv9jI/GXfPlF7UUjwBs+DYH8/0Vd3vNdT+WLr
	bM2VUKdToGJFE8LVB/VZJif8FHyXkVvtouP+ciRU8q2LKwyjH5
X-Received: by 2002:a05:6102:26c2:b0:5ee:a094:d4d2 with SMTP id ada2fe7eead31-5f5762c56b2mr1311275137.1.1769444757196;
        Mon, 26 Jan 2026 08:25:57 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d40f866sm1958915137.4.2026.01.26.08.25.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:25:56 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eea35e808dso1151534137.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLteAz88IO2jAQnGp6Hm6DNVRd+qZDtv34z45E7ETp+5vuXccJWlbO9Zr36WYEGtgpmSebUzjCMw8=@vger.kernel.org
X-Received: by 2002:a05:6102:e0d:b0:5f5:487c:83cd with SMTP id
 ada2fe7eead31-5f576578dacmr1239125137.40.1769444756176; Mon, 26 Jan 2026
 08:25:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com> <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 17:25:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
X-Gm-Features: AZwV_Qj7C5QJV_NVmMjfo_DCwWSlKdND6uVkPz6tMvHd1cTcE5aKBSokWc6r0H8
Message-ID: <CAMuHMdVOCFS-31HA2Uxiu7CSmiOf_XwPk1kijYf_WkD0aJJJMw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
>                 states = <3300000 0>, <1800000 1>;
>         };
>
> +       x1: x1-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <24000000>;
> +       };
> +
>         /* 32.768kHz crystal */
>         x6: x6-clock {
>                 compatible = "fixed-clock";
> @@ -277,6 +283,25 @@ raa215300: pmic@12 {
>                 clocks = <&x6>;
>                 clock-names = "xin";
>         };
> +
> +       versa3: clock-generator@69 {
> +               compatible = "renesas,5l35023";
> +               reg = <0x69>;
> +               clocks = <&x1>;
> +               #clock-cells = <1>;
> +               assigned-clocks = <&versa3 0>,
> +                                 <&versa3 1>,
> +                                 <&versa3 2>,
> +                                 <&versa3 3>,
> +                                 <&versa3 4>,
> +                                 <&versa3 5>;
> +               assigned-clock-rates = <24000000>,

Shouldn't (at least) qextal_clk and

> +                                      <24576000>,
> +                                      <32768>,

rtxin_clk be overridden to point to the corresponding versa3 outputs?
Same comment for [PATCH v2 5/5].

> +                                      <22579200>,
> +                                      <100000000>,
> +                                      <100000000>;
> +       };
>  };
>
>  &mdio0 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
