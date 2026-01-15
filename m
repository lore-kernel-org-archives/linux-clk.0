Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486B335080
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465807; cv=none; b=gCMWgNMJ07F+WhdjotUOyHOlDtl+YjZ+nJPZAp4Jn6t6D2VCzJrlbnee7YpPGBw+zVqlit1PEUeMzbHqeMQTzuL6QkabMo1WFU82AtDbx4tYtcLdttcQnuk8LZgwmlltkai022O4h5We3rnqI9dkqTnZD55W4GOt/ujN9EJ2DTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465807; c=relaxed/simple;
	bh=G+loJosCYPxM7dM+rE9X0eO2DVA5Iul/rElaBNI978A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIkBhu0VN2JCcUnbUQofMg4BOcy4bY3qIhgLtw3HSWRQSxUVgnQ7b4Mf++HXcxtChaBaY7sVonoBNZ0aXyD7RhZf9Dynj7V7yukF5xdtqhnF29zRLsG/bkToO/cK6Lz8BWC/YWg+IFGmMOHTjKnSIhDWdS+sMJCqPnETD7KfKG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eda26a04bfso8101301cf.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 00:30:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465798; x=1769070598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hVlaltCoWANklzhMp5xvIF6YsYsDq1BU+u4OGSDZeY=;
        b=XUBwzeIDoy6o9QXUAim3QoqSuYsfJy+Uz89vDM2PFYFMbEVRX6Pnw+cnIiSAwG0uQL
         HGMvHeskuOCHORgYznhh5UlwfLhrQuxUhvF6LLMXTSFWRyhLvByPPMfPVzaUKjcDPlIC
         DPHiWrUHh6kBypQ9OJpX9usZlYbh0u1s0eNRphFq6S8mRG7hGKo9CzfuNv5pulIQIaSU
         +4f3bU9YlagNLN9ADrtIkFYVWYsrqSzJMaoLk2YHQ8xwHkXXJle/Eq1a1CQNSVv9IQ8O
         sxPZZdm7Fu5uLrWqlFfleTx2rSZmcI+kOt93cpM2BkWMStm1B2ueV5TpKR7GJJ+S+KYO
         4RpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzrEJJ4QN/TCvgy2bMjTOdDobbDW4sweyqKgv78oaCX6YBEvrCTvDx131vUmZyImwtBIJZ78Qc7pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2b4vzFBA3dRx512kYiEOockMy9FCTxcxaWW77XU5WNqJEJPO
	ExHCZlEXFDT4ChlaMYR/dbuKzig78F8RqpZvwq5FCCPD5RkhFGLkbP6LytwzV6oh
X-Gm-Gg: AY/fxX7YjHoO4mP5p9zFdIQtG0Y86FRHtfk6j6YZrwB909+Fw11W9kqhS/Z6ZyH/AAR
	Zu3k/Jp+B15/CZEANUWgvJT0UNf3QCFsI7pXZbCB9mhGbiKoE3vj+wEGHdsRnGqP0RAYy6EiHo6
	0VwUS/bm6LyHco5cYWiNay41xVp2rpB/U/0hWHmcLUTaESV2Qxy0r4Al7sj8ic9oc4N1/K3XtpR
	nAs12JBjvAWAJbXTWAaRgHuKO7tiEGxRRcKtmvd89JvigvpflCLK14JWQkNItVg5iv1CAZhlNpT
	AW/c/jpQrH+Fev88aEkePfN+MEfy21ADrAgTXnJ9oIvAc3pFWN0h+hV8/xgaemruca1UlSTFj1m
	xBY838xLyBF9djnge90zBjNmIPde8CIQlqVUpuQgnOpIGXb2fOw1MhIQKVQAVQG0W27RTkByfXO
	x+sIn/U/V5BdYBHItUbHv1h2eL0gqukgF8VBzUfYH4s8GtV+yxrCJfmyoBYfXsB/E=
X-Received: by 2002:ac8:570e:0:b0:501:465f:6e59 with SMTP id d75a77b69052e-5014a9915b4mr60371041cf.47.1768465797560;
        Thu, 15 Jan 2026 00:29:57 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148ebae6asm29872721cf.17.2026.01.15.00.29.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:29:57 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c0f13e4424so76139685a.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 00:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT4hykh0dquCTugrP51IVWBbQ+6e+BnOmFUxxC9n0NzCxu6kMWmGg1eMVFlleoKrxtMkn7sLIaG7I=@vger.kernel.org
X-Received: by 2002:a05:6102:304b:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5f183897017mr1662832137.8.1768465478084; Thu, 15 Jan 2026
 00:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll> <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com> <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 09:24:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxwq_ugUrK3ifMblmAkyp8fbq-QzkWqQkuoZnCA8EiRq61e2GRJHn8aQo
Message-ID: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add support
 for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 15 Jan 2026 at 08:48, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 3 Dec 2025 at 14:42, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> > > > On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > > > > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame
> > > > > Compression Processor (FCPVD), a Video Signal Processor (VSPD),
> > > > > Video Signal Processor (VSPD), and Display Unit (DU).
> > > > >
> > > > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > > > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > > >
> > > > > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > > > > and 'renesas,r9a09g047-du1'.
> > > >
> > > > LCDC0/1 but compatibles du0/du1...
> > > >
> > > > What are the differences between DU0 and DU1? Just different
> > > > outputs? Is the programming model the same?
> > >
> > > The hardware configurations are different: these are two distinct hardware blocks.
> > >
> > > Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1
> > > (LCDC0), the only difference concerns the output, but this variation
> > > is internal to the hardware blocks themselves.
> > > Therefore, LCDC0 and LCDC1 are not identical blocks, and their
> > > programming models differ as a result.
> > >
> > > In summary, although most of the internal functions are the same, the
> > > two blocks have output signals connected to different components within the SoC.
> > > This requires different hardware configurations and inevitably leads
> > > to different programming models for LCDC0 and LCDC1.
> >
> > Isn't that merely an SoC integration issue?
> > Are there any differences in programming LCDC0 or LCDC1 for the common output types supported by both
> > (single channel LVDS and 4-lane MIPI-DSI)?
>
> Dual LVDS case, dot clock from LCDC0 is used in both LCDC's.

For the single dual-channel LVDS output on LCDC0, or for using two
independent LVDS outputs on both instances? How is this handled?
Don't you need a companion property to link them together?

Is this similar to dual-channel LVDS on R-Car E3 and RZ/G2E?
On these SoCs we have a single combined device node for all DU instances
(which comes with its own set of issues, e.g. Runtime PM and Clock
Domain handling).

> Standalone LVDS and DSI the programming flow is same.

OK.

> > Of there are no such differences, both instances should use the same compatible value.
>
> Then we need to use a property called display-id, to describe the supported
> output types in bindings, right??
>
> Display-id=0 {LVDS, DSI)

LVDS twice?

> Display-id=1 {LVDS, DSI, DPI)

Not necessarily: if this is purely different SoC integration per
instance, describing all possible options is fine.

But I'd like to defer to Laurent for the details...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
