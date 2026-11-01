Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564729;
	b=hL5NsnBLwwRKddb1vdsvnDe1uh1Ia6sF83MfZwntPTR97rZ3sureUDZPNhuDgtwU3vuh
	 A0PU3AJO1KKCQZldeRhBx0gWgwp4A0i/H0uxl9m6EhpRnoSXF03dEA2yz+i834/n3VoNj
	 N4Pbwn/i4BHwJ2GvZv129GtaEgP+SIMAZS4i8Cnjzd+Wg81xG+YP9B3QYBXFxcDt32Yy3
	 GCTJsnQQKQJccm3XSzai80iBGFMVpL7m1HmVluuXfNn6tpMUWLJD6E6dX4naBrwtCAmMa
	 phP1qltJk1c+85ELU+JfDI98HR5muA9bDl+q8GrNhPz6YBwbNzXKqJlekl1KmtvOC3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564729;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hCEp617jQD08gcsGuzNPxj0pZDjFgXb5JPdljCDEfxg=;
	b=yya+tvH2UIs47vbMQxPgeOz5RbDivDSq6Bx08AxIgJ6+72b2tQTbctFcE2v3uTzFJaAh
	 V5tsNQNhu1jV+R0sCAi3R4IPewy0eLPSxXo7WIyPcVGA5p+yGdCBloPeVPft1kXlgIp/9
	 SIcoN8sShb2zvzjA1lg0rZ1JRqNmXsJs85kPP8GjiqqOzpP+FEdt1CIrSzolZSGltmu1E
	 JIfu9npWsZsm5XMjlbHa6T94uJL4hgrb2/ImUBVqY9V0Q6SmCzzUaJtgmQ2r92ukJKvnl
	 lj16AyeVQfTwnNC03A0unIrrT5C7GFSc3Q3l1Urn/mI47h2j2hVZ6vrDZKP6B8L1klA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FWCl+TKL;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE2606A325
	for <linux-clk@vger.kernel.org>; Sun,  1 Nov 2026 20:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AE2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=FWCl+TKL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hCEp
	617jQD08gcsGuzNPxj0pZDjFgXb5JPdljCDEfxg=; b=FWCl+TKLp4Z61J6CB67M
	gFQTDB9/UXXUgn0V98cIpWxxpIHDvaPi/XldHBCMJ3N9yzKPh30HLEOQa+36Pd7q
	0haglR1fTxaewQJqmoZ9vR0qNCtw3c5eQ6wfLM/7AVfyo4GbiNRqh27Camk9NYuU
	LKSgNK9JmCiNHZxrldDF61H2214cAUyCGpw9YT/EWBQKQ0vKifzMqfX5P1EKYore
	kPARxwByg9V76spKWAxO+egrw9wp85atxHGGewXQuxfKeFWr96xEI7qzuruXRNV5
	JsEI4PlaZWpMtXyN9VkMm4M2d3eLaRjP8LKSLqrh4Fi9AnkBVpXlDyNc+AUNNa1T
	2A==
Received: (qmail 851632 invoked from network); 1 Nov 2026 21:25:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2026 21:25:15 +0100
X-UD-Smtp-Session: l3s3148p1@89W+0zxfLOfB0HFD
Date: Sun, 1 Nov 2026 22:25:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: i3c: renesas,i3c: Add RZ/G3L support
Message-ID: <auegK_2i5fp3Q34Y@shikoro>
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>
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
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-3-2e76b87209bb@renesas.com>

On Mon, Oct 26, 2026 at 11:35:46AM +0000, Diogo Ivo wrote:
> Add device tree binding support for I3C on the Renesas RZ/G3L
> (R9A08G046) SoC.
> 
> The I3C IP on the RZ/G3L is a subset of the one on the RZ/G3S, as the
> RZ/G3L has no HDR Exit Pattern detection interrupt. The resources are
> consumed by name (the tclk clock, the presetn and tresetn resets and
> seven of the named interrupts), all of which the RZ/G3L provides, so
> software can match and bind a RZ/G3L node through the RZ/G3S
> compatible. Add the RZ/G3L-specific "renesas,r9a08g046-i3c" compatible
> with a fallback to the RZ/G3S "renesas,r9a08g045-i3c" compatible.
> 
> The RZ/G3L is not compatible with the RZ/G3E, which has no input analog
> filters and supports high-speed mode (up to 3.4 Mbps).
> 
> Split the clock and interrupt constraints into separate if/else blocks
> so that RZ/G3L nodes inherit the 2-clock limit from the RZ/G3S fallback
> while being constrained to 16 interrupts alongside the RZ/G3E.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

