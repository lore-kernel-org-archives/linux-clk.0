Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1F35B63D
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352495; cv=none; b=JV5dGe2k5Q0DupO4XlHPI6/2Cc9sKtuK/b+nJnk3XzU3MlCH6QuwO0OpOGqNJ/Iy0d8HsmNufzGOEk/fgKpES+zt7GnBk8RofSEWsgKLcjEtYDNIKVkEtLC4qGrbo/qPj8bfqYTGOHV4I8W/f1H0Y7RN1ccSMXqd5QLqY72kcHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352495; c=relaxed/simple;
	bh=8s7H6XW7k7X7xmSxjH45D5K9tIbgL0en//u1liivD3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SK11Zfqoxt4RYbDLNAZKXJItUmyhJ9elc1hvQ/wKOTIFWR8tXA1d1Tr3opv5OC1nmv7PRPNcf4Z3xOdoufMaf+mq781mUFsNR4bweMcGuKt4RpBgpG1XKrN4h7hg4syNhxQ2eISfxPKWQFdoS0TE48WPEIqlqN5GJXYepVr4gxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-83ef1d17904so5834469b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352493; x=1779957293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJBmBePAR5zxYZavdDNae1lt8A1fnyv8gTHT/WQkGDg=;
        b=UDkRmn9ws/r806DJV3vZ+HU+hku26efT9Lhmvv9RoqmKJuMOwxV19/kiSXkiL4YMMj
         mU8H4Id0VqSvkeoDqHGNKwO30+beN3aQMDur56arWk1tWyy77bjMu0yJsawQkd2gZmLs
         yVkXzfbXKKi5Xj/hW/0w0CcO2xhGXpCNeU54O/QI2pFUM5679mFCTXzDQzZm/txyD37f
         HsUNujaCcY1FpWThod7RXms0nR4zaEr96aykJeIvPYJdgdXBMWA22pO7GZSuEeCj73t/
         N9RkAPWewyv5fG82MrCrqKpS1Pd70uC3AsvjZq38xq4GyQQfa3guMnU75dFezNeernB4
         ZCsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0lTr2yYZ5b+OaRdP4tNVHKKsms2KrHXvTtSR9Q1WFto4AMrzcyBUNtIvX4XkpxB9pIprzYCUcovU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1SMA5UqV4miR8GESY/R98J4EEaVxPdQJts9yp3KhTfUFEdbI
	g4cw/toPQy354G799tsV3oEBhL+iBf3IWPg14xuUN9o0W3IY5A4M30VEC/1eglaejIA=
X-Gm-Gg: Acq92OGit87+1kCqRcjJFVF+kNLxbLPskU6nxJfOouox4obhZOejOnSx/b7Ht6pFVTT
	zxJaBaGJcIPyV4ap3st7A4nFzeHhNYeT0Ubjy2OORevd6tNyTiZ3uD5hYaWQuBjPdZxvIfxs3e8
	q56K0Mxmmwy43twsHHA/jFQKmmpOPTzMs1sr6o92xT+wie2mk5lnA4NS2LulldNmsTnnNhh+xbT
	g3m3E1V0Ls7NMrbBZVFlvyY5oK4dEH8JdcrUaBqDjCyIULPqhlO8GFFsqQIVAFEHTs9aX77W28D
	j+kC7ex4AsQruUbtTxy575FzWqb89D+ygVM7iiZIK+S5B1abNGcPFWAKpbjh1lWT2gfbU3Ykksn
	kNfgapKvFVE32cR8PiyASqZWk+28/3vKvjab0mDdK5gzk7PsWCzxGfZG7qKdoN5m+9je/s+SYs4
	6hketxrXj/TT0exT9sVOZM8jEQloPVbMmq2EZEjzXcLKa0AdryoYn+jowortMJ
X-Received: by 2002:a05:6a00:845:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-8414adf542bmr2078328b3a.25.1779352492896;
        Thu, 21 May 2026 01:34:52 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154a20a7fsm597468b3a.24.2026.05.21.01.34.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:34:52 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3698e34a567so5103608a91.2
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9uRmzNGyIv+7uVDQ9Z6tbozT4N2LInmvBOnI6xs6Vx4dnVobUulfwgKuTSoFL3iRrPbJCs+rZ494o=@vger.kernel.org
X-Received: by 2002:a05:6122:1c10:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-584257c283dmr596427e0c.8.1779352064209; Thu, 21 May 2026
 01:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdWJvMH+a1RqozbaCxxH_8M569JcruTFa8PW+87FysnjHw@mail.gmail.com>
 <ae6Zp54NhKlVes8J@pluto> <CAMuHMdWK3Noh5ZQVWT9C0EKyXZePMaJ97C0A_syK+xCb_=abeQ@mail.gmail.com>
 <agooKghZJw3iElvp@pluto> <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
In-Reply-To: <CAMuHMdU8VRCOZtLrM2EoHFmhd5XFs8cwXc2A1tPTTr01KvUx0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:27:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
X-Gm-Features: AVHnY4IdjfB7BITVFZv-z-ao_K498dR56La7qQvqwgCb0qZYOOtkE_cpqTj8o-w
Message-ID: <CAMuHMdUo9=J0hpNfVDfiFGoAqfC73QQxvMCYyahBTTbKT8_6VA@mail.gmail.com>
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

