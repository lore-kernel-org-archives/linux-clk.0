Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198637;
	b=aK5Xf+8GOIsYa+ovFuFpXSqIsb+xJO+ez9oHZeTW+2FMwkAvhal+Xagb6JGlPhR7Ar89
	 Hc/atLmt8TxCCJFP51zolDsrDO7mTPLrE/9B1jwF9QNqAN6BNbvMZIhrodCiFHRred+pq
	 5WidS9XUnuwAdt6rFUyhR9BP5wexUpD66P+GRwQo4g4PbflYUZxb2w3jtnAsSMUEh8Buk
	 vtwY3SS/aMl02aq0ozzxvGMS0xr8vUfI1a/eknEtLcO+IKU7DnqAQqvGRMcb1aD1iH4sK
	 JulfIiXZX+UIShWtQbDxKkA0Tn5Z2bK0oZQeII2l1kS47BAN8xdTeM0xUZ9tv4fDesg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198637;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
	b=4+OkRj2fXzOGL4YYdD0JldVErO+pxUDg71MiyDXBv5U9rnlouFsrEGdK+OzXifkyI5z8
	 VlASY7vFz8PUlSk8cstneO6Py+dmkEOl1WCfQ6GsicNAyEDtEKwvCZvQdhN6tPY+x/Z8D
	 vYT2OvldRl9UvpU/A+dkyhSE1zKBdZQtFTlzlOEZkakI7KsEWOBswt/GUYBZMSZpFqv8D
	 342K1SLRsY2fU0FqWtZwfEz9lA4+4NMmuqewTgeNteK2sfSfx4nAC0e08e6e8/S2SuqCi
	 0Eu/WV5B+daFfXJDHYNOzS0gtp6ulnQZ+bWAz87fA43LfhfSBkMMb+7bZVMNvwCfcjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E86606A31D
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 14:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E86606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c03744ef27so315604137.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198636; x=1793803436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gvbpjObWezyuObEIw7vWCioNUAtttLKw08sbbnbJ9pw=;
        b=SGPVv/UXxqyQ69yswuXoPLcIGCrYZQrZ+G69IeyhLadocgcfjFZQqQdEWPbZ25Nxc1
         0OK0m9Rhu8XnWcVYzhr4usP9PWM2NI+ErgLtKfVfMbRJp6T099k84C/LlSrcL+OtAVWv
         Sb/uD3vsDvHzwuUAKuhv0rJqmJqvrYUHoIe5X/FA4+5Tqr89cea0peRN1Hymu6se3ZDB
         wG1SzYEUt+3KHvSvt1DB6Z4GHlvY3BdH0ROsuBhl5QTseuJo4opzydlSYsn9ZOOT7Auf
         +ne6i5SkdEtlEYGUgRhji4GCuRL+IGfmS72Dsaav+faPdz6HQnfDceTNf4y25xAZyfXx
         PjFw==
X-Forwarded-Encrypted: i=1; AKwUvBwaSwMMOp5Nii+MobouENaKXw2yWFfyqOpwHBsfGBUab653o4DZnVf/PVPUZiOU8lfzHsbhuhk9x78=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEtvEdXXp9sJ54n9SkZQhR/ZH+8YRbQmFuPHluHxY1Wslr5ql7
	JLFADyVtbS1lGh8peuZQv66FRngjLkzogsZktBeydhOjNcLS4wM/939jhCEDKIDA
X-Gm-Gg: AYBFou1kIYDT5CQLbT5KFB46WSWhh2xm0pKglb83aAYBFRmnZUdwnc2J8AwUYJTWDnB
	LaqaYnEXqdptc7FH/92fb93HPgR3jXA0FznVGsx91F/ZaiWm0dyIHU1Em8eJqcoizgAnjTbPkht
	CQ/IdNkV3aFi6uiaD9622M/gg1ycN9M9V1GiZ6ITF9TWFg+I38vPnjh4gxEfHjOCHWBPTyu0iGF
	PZeopTLhgqNtFY3dLFMNRp+IR7/63x79j9d8rJ5kABvOSob6yPGFiUrnHRAKaoBO2gsEg9WKjKV
	HX57XQL7ItQEJt+XWpTR4ubQX7fKgHMcJDWwaEShT/6jkGLLfU8sV6ULD7ZfWcgCtFaqIYShRKi
	ug6FP/SMw6YmQRMOlk8ZvPO2DUDP6kA+DnSkEu+h2njINkLQyH8h62M7Oc0ednrrHLMNCn0Q6l+
	jHwB1iqF0tR0YB3kYbD0kf0FyLA9SwGH6MMO38OY/E406ErK5qkB4oxTOPYYde/6fh6ATNlWZgk
	09AFfoQKquVbBsWeYrpiU4HNiLNu8i9PoIf/UTxQn9jtNovJQiVYD0jctl9RSklmpn7rx86eulQ
	snfBngQs2UobEKgpX+X1zABtu+LtCPh8WBAi96wbrrOfVbDiZjIhI8MpMzVqUw6pHlE=
X-Received: by 2002:a05:6102:5492:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7d03a50d052mr971662137.11.1793198635838;
        Wed, 28 Oct 2026 07:43:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125931983sm6091815241.2.2026.10.28.07.43.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:43:54 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc81984fceso325649137.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxb/jEwhSln7LHHec+ABgYZdj/5iFjLtCJzmJ2SBDoCCULxmn73WM4ffv9vwwp/BjllucBgkkYwOSk=@vger.kernel.org
X-Received: by 2002:a05:6102:6f07:b0:7c3:1d7:f234 with SMTP id
 ada2fe7eead31-7d03a294a6dmr903761137.2.1793198633657; Wed, 28 Oct 2026
 07:43:53 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793026273.git.geert+renesas@glider.be> <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
 <20261028132937.GL15441@killaraus.ideasonboard.com>
In-Reply-To: <20261028132937.GL15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Oct 2026 15:43:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
X-Gm-Features: AclHuK8gWV6NxtQKAEUrEm-e_rgKbr7fNh5k6QXPge3G8NVSao5SAOErcvAPoSI
Message-ID: <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM clocks
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > @@ -28,5 +28,8 @@
> >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
>
> Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> R8A78000_CPG_SGD16_PERW_BUS, as well as
> R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.

I could add them, but do you have any need to refer to them from DT?
So far I only added clocks that are listed as clock supplies of on-SoC
modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
Timer Unit (TMU)).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
