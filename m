Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101441;
	b=TnDDkTM6wRWutWnnEnNPMUr3RFi4RoguXY/uAhEmeUkY0vaJb5WUXdRVgyVhcDmBrOA5
	 clK3TxEZ7KJg4P/vLniBum242L304UlxmPPekbXuYBaU7hQQaYBdxPQuty08lMyg4PhDK
	 6CGdVpNR16PKVDXaQPg9z2YTbuEMynDVvppK2m4Db3ohQniCzNM/Ezc3YKtwMNONYcZ0e
	 Ik8rTn/Gm/Kbw3nJcKYG5sUuqajaPeEHnErfQL5eWKiPQcWmkw8RrnYMwbxciZJhgv5Lq
	 F0L8Fbd5flsWzp1xf5G+u9mHHA49KT0VQLdo5BGST4mE/7ACnLbkJ8Wl2EGy3EO1IsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101441;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent:
	 X-Last-TLS-Session-Version;
	bh=zMUOTf/upqWE8PmKUGyV8pTt0i4NWtIy6Bb7m2a+O3k=;
	b=JVFgAS8SHNwkpYMtCNztrq0kV8le9cyd5roJp05Wyi03bnFlN2/chQYCfuhheWsUWIoY
	 HzpubCwEa27kHEgWPtDX7DLXYZ+ddvzVEU7x316ziIkQBIk7Y4tEdJ58vBFXDgxxDe67i
	 5xQ65APQQg7mpP8oOmZ3Dp3zMgLE6O1+ZLDm80Yw1Y30s6CMCk1mFWx7HOwVxdhBdUBIH
	 NLer9io0e9UnOadq2BnMLPdh3xIeCB9BwvGwuLn11TPLaVn+MVYyumtNN43ARa91fkIVP
	 1vMkZw330XQ6jbxp7vGKWFLITB7skjXLJKvUBe51rrhRiVWIdiECtl9gC6qDLpDDwIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=lp7z7ZXU;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4C60A2604;
	Thu, 19 Nov 2026 15:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF4C60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=lp7z7ZXU
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 020F81483750;
	Thu, 19 Nov 2026 16:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795101445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zMUOTf/upqWE8PmKUGyV8pTt0i4NWtIy6Bb7m2a+O3k=;
	b=lp7z7ZXUBpEBkO652IcK2/GVHonbqF10yhwWr0qa0dlru3OSuGktfPpoJxyDUFrhZnxo9B
	0y3UZGGW6fhgF+w4uhec61zFDLdz1KMeh1yaTFZ2lKrnveB2L5a9ARYaXrThhddPlh6Mrb
	3gSsv8m9cqqq+Ojs9s9fJMqmmG7SwNs+1O3UbwS/VUv5cQLuD5E7qPahHld1hpSPU2d2Yx
	TfU/5K9lqKmvVW5LT3goXtFv8b58eIz0AYglMWZDR5b/QHc1fZde/xR7fxZjjsWGYnnN+p
	WBmQxL/PdVHhOyVqY7lAmZb0d+WnH+lwV39XtVgAqgizEo8y84oxx/fAeagQhg==
Date: Thu, 19 Nov 2026 16:17:16 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 15/16] ARM: dts: microchip: sam9x60_curiosity: Enable
 OTP Controller
Message-ID: <20261119-gaming-employed-e2f29d4756aa@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-16-ada@thorsis.com>
 <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
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
In-Reply-To: <1d45ab58-9e5a-4b9f-adc4-691a99f0e05e@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Claudiu,

Am Sun, Nov 15, 2026 at 04:27:35PM +0200 schrieb Claudiu Beznea:
> 
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > Allows to access the OTP memory and Product UID now.
> > 
> > Signed-off-by: Alexander Dahl<ada@thorsis.com>
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>

Well, in feedback to v4 sashiko suggested [1] it is not necessary to
enable the node in board dts, because the node is implicitly enabled
already in SoC dtsi.  Can confirm this from testing.  I would therefor
drop this patch for v5 of the series.  Or is it better to keep it to
make it explicit?

Greets
Alex

[1] https://lore.kernel.org/linux-devicetree/sashiko-outbox-199240@kernel.org/
