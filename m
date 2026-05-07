Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA38346FCA
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141729; cv=none; b=fZaoF6q4jrd45sv/VXGh6ld02lD7BkeXrIbJul5jRx8qFvNoXU8vxf4VOSD2lj/GCC5InmLLV324DniyU0CmHb63riuQ6uA7mkOj6zGY2XR+S00d0d6nguZGlt4VP4sPGUMvD+DnViluasyeIKltATauoGyGMSUGCHvnvVa/2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141729; c=relaxed/simple;
	bh=BtfahhhAzKwhxGXbFBG/UrJl92zYnGC9mAaLmhhe9pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBfxfZM1Ralr6ehyd4l2D4WiFmg1W0fmeirZiRT2b3NlR38Srw4nj6fjQPqKkVvihZYFnrbkbECzn2xjUjn38aEtXlbCmDbonFnevnsXhN0oAuVuFkfo88sXhpIrF6F7NpejloJdqse2756fjbMFkNIHIvGHUPsn/9o+bTy3ZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso232619b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141727; x=1778746527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlujo7B4GXnOEwb19kGu4mpvesYmekRBqIKCAW22YrQ=;
        b=h4vG8ufi0XKEgGO8/AIogCUosDCKOTGoBVk/QGigeVrt69wvaAp3qfaR/+9ljxCoeT
         PAei8ZVV7bqaOErlnGQ4zT2XmkWBcV3w6TjIz2jqd23IaadZZAv0i16zGqLmabNEKi4+
         DVQUUV8uMRF6U+YNwqzgirHXSe6+uqqe/rF8kGmVyJf9x1ttruD19ZPLAxsFFlwUpIUM
         WSbbcVEmF8C/nDJIdBxbCrmXZ0tIeMwpOURFUd8V3ksyOosxh8ruHRKHFMNyHrEbEtr2
         iGBUtqHuUrMa+sgiqt+GV4wejmjDz8esIiqHRb21WHHMqKUHfDYNt5tVa4ZAtgAVM5Sf
         Pnvg==
X-Forwarded-Encrypted: i=1; AFNElJ/h5Wc94N/NIn7gm3iQey4wXNohUeBI1kg83YI8qTYgQjDgsfUQkM0HBTqKb4OhLaYNAY71eZ2TGqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CJj7gSpvcIp/lJFlQNXukxDK0MYmPhlbG09pUhFvp2nZyVD8
	dRxwzlNWEssQoQtR3Uv31Sm1oOYYBLebDIcDQ8ZTVp12hgfCDgi7rwAeiAwXA2bmltU=
X-Gm-Gg: AeBDieu60wlc3WmjlNvEw8NMHdZkXx3PJmu2pLrwN4Fo8Wf0ZAC9es4nMNCMLHQ1cXJ
	+qqq703099VmiOBDKhR8sSEmYehJxjHqAkV00XL24rztmn7XImYJ9TBFTNyWXUBzYnVX7tILOrM
	LehpfnvWM5eVVjepy8Y+JdYkyhrcgDy4N0NyqHck7i4IpS9TFFn6X7n46TGfekSkvLW//2ngdyN
	k9jBv9n42ePcKTtbgzvNeDi9k1Pj6y0kl+V+h6KwpB54PIX9XL3TDLxKWn+AmYfjOkAocwh0l9m
	2QN62DRkH4S64Tnbco1oLa3RxHkT1t3DGBWAXCDgCv3xm7GFjL4EItwbuqghJQXdoUw2zWhyhUn
	/pGEqS2DzoThLj3AkmcyabsQecJo03xjzk1gqLycl0lBNDy1V3moMd1AeUAzi5oTfnGEbPhezE6
	33cPg3yzce7uQhI74X3+8/rOEgGsoE5OXB5PQ3UTsxq7lY2Ocl8J+nMhJJr5bddAXVjmwriA==
X-Received: by 2002:a05:6a00:1411:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-83a5d68134fmr6644030b3a.30.1778141727086;
        Thu, 07 May 2026 01:15:27 -0700 (PDT)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm9739263b3a.28.2026.05.07.01.15.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:15:26 -0700 (PDT)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-132536e7af4so149579c88.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NTi+k97/CjBf0VyWk0JdmtBAzTCDZ5WwfzH4rWLEF6vEERqye5zzWJZp/DQrwOnVEfZ3FAGmgqVc=@vger.kernel.org
X-Received: by 2002:a05:6102:304e:b0:62e:79ee:4cda with SMTP id
 ada2fe7eead31-630f8e6ad78mr3364577137.3.1778141327428; Thu, 07 May 2026
 01:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto>
In-Reply-To: <ae6Zp54NhKlVes8J@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 10:08:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
X-Gm-Features: AVHnY4JbGLo8_iAmQ_D9O0588NyvaqL5CIqCjBD959GBuikmvjn-HVAEApsHrL4
Message-ID: <CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com>
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

