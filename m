Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309D1FC7F3
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964801; cv=none; b=r96rUJiHlXLfOFlJx6RL8NwIhJZ3D7Y1Q89Q+5AVeyfZuzsO7snpf/PhP8M33HWKk0ZHezq2QlGDL+WmhaTFH9eF/hBtwT5LtnlRsGaldHsxPkwmWV6kPW7Gayxbvf53jgawgrCIamFF2odn0wr3PL5vvJkCsBjUrAWjqkXaIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964801; c=relaxed/simple;
	bh=6aTZPcmNRSRdG6+MBREFDTzHWHDe6eeVH0Nu/xDqPBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxc7nphKYdjkZWYbR5zZCArJxGxLzWJivjIAyvrqzoeRw1IGinuVLb1nnxkz9dM+9vLpWQSNfBZyvuUPf/QxLVJBXYh5ulggu5937Pr0yUtIdFeuuK3T2nHosr9EBK1Htsy9pugwXBEU4Qg3vX2Op5s4bRIN0i4AKNP2hgU7alc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XQYDNqwm; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XQYDNqwm"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e54bd61e793so6713317276.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737964799; x=1738569599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+VoyYfMUG+4N9u1dObDfYsaafMFTRcdAzbPiYZN20k=;
        b=XQYDNqwmpB6bnY8yY0GDCOCciZaimVBnUvHGW6hd0mOvX7CEHMkE4dhj/K128uX2ut
         pQmcpAfnfOdP896OWQ2k+91hN/DKWQdxTizW/GhvbHvl6DfLyYB1CbLE/xhvRNt8GeZm
         vyCDXnYjKILjErTPfLgjwJZzW5u7SAwqLRUkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737964799; x=1738569599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+VoyYfMUG+4N9u1dObDfYsaafMFTRcdAzbPiYZN20k=;
        b=IoH5eIK3rumbANTp2LAxfrrLYDAgOSFudyHMQyB+Q60z7myDinhIIQJ4Rutk4TKpmk
         Czylwa8WCq3Jth8+24KRLwEcAzI086Oz87Mrjc/KgOq+/BLeLq5+r27pCOjeF6s0HK8+
         nEX8WAbHmyy2vNErKK2uquvTXwwQLpXd3o9+ewDb6UlQTEUaQ6RvP/x+TjI+ernLiVuX
         lk4z8xaF96SOf/ZfI3+vYzNBb8o/ovliotLD7chPewWL46Qg5W9wODOafQdjJL6WaJ1P
         pHL/ghBgSjpju6KKMnKDJ8Zr+eb1I2+gsMFU9qJvEdWkhRm+6wnN3QShrlZpY2/dY5F9
         h1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3lpLqM3zI+JACBmpKvJ2A5HwHwJvmM/dZr0Xsf4o70O7jH3Qpf0IkY/QZ6Mnyvd0+t26xFKKReMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNXldqdcfdgohXyTuqU17KQmJFjZiNGeV9Z/Nv2Kt003EqqY6/
	QptWGlMyq6UggjfJUE+z+oiN/GzepXIKw0HXgHU7JcAQdYzo+/OvgAPg+X6rpoCuCBX+WowyRui
	W2FZL+LRNhta17R4aN6pP/MugcYe0R2EG52GO0w==
X-Gm-Gg: ASbGncvw+eX3li3vt5Hmf6XqwRv2ZdfL115ZVw9Tpz6BOhWLRvpK4T2OcpMcMhrA+yQ
	ALX2XNo5/dkUA3gSmT3WwW4Y6Kf7Kbn7lBiFG1l6Dx8jq/MxxIuvtPr6qcVgy
X-Google-Smtp-Source: AGHT+IFX3AyS24bKYvvxXCujrzZUbEJvGk+kAmVE1IyqOCZgAHd9qOkJvg0QvUvcRnKZzmt22xUGs+LmO83I6nmj5A0=
X-Received: by 2002:a05:690c:b99:b0:6ef:761e:cfc with SMTP id
 00721157ae682-6f6eb90b207mr296554447b3.25.1737964799325; Sun, 26 Jan 2025
 23:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com> <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
 <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org>
In-Reply-To: <74663d9d-364e-4db3-b18a-1068e2845215@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 27 Jan 2025 08:59:48 +0100
X-Gm-Features: AWEUYZkHJy82sfoPRSJ6UWwyoDs8ApP5Odlncth0pfXUuoFeCY-aQph_yq9FoZI
Message-ID: <CABGWkvo+HXF4hu-TG314HSb2omSmTE57hbHQt5V2zoc2_SkxvQ@mail.gmail.com>
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

On Mon, Jan 27, 2025 at 8:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 25/01/2025 13:58, Dario Binacchi wrote:
> > On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nx=
p.com> wrote:
> >>
> >> - Introduce clk_set_spread_spectrum to set the parameters for enabling
> >>   spread spectrum of a clock.
> >> - Parse 'assigned-clock-sscs' and configure it by default before using=
 the
> >>   clock. The pull request for this property is at [1]
> >>   This property is parsed before parsing clock rate.
> >>
> >> - Enable this feature for clk-scmi on i.MX95.
> >>   This may not the best, since checking machine compatibles.
> >>   I am thinking to provide an API scmi_get_vendor_info, then driver
> >>   could use it for OEM stuff, such as
> >>   if (scmi_get_vendor_info returns NXP_IMX)
> >>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
> >>
> >
> > I wonder if your solution is truly generic or merely a generalization
> > of your use case, which seems significantly simpler compared to what
>
> Please come with specific arguments why this is not generic enough, not
> just FUD. Does it fit your case? If not, what would had to be changed?
> These are the comments needed to actually work on generic solution.
>
> > happens on the i.MX8M platform, as discussed in thread
> > https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAX=
PR04MB8459.eurprd04.prod.outlook.com/,
> > or on the STM32F platform, where parameters are not written directly
> > to registers but are instead used in calculations involving the
> > parent_rate and the PLL divider, for example.
> >
> > I am the author of the patches that introduced spread spectrum
> > management for the AM33x and STM32Fx platforms, as well as the
> > series, still pending acceptance, for the i.MX8M.
> > From my perspective, this functionality varies significantly
> > from platform to platform, with key differences that must be
> > considered.
>
> So what exactly varies? Come with specifics.

In all the cases I implemented, I enabled spread spectrum within
the set_rate of the clock/PLL in question, as information such as
the parent rate or the divisor used was necessary to perform the
calculations needed to extract the data for setting the SSCG
register bitfields.

If I'm not mistaken, I think this is not the case implemented by this
series.

Thanks and regards,
Dario

> To me look addressing exactly the same.
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
