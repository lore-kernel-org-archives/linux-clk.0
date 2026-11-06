Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953299;
	b=wt9AmlgyZ6c0NQrkkK4vOeW4pAITm3oqNnvUWHrZopd3a8X7ZqqPoahvTBk5YwQE10SX
	 3DFdHQdZOVYVWpjxif4atDRT7EDzrWOhrR1F77ZtuNEbNr5QVQNxIx1dOMuKx3BvEm2v4
	 w4ExtuIw6ItsezZ9EVpN79evEPvRfH/JK7XmVQznsIG6+oVKJ2ekEpDJLp5UpvzQSHKUK
	 YWGHdpnGPGOrFQOn7o9CWfu2UXXsordTai+KRLCFuVMW1iOZMqz4hGEBNjt8emjjbJAcy
	 qz93NYPiZSJiyU+bc7c5uD0TKdya8owYD5oaHH/SdV8ClmCW7oiKSpo4a4h+BnulCkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953299;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
	b=L1aSycU6Ml7Et2HZUNo2wrp1ZMSyAOKQppaYrUHh1aXdVSACDmDmz0xpGQYuT1G+7dzk
	 IW2Rz/GkiimHw6Ld+WLHfpsMMwMCNkmOoDB+vBP1xeXw5cGQw+5FG//1EcmAMxV8X9SIS
	 Hpp16S5jEBQ9zaShpx7IbF6FR9/ACFdKd31zZGoefynvVSeZfWi/pAouztKRTgDEvF/d3
	 9kAufecdoQvbJGa032PCCkSRyUc13rFd1rzXsqYS3HabP+xQeob6pEKuYPgmHXI8ggnL1
	 vPRZW0tfc4j0mWdejm1nYqeiT8Hy4lqMM1cajE9QhVmA+0f8+v4cXc+0DAS2u93T0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC9606A326
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEC9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-980c4258105so177586241.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953298; x=1794558098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B5U6R28eASu1V9FcblqPPOgTL19VFOQ1nMFsFJSdCXU=;
        b=m2Lj8Poz22gXQyD9R1pKrC4udvFLiMrNto0KUFAL/xbULNLrsT+pwXQ97U94E5R3a3
         qjUosxe0tvNYQacblnzlpt+2yQLLymrwMQjwGJmC10XBogGQkgPYIInQSCBvkb6/gmoE
         Hv98PpYZEO8v+reUVNkzCC0NP//JE4tdU81ZN5cvcDhdBDlfJQNoGU2NvwGxDo2ijU/X
         qd+KWbJIKwoTCzEs1NPaNE2/aUfYdqlRLPwY1TQAjb3eyJVmSGkEsPjc/Y3MoTaCdPzB
         86Yj1XR1pJ0ZqvagKP4lvNlLpbBS1NuDotSzAAjtMlPa2Vn9aux+YRai/A8LU6sODptM
         pGHg==
X-Forwarded-Encrypted: i=1; AKwUvBy0sK5cOiJ4puAlSV66zgu/oHGJO4szjRCvlmNuhk5vh6GcLMxStqpqKB9eC73jRdh5vzyhMDRL4qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oVgHUnUSHJoThgYTtKN/VbWvElCivSgpB4XTikLABNMnRcVNz
	eHA06UqjDrSZUhdByp4Oiezgh6owCsIgE7lTnSWnMS0+AuHAlTsRiQiqbTSdEc4Bb00=
