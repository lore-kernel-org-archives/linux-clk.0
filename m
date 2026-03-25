Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD730E0F5
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431818; cv=pass; b=Sdxd4qljqOPqnUQoLZOVKiYSCcIo/MopnSndC+P/9VDKASgajuUo4HKDjfK2XAMBeXBFOlTgRIMEYe/sLCn5+CKqFoTvV9T6SwWGnJlYTCaWrh6VmKFepadhr7oWsHSo8bMb0BkB39YLThLOLzLvxElOQhzK+oKFU9losGxAMKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431818; c=relaxed/simple;
	bh=ec+NdA3zHGUESIcSYiIluqbC7orAYPTkxLb4Lo7OT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTESuZhb83hkq1LU7upgGgmmM6MBiz4LP1HN5uqqC1a8xpKkPc0lTsbs/gvDVGGa3U0Miye0a+WS5Lg0MYlXHnd5glV+fLKtVAP0QxTr1ohQgGe8DOhg1d4MEkHzmBPs5q88I4K0RdFEl5Pe1zejKZhgZPRMAN6ZgtFPkG0ys38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFYZZxjH; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFYZZxjH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b2965d4bso3438349f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431816; cv=none;
        d=google.com; s=arc-20240605;
        b=HkOaEYsU81TlvRbGmjtGLTNbkd7qX/z1vWMCxDBvX1BdIQq99FfzKoBSOBLISJ4OGj
         2fckoTzxhBXAkyK54lFlYNNzSwKi3gFMG14Wgu2J8ukFArI552RdFfLVpQlnObZZKiXE
         9/Z2QJO+jCTZKlSeSYpQGHj1LqbW00H0gSjoPtd9C9X61ht1IDX3slokfBpHh4DC1p54
         MJzkFXR2neSHZgiht2qcMsL8jufg0glSu/b731FdNyXXwsFmttRtSYTNciWi18WSObjT
         V7oclsh8DiFLKY9TjmF8VKDjCcgO6QRLY0B0snOv45ZhAbZavx7uRdU62d2eEu8ox/xh
         yC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        fh=lLlveWaRSoI6UFkxNCxsnLDm9aSd0DyEu5K1+++dKmI=;
        b=WjML8KBGtwWk2qoV6jTY9M5NbepVPUCTAqixgaJR5Y/R7qwPkg2+9TjbnClyRPx/ow
         YSJXXDVDu+PualqetWShBGRovcX1ddaGUtyt1jTWVTxwsoVEmIF3M9nHrnJeeY67I8oF
         nc8QLE7ECyA5ayqOME9hsqMGR30pO5oTaYcUpCAakaY38DYcnjxhoySKAD67Jp/ijBme
         E1os01YX9/q7sJHNbc98/KFXsXnVOrPLbdMsdjhGY01NL+6sRorD1AszutiEsEWDtuuG
         BduiyAnW6zgurOl2w+WHZINYpoTIlvJQhehSgS9+cGRrpsv9VMy/0gP79nssF4qt3twQ
         bLYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431816; x=1775036616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=oFYZZxjHE2EV56fYMyNZ7a/ip4CWRTyYqoS1EJe27BLAdI2INxdFA4xFKi3Oue6M0W
         TymzRVtMz82pkOpWQhYOE8Dh6nF0yUYxF53KrIwCXUp2zWw3/RH4vkp34tqaNi7GPjOQ
         NHXudRZYiGb1rLfd+8Pp6zVQ5UdYbk86dbCctLqWIme6o2y/CPGe5TZu6nJ5Xfeed/Eb
         T2sKbDfzUTI/uqK0QWqnd4NF9/ai6tU1Wiem6+/GWQHximKph5OQb4HrfxYexeE1YKJh
         6AidGlxm4WvVvzWCkJwd876ODBVgkM693+4nR/swI4d2DnlALcnUTZqF9CUbodS+z6jr
         p33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431816; x=1775036616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAGI5BL007tqvsM1+3a7mRF/PiCFVCCGSSHXUXFu1f8=;
        b=YAD0bft6YcbVveUtF+KlXOI84CUNyG3YQ1N77/qj4dslZQZVPgVT0YiwM+iuRN7FxA
         ZfOcVkbxHiGQWCSm5ufx4maJn/4oxzk6m5OmPN0c+/m2VL3dpQI6RFFRiH0FQnbc676t
         owgcvwmjflE06UIW2lgonrDoxP5e+lzJpcorhAjSQNzJJueTOob8nwfocCy+NcaqqTKx
         pp33mOV3F0r8h1qCZHyFSYbkF5lBDJzXcTaVZKRihZQv2e5aNZ8+XXG3uFWOt9LDnE9i
         eX3MRqIp4R3CUFWSBeMMDK8dZHyUrANPkthhTT60VN3XoFeJooh0LM3upuEkOP5BGBzY
         PUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVES6OFFl0xJ0gr4DXIKE+OC2nb367Dp7N2QWNhsislMEyJf2gHmZ58SguNI7rd14jGdGyk2mRc87c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBk9pjByKMJY+EXSSo6WVnn/7B95UvOIgdwxVqVUeF5Yy1kB6Y
	/kCmWqm+XoGrlQSktv7Ach2e16/T8r/kH6XR8esuqCEE6VgkJVoBsInqBTyjLiHD64x0JsPOzR+
	bxrIYWhrjkvitde9W1sDC1G2dw3gDPoBzR3uzqM0big==
