Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A13C3C1E
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032942; cv=none; b=emSDzHDspNoESpcVVGgAq1VqGJ6aCYG3QdUJemI4454assZh45pC56Sy0zioFGr74H6Fmf0uHhQwyOn0dT6OcMS4oo4/NZkvNnxb/XFLbJyvjtrQLNrAzk/SaRAnM/QHT2wkrjWLCRDvL4a15X49SC873wKXvXqblnJ5eI/1kl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032942; c=relaxed/simple;
	bh=6x8AaL0soP/QvCrhUlcKrRT+37cNHuikR53lCEKEpMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/7RoZAtMdGHLobzylE3KVkbYbfH4OUrZ+pSxjaaPb4k59HQMD/CWaLgeABKdACp8bELMhjoDGfPGCOuAky7oWd6CIY0Vd4Q8Klg0/05uDxIlOGFgny4zppZDoNBqmvE/LyEw72sCRstHX7LzI532G8bzWxm9DxHaLLr0W0MdL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bad54961385so198600866b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032939; x=1777637739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlPOzsbSlIKF8HuNfduxYXPi56LqB7rH+tGNemLx+GY=;
        b=bXLfXn0lq92xT677k58VZkW/KPTy3TraIRA4nhYtCTGuFZXrF3tKBCqbg3x91GUzGg
         QT2L9jXOJj1Z9k6Ab/OLT0fcyRIgWigvAHPKGg1/Zj0RV9hwXz8VsYlEbGtk0oTlj4RZ
         viktm2BNZiPHTOq+nnULG+Oetf0DE8tcy2ci/xW7BTDjFdFBZdKpOUS+u7BlHusTLRQd
         xQCMUJ2cs1Upp11LivstKbewWXNt83/6uwgAIzZ2k5iBas8eh11JvfhW3U656n/8Qs9Q
         ONOvn14i4A5SqXjzysogcUUsIgVkaFv6h/hIvFpILDjYU4rfmD2tq7FJtOudOmM21+pf
         bPbg==
X-Forwarded-Encrypted: i=1; AFNElJ9AF2Iy74cJ7QeL64FRgsTHnLzUV/nPicbiRmRLbrd110u4kZ0sQOWwV83iN0Sy8uth3OYvHwHqVVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4QoMtY+YGNaeeFrDxT0pPLi123Fmn9KsYxM+OIKfU/tM6+Ukt
	q2LgA3gr/iCnMMf/2gjJ5xo6O+HZSCSAu973n7ll0t8N8onc1tDkqcqSLcn6DOHpnXM=
X-Gm-Gg: AeBDietszdd0R7iQ7cOFaQc8h7F2S4I5ha3qp7EeWzbccb3qxEICOLIqfLvKdrViKWh
	IcHBSxoXn5+d9DKljdgwMoC5nhP6320PM6hF6KEtSow1aG+iDPrpRevaGK+qZ5NSsb2ymmevlUI
	bcEX0QwOhDYt1mcLIy/Nt3SADQ3jKdqNJtrZ7tTNE6bA9bUU6oDYlYUUm9o26qlr4mqY90V/cdz
	jQYBlp+/XRMy4v+XtZ4jbur7C+4pafrWoa3x8+AcqiifvD3yHrE4v2MhO97cttncVsuGwMLRRab
	t1YdVaXkZ0FhqgQTy6EycyupYWLUFOuBuzUvGT8IwQuQub0BlqDyWGHBhBzP67ZtAFXhPtFpjES
	1L30MajqCqqgsQn1KT63g18gVIA4sKeElUFj6XFXGBimj4DvxVI65Gr1VKAuhZQPvfjXUMji25z
	Tem/EOQEhDyulyHVMGJXl1htKKR9Bbo7G/pUot3c5O2HF2imeXcJwCQrWaCuGtJAOE/JAF3NA=
X-Received: by 2002:a17:906:6a19:b0:ba7:7f6d:be4a with SMTP id a640c23a62f3a-ba77f6dcc54mr1267494466b.26.1777032938622;
        Fri, 24 Apr 2026 05:15:38 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504441bsm766505366b.45.2026.04.24.05.15.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:15:38 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67790429f71so4386700a12.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hIjeR5bac3ex+7lEAmFtHpBiUzLXNPt4xsI5dVCjOzpNUtVeHirbt7ROxIV6eSEJZ5DRx4ROWM0A=@vger.kernel.org
