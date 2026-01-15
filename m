Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21F326937
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472852; cv=none; b=JJIDRWbTG9rhukQqjIOR41/Dt75hhEUFPRxzLlA1s0GCuXi9BhUMy5oF4rwI20QnzwQTwFBLHot3Xv5NgvBocVpUyJqGuTMknOAZg98o4G1bF2CZ0iSBXdNOpYIcMxmu+KDE1TotBEBuNs/cUej12ybm3P0b+c8N5dHpPJz7Qpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472852; c=relaxed/simple;
	bh=Nhf2/CHwDEdteT938p0gnbEPbJWBPW0Anlq7VNLM3C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/1Y1o6txT+mY6UuT71wBmBGu3wltX+KJnGUOd1wHiHP5c4mBbtgbnjG5KvIkjNBMCxYUk8uAic4BmrXGXbro8KI8eWTodDrlS/9Ru/w6fiUmQ6f3p1YbzH6oAdVGdhXeh+7ExyzgpK1yFlLgGxApkCpYi1zxo01Ksyo2HtLqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-650854c473fso1288607a12.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 02:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472849; x=1769077649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqR8XdDFFIIFkcmLBykQTFX9t5bxqI0RceWqMGx+9nY=;
        b=v8Z+MQsQ5C33EMokfxXaCt50F1rrDWjcOf9+shsgeJJ6YUU1eyB7Zi2OMlukOblL3t
         Vfhkxa/STEXbALolguCewex9peR1PEIuHcoUcZE4y7a5y9YN/lddf93kMX2MxecO/On1
         tUqUV6qJ/SYpKlzjent5sr8xKwPXVNYmgIBJi0h4voqkvW18DA5DKYEAGMQmDx9IZaK9
         xeKpBKIWEbcN6VBbqe0KQD8BJeuk1sLybzRYNHhYTqC/ELrw1jIMcKNBUn3m4ezH+e98
         Ec//7sgT/MJznFNxsM8mBJy5uEpydTO0hE2hZe2NvhgxMLuNcEp6D4hE960yq+1tTtyV
         3euw==
X-Forwarded-Encrypted: i=1; AJvYcCWkDdLhKanDgim36EftWoDxi4x5XNfA566C0ODiWbRHwTLyUsHUDJWbYIadq/fyaHDEj0sRZ/FNzcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOgoo1Dzj0rSU49ehj442OWeIUe19uE8ZFt+6reC85u+ms8TmP
	VWcMDAPBVWgTZT8/RO6N6CBvp6X+h6tJatOZjrOA9PO/nNh7047pXDWey7+8nk44aSA=
X-Gm-Gg: AY/fxX7wmulAiRGCR0Kb88AYcdpwN+l1WlyoWfTo8TQdKVaRikwRBccDGS8CVXCP9BR
	hnfwHeG8pY8eiIc2xgqngTCnpMRwfnJeE+UnX5MUOI4KbdMeh7omI9Sv69hNB8z1gezcadcXlCv
	+/tRBPptK7dRNz6zAhA35TF+PP5fOkegU4oVJHrasn3kjh07ZaopoSldK4Eo5mMT3MXIafZ4ONm
	Idjb93CR26+QwtRwgzjSz983o3RYS0h8T6xO16oROr3PQky55t4Ri0P7cpE5jqg7qscdx1xjEnv
	Hg+kJTfgc/Iohoaman7bQKMwBtP0vMeRcLz2ArtlEBF3JMzuHKHOcJu43U26uXeQSDYMg/7JUmw
	nzGnb6N700Bq/ZAxS3lZ9yIz1BWbDCjjJSAIQozM/LO9WTVbqkYAIvMsGYY5h+DDrmAxrEX+ybB
	uBfUMLuXCDDf6+lXlpMm4gLpPIRWfrFo91gKEKdg066h5OsFYr
X-Received: by 2002:a05:6402:5202:b0:64d:a80b:3268 with SMTP id 4fb4d7f45d1cf-65412f4e5c6mr2369774a12.10.1768472849485;
        Thu, 15 Jan 2026 02:27:29 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411f70f39sm2047825a12.18.2026.01.15.02.27.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 02:27:29 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b876bf5277dso243004366b.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 02:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWo+sYTDCmXtJUX0MpzY8xePL2+W4fJTj9EFvmFFQxbirhu0Gp6O+rNlazGoRR6tjncvf5H+p7/FDY=@vger.kernel.org
