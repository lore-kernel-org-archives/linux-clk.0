Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264923;
	b=TMB97rIdDAyTXIYc/B+pon3LyB7U4Aua0EBzhhoyThfxB1CzOQ91DK6Yck1dqmQoiZnF
	 gwtJt4V5N03tnK4YgWgmn1QViEnjjTbk6J7kijR6tJm40s4JmRJonYKgTfLNSjhzJ50dv
	 GAybbjeOWIQuXQ4D+1+j17WdAeb1tExeAFN8GH6k8GSWRQML4bOkmz95WRn6Xahzw66sP
	 GNnFdbqogo4eH6HU8lCiuD2dMk3wqSDGhx5G4t+brTu/MmsDhOjeMj0rvkNw8JlPJ1Yil
	 sqr1Ng5KE6FlDuOcJhy5adaXs+yT3zPU7yzcGdWnBGkKQUOPloM9Qp42VfOtX/3K+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264923;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=;
	b=cqXCSkccNptu2Z0ykH5t17m1v0Ujf3R2egYd3uq637WA7k799Wl6ByIHKW+Ss/mJdvvJ
	 MQuA5M3m/JRU9Pij9wqz8FXD8NKV7QXKeuUKeVDJgAv0bb20k6yfQL0WBezsxLbkuyN3Q
	 JnFAAjHpjBC6lwB11TtyK+f8gIger5VHV4yAKOIGDDjC9sQMQd+iGjCbWKn7+576Ar1W2
	 z70PKqVg9QnIgjJSQFOVxHIIAu5qi3pLxmpuyuhp9NbhpZB0nHCBlB43YX4su6Kwe7ymn
	 gx55A2NF0cK/5Y75V0ck1zY3Fx5ip4scUQf/x1aCvpoqvbnCpz3xj+16NjRuuAJcEvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE5606A325
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 09:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FE5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso783915e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 02:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264922; x=1793869722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZlsJgsuUxLshKsbZ0JGTcZhiSxa4IqXzGzYrO+oYcmo=;
        b=uC7QxCtcHwTOspXxz7iC1Ed9ijK+ofeQT1zJv1OJad5EOL7Gp6cuLUz5aAJx5DNPM2
         Q+WFOn2WHim20p+KIxPJiVClL65vQAGCV6Hok3dcGFn48rqz1Nr5DXSBZvG8IBDbhn+c
         0cEo/V+0LQQfe44pQUGTM92B+h5Z2p4H69YojQy2w4R4sZphM3GG7ocYzhh2iXlLvoWu
         pw4eyiogkca69oj9I90L2oTiC5DLxvmUrK3/5zTD5EMPIKol03GVnmwbdUzZTQgcArgr
         K5vHtS2a6p1w/ywywwtktSNxkJLmcgxhgz25pRdJI6sgkRKYqCx1G3TrCPz5xLQleUXd
         Kdxg==
X-Forwarded-Encrypted: i=1; AKwUvBzb4KRB90bNnJgo7gNz7OfhuLHTP/IQnpuOUB7wj6MtuVI96Uq+2MJfu0tAr2EacIJLCYB/SQxKJHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK8uQfDoF3EQV8Bu0bt5B+n31MX+fhlaUm4vcSHXaJEWaYC0ae
	ck8iw5aSCyRmJ2P3lwVIae3vONLNETrA4SpGp1TqD5bxB5HZBo0vx2TL0RnRiJCT
X-Gm-Gg: AYBFou3h/zdtAFpQs8lpQVYG/vx+KCF9bMcmm/oBx3kldjonuVWXuXOqnO3KBZLV5/9
	ZOvzTCY6JLGuI9EfsvlznWt504xjmtTpsYKk8DnLlzal/Oj+jRn+w1jNgyVc6a061u9iWHg4X4v
	G04pvSnMkhoFC2/nxcMvZPbVbWsPQvUFiz3TnDOpGeJ71ntfq9l2+mDwWxZsL7EJajqZPK3k+sb
	J8+jpBhnCqTM3es2GKiOZpgmT7X4OtlfZ+drSON96MnVx2aAWZ7W0HxeArDsOy6NNvAq6cf+ac/
	b/gANUhsSY9v78ZyvFFuh+NcOsNDHNRVCGCqZDJdh1jv3bsdcnpXOWQZEpWxToQUlhi8AHBzoDQ
	q65Q88QnaqVo4njgMawwEnMcvkt+1B4HdDZmeRcLd7Sxa6zq1GBIKzBEnf62OB503xemZFsEs7U
	LX7QmXMVroKKLqIZtyt5EKrgEnQ9iaPjKLRYcj3topRh8TWpnvNZFXzaqo3nNFheq4Irzb75MSz
	yRhWptUryIzsv+9mF4evTHHgxG30Y/HcAJJCAKqzTpCOiDsqvWvHSKmZLe8fbqIldKveIEpjExn
	6qPecAI6IyGtaCPoN2LPBqaG+QZwpwvOeUYa74AgUS31uDzRzb2/0C9gO+A1tFZNXKOWo/WzQiP
	JMIOI34lqKvcG
X-Received: by 2002:a05:6122:62b1:b0:5df:682a:5d14 with SMTP id 71dfb90a1353d-5ec4cc0df9amr2657309e0c.4.1793264922025;
        Thu, 29 Oct 2026 02:08:42 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f9210c3sm4807434e0c.8.2026.10.29.02.08.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:41 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9906034086cso588411241.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 02:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJ5JopVcjsqWTMTQs7+hb9J8nrwrT5CDS/EdMkn96QMden2eahuUbGkxPrmKqpBpLKObvgMRLJhgo=@vger.kernel.org
