Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44043361963;
	Mon, 10 Aug 2026 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380845; cv=none; b=tkEsKd8naqxMxOXDEiLbxfCLDR4ucIgCD/XMOa+LVx3XJZwOC9R14SAqs0e8l8Vex0Zcnq7zWTT1lF14osHI0PnBMJDORvan327K4HzKEc7WAR87EHp15pZh4eiRJ8v3JTbhqIP1gB1bQQ6HndLyb+h0rA9tYsI8kaSHlVbx3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380845; c=relaxed/simple;
	bh=RGuMXteJ+0S886Hhj5jqmAUd0iH3k40JJ5/CGL+peXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LR5EDSDFDbJfLojryLWNX8ct3M+H6m6LL3zE6b4JQeCWhSPGOzDzJdCecbDey2mToTb9S5hVkF0AQGUdCSnxLvgKke7JjDgOKXEp1pZamy8MJ9WcFnOqVUM8GD4pP06OE934sRfLXjiodg2Z3RkGI6B1X/3PnJcQplcqvzQymQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A91WYc6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A91WYc6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD591F000E9;
	Mon, 10 Aug 2026 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380844;
	bh=edFOAhRzrYrPLPA3IaE3fo5UzDqS2qZA6yseavDYBD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A91WYc6kMPaAly4SOSefNxtfsrOjRcqmCfPmShNnGOQ0jjfUDkCPhrtT43HvWAURA
	 bfNYOz7qQ2rosgEIA/DMbFt2RSxmSDpagEM8tj/iE7b0mPNT6bkbeuNvmY4qJE+5Xz
	 UQmJCtGB1Oz2UejsVvzme+9AHLswrAxRbhFwM5d6i/xWWoFB5GFuqcBskfOXYq6JFB
	 YQ4M1lJMceAGgCY+Wyxp68C8sVCU6Iguzm/vWUQBemX7ZFxtBh93rm/Kb1iD/yLNv2
	 m1UI76mYZuB2wBSnenGXS5WO79DQkxhy6VOO9SUVZ7utknfZa6dOG7CtQmf8SlD98Y
	 0Hd8f9k/fXMuA==
Date: Mon, 10 Aug 2026 11:54:03 -0500
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260810165403.GA2145873-robh@kernel.org>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810164000.GA1846263-robh@kernel.org>

On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
> On Sun, Jul 26, 2026 at 05:40:24PM +0000, Vyacheslav Yurkov wrote:
> > Some hardware designs provide fixed-frequency clocks generated outside
> > software control, such as by FPGA-resident PLLs. While the clock rate is
> > fixed, a separate GPIO signal indicates whether the clock source is
> > locked and producing a valid output.
> > 
> > Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
> > clock whose availability depends on one or more GPIO lock-status
> > signals.
> > 
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> 
> I think you can drop this. Just update your author email.
> 
> > Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > ---
> >  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 59 ++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> > new file mode 100644
> > index 000000000000..4d17889c51ad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO Locked Fixed Clock
> > +
> > +maintainers:
> > +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-locked-fixed-clock
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    description: Input clocks whose validity is monitored by this provider.
> > +
> > +  clock-output-names:
> > +    description: Names of the clock provided by this controller.
> > +    maxItems: 1
> > +
> > +  locked-gpios:
> > +    description: |
> 
> Don't need '|' if no formatting.
> 
> > +      GPIOs to check the lock state.
> > +    minItems: 1
> > +    maxItems: 32
> 
> Please explain better how multiple GPIOs work? Why would you ever have 
> more than 1 lock signal per clock? And you can only have 1 clock given 
> #clock-cells==0.
> 
> Do you have an immediate need for more than 1? If not, I'd drop 
> support for it for now.

I missed that this is N input clocks and 1 output clock. But that leads 
to other questions. You've implemented a clock mux then? I still don't 
understand for what h/w that makes sense. Which input clock is selected? 
The locked one?

Rob
