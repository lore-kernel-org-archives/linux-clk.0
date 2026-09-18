Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B3632
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717615; cv=none; b=aX2txOrbmZmPWKruj8GclS+cIz/yJGkURRIbrUlSdgDrXNiwpLQKvdH0IbXZjApEwrk50ccIzWAG93/PfskHpiKOcUaA9+TeMYq9VZDBUgcTMNai0P7CGja6t2R9WucvTIWXxFlOkJP9p4NZPu1C8lP0Kdq0K72zjIO2eTDjhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717615; c=relaxed/simple;
	bh=wTlung53wgG0U6uz6ynHrcjwVaYOb0YK4Nvyasm8+go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpbJu/O934JNO0CnZIl7L5+65mzCJYjK48KUGmzYC2x8GBTumUaAOYTv1rayYmwAzvvPfoR3sds23xB8zqbLtFll146SOpMZ7fzPSi4CuHKFN54+/6kiNIzA/ACHt1r9xuXFBJTzoht+yAAksydPnmMy4kPIGfEhqCLWjAMgwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so103953e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717609; x=1790322409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y+tYCkkvzZJmFoYOhTQyYw6fM+qA/usgZs/lU8fn+ao=;
        b=cBfDxzYwbXRfB51z1EcxiS7wezABCDSo/Ofyz6Hqlo/Excwj0CqGozhFjroJRSWCKe
         r0TdsZYjPIm8RVW9prKg4DK+pdcFc6TCGbGJQRqW4mYx7fCN4Q1b7lbLKZ6Js/bgEFHe
         OsRQVahVZTBwGOh2UWOgudBQykau/UlYmUT/t93CWy5IV+xcKCH8oM1CdiELt9611jBS
         2IZXmsGl62Gj/ACoIElhglEkxgoqhMClEY8/QkjcZDZHmRkFO8Clgn7A+VtgYCAb+iZC
         J8tg/+Bnkt6ZCKifKK8GHeROJ+5c/dROrr+e+n6vSrW5H80eV8xv3nsvZ4uDmeBIahCW
         b/oA==
X-Forwarded-Encrypted: i=1; AKwUvByhnO5wMxFDVqqf74jl24K/e5wg4eTZXZVATlOjak/jV49iGOLINtp4ud27OyIRKW9lb9kFYrZjCIs=@vger.kernel.org
X-Gm-Message-State: AFuF++nMgABDYCaHs7fKFwDHdciwRAwsyCxC7Fu2CYpfHou5jSWYbAqW
	DDOaq9QtoOEwQ+jbL8wHq0sVUloHpXTaF2Z58WKh67oMRSy+1wtJoMgVSx0Q75de
X-Gm-Gg: AYBFou0sFvbQYbVX/vX4d630jgo9/WCYe2pURmxMZbESc0MJLGfFKqZckAU5Nb6vBUP
	hAzceaa1DvqPTt+N/sy0AaDEkJSf94u2+AfWG3CCMMKE4zfLrs/qn0VPsNIOiYgN0g8hcD6LMK9
	0mKlGwoLId9TjEJxfSWvdjElpAqHL1zabIw1qJ3yAYOypZ6mxbZ0g8y71cu8T5Q8huZAMGUljWQ
	zrNIzVP+pqpCMFd61hvVJUP65p0em6/bDS6u/T3DhOCDfZHIXo4QcGWqFv1Hrw3wAbexFy43jku
	5hs4xAmzIT6OGBuyP8cauWl5a4uXmGwsDX8clanNoMl8K8FvgYQKZxXa+bCW220Pnq3KGv06jaJ
	1xYRXXmJPNA1xP7e5D2Pak8fsk9nGa2IBiMWtG6VjHexjoAi1dMp4AEeCBBiiM5jXD+n5VSPVE7
	leND5d1UmM1wrqWfICgRiMnEVUPzx66WkVOr/btCHsaXfhK9R8jPGJQXubYVSH7QzAGKjAgQfY/
	KMRfjaVw0W7+FA9zk1h2FsrQizJ3nKNjpIkZONYivjVO2c=
X-Received: by 2002:a05:6122:3291:b0:5c9:a617:580c with SMTP id 71dfb90a1353d-5c9b8b29d50mr304683e0c.9.1789717609394;
        Fri, 18 Sep 2026 00:46:49 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9b82fc23bsm838799e0c.4.2026.09.18.00.46.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:46:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so103948e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 00:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfAM1HoX1H8TEHD1ds+uHVpovUlGNyTF4+93Xe50EuCcS7g/xA4DFY/E/UT4StVGS8HrT26KKndCk=@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:79f:e8ce:27f2 with SMTP id
 ada2fe7eead31-7a55af2df71mr547985137.4.1789717606396; Fri, 18 Sep 2026
 00:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <1d5c56c80291e447208ac8777aaf90ad6f0a4f4d.1788338320.git.geert+renesas@glider.be>
 <20260917221647.GA4038349-robh@kernel.org>
In-Reply-To: <20260917221647.GA4038349-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Sep 2026 09:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
X-Gm-Features: AcwNN1XFZho-l6FTtqXfFYSmbjO5DpuymjytNtvp4sOSdCdr5EidSrnlACqjwyk
Message-ID: <CAMuHMdXCFY7-SEGLjhaO1uCDwsvogc0ocdqSz=1C_gsWX6T_tA@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] of: property: fw_devlink: Add support for renesas,scmi-firmware
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 18 Sept 2026 at 00:16, Rob Herring <robh@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:20PM +0200, Geert Uytterhoeven wrote:
> > Let fw_devlink create device links between consumers and suppliers of
> > SCMI firmware on Renesas platforms, and enforce these dependencies.
> >
> > This prevents probing of drivers before the firmware they depend on
> > becomes available, thus avoiding unneeded probe deferrals.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - s/firmware/renesas,scmi-firmware/,

> > +++ b/drivers/of/property.c
> > @@ -1417,6 +1417,7 @@ DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
> >  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > +DEFINE_SIMPLE_PROP(renesas_scmi_firmware, "renesas,scmi-firmware", NULL)
> >
> >  static struct device_node *parse_pinctrl_n(struct device_node *np,
> >                                          const char *prop_name, int index)
> > @@ -1574,6 +1575,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
> >       { .parse_prop = parse_regulators, },
> >       { .parse_prop = parse_gpio, },
> >       { .parse_prop = parse_gpios, },
> > +     { .parse_prop = parse_renesas_scmi_firmware, },
>
> This is going to be a catch-22, we can't have vendor specific properties
> here. If we need this, we need to come up with a distributed way to
> declare them. Linker section tricks is one way. Maybe something in the
> driver struct would work?

Quoting myself:
"I still think the vendor prefix should be dropped, or replaced by "arm".

> Can you just avoid a property altogether? Why can't you check for the
> presence of SCMI at runtime?

A system can have multiple SCMI providers, so
of_find_compatible_node(..., "arm,scmi") is not sufficient to find
the right one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
