Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71AA26F295;
	Wed,  3 Sep 2025 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892823; cv=none; b=k6Y4KzU5dsSv/eYcCzYaF/V6x/uSh3HgBVBTD+X4ShRtnIcbH/gJfaA95XHw1Ou51/kzPVoymbCpSA36ZCnwO6IZJsbIqCT/E24VemKNbRmKlvwh9qR5n6pHpnVNWy24Ad5SxjiVli2MirFdBL2ik3IxcP2MZiXfSutcYK5Sdxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892823; c=relaxed/simple;
	bh=+hyGf877IWWapmR76LJP4YO434xPnBDCXZM23K5QIpY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yev/qODrwdh4Ry0K+isqXpfY5Uiuu5ApsZwbSU4WzHHzAqV86zNp7oxQr7txQZAxUpuyMOy2TFRNjM7xAMXz2ZJKYFeV7daJcA/CTkCGr7lmZpUKgPoKkWZWUUmT7ewMwKByhCk18tAVdQjXKlJUAvrLXpUC/MAj0yr8f9vQdus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D7E1595;
	Wed,  3 Sep 2025 02:46:52 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749973F694;
	Wed,  3 Sep 2025 02:46:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 10:46:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20250903104644.7359a86d@donnerap>
In-Reply-To: <20250903-meticulous-didactic-degu-621fe0@kuoka>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-2-andre.przywara@arm.com>
	<20250903-meticulous-didactic-degu-621fe0@kuoka>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Sep 2025 10:08:33 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

Hi,

> On Wed, Sep 03, 2025 at 01:09:06AM +0100, Andre Przywara wrote:
> > There are four clock controllers in the A523 SoC, but only three are
> > described in the DT binding so far.
> > 
> > Add a description for the CPU CCU, which provides separate clocks for
> > the two CPU clusters and the DSU interconnect.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
> >  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> > index 1dbd92febc471..367d26800fd0d 100644
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
> > @@ -64,6 +65,30 @@ allOf:
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
> Filename based on compatible.
> 
> 
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
> > +#define CLK_CPU_DSU		8
> > +#define CLK_CPU_B		9  
> 
> I don't see the header being used by the driver and odd numbers (they
> should start from 0 or 1) suggest these are not bindings.

This header is included by the private header (at the end of patch 4/5).
The private header is then included by the driver.
Happy to change that, but that's the pattern used in all the other drivers.

Those numbers represent the publicly exposed clocks, the other clocks are
internal. Having gaps in those numbers is somewhat common in sunxi-ng
(check sun50i-h616-ccu.h). This large gap at the beginning here is mostly
due to the somewhat extreme design of this CCU, which requires quite some
helper clocks to get to the actual ones.
We could sort the identifiers to have the public clocks first, but
that would only be the case until we discover a missed clock (which seems
to happen from times to times). And again, that's the pattern used in the
sibling drivers, so I'd rather stay consistent here.

Cheers,
Andre

> Otherwise please explain in commit msg what exactly are you binding
> here.
> 
> Best regards,
> Krzysztof
> 

