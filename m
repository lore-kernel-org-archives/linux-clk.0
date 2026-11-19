Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099999;
	b=ZWqMc/SGxrTT10efGD1vMnN2b1vXiugx1qeQLqDD/M67hJZNf+Xeb1KMBjp982LJQNYe
	 28QRiNzupc00GBq0717A/J9izm0oegFrz3CbOKJaQ1Fx25rkgnwHieEzloJfRUr2c6q1v
	 1jBzn13YfY+G5MfrsFsjfqBTDqoQKlpGt8vFdMXsWXmc1N1zdIAhvu1NPydiPZJfA+Dqf
	 t2BNPHtNAITdTxAz3Ywdr2O+3c358l/l8xP8AjKJpRDeyBVMMR4D8fcq4Fhejb1jYQ4p2
	 FI4FrUTU7anCw32UB/pZ/eDLFad/eQpUn3xehGFnq6U0axwJTsiU3i2YrVCz/0V5NzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099999;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent:
	 X-Last-TLS-Session-Version;
	bh=k1TemjZqZzUtb911eFpFTlr9YVP5j33fp7w/pph9qY8=;
	b=P3kguNldSHJrLXMTvugdEKDpXpHrY/R+iu2NGYJh1d3xfG//Cnlgf1EnzQTsPnNn/aC6
	 B34/GnWchudzdkkQljz27HfXihBZiuy1w2wn1vyrNnzit071CZjBndN/D492WxvREamyo
	 8GEPDjnsvCrjvFY6cdGmw/4j5rfspmqJw7Rf0BF+wufhi9VNS4dsy3Ng7Wv9edDbs8gNP
	 rZmqbK8UTU/LbeGH28Khyfea9XlbEVYwbd3ngx6mVIt5hzm8yP4TKIQte5VlzQ5JsThgl
	 sp+ikLXH1N7pzWXzI/CwSmfkf6ZNs2GKaIfCoouabUixmdF05ZkleVJ6/zZCuL/sESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=jxPXT3Io;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAEA606A324;
	Thu, 19 Nov 2026 14:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAEA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=jxPXT3Io
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D3E01483022;
	Thu, 19 Nov 2026 15:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795100002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=k1TemjZqZzUtb911eFpFTlr9YVP5j33fp7w/pph9qY8=;
	b=jxPXT3IoGdPzIrANv/1IsOBMFwrG0fKNZ2kYGvul8pZ3lqJ1iIi1uUIwygxseWnUedBX5r
	pCuASsLWd44+piSPYRDtEFK984UK3DeXNSfymq4rpqEm0tc3uL+JP+VylYDKAEn5KHnYQ4
	iibgQuY3yubiQZRnJrbmRQCgQ+hKi4V/PZSAn0XcCo1TnFZCud0mK33uX+2zTW9iCZMbkO
	Gxmv1vu1GzJJPBRgJdi5jWo9hbj4YqyQo8x2XCCkv543CHe1Vi+i7st0+PncjoLhlgLUT7
	wYczqi14VFFD3TQqFiobiCvpmycHuLH/wZRcAdvOh3DsOjADi+kmiLroe9454A==
Date: Thu, 19 Nov 2026 15:53:12 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20261119-sixfold-tradition-ab9492ca6c2e@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
 <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
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
In-Reply-To: <5273baa7-aae5-4364-bb09-dccee581200b@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Claudiu,

Am Sun, Nov 15, 2026 at 04:34:30PM +0200 schrieb Claudiu Beznea:
> Hi, Alexander,
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > The main rc oscillator will be needed for the OTPC to work properly.
> > 
> > The new index introduced here was not used on the four affected SoC
> > clock drivers before.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v4:
> >      - change index for sama7g5 and sama7d65 after re-adding unused PLLs in patch 2
> >      v3:
> >      - adapt to different base changes, added lines are the same
> >      v2:
> >      - new patch, not present in v1
> > 
> >   include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
> >   include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
> >   include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
> >   include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
> >   4 files changed, 4 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > index 050e5e774b274..830e247ba2532 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X60_PMC_MCK		1
> >   #define SAM9X60_PMC_UPLLCK	2
> >   #define SAM9X60_PMC_MAIN	3
> > +#define SAM9X60_PMC_MAIN_RC	6
> >   #define SAM9X60_PMC_PLLACK	7
> >   #endif
> > diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > index 292c5873e101e..58d2a08116795 100644
> > --- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> > @@ -10,6 +10,7 @@
> >   #define SAM9X7_PMC_MCK		1
> >   #define SAM9X7_PMC_UPLLCK	2
> >   #define SAM9X7_PMC_MAIN		3
> > +#define SAM9X7_PMC_MAIN_RC	6
> >   #define SAM9X7_PMC_PLLACK	7
> >   #define SAM9X7_PMC_AUDIOPMCPLL	9
> >   #define SAM9X7_PMC_AUDIOIOPLL	10
> > diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > index 08581418b9115..17105a6bedb54 100644
> > --- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> > @@ -19,6 +19,7 @@
> >   #define SAMA7D65_PMC_AUDIOIOPLL		10
> >   #define SAMA7D65_PMC_ETHPLL		11
> >   #define SAMA7D65_PMC_MCK1		13
> > +#define SAMA7D65_PMC_MAIN_RC		14
> >   #define SAMA7D65_PMC_LVDSPLL		15
> >   #define SAMA7D65_PMC_MCK3		16
> >   #define SAMA7D65_PMC_MCK5		17
> > diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > index 27668634b0a2b..4a1c4af8ecc9a 100644
> > --- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > @@ -19,5 +19,6 @@
> >   #define SAMA7G5_PMC_AUDIOIOPLL	10
> >   #define SAMA7G5_PMC_ETHPLL	11
> >   #define SAMA7G5_PMC_MCK1	13
> > +#define SAMA7G5_PMC_MAIN_RC	14
> 
> I think we can use 12 instead. Correct me if I'm wrong. Otherwise, you
> should change also driver code to allocate space for this clock. See
> pmc_data_allocate() in drivers/clk/at91/sama7g5.c

The old definition had this (with PMC_MAIN = 3):

    #define PMC_CPU                 (PMC_MAIN + 9)

That's the 12 which is missing in the new list.  PMC_CPU was not used
in the current code base.  Personally I'm fine with using 12 here, but
I was not sure if this is again some value Microchip wants to keep for
some reason?

The allocation problem was found by sashiko on patch 5.  I already
fixed that in my working copy for v5 of the series, but will adapt, if
the value here is changed again.

Greets
Alex

