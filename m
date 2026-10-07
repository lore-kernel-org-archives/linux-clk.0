Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAC45FFDB
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366198; cv=none; b=OMEz2jdhAQ5ElD1YdIIcLCWCyTdtnXfiGjRWUvil7kVBQISQ/XrYa0zGs94xIgN4IvvVThngkTV9coQrBtgGicxyJdlzbEP5j5f+Y+OSfpZ48VhE2PM/ziEkiK4OH2ytORms/xJCWTSA/hDrnL2QKMY9r4YqDtRi4CdrUquvq30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366198; c=relaxed/simple;
	bh=kiFe84dyPezmzLEDiTg3RDtzBXfiX84mT6KO+DQZ1UA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNQAcfQpDl+YQzzVCSPhyiM5TB/tAaZ3XBsX3/BlAxV5k0Gtx4XNK1bkZvzWIzuTmPU6sDhP9qfqvW6GOzVYgydeMrZfskOUbi+NRb2/KkY0AebeTCyYd4q4Y2KyRp9wVBBj3Whyivt4slI+lTJTZuFlImKiUfpPEdRLm6RtmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6N7f0BF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6N7f0BF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2221073f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791366187; x=1791970987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcB2VgVQ6zTdQxaTfRiH7KXquW4kD4zCj2MYVMkIYy4=;
        b=W6N7f0BFwpPQV8Yavt+IkpBMy8GlnhZK5n4C5LVcI9wOHe3FMg7IqpcUgnTBXC6Ai4
         UP56WNzYo7pplgJxBFHmuYReUj4SE5LqngcoMKYSqzG1G16T+5hL5lvAJ4UvpovGO5vf
         221rnK2eR7g8dS9A6PJcfuUJKiCNsu/qzVrQpHzb2+LwJfBcvvWEA6XskoTA+4nuMCyd
         p82n52LMDVv0/ESz6IqzX4O+l4DwIW559z7jrn4apF0fEYcZG1GajsJWUMVM18thBlwi
         E781O1NWskrxTXM2SJ2t4myUAIDSWhGyJmwDnm8Z62JcgpbtwwCVt4e5WJMCCuthUXFz
         /Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366187; x=1791970987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcB2VgVQ6zTdQxaTfRiH7KXquW4kD4zCj2MYVMkIYy4=;
        b=lbBmAd0lsgc5N0+Vr4gZnVNanQSQ+rwkKL0SilyNh+jAQ/WBuFnjP2R/T+i09nZdzh
         RrMf9lPuoIg5fQg9euuCCs+QgjuXRf2/GxhkEcig4humqV7e42dpsnEVgsF64zrcdWvW
         BDt+lpFmD8vA2CQf++3GSIV5wYpIgD/7LGmppYed/h2D92ZS01uS/GLJYgm+O9w1QpxY
         ZuxR+1h7aqPUDDbhCiqJjCXUK5LikAvOusXsTaMhnyi4CrZMESV0byBVd9cSqsbHWQ5H
         ftlUiE7A1fGASlmQ/0fvlP6GysekRDnjRkGetOjA1+bSmSiebnQ7iwBjbq1M/8KBiTMq
         KR0g==
X-Forwarded-Encrypted: i=1; AKwUvBx+m4JUpgAdavoyBO2+Y2f4tZyWtUrjyWHjgDPZClzyI1zl2oTQan1zREowLHzPwPdGH8deDWTkwBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY/3vle2Sh+93m9kizY7P8+1VDCsPfdav7yV/OCq5y7mm/hKOF
	2+SWi+Ll2C3Cai+PDqSW2N8Ts2Vb1Aeb80x+HhRdCSXpxL1qszzKcD4n
