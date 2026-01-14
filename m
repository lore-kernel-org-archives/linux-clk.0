Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D4322768
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403842; cv=none; b=Nm7M1Bx+u9rd0dAEybxw3cr/st4lPB8YUY8TSzlav73EFjwY6ADDtj1kGjy4tENWrGwNc+ahsnaxNlvHOQqS6ORMBMQ9Ufl7+/3N/aHzXxjJNQglDiwke0Wd0rgVUsFvABhwn8V3Wou1igAiKHv6xLkD6KKWhv6eKgtpuRg7BFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403842; c=relaxed/simple;
	bh=FVp9JszAvDPklWiBOZYNfZx5aTGhTO2ByBB8fUsE2hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldjhWFhmCkznMs0fPZxoXhAK9cpyfdMnLa+ofJjmZAwVuyPHVy7eCcAo/VW53Sm1tXYgu/3PAAfOzrcxwS+ctI6H8kkswIiotZHikd+1iK7ZOERzxtkbOqRx+smR9LnXjVLP8aF96Cm6s5oN0Bn4yYzo5y48CB/MYUgMrHC5ZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-563686df549so3867762e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403835; x=1769008635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKv1ovepy8byUAHhXrIcegwAZXFuolP4bDoWHXlYmv4=;
        b=VfJld+iCgf+uPLKGRoKh1JpUCqkXo5KvAeJILkejTpv4yYFHBGY3k2eJdQ4PEZKLLp
         Vjpu2ss4MZ74lkMwUX9Bx4fDP0RUmjIL+YzdAhar2zGyvgMR558E11Z1IX5hHPhnox9K
         nCD7OBWPbgkjAGYxMu+Mp9WQ2KinlJuxl3VewYbLPYhdNJ7aO57iwVW/ayzwlcKbF3lf
         y3pg7Nh24SEzLmzztE8/bd3mmR4sPI8JD//0aLDiO1X+7lvNruYLue81/3wtIVlNtb1h
         tNEONkyUoL+qhQSO72XNVxMeYUMIALYPpI70e+wRIarbELXY1+ADCE/FznX/0xt9J8R+
         1C1g==
X-Forwarded-Encrypted: i=1; AJvYcCUXd1148PZbUwdOTqrQtKKdCG/srb1/6gv2OTlQLjxXDQ3uPkJDkVH4bsk/PqMg2anU92sRwZlO51c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzijvg3zeWc2D22oCSchmuE2Fy8zftTZK5UVsGStBvm7TH0KBG9
	92/WuAQnXRHwOA2TJ7SxHW8WOQh0OtDMI+P7TJNDD3x3oZTA55s3Xb9imStxf1M/
X-Gm-Gg: AY/fxX7lx/dbEMYwxAbrhwrOUAmmItsD7FhArxY8VL0bYRUwPi6Fd3BVpFYbtPfuk41
	S9Z00SwQm5cmTUn1qQnAnhSrzAmxGb6ZDN/OgTWnpgbZhe5TGYbWpnFg7t/C6L6RtBFi3lE6X3v
	/U5XP+2edwkN7HqnS+830aKu8rMIdqDIKBvpEMAiK3qBQ+1SlKOxhrBNKetU1vQqQFRFCGYhJAN
	fNOInYuNimH8AKAHxJD0zdmPLUVgPqBLX4xw1O4fOxktcNgF7slQA0XQL2MAbCCzMPB6Nrr0ODX
	IzMMmU1sS83tL7cv6SLhw8aJ6dG7E0YJdSvgVWPs+rg+UR6aG9WBnfbH94Bq6Vr4XluuGZYgHFr
	erkJValAhzq2MMzW73jazPSs6QTVb3l4D3mk7vEu8BSIx/kaggR1GEdtv8tfxnGzfpYIRoy0IiX
	6mppxyXY8f8mrgz8eRW4eifQQ4nhDvJ2WXcLgMCqBagZXrXs2UitI9
X-Received: by 2002:a05:6122:91e:b0:55b:305b:4e34 with SMTP id 71dfb90a1353d-563a22a4fbfmr931990e0c.20.1768403833354;
        Wed, 14 Jan 2026 07:17:13 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122ae554sm22522957241.2.2026.01.14.07.17.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:17:11 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-563686df549so3867713e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQephaN4Zr6nEYh9eXSMU/T15vgj1eU5X/bzGYxsNw6IIM/uc0z1d5mNb1attE23Y+PLvwPlJMGlA=@vger.kernel.org
X-Received: by 2002:a05:6122:130c:b0:55a:be72:7588 with SMTP id
 71dfb90a1353d-563a21caaf3mr947121e0c.11.1768403830849; Wed, 14 Jan 2026
 07:17:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:16:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
X-Gm-Features: AZwV_QglkbidH76AuWe3Sfdqyn2BD0tJQEne_GsvUMV72nBp7iQEpygHJH5KiHg
Message-ID: <CAMuHMdW6rsfeYjdqnxZxFrPe22aboPMwgzDVMtrfso5D3m4GhQ@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: renesas: r9a09g047: Add vspd1 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add vspd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 18/22] arm64: dts: renesas: r9a09g047:
Add vspd0 node", i.e. add all VSPD instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1219,6 +1219,20 @@ fcpvd1: fcp@164a0000 {
>                         resets = <&cpg 0x11e>;
>                         power-domains = <&cpg>;
>                 };
> +
> +               vspd1: vsp@164b0000 {

Please move this just below vsp@16480000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-vsp2",
> +                                    "renesas,r9a07g044-vsp2";
> +                       reg = <0 0x164b0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
> +                       renesas,fcp = <&fcpvd1>;
> +               };
>         };
>
>         stmmac_axi_setup: stmmac-axi-config {

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
