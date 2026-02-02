Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA807352FBD
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770020688; cv=none; b=ZyHXxFp5SA/Akp3LAOTbSc955Pvs/Zr2dAeKAsTTBKuLXpoy5+s+NgH1UF/Dr5ErvtbBkiM0KQ1hTxnFZTwiUBBs4VMU5M4ZQvhFxNjiOZP5exTxrTV/kd6WZwZKAXhE9mhxpbAYcUKGJUM7Gws9hjrZERF8QMj0p6v4sLBVEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770020688; c=relaxed/simple;
	bh=HJS32IFykbcLgbb0kjZg9u+QwAT/v4aHSGd9LhSBRks=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgJeopA/qn/3jtuC89yrgPL0i8ZLbeuTr6F3xmqIjLcOdmdbJEn8UL7/4T1R5/oqW34G+2vE4+T/NSdqstVtgrg7HhbbJxD0YrBRivYJAqAiVeHvNviY/+Kz+Yey9tJwJ9gP1QoFQ4cwAFp/3GxDIY9rk1oo6WLtgwS8QnAPtfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pnVL7QuH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pnVL7QuH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A85B71A2B9C;
	Mon,  2 Feb 2026 08:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA2860767;
	Mon,  2 Feb 2026 08:24:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BD09119A8891;
	Mon,  2 Feb 2026 09:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770020679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jchfY4fsZM0MoF7fQYORsG0RykmbRNUPoen59XFDfgg=;
	b=pnVL7QuHNcvAiWVAhyi3f5vfMze3iaHVa4cu6E1ax69zGX91T852COnHRMUS06pQHPXCvP
	DSfVpSnm/UI6HH+LYXk9DniV91PcABf6gvZAUtSvG5aDNyYpq9Jfp6FhTCEtD6Q+z2BiiH
	WftCkV+zLaPiOnqhKakAup7jNMN0YBldhjql+Nx2sqdOb7NNM1cF2WEcDu4ShnuYAF4h0K
	dVsM4FWJzZrp/op/ueOWxs/DCP2dl2RksNeuSMfwBRJYlBc/+wqR2Y5//3eaxC8WFbZu3f
	AW3jgn/r49sVvvOCuLT2E3VlKCg/uu0miUdzEFY4bKYemYg3e8dUeMfzQqjshw==
Date: Mon, 2 Feb 2026 09:24:36 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] clk: Add support for clock nexus dt bindings
Message-ID: <20260202092436.66558861@bootlin.com>
In-Reply-To: <20260129201003.288605-1-miquel.raynal@bootlin.com>
References: <20260129201003.288605-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Miquèl,

On Thu, 29 Jan 2026 21:10:03 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> 
> A nexus node is some kind of parent device abstracting the outer
> connexions. They are particularly useful for describing connectors-like
> interfaces but not only. Certain IP blocks will typically include inner
> blocks and distribute resources to them.
> 
> In the case of clocks, there is already the concept of clock controller,
> but this usually indicates some kind of control over the said clock,
> ie. gate or rate control. When there is none of this, an existing
> approach is to reference the upper clock, which is wrong from a hardware
> point of view.
> 
> Nexus nodes are already part of the device-tree specification and clocks
> are already mentioned:
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
> 
> Following the introductions of nexus nodes support for interrupts, gpios
> and pwms, here is the same logic applied again to the clk subsystem,
> just by transitioning from of_parse_phandle_with_args() to
> of_parse_phandle_with_args_map():
> 
> * Nexus OF support:
> bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
> 
> Expected Nexus properties supported:
> - clock-map: maps inner clocks to inlet clocks,
> - clock-map-mask: specifier cell(s) which will be remapped,
> - clock-map-pass-thru: specifier cell(s) not used for remapping,
>   forwarded as-is.
> 
> In my own usage I had to deal with controllers where clock-map-mask and
> clock-map-pass-thru were not relevant, but here is a made up example
> showing how all these properties could go together:
> 
> Example:
>     soc_clk: clock-controller {
>         #clock-cells = <2>;
>     };
> 
>     container: container {
>         #clock-cells = <2>;
>         clock-map = <0 0 &soc_clk 2 0>,
>                     <1 0 &soc_clk 6 0>;
>         clock-map-mask = <0xffffffff 0x0>;
>         clock-map-pass-thru = <0x0 0xffffffff>;
> 
>         child_device {
>             clocks = <&container 1 0>;
> 	    /* This is equivalent to <&soc_clk 6 0> */
>         };
>     };
> 
> The child device does not need to know about the outer implementation,
> and only knows about what the nexus provides. The nexus acts as a
> pass-through, with no extra control.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Looks good to me.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Hervé
