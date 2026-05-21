Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4239AD3B
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 08:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350906; cv=none; b=AwPJUTrPrIeYqac8jHCyAy4fSszIkn3kT+25gpwKUQIAz6+Plqg44KLmMxVNTTiqlIvdKMf+LC+WK491tCWVM9StVT3zj3mx4NpGCT+nMBtWIEdd/+VystWWwZTtIjbXcpWEaB4Q0aVKdoQrxlAdv0TvkNxNINTJOPxAtE5SYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350906; c=relaxed/simple;
	bh=+RDLim/geriyK6BHkVN+y+fbAsLHqr+xXa+qxaKtufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SH//ry0Lopl5djAZkHwbDMxyQH+KNW9HJCGKObkCt51HJsI3yUXKITgO4MtsfDDiBDE3ZjO+GZdC8aFW7HwiWpO85ITGpPHI3mKYDUzbmahMG3mtOoPtmTiZGkkOjkRCD40XEXm7a97OlQE0JukiSoZuBr1kiJq4X07BbwLfpTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-479eb8bcacbso3924175b6e.1
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350903; x=1779955703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kh5ilGfgBOd7IY4hv5kPF1I4gBzJqYiKUxJVuEQxYWY=;
        b=Q8QqgaN+fJhSvXR/4dEg5Gw1LUdfDsjsOVMXT1B7GdqVehfHtsCHDKP3b7N9CYcCE/
         KefgmNR+aXg6iT402SZvAZTgGBxwIvl70YxgrVb+bH/oXfQQ957PNi0b7+NmAL5K7+F3
         ZhYiDvBQohYRNC2UqMVr3vgtmGQCXPu34NQ87kBZXa6bzzlk6AK7gH0bxU2iqXhKYwqi
         n91vHLMP+pBQPDZpIVOroZrDRZOtSIRouOQdSRVkBmPKUXdqRv6Hxo06TQtBJAQXNYMj
         rQoJwm3gawdwg8q4GduJCIgkjjrJebak7//RyetNNh4QOBPzINa5FtVKHwQPS2Xasw1w
         DdvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vtClre1kIXGq9QMpbXt6Kr33GfCPRn8y80A639oEL1j1Pkbxy21c+3uFqyyuUVzH77uo8S5oQ6Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvhTlMw0pZpaYEMapG1RYmjYp2L3gwML9KG4SgzIVcQNX6/uzY
	NpCnCjVuLPPpzCG5M5MVydXU4Nisu/Vgmm8oltx6c/nK6lMBY9ZQ6ed6QNejaaDH7NU=
X-Gm-Gg: Acq92OGLXCb5oVtPVh3nIr8nWwlCJ9IjFxsV/YylaV4THKHAY7+qSipJH7Hi1kIOmy1
	OWOpi6oJDghMn0mA4mHUzuaRy9Dp6H1xC2A33wjut3JV6tuSDrtgNklbEcT5j3TOyL3ozG2tHdB
	hdGdRN+khw+H+/hYS2FfX3czWPrkIcFMWACvi0EkBmwY3SjI0fI4PQ41/6Yz5yt0f6tS5qvWDYX
	flzVDN9i9KE0KkhUfaywUc+zO5Bdx4XHRpeTo65BWnKsGIQmD3+GeyycmyBL0aJXy+6By0hQaIx
	J1WPlWXxCAbL7N8CsQChTmVuMaH4LTU9RAww4hE5Qw2IsGzvlyE72ayUuUSmq3Nh7lVPKVLOaTW
	UtlqsOEYT2+D/bReEmnkqhN8W75epazFs7SM+NnyCjBxGrMm5DeonjH1CPGvfwNqctHgVih7P6D
	CXHNUPkeILkYeLj22Urv0ea8V7yPNptQJtgQF6noS/fVZttHQYi0mYWwye2Vug
X-Received: by 2002:a05:6808:2395:b0:464:3d5d:d9d4 with SMTP id 5614622812f47-4852ed7cc84mr929461b6e.39.1779350903180;
        Thu, 21 May 2026 01:08:23 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee533acbsm9451686b6e.13.2026.05.21.01.08.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:08:22 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-439c00ed7e0so5253767fac.0
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8vDTywUGw5qqdUN/ATs/F07/C5R+MjobYvvQJzbv04lazNVqyZVEmrnnRinZzlAeRtgz2Dvj7pZE0=@vger.kernel.org
X-Received: by 2002:a05:6102:952:b0:660:cba2:b6a5 with SMTP id
 ada2fe7eead31-6738d46a2c9mr965451137.7.1779350455953; Thu, 21 May 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
 <aekXUvIPb8nkhdKu@pluto> <CAMuHMdX8b9C3D8fV5th6GCgs6JAq7HZbF_SrOKz_gDy2H8ksow@mail.gmail.com>
 <agor5HJ0JFBoX3sZ@pluto>
