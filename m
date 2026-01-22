Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555EE39CB42
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099384; cv=none; b=UkCVOiqwejwJgqfHQnUMv4gcX/mk3R/hbKjY7sxtfdR+tw+SdV961bBnDej8VTJDHvLZE4Fkejc0+Lq2Iw8Ibd9w51kgqIqr1J3uuY/IBxgVxjpqSYUck2H6SLCb2FsFhD8fDscwOgmhIaUqBPZB9I31ocYLu/2UCRrpXHgLi3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099384; c=relaxed/simple;
	bh=KsGWBtdWAcOuouRcNgHYXyDSxWrjlkEILO0o03DoYzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyTfkHgRo2orc0nl1e+ZT/rhsqKeskf+4Trbu7XCwxYAvO+YCb7GC0k2h2VXvG2oBBMuro8TMulOblhY9iApyuf7yuEMP2rwAWJ4aTLO++Mga50glX0+kgwRNVYmLQRnOo1fb8ryaNzsRL+60zbmCtw9HT24AESwAqA9lzl1v7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5f52ed75c45so771510137.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 08:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099374; x=1769704174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1WfrbwhdDFpnMP8QjUxFisYdCm9ShlmwjTsosQ6yyM=;
        b=xRIrWknZvzF9Qif9e5iH4OQnL0/5d/hLNYvKCiyo83SQEse5NKgWB/Ajgh3yInmu89
         e9KHgXWVpxp44SOiidfBCIfC3kbSzpIo7MHx80/bIBweYVOdpJr/XzLHhfolrn0pJ64v
         ngcHFpAGWHlHVv+aUENetaZGesvRHWF63fO1b9QkikilO7+r6QnxDj9qgfpXg0NmLBZ7
         sbGaEw1NaBeFymNw0sFNzunVNf9kKVh6bQGDAbS6hYdfa35lJXW8U4UVJ+DawuNAUD19
         yNBObExdeDncrJhPdWZqfyiaxSQ5FrWei3NguzJGeD2z6cKTDA9Vdx4Dyg17AP5Wdw7m
         KK6A==
X-Forwarded-Encrypted: i=1; AJvYcCV/RxXR+RaqSrijtp8Vp/cBcbreST79DIaJfO13PtXlB4dAGb6hvSADlv50x1BOBnAIySqNxIuKI+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxywrigEwvGOrPs1SjT5fz9/eFfzbTUBkD/Bdr/smrgOjZIXiS9
	giw8xx5cGr6Csi3gxkzvY1Tm495pBWXLsWFPYfKGZCTSc1xECWChyfkwvJH/9asG
X-Gm-Gg: AZuq6aJjUwR1n1AKnvr61g6/hJ0Sf6lta46ghLvrWR7lQWgvrOZ/LGp2ujFCgF5y/Pi
	yJ5iPDtkXn0Hg94Ps7C8u3bDyvFZuU3lffH06wHns66pZ1yY8VyQvWSqxvXxSK0scfFGVOPB2b7
	/RDm7KHRF+4ofK+nwzDIwsAFDofLQkfSpgUrJ9ytG4XHy1B72/dcoocm19nYq5O4GsaPzVu4tt9
	zEtKTY/sQyP8oQJfZDj4p/IfoS+VJa8lUN6sMIVAJ0+f2MLMaCypwcpN13iHIDl9ojWOg9e1pXi
	z5imDmr1G2ZYLXBaVEy5yUxsu9dcmjoVJA64Cx0jc4a7Z3s/HmXkpP1sAmw4bxTCMxSw7/G+ofa
	PqRkatNnF3Z2EX0RduNkiAlWUPOmHKT8hWhpGhtOTT8vFgPLm50w4q05EIx1qK5lOHUbZp+Z4JJ
	2s7UK/wM0mppUR1RYvmTYNmGc77zWsMVvfk+51ZYGVHbiUV4Tx
X-Received: by 2002:a05:6102:3906:b0:5db:ca9e:b57d with SMTP id ada2fe7eead31-5f54bb6ae63mr92694137.19.1769099373879;
        Thu, 22 Jan 2026 08:29:33 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6925223sm5647771137.4.2026.01.22.08.29.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 08:29:33 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9480a1f77d5so622590241.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 08:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2PWyoIjbkMFpVBeWvqM9WAOkUt8Ws/E+U64DhPPrCmcz1MQ5BUMGzGRARbZRE3rwcNIap3V90UMc=@vger.kernel.org
X-Received: by 2002:a05:6102:c88:b0:5db:25b5:9b5e with SMTP id
 ada2fe7eead31-5f54bc6f96bmr75281137.22.1769099373234; Thu, 22 Jan 2026
 08:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 17:29:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
X-Gm-Features: AZwV_QhbFTwa7jTSNEghn2CR26nFA8B0X7gABEL6FIix2T_XBXqsyJgYshZo110
Message-ID: <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 22 Jan 2026 at 17:21, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: John Madieu
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Wed, 14 Jan 2026 at 16:36, John Madieu
> > > <john.madieu.xa@bp.renesas.com>
> > > wrote:
> > > > Some peripherals may be left enabled by the bootloader but should be
> > > > explicitly disabled by the kernel to ensure a known initial state.
> > > > This is particularly important for PCIe which requires proper
> > > > initialization sequencing.
> > > >
> > > > Add new macros DEF_MOD_INIT_OFF() to declare module clocks that
> > > > should be turned off during CPG probe if found in the opposite state.
> > > >
> > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > LGTM, so
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > However, I am still wondering if there are any possible bad side
> > > effects of disabling the PCIe clocks, e.g. when PCIe is in use
> > > (network card, SATA card, ...)?
> >
> > I'll test and let you know.
>
> I finally did the test, disabling the PCIe clocks while a WiFi module
> connected was performing pings. System got stuck, unusable until next
> reboot.
>
> Was that the kind of test you were expecting or did you have a specific
> scenario you can share.

Not really. I was thinking about a scenario where the bootloader would
configure and use the PCIe device, then transfer control to Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
