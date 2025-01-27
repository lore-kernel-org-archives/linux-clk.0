Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCF2156886
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737966958; cv=none; b=lrF278ejPK8MhiEwfSfSc3fU0qUi7a7xLM/bANTwsxFmzasIwi4bDhDJXWYupfbBa3fiseahqMnb/whf9oP5RbohP0xlGasxN8c3H8VcQrLNnE5xVvXLvkBrHHA790+5VldbTsew16mMecFUGzcPdwpIBSEituroqvgx7Q6Wqw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737966958; c=relaxed/simple;
	bh=rsGjL6HoNG1do3zjDNwKXptBH1B7QcNyEvus9X9ridM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMECiccIF2EVvYxjwdYe64NjxoeD2eyxH+Gpg1nJ/gyTgBBMPrnfVeMVdaD1YnGQAU+povcO/vTnQHqQER5ZBNr3QmoQ2/hLc0geZaI28cigsR98ErhPMTO54uA3SKzLKAp2TwfI0Qn/kWZ5eKWjpxn5tyCzqlcmUdrlzXTo7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KQDl+3oS; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KQDl+3oS"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3983426f80so6170037276.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737966955; x=1738571755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CpuCgUhzlMwquwyxIpORAsFWoq98Sx1RYSATdcpZF8=;
        b=KQDl+3oSlOCNyjfC8ehDW6MpGb9sdIYaFgOc8C2/eBeM/27CEeoPXqJ8HsjxN5WZWV
         JH0MMSDWiefZU9nf/n1a7wSR3Os2a3UwRkZ+nelcuSqHRw1wGvVnYH0uXq+OHlk83RZA
         dOV6Vz4Y3krDHI9Z1B0UepViAxoYrqZSeclrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737966955; x=1738571755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CpuCgUhzlMwquwyxIpORAsFWoq98Sx1RYSATdcpZF8=;
        b=F/U1j5Ar4Zf9FxmRD38ugJmc+gMFYGXddjXbF6l00fI1Bq5age4Xqg55/4Zx7/LpN5
         zkJu3Zb4CJLtwuHdoM8kDDKGEJ370hvZN2MqRh/MagbBvtTlm9ptT4AfTIDEcYz560Mr
         +CCUmBSG24eLyFNBc/2qaqyTtRl0VpqQXP5lV834FUIEXU16gL6AR+PAfvRCydGKIWGY
         vMNfLVmsNA51YFkwa0KA2qtEzxK/ZnRxlYkrT7drMDLgby6tQ/5nlErnkA0rfuPI5a4V
         2fOWvIviFWFVfBY7qWlqke5XnA+yX9S06LKItjSuVCJaC4OhHr4oNQZgF0AdLXQSczMQ
         N3iA==
X-Forwarded-Encrypted: i=1; AJvYcCUwx40pisZ4Vw5qQjZrXOGGV5oMRssofaxNUKvWtBAHph8Hs5Lm2ohQpfmfATt4bvc+yjWaHoBLjBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VEhe6srhMXJ2gdzos+MeWVJeBgKt1otafIvzqbPmxFKOsIZZ
	mvyjeU2NBOLPJ7ZZNxmC3MO8j7X7l53iNaKgpXdXmuAopmflEhAbXZnBLVDsa7g+k8TrA/0yGf/
	vGhNMZW3Tri1fXAidn/qxjDq2yMvg6V+avSKTcw==
X-Gm-Gg: ASbGncsWXCL5rR+G9lDGRp2PpSOvYAzSMv9Tl1mdEjXQnrG6DmuWTzuevSjM77u5V+8
	oyclULXa6ajQrg6pVUoMPc/05wfqNlCprhj7TTRmrJ5MiyW0im70C4CGU3GPH
X-Google-Smtp-Source: AGHT+IGHyhUgcceh+vJXcAZjGUchw/OGjVtuboku6Agl5DSUcHsODqJZuXCoUSbUuE0lX16ABYtMxolar2BSkwIN+2o=
X-Received: by 2002:a05:690c:b91:b0:6ec:b74d:a013 with SMTP id
 00721157ae682-6f6eb68959amr300759977b3.19.1737966955422; Mon, 27 Jan 2025
 00:35:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
 <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org> <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
 <5165cc5e-4ba3-45a8-8bc0-6ff6f379c4af@kernel.org>
In-Reply-To: <5165cc5e-4ba3-45a8-8bc0-6ff6f379c4af@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 Jan 2025 09:35:44 +0100
X-Gm-Features: AWEUYZntrNnNxynYCZOhupOW0McEcrPg1c849eddjMilDJLdiEK_7si4ALRf0LQ
Message-ID: <CABGWkvrUjQPOc+PnpNSp7Ag2HC6DLLAH-fqGdSwUSfo6Z=M+AQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 9:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/01/2025 08:59, Dario Binacchi wrote:
> > On Mon, Jan 27, 2025 at 8:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 25/01/2025 13:58, Dario Binacchi wrote:
> >>> On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >>>>
> >>>> - Introduce clk_set_spread_spectrum to set the parameters for enabli=
ng
> >>>>   spread spectrum of a clock.
> >>>> - Parse 'assigned-clock-sscs' and configure it by default before usi=
ng the
> >>>>   clock. The pull request for this property is at [1]
> >>>>   This property is parsed before parsing clock rate.
> >>>>
> >>>> - Enable this feature for clk-scmi on i.MX95.
> >>>>   This may not the best, since checking machine compatibles.
> >>>>   I am thinking to provide an API scmi_get_vendor_info, then driver
> >>>>   could use it for OEM stuff, such as
> >>>>   if (scmi_get_vendor_info returns NXP_IMX)
> >>>>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
> >>>>
> >>>
> >>> I wonder if your solution is truly generic or merely a generalization
> >>> of your use case, which seems significantly simpler compared to what
> >>
> >> Please come with specific arguments why this is not generic enough, no=
t
> >> just FUD. Does it fit your case? If not, what would had to be changed?
> >> These are the comments needed to actually work on generic solution.
> >>
> >>> happens on the i.MX8M platform, as discussed in thread
> >>> https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@P=
AXPR04MB8459.eurprd04.prod.outlook.com/,
> >>> or on the STM32F platform, where parameters are not written directly
> >>> to registers but are instead used in calculations involving the
> >>> parent_rate and the PLL divider, for example.
> >>>
> >>> I am the author of the patches that introduced spread spectrum
> >>> management for the AM33x and STM32Fx platforms, as well as the
> >>> series, still pending acceptance, for the i.MX8M.
> >>> From my perspective, this functionality varies significantly
> >>> from platform to platform, with key differences that must be
> >>> considered.
> >>
> >> So what exactly varies? Come with specifics.
> >
> > In all the cases I implemented, I enabled spread spectrum within
> > the set_rate of the clock/PLL in question, as information such as
> > the parent rate or the divisor used was necessary to perform the
> > calculations needed to extract the data for setting the SSCG
> > register bitfields.
> >
> > If I'm not mistaken, I think this is not the case implemented by this
> > series.
>
> It feels like you speak about driver, so I misunderstood the concerns. I
> did not check the drivers at all, so here I do not claim patchsets are
> compatible.

Yes, I commented on the driver.
For the dt-bindings I added a comment in the github PR
https://github.com/devicetree-org/dt-schema/pull/154

Thanks and regards,
Dario

>
> But the binding takes the same values - the main PLL/clock rate.
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
