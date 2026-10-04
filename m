Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71873A3E73;
	Sun,  4 Oct 2026 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791154538; cv=none; b=WA55XglE8EnyGHRG0qEs1eyiqoTo4YcJoFu/l6a7VO9t+nBCr0dyVM2qBGCD+u3pJRB6jshYR/n1SP6HYezMThC8V0GMx2wK1+7aQT/Umx29Y2SaNzCtXIc/OnAE+IMoP92d6Hnps1mlSy/qYstt5xECtazfgnH78dc/3OGwyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791154538; c=relaxed/simple;
	bh=RDHP23Rz1AtuQ5UyF09iEJjPkzDkAng7PEW+9RHDvPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2/VN8oe+DmNdBDmvFMTxDXIGgNMJfPt7O9oNU7T6+vs6bGE9hgF6hF1B68Q3k8iFVqn8mMyoqsPdMy1L93eFO6oxHmmrQ/5NfV6ue2VbOaH/CYujsLfqolKU1YTqLcos1EfhXVTbv3lObrJS1eZyffB1Wjy7z+AvfOTjIeIM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JaTtcy6o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JaTtcy6o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72DDA152B;
	Sun,  4 Oct 2026 15:55:31 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 221903F763;
	Sun,  4 Oct 2026 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791154534; bh=RDHP23Rz1AtuQ5UyF09iEJjPkzDkAng7PEW+9RHDvPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JaTtcy6oNNVU5GcCEw5dj7YeY8yWboSgWEZODnBbbiKJSEl7l0oge7rFRLXTsCpYk
	 YmGZEzDhfwv4qczCg8+cwyzbuQHSmlQ3k73krrHLbi2ahyPjA9O+gPKvpSq72umIm2
	 oIDa2hTHT2elg/B9Zuvpz0Y/y02NjWaoII8vDTLE=
Date: Mon, 5 Oct 2026 00:50:36 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523
 CPU CCU clock controller
Message-ID: <20261005005036.7fd5e60e@ryzen.lan>
In-Reply-To: <20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
References: <20260925225112.14081-1-andre.przywara@arm.com>
	<20260925225112.14081-3-andre.przywara@arm.com>
	<20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 10:42:29 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi Krzysztof,

thanks for the review!

> On Sat, Sep 26, 2026 at 12:51:10AM +0200, Andre Przywara wrote:
> > There are four clock controllers in the A523 SoC, but only three are
> > described in the DT binding so far.
> > 
> > Add a description for the CPU CCU, which provides separate clocks for
> > the two CPU clusters and the DSU interconnect.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
> >  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
> >  2 files changed, 50 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > index 58be701a720ea..8d5481fb63ae8 100644
> > --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      enum:
> >        - allwinner,sun55i-a523-ccu
> > +      - allwinner,sun55i-a523-cpu-ccu
> >        - allwinner,sun55i-a523-mcu-ccu
> >        - allwinner,sun55i-a523-r-ccu
> >  
> > @@ -35,12 +36,23 @@ properties:
> >  
> >  required:
> >    - "#clock-cells"
> > -  - "#reset-cells"
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> >  
> > +if:
> 
> This goes to the allOf block.

OK.

> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: allwinner,sun55i-a523-cpu-ccu
> > +then:
> > +  properties:
> > +    "#reset-cells": false
> > +else:
> > +  required:
> > +    - "#reset-cells"
> > +
> >  allOf:
> >    - if:
> >        properties:
> > @@ -64,6 +76,30 @@ allOf:
> >              - const: iosc
> >              - const: losc-fanout
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - allwinner,sun55i-a523-cpu-ccu
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: High Frequency Oscillator (usually at 24MHz)
> > +            - description: Low Frequency Oscillator (usually at 32kHz)
> > +            - description: Internal Oscillator
> > +            - description: Peripherals PLL 0 (1200 MHz output)
> > +            - description: Peripherals PLL 0 (600 MHz output)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: hosc
> > +            - const: losc
> > +            - const: iosc
> > +            - const: pll-periph0-2x
> > +            - const: pll-periph0-600m
> > +
> >    - if:
> >        properties:
> >          compatible:
> > diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > new file mode 100644
> > index 0000000000000..042f2310f64de
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> 
> Filename should match compatible.

Is that a new requirement? We never did this for the Allwinner clock or
reset bindings, all headers are named like sun<x>i-<soc>-<name>-ccu.h.
And I think especially since we have sun55i-a523-mcu-ccu.h and
sun55i-a523-r-ccu.h, I think we should stay consistent, at least for
the existing SoCs.

> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +/*
> > + * Copyright 2025 Arm Ltd.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> > +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> > +
> > +#define CLK_CPU_L		7
> 
> Indices start from 0 or 1

This is also something very common for Allwinner clocks: the CCU has
clocks that are not exposed to the DT, because they are internal
clocks we need to model the clock tree. We number them logically,
and often the basic clocks are not exposed. See sun50i-a64-ccu.h,
sun50i-h616-ccu.h, sun8i-h3-ccu.h, to just name a few (there are many
more). The other clocks are named in the internal headers, in the
clock driver directory.

Cheers,
Andre

 
> 
> Best regards,
> Krzysztof
> 
> 

