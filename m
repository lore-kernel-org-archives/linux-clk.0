Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B8248F64
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563589; cv=none; b=DCFNsMxrEq3+SML9NC3lhTJeMSyrQKQm/+uD1hJg2av/NXa2yvuZyAlr01Gw0P86jh4DY+h+YM1zR6ZtUJeDhqJKu2sn4ESGUMhdqIx2g2gctNRLH7IxFRe2p8yMfz+mq1R2EFT4L98SIH2e+HVYkb+APm6Y7fh3Sx32VYWVJgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563589; c=relaxed/simple;
	bh=RLEQaCwlrPnS44zbzdgyul2aW2ANkVmjK7JC5gW/u4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHQSWgxVeRnEffay4C8ISfStf4Xm4rNt/QgsbhbNgi9FcRIS0zo3wEZBPwrjU72FUdhK320erTPOUrmOHelS1LXuMjjpUX7sPbmP6qgxQ/+MLwtrtcw5J8W/d74HDPO0ABiBbADt5PN3sVWqhUd63pxfaYdvjZHW08maNTLVooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so2353573241.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 05:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563587; x=1776168387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MGYxkmthcoZTlDIjYHdP2FYlzdY22eALuxJJY+zxh4=;
        b=N0Zh93E84G22INWv10UUYETjXZZPxPSe4ZPT7g8yGA5mnR0CqZRDIfZRkfEjZySVwz
         I3/B/EgfEKFY1d2/Uba/7kVSTOvzFFB6BKb/xmcuT+4m+i7mOyINWHMS70WIvbKOsxHh
         kBO4cZbcy3OjofCJ4MHCDoipB2W26RQvdUvsACO0F7tYaN1tRLEsvUIX0LeeuRaFs6fO
         jUZ1lDH4VxfgEtetZSXEQ8F+e+fYT0RzFvLghXPKQPgosrPHL4UN+Hqto1L4JNAoj36J
         mv9yFfJUv98NpGycntza+np7PNv9Igs4AX918lhfOepdNLcuHLfLcRtrn1nmx/o1PMxL
         HYNw==
X-Forwarded-Encrypted: i=1; AJvYcCXYWNBXp1YdiQIRoosodU0ptZrfr4wrHnUpXUYA+WukmhyNL8MZTkaczNtI5u4qt1KV/CBaYWuOw4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHWdUnqAgr1XLACOu+EdXk6KdLc4BKpdPLGDO2Arm9dIt1Mwt
	qXC/zj5F92Mo+eETG5xAFYoLpd6fW+T1wXw7zGseqKB+T/GSfxFvDqMeknHEy1V0
X-Gm-Gg: AeBDiesAim9Zsp5fbcYGv23s1lhtaR0npo+SKEKwFw2DI7fHm0F8Y2Haz5/Jc39k10s
	ByhCQ04mq5o6vZ0ZSGbu0CdC1WMdkbVHjC2kqGu1mDeGWnlu68EJkSs/41Lj0MEOPheZyR+aD32
	fAIE8E6S6pJelGi/P3vy8OKXdAXGSIrcxSd8s1cB3P77Rzy2ZnwTvNKW0Gx6SW966psQ6Js77r3
	tTHgxXAoSVxpupu33gGk/wO512HxCGnoyFIHjP1tfwh/16ym8s1pGQet7TNcK/j8xlMvNkEycK9
	fUgiKnEtxucXrSeKaqLR6oL2m9+FzZS5b4sLnglKgXlhNfrm3LxPLzGEuAqOLZ8EhLuMpfT0FMs
	0y+AZAzO644Ir09MUx4TSE59jKFVUQcUIBJEltQ/gCyOm14tFCnRruvPXvVwEEHJBp76VMux6xw
	T2vSy5VPJXZp0QKmbFja2LsDkDuWP8AZ3XCUkC9ocsS2xWWiCp0kTOFaP3HxQAPMxF
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-605a50e32f0mr5742091137.29.1775563587272;
        Tue, 07 Apr 2026 05:06:27 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm12932112137.5.2026.04.07.05.06.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so3168637e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 05:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkb8aOQM7iloM/I9XxxilCSrWerju23qTF6t4NNnKPyqSAcWbEo3kr+K16Er1pTue+evaIlUEJuGI=@vger.kernel.org
X-Received: by 2002:a05:6122:4891:b0:56d:aa1f:e48a with SMTP id
 71dfb90a1353d-56dab9dd9c9mr6282392e0c.12.1775563586213; Tue, 07 Apr 2026
 05:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org> <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Apr 2026 14:06:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
X-Gm-Features: AQROBzBNV8VVoIPRYTToqrCO0lTdjZgYrqxs7rGtDCmLPkMo9NmWHxs4WMpk4YA
Message-ID: <CAMuHMdVOHaQU0qAYYQV3u7bAm3jzKmQM=btnpFaToxGxPrVGXA@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 28 Mar 2026 at 01:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
> @@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
>                         clock-output-names = "system", "pllc0", "pllc1",
>                                              "pllc2", "r",
>                                              "usb24s",
> -                                            "i", "zg", "b", "m1", "hp",
> -                                            "hpp", "usbp", "s", "zb", "m3",
> -                                            "cp";
> +                                            "i", "zg", "b", "m1", "ztr", "zt",
> +                                            "hp", "hpp", "usbp", "s", "zb",
> +                                            "m3", "cp";

The order of the names must match the indices in the DT bindings below.
Else consumers end up with a wrong parent clock, leading to issues
like the I2C controller driver failing to probe because its parent
clock is out of range.

>                 };
>
>                 /* Variable factor clocks (DIV6) */
> diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
> index 1b3fdb39cc426..8a8816b2ff6ac 100644
> --- a/include/dt-bindings/clock/r8a7740-clock.h
> +++ b/include/dt-bindings/clock/r8a7740-clock.h
> @@ -24,6 +24,8 @@
>  #define R8A7740_CLK_ZB         14
>  #define R8A7740_CLK_M3         15
>  #define R8A7740_CLK_CP         16
> +#define R8A7740_CLK_ZTR                17
> +#define R8A7740_CLK_ZT         18

Append at the end, good.

>
>  /* MSTP1 */
>  #define R8A7740_CLK_CEU21      28

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