X-Received: by 2002:a17:907:3da4:b0:bac:1263:2562 with SMTP id
 a640c23a62f3a-bac12632637mr434030666b.24.1777032550820; Fri, 24 Apr 2026
 05:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto>
In-Reply-To: <aekXUvIPb8nkhdKu@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:08:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
X-Gm-Features: AQROBzCeAVXP6DoeEYDD8I1FaXSTP-ZpY0v2OnIf6zjZFA9mNfY85ZLl0E87BuA
Message-ID: <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > Currently non-SCMI drivers cannot find out what the specific versions of
> > each SCMI provider implementation on the running system are.
>
> Thanks for your patches....this is not a proper full review of the series,
> BUT this patch catched my eye..
>
> Indeed, yes, it is deliberate that the SCMI version information is NOT
> exposed out of the SCMI world, since being the SCMI an attempt to
> standardize a common FW interface (as in [1] of course), you should not
> know what runs inside the black-box, it should be irrelevant...
>
> ...indeed the versioning is used inside the SCMI stack to deal properly
> with different protocol versions implemented by the server OR to apply
> proper quirks when needed, but all the rest should be standard....
>
> ...you should NOT really behave differently based on the underneath
> protocol or firmare implementation version...it is the SCMI stack that
> should behave properly, transparently...

Oh well...

> Having said that...I understand that at least it could be useful to be able
> to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> have been applied/activated at run time...but anything more than that it

I see no need for that, but we can discover which quirks have been
applied from the kernel log ;-)

> seems to me dangerous and prone to a number of abuses of the SCMI stack
> itself...
>
> (Also...exposing the versions itself means also tracking that bit of info
> in more than one place: the quirk framework and your drivers.)

I'll see if I can get everything handled as quirks instead...

> > However, different versions may use different ABIs (e.g. different clock
> > IDs), or behave different, requiring remapping or workarounds in other
> > drivers.
>
> ...abuse like this indeed :P ... the SCMI server is supposed to be that
> one entity remapping the IDs in the background if the same IDs happen to
> be representing different physical resources across a number of distinct
> platforms all supported by the same firmware blob...so as to present
> a consistent set of contiguos IDs...

In our case it is just a single platform, with different ID number
spaces for different firmware versions.

> Also because this should be one of the selling point of the SCMI stack
> in a virtualized environment: you can ship the same kernel drivers with
> the same DT and you know that ID=<N> will always identify the specific
> resource that is needed by your driver without worrying about the fact
> that in reality in the backstage the effectively managed physical resource
> could be different across different platforms, because that does not matter

This sounds strange to me, do I understand it correctly?
So the ID should (1) be tied to the use-case, and not to the underlying
hardware, and (2) be the same for different platforms?

For (1): Then we must not put these IDs in DT at all, as DT is supposed
    to describe the hardware (and firmware IDs in DT were IMHO already
    a stretch before).
For (2): How can there be a contiguous list of IDs, as not all platforms
    may have the same underlying hardware?

> if the SCMI platform server had properly remapped (at build time/run-time ?)
> the resources to your expected ID...alternatively of course you can ship
> with different DTs to describe different hardware...BUT remmapping stuff

That is a different issue: as SCMI covers the full platform, not just
the SoC, the IDs can be board-specific, and thus should be specified
in the board .dts, not in the SoC .dtsi?
Then the SoC .dtsi should describe the hardware, and we end up with
things like arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts?

> in the drivers themselves guessing on the vendor/subvendor/impl_vers
> seems a dangerous abuse...

There is no guessing.

> I watched a bit of the LPC discussions around this (from Marek I think)
> but sincerely most of those problems had one (not necessarily simple)
> solution: fix your firmwares AND/OR apply quirks in the meantime...

Unfortunately (at this point) we have to work with the firmware that exists.

From that LPC discussion, we learned that we are actually the lucky
guys: some other vendors tend to change the IDs and/or behavior without
bumping the version, so Linux cannot even act upon that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
