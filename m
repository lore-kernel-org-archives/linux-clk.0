Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5377D2BE02A
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404151; cv=none; b=U09v+s6B6rM3v3g9OLVBGgYIr1Wt9PqfdIw/WuWJsmZfSTfJkTtCGjm1ZHvez2YG4wg0WBWAXFB/kvje4wzALJSBVNlLjsUvGL++ZY3wFKR0702V90QjHIytsb/HAkcxFIUmljF3NEe1gimYpFblgLMjB6UhZfzC9OnVLXqr8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404151; c=relaxed/simple;
	bh=9Y389q+RPnEEFphYgapGHzjctMsxb6JLwyPIyYhxWDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdghwUrq1ruILEwgaQvb/h4wH/Ba89xUCiN8Y0pOO0QvvlW0A6w2tlpJELve2/HWEYlQKIiqmlN7Dw7cHdnV9E+hWaZW1U8mO36PFqE87P6VDoiSQhRw2W3Kt11lisw8mLzAs52OqFqTDPGTw+gCtB6jDkRWOsmL3bs7jQvbO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3f0c93ecf42so675546fac.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404144; x=1769008944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIOeuRlphqUpkbTygl+t2fPPcrL2rPHxBDUM21Fb5rs=;
        b=Ydo9qMIFLdwkywta4ZIlfgBP0rx1dpBT/FPSYVUXff5pfDYi5wch7lWCwxS/jqLCrz
         wM3djK7WGmuprPPO9BZ7IaVTZvQa8wwIZeFnCOvpLqVtmAjdgtDd+m0gP/RSHf/ZuP03
         HDPg21ZhLA8gEqloL/eP/fVpUGnnLOEJld9tcf4GQIvkgQto/PUcLO2uoIiFqVMJimcP
         I+MpSowDSn7anxAQtaSDMXYhSn4zRsWxMSi7+MGUVlapnEHQp8e7wTSVQztnmgEmbdDz
         9fekltuuyhcrb4jJjIlgBPhbtorGDvbvndugP+ch7KcRMJTlSmGf8YUkUJSID5IFKBK9
         cXdg==
X-Forwarded-Encrypted: i=1; AJvYcCUYCDeoz1H/BcV5x3I9HV7PYfyVVi+loU0sG8VTrMXPzSMSnhMWv8ur4jzrLoBj9JpfC7trOgNhuo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMnX8ofVq9SboLsYXXJTXGTC9qDkdI9ZI1tZqhjZx9WlLb3Q0
	8mcqOOiKmMYygCGQAtvnY4ypLSnqdzVtI26hn3/Ld3zDmZRfYT7O12fLNqpY7Hrj
X-Gm-Gg: AY/fxX5Oc7pjVBrZlQe3SsR9v3qHc0zpSr3CCerSjpmhfX9+QsYv6ZhWrnI5+jwLIel
	aFfrohjrS9bK7D09AHJ8tdEEN0cwkrnskBJbSPFvGO1nAWWk9lHvPk2tgMgyZenrxXJaTd+jtm/
	66ayKM89qMNoJF17knSrAlkQp8iiCvCTEIv8Kexqky3EbFUbEScFKqdVVy1ukM30vkpGxkX/bIX
	lgG6G/u0GFSM+MAeZClfUmdIoDS8FvIhq9jL93NLPXeLQwmpj83I3to16Ma0cN8CLrIhPdolP3R
	uMnWIeAcUCnTZ7P7C5gE61ZIO1+lU7Xv2jWlWARVjCFszbuf7J3GjGGeZPG6HYg2mAxVQxul4MR
	KoITD2wtWsh5ftZxqDbrCHpjRVkOftooRrUHuXpOdaswcpQEZZFIEStIHtese1BrD1QOHNYzjV3
	Gb728RxcNghG9elFhCKbpdz0SMGHhg/GzeP6ClSMZ36tN6Nj8BUPqmOwd8OZo=
X-Received: by 2002:a05:6820:638d:b0:659:9a49:8ee6 with SMTP id 006d021491bc7-6610103c7a9mr1485264eaf.26.1768404143990;
        Wed, 14 Jan 2026 07:22:23 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de539bsm16353780fac.4.2026.01.14.07.22.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:22:23 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3f0c93ecf42so675510fac.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 07:22:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp7MO4OOsao5kSPHC7BbECIipsH8Qqe4emcF4N0p+tEjdROPqY+dq7s2aNSf3hBN2lQubhkEAbIg0=@vger.kernel.org
X-Received: by 2002:a05:6122:4896:b0:563:466c:2 with SMTP id
 71dfb90a1353d-56395c42437mr2778733e0c.5.1768403701354; Wed, 14 Jan 2026
 07:15:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <fd7df433130d6955983bd7187f350946e947d1c1.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
X-Gm-Features: AZwV_Qg6hyecIyDwZwQOALkySZLKoQ1lcKWx34cwqlLRfGv4_0uRnV7x2Fxw08k
Message-ID: <CAMuHMdXPGwrudTcYrkpCM2y8cuL3-4eDaeensKUDDZNhKGcEwQ@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: renesas: r9a09g047: Add fcpvd1 node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:11, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add fcpvd1 node to RZ/G3E SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

Please merge this with "[PATCH 17/22] arm64: dts: renesas: r9a09g047:
Add fcpvd0 node", i.e. add all FCPV instances in one shot.

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1207,6 +1207,18 @@ vspd0: vsp@16480000 {
>                         power-domains = <&cpg>;
>                         renesas,fcp = <&fcpvd0>;
>                 };
> +
> +               fcpvd1: fcp@164a0000 {

Please move this just below fcp@16470000, to preserve sort order
(by unit address, grouped per device type).

> +                       compatible = "renesas,r9a09g047-fcpvd",
> +                                    "renesas,fcpv";
> +                       reg = <0 0x164a0000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD 0x1a8>,
> +                                <&cpg CPG_MOD 0x1a9>,
> +                                <&cpg CPG_MOD 0x1aa>;
> +                       clock-names = "aclk", "pclk", "vclk";
> +                       resets = <&cpg 0x11e>;
> +                       power-domains = <&cpg>;
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