X-Received: by 2002:a05:6102:8357:10b0:7cd:3218:362e with SMTP id
 ada2fe7eead31-7d03a5d6043mr1694600137.29.1793264920555; Thu, 29 Oct 2026
 02:08:40 -0700 (PDT)
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
 <20261028132937.GL15441@killaraus.ideasonboard.com> <CAMuHMdXycpJ6COtiAA-2oRRfHSfLK40n2cacStW15QJRN3EfLQ@mail.gmail.com>
 <20261028163940.GA2673734@killaraus.ideasonboard.com>
In-Reply-To: <20261028163940.GA2673734@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 10:08:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
X-Gm-Features: AclHuK9-UV4UizkhZLPxSnm2gBMXfy5lUX6jKfLRdtUVdpASkFCmlMNEyTp9nPg
Message-ID: <CAMuHMdVOT+DTZum525kmYfP+jzzPrxMnEeRAkapxOMGz4XMHBA@mail.gmail.com>
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

On Wed, 28 Oct 2026 at 17:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Oct 28, 2026 at 03:43:42PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 28 Oct 2026 at 14:29, Laurent Pinchart wrote:
> > > On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> > > > Add definitions for the clocks used by the PWM modules on R-Car X5H:
> > > >  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
> > > >  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> > > > Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > +++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
> > > > @@ -28,5 +28,8 @@
> > > >  #define R8A78000_CPG_SGD8_PERW_BUS           18
> > > >  #define R8A78000_CPG_SGD32_PERW_BUS          19
> > > >  #define R8A78000_CPG_S0D24_HSCN_OTHER                20
> > > > +#define R8A78000_CPG_SGASYNCD8_PERW_MAIN     21
> > > > +#define R8A78000_CPG_SGASYNCD16_PERW_MAIN    22
> > >
> > > Could you also add R8A78000_CPG_SGASYNCD4_PERW_MAIN and
> > > R8A78000_CPG_SGASYNCD32_PERW_MAIN for ordering consistency ? The
> > > dependency patch should then also include R8A78000_CPG_SGD4_PERW_BUS and
> > > R8A78000_CPG_SGD16_PERW_BUS, as well as
> > > R8A78000_CPG_S0D{1,2,4,8,12,16}_HSCN_OTHER.
> >
> > I could add them, but do you have any need to refer to them from DT?
> > So far I only added clocks that are listed as clock supplies of on-SoC
> > modules, e.g. R8A78000_CPG_SGASYNCD8_PERW_MAIN is supplied to the
> > Timer Unit (TMU)).
>
> So we have two conflicting goals here. One of them is to only add clocks
> that we have validated to exist (and ideally work as documented). The
> other is to keep renesas,r8a78000-cpg.h readable. We won't be able to
> satisfy them both fully.
>
> I think we previously discussed adding whole groups of dividers in one
> go, as some sort of middle-ground approach. Those are clocks that are

That is what did in this and the previous patch: we need
  - R8A78000_CPG_SGASYNCDn_PERW_MAIN for n=16, and added the one for
    n=8, too.
  - R8A78000_CPG_SCPBUSDn_SCP_MAIN for n=16, and added the ones for
    n=1,2,4,6,8,32, too.
  - R8A78000_CPG_S0Dn_PERE_MAIN for n=24, and added the ones for
    n=1,2,3,4,8, too.
  - R8A78000_CPG_SGDn_PERW_BUS for n=32, and added the ones for n=8,
    too.

I did not includes clocks with values for n that exist according to
the documentation, but are not used as suppliers for modules.
Of course the documentation may be incorrect or incomplete, and we may
need to add them later. As IDs are ABI and the list is append-only,
they must be added at the end, which could indeed lead to not all
clocks of the same group being located together.  From an ABI point
of view that is OK, but from a human-readability point of view it is
indeed suboptimal.

Before, we tended to add all clocks from the clock tables listed the
documentation upfront, ignoring clocks that are clearly internal-only.
Some of them turned out not to exist later.
Some new clocks had to be added when the documentation was updated.
Nothing new here, except that the list of clocks on R-Car X5H is an
order of magnitude longer.

Note that we don't use a linear array of clocks indexed by clock ID
in the R-Car X5H CPG driver (yet), so large holes of unused clocks do
not hurt (they do hurt in the SCMI driver ;-)

> not directly controllable. There's a risk of adding clocks that don't

FTR, the xDn clocks are not directly controllable; clocks like
R8A78000_CPG_MSO_SCP_MAIN are.  We know the latter exist, as they
are used.

> exist, or clocks that we won't need to reference from DT (because
> they're only used as parents of the MDLC-controlled module clock). Do

The direct parent of an MDLC-controlled module clock should be in DT.
Higher-up parents should not be needed iff the SCMI firmware exposed
and/or implements the proper clock hierarchy (which it does not at
the moment).  Still, they can be internal enum, starting after the last
DT clock, like we did in other R-Car clock drivers.

> you think that's an issue, could it cause ABI problems in the future ?

An ABI problem appears only when you refer in DT to a clock that does
not exist in hardware.  This should be caught by testing before the
DT user is added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
