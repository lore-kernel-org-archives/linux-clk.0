Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE33128D7
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533279; cv=none; b=knhrGHtlEtq4ETYhXZcezOROHLBLaPL7E/1cNgpWUmuCPLXIqljQBMMC0629tZ7sR4vuKrlmAL5P6FvKN4VS9T+CBZv/gCftgGaWsiG7vIv2j1W/SPC6Z7pGDUW9hcv5mJZeG5ya2737v907Uy8YTBL+kG8MWP5OmLPog4I8xLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533279; c=relaxed/simple;
	bh=ZDQ5pPWDKwycT4E4mNOoJZ2LV+cHXkkjmMM1uiBduVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLiIpzcZ/FxSI1fLHiZaGOkwMZEQqdDHWpXf2fmx3K6HQqRoYpW4XpLXiNiHXxXxbeeM3cf4oKzFlxXGf1tpsv41/mhnsY5Xoda1JnjavZUkLtuEw6kGD+jy84KiUuXjQf/B/fbYx1434Vi+lyS/gSLy6u/P0jddq0rsuvxGX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-963f63fe025so222296241.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 04:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533276; x=1787138076;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=;
        b=kIsjJt7UMbyXWHwyYMXxFvvKrJjhQGvcsL1lrHgezer7Y8HSbzG/4EzkMK3uQ3AQnh
         jOQV3buaez19q9FY+kwD63nQ+DTA+tB9KQctpY414t1i80CUug6CncdJTshBTqlN3Kwv
         kbipYslN2pHDPJ9segLT0LV4PN024AIpgaSKyeqRkZPQgtMsoabN1IrGW48riBBSyWUX
         0IJ5II/DE9gHFVlqqssFGiqIOir4r4kmECALNg9GxxOaAweeShYPTeEMWhr8ucNayJD7
         bYmd3eydIJy5i7dN7hkIUCCLNLxACjXZ1wlrdqOCyjewFBBk1mwNhiyO73mWXlR7KVQU
         mBDw==
X-Forwarded-Encrypted: i=1; AHgh+RrFGQXKT2rIqpB7tyMDlcvkY1j7rlNpfPufLz4c6xn3OICgJaJKgKkH1G3ZCsGmaeIubKjW1RsgKMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfO3u0wWUWfUTkyiQU+jWNuChN91c6W6VP16Vv3+BunxZhNslL
	JOajBhaX6YndxANgdTgd7u+R0qU3vNP9BE7A4w7XXPflNlrGCK08K1fnVKcUmR0a
X-Gm-Gg: AR+sD10NB/wlIVmw5s/MLzv3zmXgQpDwhU9lWjFlXhqvMeBC9Utm5ijEQz2zhZoezGe
	/XH1zr2OS1K6fA2h7Hcdxb8aq+ND542/Ioosp75lmJIZBNg3woThAofq14NjrPnUN2rDWQ4yStM
	p/YPzWaG+jLSK1tchtej9ow6dGpISEkot/uaJHSav3doPyvk/EDiejTKOqX6DzdwjlHHdeO9ZlJ
	f0wu/litEW8DPx0V7IF+80tWFPHLg82Q33CP93Wk44uLcoe5XTApALSqmIL/7dPSu6Rrfgs2MOd
	TenBJMwdlGQKO+wB/mgyCgEJj+IEO43K8dN5R9yUKPnLyH82+HCj27D6NrATmOkE/1PobR3tsuM
	sDYLqgfcQ7RzQb0UCdoD+0Mv57Q+l4CanHXhNTsubelSM9c2/klcfIvN9poVNW9rw0gD0qmbHN1
	bIJ5j4JxlXlVxfuswbDzrYaSZVpSrfOkCFau8Up9ptVRi66rQQhzWRkMW/wpaZl/viTAybs0RkQ
	f0DpqryzLJCSE1rb+BgOf5xvg==
X-Received: by 2002:a05:6102:8020:b0:728:f34d:f410 with SMTP id ada2fe7eead31-76c8d2fb2aemr735596137.7.1786533276449;
        Wed, 12 Aug 2026 04:14:36 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76caf0969d6sm485400137.2.2026.08.12.04.14.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:14:36 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963f63fe025so222295241.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 04:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqgbCCq28fMREoNFwr19a8TApRe0bsj6z8ZI0y9kNGcQrIvBn+6aCsW1CWDOLdreHh+WOHNBuiE4qg=@vger.kernel.org
X-Received: by 2002:a05:6102:5692:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76c8d1f94a9mr774665137.6.1786533275732; Wed, 12 Aug 2026
 04:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org> <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
 <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
In-Reply-To: <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
X-Gm-Features: AUfX_myBSrf5rDcsVRuaQc_or0Um_HrH3WBYGhc9bJh3otQ1_zgZw-LE1s1AUdw
Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 12 Aug 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 12:02, Geert Uytterhoeven wrote:
> > On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>>>> +  firmware:
> >>>>>>>>
> >>>>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>>>> generic "syscon" which is disallowed.
> >>>>>>>>
> >>>>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>>>
> >>>>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>>>> it is fine, but you can't.
> >>>>>
> >>>>> It provides a firmware API, which is not available until the firmware
> >>>>> provider is initialized.
> >>>>
> >>>> I don't know what "a firmware API" is. What does it provide? I know what
> >>>
> >>> It can provide lots of things (everything we are no longer allowed to
> >>> touch directly from Linux ;-)
> >>>
> >>>> a clock, GPIO, reset, interrupt, etc. provider is.
> >>>
> >>> A clock is an object you can access through the clock API.
> >>> (s/clock/.../ for the other cases).
> >>> Firmware is a service (virtual object) you can access through a
> >>> firmware API.
> >>>
> >>> In all cases, the consumer of the object or service needs to know
> >>> which object or service to use (there can be multiple).
> >>>
> >>> In all cases you cannot access the object or service until it is
> >>> available (initialized and registered), for which we have -EPROBE_DEFER,
> >>> and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> >>> firmware".
> >>>
> >>> Thanks for your understanding ;-)
> >>
> >> I think that's the difference here. Clock is not an object, but a signal
> >> on a wire or within IC coming from one device (provider) to another
> >> (consumer). Firmware is not a signal, not a wire, not anything which can
> >> be provided from one to another.
> >
> > Oh yes, it is a service provided by the secure world or a different
> > CPU core to the application core running Linux.
>
> Service is still not a resource. Not mentioning it is way too generic,
> because anything can be a service. We have entire services-based economies.

Do you have a suggestion?
This is just a phandle linking a firmware consumer to a(n optional)
firmware
provider.

What do you suggest?
Perhaps "scmi-parent" (cfr. "interrupt-parent", which also does
not point to the resources consumed, but to the provider of these
resources)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
