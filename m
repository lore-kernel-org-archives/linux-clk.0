Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F641F366;
	Tue, 28 Jul 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233600; cv=none; b=ZCADDjWjGpU4RKSsJC3oDdbtbYu1V7Ud9m09jbn/ltK23jXrZ6sWxliqFamKex5ckYLFGaMs/EosrFPBSqCoRX53BjgDbwG6Ulfn+G2N4rdCLVvuXQfhYqkxrH0XkJfQL0i4S3XgwPzgTkmnNpGDBni6uho3nqNA0s1fuTFKmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233600; c=relaxed/simple;
	bh=JG3W1SHFFcSE24paha4HnWI6oF5U4IBcZgzuuMbTArk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajB73Vifxi0UW1je2Lvtl1JVImL1runLY2Tz+hBcnAqYoNoqB/1U25rC8Kq5OHYS7M6jsYapm03mgtfMvN6Jh1VEzdiIGQDuMxQPD65OP5Gb/CpDolpTQkhVDcky4kIxXTXKNP4nKBb47sShLAQwzWs2/3kIRI8CG3jALAETuDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YemsRUZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YemsRUZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA1E1F000E9;
	Tue, 28 Jul 2026 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233598;
	bh=WQn6wrp3y6PC6hRSk4h9T7faOMe3eCwiYcf6xPyMP60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YemsRUZMA4YKtWgsAy6cBZUu1AThRSR6dkijLvoa98hgnI3Zt2dvjwePadTyW+oUB
	 gaAeaPM3ghGGbidLhsYa4CAtqEqzXcUJYfTfAw0ed3xxL29jQWKsSlRHJ3bOguAphx
	 2n1s9wZRwZRF/wLCKcftWrDxf9pnrsMOvMkv/cuySJVTGvesa9bln+odiJpSQlQzJQ
	 IebSKlaGwceOmSYtc/9UJ31efIFKwac0LPeIia7y2bzwZN8Ko5M8cQ3IAeD/yvrOBm
	 zrPrIDiNUWUCzUNuToshSk22piHD46l1/ZHryPKIE/eEGucbNehwICE9+z5eUhBrpJ
	 YZCmeWKV5tj+g==
Date: Tue, 28 Jul 2026 12:13:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, goledhruva@gmail.com, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH v2] dt-bindings: clock: ti,dm816-fapll-clock: Convert to
 DT schema
Message-ID: <20260728-vengeful-pelican-of-support-cccec3@quoll>
References: <20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-ti-fapll-clock-v2-1-085054acf2dc@gmail.com>

On Wed, Jul 22, 2026 at 08:57:13PM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments DM816 FAPLL clock binding from plain text
> to YAML DT schema.
> 
> The text documented #clock-cells to be set as 0, while the example and
> existing dt and driver require it to be 1. The schema now strictly
> enforces #clock-cells = <1>.
> 
> Properties clock-indices and clock-output-names are documented in the
> binding and added as required as driver strictly requires it and existing
> dt already use this property.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Cleaned up binding descriptions by dropping the redundant common clock
>   sentence and removing "phandle for" from the clock items
> - Link to v1: https://lore.kernel.org/r/20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