On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> > > > Currently non-SCMI drivers cannot find out what the specific versions of
> > > > each SCMI provider implementation on the running system are.
> > >
> > > Thanks for your patches....this is not a proper full review of the series,
> > > BUT this patch catched my eye..
> > >
> > > Indeed, yes, it is deliberate that the SCMI version information is NOT
> > > exposed out of the SCMI world, since being the SCMI an attempt to
> > > standardize a common FW interface (as in [1] of course), you should not
> > > know what runs inside the black-box, it should be irrelevant...
> > >
> > > ...indeed the versioning is used inside the SCMI stack to deal properly
> > > with different protocol versions implemented by the server OR to apply
> > > proper quirks when needed, but all the rest should be standard....
> > >
> > > ...you should NOT really behave differently based on the underneath
> > > protocol or firmare implementation version...it is the SCMI stack that
> > > should behave properly, transparently...
> >
> > Oh well...
> >
> > > Having said that...I understand that at least it could be useful to be able
> > > to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
> > > have been applied/activated at run time...but anything more than that it
> >
> > I see no need for that, but we can discover which quirks have been
> > applied from the kernel log ;-)
>
> Ok so I may have misunderstood...it seemed to me, glancing through the
> series that you wanted sort of reconfigure other non-SCMI drivers based
> on the SCMI FW version assuming that some quirks were applied BUT also
> that some sort of corrective workaround was needed additionally...so
> what I was saying was that: is not more straightforward to be possibly
> able to check if a quirk has been applied instead of querying the
> version from outside ?

I am not sure I can implement everything as quirks...
Also, as quirks.h lives under drivers/firmware/arm_scmi/, accessing
quirks.h elsewhere requires a relative include path.

> > > Also because this should be one of the selling point of the SCMI stack
> > > in a virtualized environment: you can ship the same kernel drivers with
> > > the same DT and you know that ID=<N> will always identify the specific
> > > resource that is needed by your driver without worrying about the fact
> > > that in reality in the backstage the effectively managed physical resource
> > > could be different across different platforms, because that does not matter
> >
> > This sounds strange to me, do I understand it correctly?
> > So the ID should (1) be tied to the use-case, and not to the underlying
> > hardware, and (2) be the same for different platforms?
> >
> > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> >     to describe the hardware (and firmware IDs in DT were IMHO already
> >     a stretch before).
> > For (2): How can there be a contiguous list of IDs, as not all platforms
> >     may have the same underlying hardware?
>
> I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> is a possible SCMI deployed setup that can be useful in virtualized setups
>
> I mean, the DT describes the hardware of course BUT when you refer to
> some of this hardware DT bits from some other subsystem by referencing a
> phandle, even in the non-SCMI world, you are in fact selecting a specific
> resource that fit you use case, right ? Can we say this ?
> I mean you needed that specific clock or regulator that you described
> previously so as to be able to enable some other piece of HW...

OK.

> Now, the SCMI provides an abstraction on top of this, since you really
> discover domain IDs of a specific class (clocks/regulators etc) you are
> in fact describing an HW abstraction that you then refer with the usual
> phandle...also because there is NOT so much SCMI hardware to describe,
> given that the HW is handled transparently (opaquely really :P) by the
> driver on the FW side...
>
> ...you basically obtain such domain ID, usable as phandles through dynamic
> SCMI enumeration so that you can use it all over your DT to make use of such
> resources...
>
> ...on top of this, consider that the SCMI server CAN provide to its agents
> a per-agent-view of the world, IOW it can (and should) expose to a specific
> agent ONLY the resources needed by that agent, i.e. it can expose the set
> of resources 1-N to two distinct agents and that does NOT mean that the
> underlying physical resource mapped by ID=3 in both agents has to be
> effectively the same piece of hardware: it could be the case, and this
> would be useful to exposed and managed properly a shared resource, or
> it could also be that the same ID=3 could refer to completely distinct
> pieces of the same class of hardware...(same protocol same class of
> resource...)
>
> In fact the SCMI server provides an abstraction, sometime a mere illusion
> to the agents...
>
> So in a virtualized ennvironment you could expose the same ID to a pair
> of distinct agents on distinct VMs, so that you can use the same driver
> and same DT despite the fact that maybe the underlying resources are
> distinct pieces of hardware ...

I am not sure how this can actually work.  Many clock, reset, and
power domain resources cannot just be remapped to different hardware,
as they are related to other hardware resources described in DT,
which are not handled by SCMI.

Take for example a serial port:

    serial@c0714000 {
            compatible = "vendor,serial"'
            reg = <0 0xc0714000 0 0x60>;
            interrupts = <GIC_ESPI 15 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&scmi_clk 42>, <&scmi_clk 43>, <&scif_clk>;
            clock-names = "fck", "brg_int", "scif_clk";
            dmas = <&dmac1 0x33>, <&dmac1 0x32>;
            dma-names = "tx", "rx";
            power-domains = <&scmi_pd 44>;
            resets = <&scmi_reset 45>;
            status = "disabled";
    };

The clock, power-domain, and reset cannot be remapped to a different
serial port instance, as they are tied intimately to this specific
instance at MMIO address 0xc0714000, which is wired to a specific ESPI
interrupt and to specific DMA controller channels.

> ...OR on the other side you could decide to share the same resource with
> different agents (say a clock) and take care, as a server, of armonizing
> conflicting requests from different agents (e.g. by refcounting enable/disable
> across all agents), WITHOUT necessarily need to expose that same resource
> with the same ID to both agents...

E.g. preventing the inadvertent disabling of shared resources like
shared parent clocks I can agree with.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