In-Reply-To: <agor5HJ0JFBoX3sZ@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 May 2026 10:00:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
X-Gm-Features: AVHnY4LKAf9GYj9Cj8Ma9x6mjosVr-AC-oJEzWQ_9yBj7Yua2eAsFSXzEFT0UeE
Message-ID: <CAMuHMdWJrXcp7_S-KTKQJ8NuVhywiCWEHXMVvWkTFZwnmQayyA@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
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

On Sun, 17 May 2026 at 22:58, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Fri, May 15, 2026 at 05:39:45PM +0200, Geert Uytterhoeven wrote:
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
> >
> > [...]
> >
> > > I watched a bit of the LPC discussions around this (from Marek I think)
> > > but sincerely most of those problems had one (not necessarily simple)
> > > solution: fix your firmwares AND/OR apply quirks in the meantime...
> >
> > So let's forward to the future, where the firmware is fixed, is fully
> > compliant with the SCMI spec, and all IDs are stable, so no quirks are
> > needed.
> >
> > Where do we specify the SCMI IDs to use?  Unless when using the
> > remapping driver proposed in this patch series, they must end up in the
> > DTB.  Existing upstream users put them either in the SoC-specific .dtsi,
> > or in board-specific .dts.
> >
> > The SCMI server is supposed to expose to an agent (e.g. Linux) a
> > sequential and contiguous list of IDs that represent only resources that
> > the agent is allowed to use.
> >   - We cannot put the SCMI IDs in the SoC-specific .dtsi, as that
> >     describes all hardware in the SoC, which is typically much more than
> >     Linux can or even wants to use when running on a specific board.
> >   - You would think we could put the SCMI IDs in the board-specific
> >     .dts.  However, that would limit actual use cases later, which do
> >     not necessarily depend on the board solely.
> >       - E.g. when moving control of the CAN-FD controller from Linux to
> >         the Realtime OS, the CAN-FD node must be disabled in the DTB (by
> >         overriding status to "reserved", or by just deleting the CAN-FD
> >         node, both of which can be done by the boot loader). However,
> >         with SCMI, the IDs corresponding to CAN-FD resources must be
> >         removed from the ID space, causing a full renumbering. Who is
> >         supposed to update the IDs in the DTB?
>
> As per my previous email, after such a breaking change I would expect a
> new DTB describing the new HW to be needed anyway.

The underlying hardware would still be the same...

> >       - E.g. when partitioning a single Linux system in multiple VMs,
> >         and distributing hardware across these VMs, all VMs need
> >         different DTBs, each describing a subset of the hardware.  With
> >         SCMI, each VM needs different SCMI ID spaces, causing not a
> >         simple partitioning of the devices in the DTB, but also a
> >         renumbering of all IDs.
>
> Ok now I am lost..why do you need a distinct IDs space for each VM ?

Aren't the different VMs different SCMI agents?  If not, how do you
prevent them from stepping on each other's resources?

> In a virtualized env, I would expect to leverage the SCMI stack to
> realize the exact opposite: same set of IDs advertised to each VM (and
> so same DTB potentially) by the server which in turn can decide to
> assign the same device (and handle the sharing) to some ID or assign
> different devices to the same or different IDs on each VM: i.e. you
> have a set of virtual_IDs that is what the server exposes to each VM
> SCMI agent, and then a bunch of real physical IDs, without any contraint
> on their numbering, that the server uses in the backstage to refer to
> the real resources and that it properly remaps to each per-VM set of
> exposed virtual_IDs during the build and/or boot board configuration
> phase....i.e. when the FW adapts and reconfigures to the specific
> board that is finally running on.

Again[1], how would that work?  Clock, resets, and power domains are
not the final resources that are used by the OS.  They are merely
resources for devices that are described in DTB with other resources
(MMIO register ranges, interrupt numbers, ...) which are not handled
by SCMI.  If the server remaps e.g. a clock to a different clock,
it will no longer work with the corresponding device described in DT.

[1] https://lore.kernel.org/all/CAMuHMdVunEehM01pLa3t5a6o0NmMOCQRwh7n5J+OkDk2YR9kUA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
