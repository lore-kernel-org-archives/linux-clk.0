Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F7F33D6EA
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226910; cv=none; b=hKGKjYx1Lx6n2s1/LPi9ma4CUgEFDWgZp82JXOWd1uz0xYZDXiMyOiAYXXW7ahKLSgbr2W7lomiq54D1jUBGJG0tbibBuuYK/vwJmTSg+PZoJ9+zqPCK8BKVoBBrcJqsw8NnFOr/8hZwFzqHw1c+wBqrwovsBc65hhK3dBAtKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226910; c=relaxed/simple;
	bh=pk3moMq1FKy0fl1HwB0CJkZy44+CQqnu0oNoBum5fLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVz4+oAGbNoDfcSRyyffmKKlfiORm0FUL2l9s2bKafcmFpEtI6/YwBLAZxbOSCjSx/od9zXPq9pNFVOWAfwd1woZBP9msYr9w4zzx3gL8AN7RNw08AO9g0cMUGCRmoAWJlgowVqYW6y0GJZMb8Ai6acGr6dC3c5H49O8hOXmZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba4a1a0325so11856255ad.0
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 00:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226908; x=1778831708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FZfZV6lWdmpc+MfoLFhi38NvgPEcuF56xNXrAqxNBA=;
        b=CKo6d5uVgAkPNr4U1mz9S6tf+lELaVnnCLYXxw4NTLYCrUCu9XzFX4rJZDdW32xUgq
         fFu/4VJngTQu5UFNB9Zbz4RYqJmNhqlGKLEm0sWtojnySa1zxhubxOD9TIK8i8YLfb+E
         jbN7vBscyx7hC+hYbdoYcNYFOieDIyZL9ZDiCz6uKu4BIGx0aiANAVdzqU61eT8g6Tyv
         Rn5KH7UcNoBTVakKOZq3NkIq8jw1sXzTro8/lDPWIM2BwUm0WcksQ3GRvHMqIwprxtNV
         n6ZmZ8BzJTSwmaa2/6mr9ZYkJj46YfFwCeFi38wMDenmQ7IRuX7Jc0XiNRJl9MTv2WNP
         iegA==
X-Forwarded-Encrypted: i=1; AFNElJ9pflKZLlp6iIvAzrrP8IdUdBx3XjUarAGdP7ulNvCNyIaJkJYYLNAtZ/X9+saUEtTqyZpXLoXpL28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCuB2IubEZMPXdKCDrmgvRszZBqK9YRZQXTgoFAhAICoP8WGge
	B7A+VdJqwk6YpQkWHYJN7i5p5A3Q0JZln0RukrOAvqydwKEruqs4HNtW5TJt3rf/9/8=
X-Gm-Gg: Acq92OHhHfRIU7OwZr3uTREpXRXMdiPlzmv65R6I/kZ3BxqZX6R/oZjiCqnvhaF8w57
	Pf809C48CSr8d+N7I9gIJgqd/vDCbO7LjAFLAJBwaHT7d82rw+b8X9qQKxPHej3bYM1M/2fImxJ
	o6DxDLFVm96XPhjKz9cnHuZ50/jXA1rxFdHwkHzzuDT5p2TuWTmTnR8/4XOGhOE0ig47XoRwR21
	5b1BPCY9/KdkbAg1mPC57+UB97H9rVVFnJSHUzkigK+yV2f0/OTb7BlaGg7k7JVGKadUAwXHPpr
	ftzUYww2P+9kOT2IzOvB+Jt7z6+txQyZ2++78nlino0o+vWTW2amwLjxnG+tIvb4XJGpUCa03tl
	ZEPpPPPzU82y8SqjINdacmnTJ7Z9J4qnEbUo8vWPJ8uFS7Mz8ucodjk7031p1vGxVgJjUxIm9h3
	mIfgNWQEZKvwVmRT3p8wtk3RvMtDffVlkKwFgtcR8/QR5S73GEX0io8tYpXpyfPuq2
X-Received: by 2002:a17:903:bc8:b0:2ba:839e:15dc with SMTP id d9443c01a7336-2ba839e1b5cmr74358805ad.17.1778226908223;
        Fri, 08 May 2026 00:55:08 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f1bsm12662705ad.37.2026.05.08.00.55.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:55:07 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c796163fac5so1157351a12.1
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 00:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/I+RBu3xXeZY5TWwVrXgirOiw1nMfgyZHGc0OrK5ZV0BgqT7xQm51Gjf+Kpm04+WsN2/gxT1OQV0M=@vger.kernel.org
X-Received: by 2002:a05:6102:8499:10b0:631:28c1:155c with SMTP id
 ada2fe7eead31-63128c11e98mr2184841137.7.1778226445710; Fri, 08 May 2026
 00:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
In-Reply-To: <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 09:47:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
X-Gm-Features: AVHnY4Jrjqq6M3ZL6uO54VIlKGFRT3YU3BSC7jZzhSUGnVnDGxRcagGSeBzeNKo
Message-ID: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
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

Hi Marek,

On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> > +  '#power-domain-cells':
> > +    description: |
> > +      - The first power domain specifier cell must be either the Module
> > +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> > +        datasheet, or a Power Domain number, as defined in
> > +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> > +      - The second power domain specifier cell must be the module number
> > +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> > +        in the high nibble, and the Module Reset Destination bitfield index in
> > +        the low nibble.
> > +    const: 2
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the module number (0x00-0xff).
> > +    const: 1
> Just one more question -- the power-domain-cells second cell and
> reset-cells are always going to be identical values, correct ? If so, it

Yes they are.

> would be nice to keep the description: aligned, and maybe even indicate
> in the description that those two values have to be the same.

I thought that was obvious (but apparently it is not)? The descriptions
are identical, except for the latter not explaining again what a module
number is composed of...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
