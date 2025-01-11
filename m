Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4314F132;
	Sat, 11 Jan 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587549; cv=none; b=FWQAr3L7mlwBuoP77Y2VBDg4eaYgyduS1JsUFQlut9WwvWsCtXtauAX+XdkHD5vb4j04JJz5FNXU2OyV/ru1ta5pi0m1iMchprnAanASLtJVLRxGY6YOCiipkPjWfK9FGs/R5Bu9j05Y/Vs8GaISG89sOSvSaSrR65a0kuQIVtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587549; c=relaxed/simple;
	bh=Z83WXJZoT28SBDIuoOe79g+ADfiCinqPsdEf+EaBKnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTP38Xt7P42thLdMiO1PglTz1MSvtz6xoKtw0+V7+KMOhzYEV1WvPgtuQl6rECnZFsizG95TLARHqJSEYWRWOngaARoFIQE98m5C63HYQcUkdbN0u38KUawbpL1UEi/+IE3Xvyju7Gnsb0vnmPFGiyF+lxnCpyeo5uhfunN846k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsKT0sWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsKT0sWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFF1C4CEDD;
	Sat, 11 Jan 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736587548;
	bh=Z83WXJZoT28SBDIuoOe79g+ADfiCinqPsdEf+EaBKnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsKT0sWer0S+oyjZTnsrYwJwGgp70I+ShlBu3pf7DVCCEaSKzGqLLZNz7ThLBitUv
	 vLxgsh6E9TKKC+UeBCwL4y398nARXKbk7VHtD5SMUXdL8DKlZDlzsicjR9c87CMaGj
	 1tKKgli2nbvcSskJveAG9eP3qqtt8kPYSBIL5UHH5N8kuQuXfzRn68/ujbT58klMxo
	 ZPWjL/bfwtcWKu69sEa7I7ClWvg/tnvjsVPCwo5dCDuSJKdDdUpx87K1GF64uDG6ki
	 sy1cLecLOOrG7zKU27CgYA3bvBbkl0H17wLc/awhiJCg2mPGX5X9R/VrGxVSwAEwk/
	 HXBw/CP8a03CA==
Date: Sat, 11 Jan 2025 10:25:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: convert stm32 rcc bindings to
 json-schema
Message-ID: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>

On Thu, Jan 09, 2025 at 10:18:28PM +0100, Dario Binacchi wrote:
> +maintainers:
> +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +description: |
> +  The RCC IP is both a reset and a clock controller.
> +  The reset phandle argument is the bit number within the RCC registers bank,
> +  starting from RCC base address.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f469-rcc
> +          - const: st,stm32f42xx-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32f746-rcc

Why this isn't just part of enum with first group/list? Different
groups/lists are for different fallbacks and I am pretty sure fallback
is the same.

> +          - const: st,stm32-rcc
> +      - items:
> +          - enum:
> +              - st,stm32f769-rcc
> +          - const: st,stm32f746-rcc
> +          - const: st,stm32-rcc
> +      - items:
> +          - const: st,stm32h743-rcc

Same here.

Rest looks good, so with combining entries above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