X-Gm-Gg: AYBFou1ZIZdbqnf//5VnpGLCYqXJTonHM0RUhRFgdot2YB6pGaIwhyl+FsQtrv0CdDZ
	2sfMfKY6yWPOlbMktF8IyJpHN8ETtA54smt2zFZfjQyeoUH1N/Ue6dSrt+pbH6RxlYC+SgslBFJ
	w7/9jE+QayQfMADsNhAQy//uwoS6TqsjoIsMQ3egfBFT+rjoH0cmY9juLAglyAjg8NzpOxtW3wE
	2qao3fmpkV7OxqVTHviRpMGsTflzWrnLc3VD5zMcKlUw6nghxj1SQwJEBnyoyEP1l8XuDc0mvLI
	Uh4AWKiHQ8KMU+lDF7JCL95gyI5fTnkmXnwHbCr+pn3sY8ufcxv77BfjXydp17JO4NuNWe96Mog
	cAmT/WPqtCLFS0nOl1S7BFN+Jh05OMTpfK4yRz0p45R45GeAFAW2KhdIh/xAQed5BrtRTl6eTQV
	HMLJNuGv5dRM+l4sPgYlZ89RCnILx8k+wqKlrIOC2KlUkPvgAOI4hWNqIDHrhv1zLf3CCGe2f/D
	vu9PLApzhNA/emyD10j8Jfn+HPGUhmJZhNRa0Rie3UjZQxFBSMQ0wt+397/hm3Hb00qe9aAq1dI
	CGOtccYQ0m6ZKgcGZBnN6Yrg18yNLJS+7rf5xvT580L8YtAH0vB5qYNmpMUU6nsN9Q==
X-Received: by 2002:a05:6102:6a8a:b0:7d0:6db8:dc37 with SMTP id ada2fe7eead31-7d2a15057d8mr1124865137.7.1793953297615;
        Fri, 06 Nov 2026 00:21:37 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99badbceebdsm1266726241.3.2026.11.06.00.21.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:21:36 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c3b75caad1so298775137.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:21:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzfIowiVpbgPp7reSEIRqypH9aYQ4EbRVFYsuA4CqVl8VjeCz5vvrQhx3sUC7H2L/d3MD+4o0j/qWM=@vger.kernel.org
X-Received: by 2002:a05:6102:4188:b0:7c1:7ca9:94bf with SMTP id
 ada2fe7eead31-7d2a157ad1bmr1177241137.19.1793953296374; Fri, 06 Nov 2026
 00:21:36 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793278754.git.geert+renesas@glider.be> <415c8b26718e2e5d53f74e65daedf9986c76dcfe.1793278754.git.geert+renesas@glider.be>
 <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113465CCAA88F962CA6BA2E7186762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:21:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
X-Gm-Features: AclHuK-V7fgcHmuwvDEyfPRfTLsQvNGxgbL-okuZ_HotpWdWbAS1JxTmpUbfEsQ
Message-ID: <CAMuHMdXObreJN74sFpqmorWFHQ+uuYQ8E8z53YLy83QWzOhSmA@mail.gmail.com>
Subject: Re: [PATCH 3/9] can: rcar_canfd: Make clkp local
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Nov 2026 at 09:17, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 29 October 2026 13:11
> > Subject: [PATCH 3/9] can: rcar_canfd: Make clkp local
> >
> > The peripheral clock is only used in rcar_canfd_probe(), so convert clkp to a local variable.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/net/can/rcar/rcar_canfd.c
> > +++ b/drivers/net/can/rcar/rcar_canfd.c
> > @@ -467,7 +467,6 @@ struct rcar_canfd_global {
> >       void __iomem *base;             /* Register base address */
> >       struct rcar_canfd_f_c __iomem *fcbase;
> >       struct platform_device *pdev;   /* Respective platform device */
> > -     struct clk *clkp;               /* Peripheral clock */
>
> Unless I am missing something, I get build error
>
> drivers/net/can/rcar/rcar_canfd.c: In function 'rcar_canfd_probe':
> drivers/net/can/rcar/rcar_canfd.c:2250:55: error: 'struct rcar_canfd_global' has no member named 'clkp'
>  2250 |                         fcan_freq = clk_get_rate(gpriv->clkp);

If your tree has Claudiu's "[PATCH v4 3/7] can: rcar_canfd: Allow the
CAN FD clock to be sourced from fck", you have to update the new user
of gpriv->clkp.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
