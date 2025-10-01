Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427302951B3
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 12:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759321428; cv=none; b=ar7GzhyNtgfs5CwFisk7PlVDzi3vkzXRemt4S4ybgni3gRnJVzLfhoWSR6wtYojOygs97zHx6yTn/u2W6rNfixACGL+uOWTU3x00keQDJCDowQ/Gp2Z1pYGsxeEdwrLAVplN4ipZXwb6of2oPlV5jUDiyEgo2puZCLMSgnfu5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759321428; c=relaxed/simple;
	bh=gBGrabJtd45mAFEOoJqVzc2XuZnoyBrQ0XCWSCj9+dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zop1/cOiNu1Otbokzg6/Ai2nixa4pkD99ITIjb0j3Esd2w98X3NYLOczRAZryMrar5Z/STg6KHxAYvN6x3Ainck0TeZCXvarlLtNgEORVryogwsMxamViwE4D9RQu69jEJ31fPwusLH6OhQWUXFMo+F5gvj3sZS5jVEn+44fbOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isSYGNQl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isSYGNQl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e317bc647so46390085e9.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Oct 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759321424; x=1759926224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBGrabJtd45mAFEOoJqVzc2XuZnoyBrQ0XCWSCj9+dc=;
        b=isSYGNQllL7IbiPcorn0mVirT4kJeukTbpaaJ9fnzt6HIm0+7ywRlogG3nF+XlKc+y
         3weL1QqULtgmoADyF99KKCa6Bf79Imxl7eGsVvcWFO0bArkTFBgGMLKP1OcGwnsh+FVd
         uY8AW6HF3YATWpttVC2yjqjHgPGdCCFZtNx4OD0oSrmlBsNUR1YIT0fq56xZQY7oRKwM
         nOOga0KifkU1DbZhCV12VxzU7V8vMRldILLv+0BW/IzyWE/TlH20ltfPAaNG05z5YVFp
         v4ABUPSurOXT9RmAu0QU3cdJsWlsKAMdC1+Y8mP2JdOb6ir1bpjbefFfR18CVah6DiBu
         cO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759321424; x=1759926224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBGrabJtd45mAFEOoJqVzc2XuZnoyBrQ0XCWSCj9+dc=;
        b=URaQtkGrXUlHjBcAcZz1F5tUUtJI1tTQfT6bbIgje11YIG0rPjNl+GiDWYAKURem0H
         u3opA/no5ioycp85bsmBSaIIV/OP8f+JIOvSJdqCy1CrTH5/Vi11CmyruOt5m62TZbMk
         KLt8B8BZF96HusrxBAS+vWg9Vjp3YqneSLsYGFDFR0ukz9FKuBmbZ944DBxTggCJ6aa7
         N1506Wyv4YbSBvga5FvkNy23zX5GS2i6Pv4o/x2es1I0VSJkZcZ/luDFJP5fJNjYTEWg
         smvrA0WiSisM4jRYp6aJGt0Yz1/L4HheVaUCYe2UW91eA7Xlc+JIood8P21n67rR3hEg
         6d2g==
X-Forwarded-Encrypted: i=1; AJvYcCUmVDtVNlmuCoL3h7RUqoNb+mLGkckA5ZjG8Tt1adJG/lwdBgRWA5vrgYHDCyHt+sa2VTc24SfloTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MtmvXBGXsgFPQj8zfiVf0SXF0QdcjJHn4pj3KgysqX9pbrp6
	wbXYSh97QWyRX9V8fm/iDZMunZB4N6HCFXjwm0X/apjIN52axPO5v8MCATQYVk5J38xaSqR1f+x
	BOhYEzVa5qfaBhb4WF1ZydkCIiDdLDa2KH0k5Qok=
X-Gm-Gg: ASbGncv5Rz6kvKB+/7VRuxIMR78wqg+AlnPKNsFh47CGBfmvWB4z8yaCWGsHC1eitWw
	NEZ9FnFxql1bF6CvH2dBe+OuBOa1KScJRG2kdYtdpO250i90bfhJsQ5O8YjNecanKwxmzwHLlBW
	vBYnN9v1LUB4I1aCxnIcpPxe8AuSNfS5cqaWKgEUhAdQUqKhvy1vXgCOhJ1EdTxt+qdqOJNI6AA
	PhwOKq1yOBNU+IC8azEfjENjVbjX3Cs
