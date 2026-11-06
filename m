Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962967;
	b=GrlohQM5umUcKeGFYWi86+P7jJMx4106fVRTCAacHOO5MlQL7bQmfC+Zhin0h8M2lPS4
	 B8cFGxInSiYxkxH9ob3Apdq6SreWBu2rog8lngCLXXL8yYtW0sQAUkhwzHIzRkS3PXhNk
	 6K7eMFsjXomQmRXzlOQTy9DQe0UkYSrz3iMLAEbhw6gG5wrbMUHgkMbtierOYQucTcf5Y
	 pZwckoRzx7WumtuEGxybLhTmRW8O1X/O2yEsn5o690mTIJAbORCFKbw3NGJQQ14PizTEp
	 bba4++a1pvK9Tha81gIILoB2jLq2sCQF5lsN6MvYY32U+m8EYjkXnY5WrR2JxPz/QoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962967;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent:
	 X-Last-TLS-Session-Version;
	bh=iCM2cycWCwaMm6hiUmHFooj8p+WDE9YQ8jpkczfNGY0=;
	b=Zgr6etSsZtX2UwCmH+YzWVTYRJsHPsAShZ1P/INdSmwwuNK9Nt+/QhuAaHj63+megDpa
	 8U4kfwSGi9TR1ejVowvXCiylA21fugLLo92F1AnoMyhesnfq/3pXUhATks+2NvYFFWm02
	 XE0/ihCWde9rTvRWN0pzwGgec0A/6AVxWbFKBJbYk2xV6jWkbYOeJDtlFQ2SOeL/pvUvP
	 7xKERULBcHoiZbcggNcTifMy3GokdMmAYiJcyR52GbN9llcxNMSVDbXjJAx7sMQQZwoo+
	 rCxDHEIn1eM4mu0Gyoq3UT9FH6PYevjp5bMnc7opHkjwH05h24NGp+fjO7MFJS6TPNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=A6GNpLVt;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB338606A326;
	Fri,  6 Nov 2026 11:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB338606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=A6GNpLVt
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5874148053E;
	Fri, 06 Nov 2026 12:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793962999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iCM2cycWCwaMm6hiUmHFooj8p+WDE9YQ8jpkczfNGY0=;
	b=A6GNpLVtsHeso5gjnzHSm1aqE0/DodHSklqFKj3InXBy6KlEULAYwPHatJbuAddtQa93uF
	AZFPqP/uvqt+qMBpd+2F4QqG8ovRyO63QJrGAsgTomrOITHHZLcO9F0KUrrVwjpEJAYkmZ
	/BiwpQKbN2tZc0hbVc7ylpryvVD2DbHVodmizuFGsL6bQdGU2uGawgOLqJIwOJabdbIkm6
	mToHBkcFTRlZH221UqgLDOllYDIUy90UHj/w63IrI5Nu2+xlrDJRiaRvobqyNsaQIeWdu8
	cpGriQdE5PVr4vHPBZMC30nNREGJVVjpDRSw+BzGZB263VXKpxPrIdVRaIcqcw==
Date: Fri, 6 Nov 2026 12:02:35 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261106-oil-swear-a9e81127bc25@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
 <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof,

Am Fri, Nov 06, 2026 at 11:57:53AM +0100 schrieb Krzysztof Kozlowski:
> On Thu, Nov 05, 2026 at 12:06:38PM +0100, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for some of the old PMC definitions.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v4:
> >     - "re-added" some definitions present in hardware but not used in dt
> >     - reword header comment (at91 -> Microchip) for newer SoCs
> >     - PMC_UTMI was renamed where appropriate according to datasheets
> >     
> >     v3:
> >     - full splitup for all at91 family SoCs instead of just a few
> >     
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
> >  .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
> >  .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
> >  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
> >  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
> >  .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
> >  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
> 
> I miss the "split" part. You only added defines, shouldn't you remove
> them from other binding?

This is done later in the series in
[PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC definitions.

Greets
Alex