X-Gm-Gg: ATEYQzyqgaAqgLyDAZVhmoF5t6oD3GdHnjGKF2jbRRdAZtdxGmeN3Hp4FvLlBnDCEUh
	Ssqh4i7smbsTKmYHEskodMEhKxRNxCUpeNV8VAZc8CnvYXFN4O7e+1DlWrme0cSdtIZPqBs9fBW
	JHNZWlwf+Dthe9oDuousycAceYaOECDzhn5TTUcYj6blJ85XjdzgzAER/jkuuPffJNwVkNrXJd0
	rDuz8ijPqC7yGw3o8LvQQBK4xL3+/rVNnLdoJkjXHgNXfHtkhtlm2iwqLZtV/KM+QioFzlo7ElZ
	xL9jZopZ3oM60mwKj50o2/Wwa15gtVr0XZtlTbKmpdruOlWHa09q5uXrWCuHUqUQmUrQQg==
X-Received: by 2002:a05:6000:18a5:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43b88a05091mr4247725f8f.34.1774431815552; Wed, 25 Mar 2026
 02:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Mar 2026 09:43:09 +0000
X-Gm-Features: AQROBzDFDTBtO3a_1v86L3_iqhrOnSlLOGOv1FeNaTZhn03Rr9fvIwgKgyBVauQ
Message-ID: <CA+V-a8vbDvbc83TjHhmMMnCCeB++-B65wDq4aGti0t29t98BCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 10:58=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  drivers/clk/renesas/r9a09g056-cpg.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9=
a09g056-cpg.c
> index 549c882f9a18..2ff2935aeb0d 100644
> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> @@ -273,22 +273,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clk=
s[] __initconst =3D {
>                                                 BUS_MSTOP(11, BIT(15))),
>         DEF_MOD("gtm_7_pclk",                   CLK_PLLCLN_DIV16, 4, 10, =
2, 10,
>                                                 BUS_MSTOP(12, BIT(0))),
> -       DEF_MOD("wdt_0_clkp",                   CLK_PLLCM33_DIV16, 4, 11,=
 2, 11,
> -                                               BUS_MSTOP(3, BIT(10))),
> -       DEF_MOD("wdt_0_clk_loco",               CLK_QEXTAL, 4, 12, 2, 12,
> -                                               BUS_MSTOP(3, BIT(10))),
>         DEF_MOD("wdt_1_clkp",                   CLK_PLLCLN_DIV16, 4, 13, =
2, 13,
>                                                 BUS_MSTOP(1, BIT(0))),
>         DEF_MOD("wdt_1_clk_loco",               CLK_QEXTAL, 4, 14, 2, 14,
>                                                 BUS_MSTOP(1, BIT(0))),
> -       DEF_MOD("wdt_2_clkp",                   CLK_PLLCLN_DIV16, 4, 15, =
2, 15,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_2_clk_loco",               CLK_QEXTAL, 5, 0, 2, 16,
> -                                               BUS_MSTOP(5, BIT(12))),
> -       DEF_MOD("wdt_3_clkp",                   CLK_PLLCLN_DIV16, 5, 1, 2=
, 17,
> -                                               BUS_MSTOP(5, BIT(13))),
> -       DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
> -                                               BUS_MSTOP(5, BIT(13))),
>         DEF_MOD("rtc_0_clk_rtc",                CLK_PLLCM33_DIV16, 5, 3, =
2, 19,
>                                                 BUS_MSTOP(3, BIT(11) | BI=
T(12))),
>         DEF_MOD("rspi_0_pclk",                  CLK_PLLCLN_DIV8, 5, 4, 2,=
 20,
> @@ -571,10 +559,7 @@ static const struct rzv2h_reset r9a09g056_resets[] _=
_initconst =3D {
>         DEF_RST(7, 2, 3, 3),            /* GTM_5_PRESETZ */
>         DEF_RST(7, 3, 3, 4),            /* GTM_6_PRESETZ */
>         DEF_RST(7, 4, 3, 5),            /* GTM_7_PRESETZ */
> -       DEF_RST(7, 5, 3, 6),            /* WDT_0_RESET */
>         DEF_RST(7, 6, 3, 7),            /* WDT_1_RESET */
> -       DEF_RST(7, 7, 3, 8),            /* WDT_2_RESET */
> -       DEF_RST(7, 8, 3, 9),            /* WDT_3_RESET */
>         DEF_RST(8, 1, 3, 18),           /* RSCI0_PRESETN */
>         DEF_RST(8, 2, 3, 19),           /* RSCI0_TRESETN */
>         DEF_RST(8, 3, 3, 20),           /* RSCI1_PRESETN */
> --
> 2.43.0
>
>