X-Gm-Gg: AYBFou1OrCt9Q+lA7+ABeEog6OBKge8qN2xKYkS7OG485QBmOVOs5wObYDLKA7981mz
	2TgmqRhoCHvS5V6gYrsoosxQYRE1fH8y4vZI73NKZDvkVEG+nOHTgdsAXtRAfFngNGJMLbdBDwW
	3OFCy2lcQ450SKzv+xnYsovFdtvXb1nXaqu/ISiPmJhy4GOICAuUeG1hj38uwspE1HbZTLrGmZ2
	XYkio10m95gwnk6B1WxbWH07YcgDeA/4wWGzpgwgIpSTsPvNCHlFA56qc7NTMcoEjL8rtQjClkR
	JE9D6nBY4qdDHXx1suQc5q498kLRZpveH5weVg9ABahO64yjOoIP/8rAuNrh0xayAV8Nqdop8TC
	bCaBypIomO8PX7c/G80eKZsqgwxgtzZi0Jk8egf54iMCvELWu0Q2quzmB/L8ifk4hCbKweEdQZJ
	cGrYnbxzeXOYaxMVXdIzKjFQ8AusMLRYFLfoecfQ7JnFQTb+xjXWdfkcq7g4I8MHCa1vSLe8KtI
	IcQl/09v3WAhpM42pGwFd8pfueIsoSXJmv8d21xANp7qYJfKRWQ1NQEnC/UVSGfmqckyT8v+ow9
X-Received: by 2002:a05:6000:2886:b0:48b:fdd:fbe4 with SMTP id ffacd0b85a97d-48c72889c8fmr2930515f8f.21.1791366186990;
        Wed, 07 Oct 2026 02:43:06 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2e2dcsm5072334f8f.42.2026.10.07.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:43:06 -0700 (PDT)
Message-ID: <6ac6142a.fadcb60d.16e2b1.f951@mx.google.com>
X-Google-Original-Message-ID: <asYUJuNkLNMrz0BW@Ansuel-XPS.>
Date: Wed, 7 Oct 2026 11:43:02 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-2-ansuelsmth@gmail.com>
 <20260827-expert-ruby-grasshopper-954aa2@quoll>
 <6a9e82dc.8fb0a6ce.a0d71.1d0a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a9e82dc.8fb0a6ce.a0d71.1d0a@mx.google.com>

On Mon, Sep 07, 2026 at 11:24:41AM +0200, Christian Marangi wrote:
> On Thu, Aug 27, 2026 at 11:52:13AM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Aug 20, 2026 at 12:14:54AM +0200, Christian Marangi wrote:
> > > Document support for Airoha AN7583 clock. This is based on the EN7523
> > > clock schema with the new requirement of the "airoha,chip-scu".
> > > 
> > > Add additional binding for additional clock and reset lines.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/clock/airoha,en7523-scu.yaml     | 20 ++++++
> > >  include/dt-bindings/clock/en7523-clk.h        |  3 +
> > >  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
> > >  3 files changed, 88 insertions(+)
> > >  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > index eb24a5687639..edecc635807b 100644
> > > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > > @@ -30,6 +30,7 @@ properties:
> > >    compatible:
> > >      items:
> > >        - enum:
> > > +          - airoha,an7583-scu
> > >            - airoha,en7523-scu
> > >            - airoha,en7581-scu
> > >            - econet,en751221-scu
> > > @@ -50,12 +51,30 @@ properties:
> > >      description: ID of the controller reset line
> > >      const: 1
> > >  
> > > +  airoha,chip-scu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to the Chip SCU providing the registers required
> > > +      for configuring the PCIe related clocks and resets.
> > 
> > This is the clock provider. Clock provider should not be accessing
> > registers of other device to configure its clocks. Either you
> > misrepresented clock hierarchy or devices.
> > 
> > I did search for DTS to try to understand the big pictuer - nothing, no
> > results, no upstream submission to Linux kernel.
> >
> 
> Hi, you can use en7581 as an example as the implementation is exactly the
> same register wise.
> 
> The register for clock and reset for normal system and PCIe are scattered
> between the "SCU" and "chip SCU" registers (they are 2 different register
> block, the name is taken from the programming guide)
> 
> - Chip SCU provide register access to some clk gate and clk rate
> - SCU provide register for reset, PCIe clock, other clock gate and PHY
>   SERDES.
> 
> Upcoming and current airoha clock driver all follow this pattern of
> declaring one of the 2 register and use a sysconf for the other as the 2
> register block are tighlty coupled.
> 
> There was a similar phandle in another series adding support for pinctrl
> for econet EN7528.
> 
> This phandle is not present for en7581 just because it's hidden by a direct
> call to the syscon with syscon_regmap_lookup_by_compatible API.
> 
> With AN7583 I'm trying to fix this by making it more explicit.
> 
> Does this makes the situation more clear? 
> 

Hi, I would like to send a new revision of this since the clock driver
needs to be rebased.

Any hint on this, is the syscon phandle OK after the above explainations?

-- 
	Ansuel
