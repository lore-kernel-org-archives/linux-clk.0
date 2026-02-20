Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A153B31B123;
	Fri, 20 Feb 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581518; cv=none; b=WcyS5b9gMKOoXR4pbRVx9UnNSDAmCTSvpa1SF2SJmqyG/QP4FAz36IUs9CANNW8WWsEOQuqPTAs8ONbzgNpyJjK7h42XdxsMeE/UD+7shWCK7YhnwO+hFUi3U6U1mmGPaGQY2xZaujpObGZBsxgGNYoYrTDp6h/D4ZzCucBGhb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581518; c=relaxed/simple;
	bh=MhPtn4MKpm3CPTNUcCJBB31kbLXp1abnqxxpFQLYsWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPRhqHpGma+drfGekPg8MLcuo1dXQsr0ZGZhr1YmIGMnbKDthl3Eas3ExCVEZct/oi6JyNx1Ai7nwP+8rlfAXj4pe+/VJ2o+gFvUVEmXx7E/1yF7EQ6Msl/3LQLDZRAgoQfkXh3zofwzxLxORcmMLbLaP/DRS7P+pBY4jtMazuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=TQZtoTDw; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="TQZtoTDw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2A481483628;
	Fri, 20 Feb 2026 10:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1771581512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sAJ079v3EuGaMgXIGsa8tTVoFFB51aEPHIUaV4fqzFE=;
	b=TQZtoTDwMs37I4I8gIeJassjf9/U8KxmeaNXN06BKIdkR1LarQVTeOACFa6dVuv7HyImUU
	jpC1NWJ+7rWEnR4VtuWsnean0F3+u1oy/xgO9XdGgCd5FiRTV/2yJM5xVUnBBm06iChh23
	QKW4OTYaKL4lGYB5yCM+jPLMS3H1RwPgyygxZAP7Wlc0r+xKvl+n05v0CHdJIXO+hhcA0/
	HSNnMXv2VpPGcZNpQRdxKSkwp04wkWuey9qIf1mgZKSO2OyGFBvFPxzDm/pTCWnG0Ozun3
	BUKETuB47iUekQhoQEX97zQflz2lnUiWDfBxqm5hySPsG2ZC4buBAIzQAkpzCw==
Date: Fri, 20 Feb 2026 10:58:25 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20260220-bloomers-runny-e69ab1966b9c@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
 <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f406abde-c7d1-4ed6-b7dd-5336956bc795@tuxon.dev>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Claudiu,

Am Sat, Jan 31, 2026 at 05:47:05PM +0200 schrieb Claudiu Beznea:
> 
> 
> On 1/20/26 17:44, Alexander Dahl wrote:
> > The OTPC requires both the peripheral clock through PMC and the main RC
> > oscillator.  Seemed to work without explicitly enabling those clocks on
> > sama7g5 before, but did not on sam9x60.
> > 
> > Older datasheets were not clear and explicit about this, but recent are,
> > e.g. SAMA7G5 series datasheet (DS60001765B),
> > section 30.4.1 Power Management:
> > 
> > > The OTPC is clocked through the Power Management Controller (PMC).
> > > The user must power on the main RC oscillator and enable the
> > > peripheral clock of the OTPC prior to reading or writing the OTP
> > > memory.
> 
> As this was not mentioned in the previous datasheet versions, the current
> driver don't handle those clocks, and it probably worked as the clocks were
> enabled by bootloaders, I think the clocks should be marked as required and
> this patch to be propagated as a fix along with fixes on driver and device
> trees.

What do you mean by "clocks should be marked as required"?  Where?
How?  Is something more necessary, than already done here?

> I'll let DT binding maintainers for the final decision on this.
> 
> > 
> > Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> 
> Why this link here?

That was the original discussion and at the time the sama7g5 datasheet
mentioned a thing missing in the sam9x60 datasheet.  So that
discussion was the only reference for why this change is needed for
sam9x60.  Will drop the line in v4 then.

Greets
Alex

> 
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v3:
> >      - Removed clock-names (led to confusion, and not used by the driver anyways)
> >      - Removed redundant example
> >      v2:
> >      - new patch, not present in v1
> > 
> >   .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > index 9a7aaf64eef32..847dfb67c6b72 100644
> > --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> > @@ -29,6 +29,11 @@ properties:
> >     reg:
> >       maxItems: 1
> > +  clocks:
> > +    items:
> > +      - description: main rc oscillator
> > +      - description: otpc peripheral clock
> > +
> >   required:
> >     - compatible
> >     - reg
> > @@ -37,6 +42,8 @@ unevaluatedProperties: false
> >   examples:
> >     - |
> > +    #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
> >       #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
> >       otpc: efuse@e8c00000 {
> > @@ -44,6 +51,7 @@ examples:
> >           reg = <0xe8c00000 0xec>;
> >           #address-cells = <1>;
> >           #size-cells = <1>;
> > +        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
> >           temperature_calib: calib@1 {
> >               reg = <OTP_PKT(1) 76>;
> 