X-Received: by 2002:aa7:c2c9:0:b0:64a:86db:526a with SMTP id
 4fb4d7f45d1cf-65412e18d72mr1612333a12.4.1768472535836; Thu, 15 Jan 2026
 02:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll> <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com> <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 11:22:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
X-Gm-Features: AZwV_QhQwMICcWnKjFrMx3lNkRtKNznFCujSIJRMO0ecc8R3fUkTKRJSiViAt_Y
Message-ID: <CAMuHMdVP4M6mS6itgN13QG_w7rxUo6wUbA2cbWU38=vPA0XLhw@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 15 Jan 2026 at 11:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 15 Jan 2026 at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 3 Dec 2025
> > > > at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame
> > > > > > > Compression Processor (FCPVD), a Video Signal Processor
> > > > > > > (VSPD), Video Signal Processor (VSPD), and Display Unit (DU).
> > > > > > >
> > > > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > > > >
> > > > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > > > and 'renesas,r9a09g047-du1'.
> > > > > >
> > > > > > LCDC0/1 but compatibles du0/du1...
> > > > > >
> > > > > > What are the differences between DU0 and DU1? Just different
> > > > > > outputs? Is the programming model the same?
> > > > >
> > > > > The hardware configurations are different: these are two distinct hardware blocks.
> > > > >
> > > > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and
> > > > > 9.4-1 (LCDC0), the only difference concerns the output, but this
> > > > > variation is internal to the hardware blocks themselves.
> > > > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > > > programming models differ as a result.
> > > > >
> > > > > In summary, although most of the internal functions are the same,
> > > > > the two blocks have output signals connected to different components within the SoC.
> > > > > This requires different hardware configurations and inevitably
> > > > > leads to different programming models for LCDC0 and LCDC1.
> > > >
> > > > Isn't that merely an SoC integration issue?
> > > > Are there any differences in programming LCDC0 or LCDC1 for the
> > > > common output types supported by both (single channel LVDS and 4-lane MIPI-DSI)?
> > >
> > > Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.
> >
> > For the single dual-channel LVDS output on LCDC0, or for using two independent LVDS outputs on both
> > instances? How is this handled?
>
> Dual-channel LVDS output on LCDC0, we use the data from LCDC0.

That's the "dual-link" case below? But that case doesn't use LCDC1 at all,
so how can "dot clock from LCDC0 is used in both LCDC's" be true?
What am I missing?

>
> We have the following use cases:
>
> Single-link(ch0 only):
>   This mode outputs the image data of LCDC0 to LVDS (ch0). In this mode,
>   LVDS (ch1) is not used.
>
> Single-link(ch1 only):
>   This mode outputs the image data of LCDC1 to LVDS (ch1).
>   In this mode, LVDS (ch0) is not used.
>
> Single-link(2ch):
>   In this mode, the image data of LCDC0 is output to LVDS (ch0) and the
>   image data of LCDC1 is output to LVDS (ch1).
>   Since LVDS (ch0) and LVDS (ch1) are not synchronously related, they
>   can be output in different image formats and can be operated asynchronously.
>
> Single-link(Multi)
>   In this mode, the image data of LCDC0 is output to both LVDS (ch0) and
>   LVDS (ch1). LVDS (ch0) and LVDS (ch1) operate synchronously.
>
> Dual-link:
>   In this mode, the input image data from LCDC0 is separated into Even pixels and
>   Odd pixels, and the output is distributed to LVDS ch0 and ch1.
>
>
> > Don't you need a companion property to link them together?
>
> Yes, We use companion property for Dual channel LVDS(Dual-Link) use case.
> >
> > Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
>
> Yes.

OK, "companion" is in the renesas,lvds bindings, which are not yet updated
for RZ/G3E? Do you need it in "renesas,rzg2l-du", too?

> > On these SoCs we have a single combined device node for all DU instances (which comes with its own set
> > of issues, e.g. Runtime PM and Clock Domain handling).
>
> But in our case, it has 2 separate independent LCDC IP's to allow all the possible outputs as mentioned above.
>
> > > Standalone LVDS and DSI the programming flow is same.
> >
> > OK.
> >
> > > > Of there are no such differences, both instances should use the same compatible value.
> > >
> > > Then we need to use a property called display-id, to describe the
> > > supported output types in bindings, right??
> > >
> > > Display-id=0 {LVDS, DSI)
> >
> > LVDS twice?
>
> LCDC0 supports DSI and LVDS (single or dual-channel) outputs.

That's two ports for LVDS (i.e. "twice"), right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