X-Google-Smtp-Source: AGHT+IG6w9L1LgThnpefnQm9I8OUIomLSyIMrWw3z8rhw6qFvyxmd8vXZTGsJ+SjoSiCjhbCQK0VPlSPMN9tMkkTwbU=
X-Received: by 2002:a05:600c:820c:b0:45b:9afe:ad48 with SMTP id
 5b1f17b1804b1-46e6127a4bemr35253245e9.16.1759321424233; Wed, 01 Oct 2025
 05:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com> <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
In-Reply-To: <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Oct 2025 13:23:17 +0100
X-Gm-Features: AS18NWAI4MLtfZreV3_pLNGPAC-_jcQVSy6mD_NW1R1LCvbGTlMIsTFaxBIK_zI
Message-ID: <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Thu, Sep 11, 2025 at 3:26=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 11/09/2025 11:14, Lad, Prabhakar wrote:
> > Hi Tomi,
> >
> > On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>
> >> Hi,
> >>
> >> On 03/09/2025 19:17, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Add support for PLLDSI and PLLDSI divider clocks.
> >>>
> >>> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and shar=
e
> >>> PLLDSI related data structures, limits, and algorithms between the
> >>> RZ/V2H(P) CPG and DSI drivers.
> >>>
> >>> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> >>> different parameter limits and omits the programmable divider present=
 in
> >>> CPG. To ensure precise frequency calculations, especially for milliHz=
-level
> >>> accuracy needed by the DSI driver, the shared algorithm allows both d=
rivers
> >>> to compute PLL parameters consistently using the same logic and input
> >>> clock.
> >>
> >> Can you elaborate a bit more why a new clock APIs are needed for the D=
SI
> >> PLL? This is the first time I have heard a DSI TX (well, any IP) requi=
re
> >> more precision than Hz. Is that really the case? Are there other reaso=
ns?
> >>
> > Im pasting the same reply from Fab
> > (https://lore.kernel.org/all/TYCPR01MB12093A7D99392BC3D6B5E5864C2BC2@TY=
CPR01MB12093.jpnprd01.prod.outlook.com/#t)
> > for the similar concern.
> >
> > The PLL found inside the DSI IP is very similar to the PLLDSI found in
> > the CPG IP block, although the limits for some of the parameters are
>
> Thanks. As discussed on chat, this confused me: There's a PLLDSI on CPG,
> which doesn't provide a DSI clock, but a pixel clock. And then there's a
> PLL in the DSI D-PHY which provides the DSI clock.
>
> A few comments overall some for this driver but also the dsi driver:
>
> This hardcodes the refclk rate to 24 MHz with RZ_V2H_OSC_CLK_IN_MEGA in
> the header file. That doesn't feel right, shouldn't the refclk rate come
> from the clock framework with clk_get_rate()?
>
From the CPG perspective we could get the info with clk_get_rate() but
from the DSI part we can't. So to keep it consistent I will keep this
macro as is.

> While not v2h related, I think it would be good to have a comment in the
> dsi driver about how the g2l hs clock rate is derived directly from the
> pixel clock.
>
> I still don't see why all the code here has to be in a header file.
> Usually headers contain only a few lines of inline code. Is there a
> reason why it's not in a .c file?
>
Ok, I will move the functions to rzv2h-cpg.c and export the symbols
and have the declarations in include/linux/clk/renesas.h.

Geert are you OK with the above?

> And last, we discussed the milliHz a bit on chat, you said you'll come
> back to that. I don't think it's a blocker, but I'm very curious why
> exactly it is needed in the DSI. +/- 12 Hz with, say 3.6GHz clock does
> not sound very much to me, and there should be enough time every line
> during blanking period to empty any fifos and "catch up".
>
> In fact, if the DSI is so picky about the rate, I find the HW design
> odd: in g2l the pixel clock and the DSI clock come from a single source,
> which keeps them neatly in sync. If that is required, why change the
> design here so that the DSI PLL is independent of the pixel clock, yet
> still the DSI PLL must be programmed to be exactly matched to the pixel
> clock.
>
As discussed on irc we have to live with mHz solution as the HW is picky.

Cheers,
Prabhakar
