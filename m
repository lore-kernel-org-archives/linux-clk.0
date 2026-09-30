Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80EC4A0F1C;
	Wed, 30 Sep 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765321; cv=none; b=W2p2xRLpI0uc77OxTrR2ANXtkyPUZ4zyk8rrgUd3YLLc9phYm3u2V8tP4cGFfqSGIASPq37pLIBmfY4FPGaO+avdVKTa9N4mbw8DV29Mn0551B3XA+VI7PRfKNGtgarcB02jX3jx7/gMjzHcTszMikDmba83WhSHFUFjpnzQfgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765321; c=relaxed/simple;
	bh=Ez5r42VihnW/EOv06gVsfiHRaZfebgSoT9n+mo5qmhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMhRmn3Pf0y0HPOYTJttmv0k5+kdo1R3N576bLtwOhKJBrbJNK8DhMc4iSrlPTP8JCgWNBPj5Q2ymjvCll4C5/dqj6NuTbcrJJoUBmISEAnkdO5a7RLCPbvRqLOPWVS4fpoZWkdk9ka44Y1kq7ddmEdhB81wX3bHBQeujWBvNBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRSpyfLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRSpyfLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FDA1F000FF;
	Wed, 30 Sep 2026 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790765308;
	bh=mHsRRH5vJT9TKO2614eEaJo0HeOqX+AgSVsWkqICnxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PRSpyfLx0XFdj/Y42oE0IQmLq+LAOzKxfLqOU3Yls0ZLE20mT8m2qm0S7rBMjDAS7
	 MqfWUS6297hdeBNWaMrPJCeXWDPD07Gl0SrbXV3BxttR8ppSU5zD7I9dKksJUXtAX2
	 /qFtcXMRgE471BKHyQVJA/qi+hmuC+ChTIOsNo0xwUaEURKrEmuW4ArA90p45mJVOK
	 LF7hs5jmymye5Uhl3l6EsVqgdzkYwW4IeKa68KOPlgxcpuNxfVfJlOEGbVakapIQ1t
	 ecjvlPod0r3TqSPb4tZXF0D3SQiIwWPYZHkvdQNSdqZi1x9hgeL0YBYe6qDYK9uFy3
	 NkEg+w9kE9RKg==
Date: Wed, 30 Sep 2026 12:48:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: evon.chiam@altera.com
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: altr,agilex72-clkmgr: add
 Agilex72 clock manager
Message-ID: <20260930-scrupulous-immortal-saiga-f2b24f@quoll>
References: <cover.1790651166.git.evon.chiam@altera.com>
 <db3dd69fc666cca536488a75da122ff173995030.1790651166.git.evon.chiam@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db3dd69fc666cca536488a75da122ff173995030.1790651166.git.evon.chiam@altera.com>

On Tue, Sep 29, 2026 at 05:38:12PM +0800, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> The Agilex72 clock manager exposes four register regions: the clock
> manager itself plus three general purpose PLLs.
> 
> Add the schema and the clock ID header that consumers index.
> 
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> ---

Where is patch 3/3?

> Changes in v2:
> - Subject: dropped the redundant "binding" suffix.
> - Reworded the commit message.
> - Dropped the external fixed-clock nodes from the example; they are not
>   relevant to this binding.
> - Dropped AGILEX72_NUM_CLKS from the clock ID header; it is not part of
>   the binding. The driver derives it instead.
> - Added the clocks and clock-names properties for the four external
>   reference clocks, made them required, and used them in the example.

...

> +  clocks:
> +    items:
> +      - description: External oscillator input
> +      - description: Internal oscillator divided by 2
> +      - description: Internal oscillator divided by 10
> +      - description: FPGA fabric to SoC free running clock
> +
> +  clock-names:
> +    items:
> +      - const: osc1

osc

> +      - const: cb-intosc-div2-clk

Drop -clk

> +      - const: cb-intosc-div10-clk

Names are odd, seems like you put here source clock names, not the
actual logical names of the inputs.

> +      - const: f2s-free-clk
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkmgr: clock-controller@915c000 {

and drop unused label.

Best regards,
Krzysztof