On Thu, 21 May 2026 at 09:53, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 17 May 2026 at 22:42, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, May 08, 2026 at 12:26:19PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, 27 Apr 2026 at 01:03, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Fri, Apr 24, 2026 at 02:08:55PM +0200, Geert Uytterhoeven wrote:
> > > > > On Wed, 22 Apr 2026 at 20:45, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > Also because this should be one of the selling point of the SCMI stack
> > > > > > in a virtualized environment: you can ship the same kernel drivers with
> > > > > > the same DT and you know that ID=<N> will always identify the specific
> > > > > > resource that is needed by your driver without worrying about the fact
> > > > > > that in reality in the backstage the effectively managed physical resource
> > > > > > could be different across different platforms, because that does not matter
> > > > >
> > > > > This sounds strange to me, do I understand it correctly?
> > > > > So the ID should (1) be tied to the use-case, and not to the underlying
> > > > > hardware, and (2) be the same for different platforms?
> > > > >
> > > > > For (1): Then we must not put these IDs in DT at all, as DT is supposed
> > > > >     to describe the hardware (and firmware IDs in DT were IMHO already
> > > > >     a stretch before).
> > > > > For (2): How can there be a contiguous list of IDs, as not all platforms
> > > > >     may have the same underlying hardware?
> > > >
> > > > I would NOT say that an SCMI FW must behave like this regarding IDs, but it
> > > > is a possible SCMI deployed setup that can be useful in virtualized setups
> > > >
> > > > I mean, the DT describes the hardware of course BUT when you refer to
> > > > some of this hardware DT bits from some other subsystem by referencing a
> > > > phandle, even in the non-SCMI world, you are in fact selecting a specific
> > > > resource that fit you use case, right ? Can we say this ?
> > > > I mean you needed that specific clock or regulator that you described
> > > > previously so as to be able to enable some other piece of HW...
> > > >
> > > > Now, the SCMI provides an abstraction on top of this, since you really
> > > > discover domain IDs of a specific class (clocks/regulators etc) you are
> > > > in fact describing an HW abstraction that you then refer with the usual
> > > > phandle...also because there is NOT so much SCMI hardware to describe,
> > > > given that the HW is handled transparently (opaquely really :P) by the
> > > > driver on the FW side...
> > > >
> > > > ...you basically obtain such domain ID, usable as phandles through dynamic
> > > > SCMI enumeration so that you can use it all over your DT to make use of such
> > > > resources...
> > > >
> > > > ...on top of this, consider that the SCMI server CAN provide to its agents
> > > > a per-agent-view of the world, IOW it can (and should) expose to a specific
> > > > agent ONLY the resources needed by that agent, i.e. it can expose the set
> > > > of resources 1-N to two distinct agents and that does NOT mean that the
> > > > underlying physical resource mapped by ID=3 in both agents has to be
> > > > effectively the same piece of hardware: it could be the case, and this
> > > > would be useful to exposed and managed properly a shared resource, or
> > > > it could also be that the same ID=3 could refer to completely distinct
> > > > pieces of the same class of hardware...(same protocol same class of
> > > > resource...)
> > >
> > > Exposing only the clocks/reset/power domains the agent can use,
> > > in a contiguous list of IDS, means that the number space changes,
> > > depending on which resources are exposed.
> >
> > Yes, potentially, it depedns on how the HW/FW stack was designed I
> > suppose...
> >
> > > Suppose you have a system where you want to assign a specific hardware
> > > block in the SoC to the realtime CPU core instead of the application
> > > CPU core running Linux.
> >
> > Ok, so this is definitely a considerable change.
> >
> > > That means all resources used by that block must no longer be exposed
> > > to the Linux agent, and the corresponding IDs must be removed from
> > > the ID space exposed to Linux.  As the ID space must be sequential
> > > and contiguous, the IDs must be renumbered, impacting resources that
> > > are exposed to Linux.  As these IDs are used in the SoC .dtsi, they
> > > must be changed there, too, However, these IDs have become part of
> > > the stable DT ABI, and thus cannot be changed.
> >
> > Well, you have to ship a final DTB blob that is crafted to describe the
> > actual HW at the end, right ?
> >
> > I mean, in your example, it seems to me that you have changed considerably
> > the HW surface by moving a clock (and its related resources) away from the
> > reach of Linux as a whole, so should not be expected to have an updated
> > DTB shipped ?
>
> It is not necessary to ship an updated DTB.
> The bootloader stack can just change the "status" properties of devices
> nodes that are be taken away from Linux from "okay" to "reserved":
>
> Devicetree Specification, Release v0.4, Table 2.4: Values for statu
> property states:
>
>     Value: "reserved"
>     Description:
>         Indicates that the device is operational, but should not be
>         used. Typically this is used for devices that are controlled
>         by another software component, such as platform firmware.
>
> When all SCMI IDs change, too, much more work needs to be done.

It's a pity we cannot use strings in e.g. clock specifiers.
Then we could look them up by name (which would hopefully be more
stable) instead of by ID...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
