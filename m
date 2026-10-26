Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002334;
	b=l3R93vyhhBmh0GQdRLTFuVeAhnDPoi9dTaMs1LBwd21CteiNLqOmWe2KBQ2bDTQEVvL6
	 S0TBZzvlc69+NgPjMDfMm5bG9lCskdt7PZ/ZoYwVPVuDNSx1AqUR8gf11jl6s9sLkS9jk
	 p95PIYV2Zx7msYqRUkeO+Njl4xRFeyh8qS/TGYZ/+XLITouG941tMCN70NbB6u2ylMcSp
	 7D9NSNfxT3Z4u3O1pJtvlhkl/Omc5cuIAWJKN4VsjrbmQFToBjRWgZD6FsCvS8ca4wPX/
	 OwnXfv04HDcjatt5bXfZIgtJIXHKFm5Q/PzjXH4/NGI2VXwFUdEJexgAYlOIcX9PrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002334;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=788vu28/RmpbuxZcV5D6HBDXw42mfNytDK356zbWFxI=;
	b=pQbEgqwq6Guw7ra5Zcef2JQ4mZVvWZ0LX/LJRljGB1HcjEe+uB/ZaxBkuyyF3TMDdf8b
	 RbSux5rD7iVk6Q42epYS0qqu15GG66KdvrR9jIQuqRw/Sl6CiJxYv+2zCz5MQzpNsC+l6
	 Ov3Fb1/beYZRv6Pd5ii2ofDWofmrtxRSh+PGz08Jb/iJfIcDoCGEk8Uv8yfPpATQpqc16
	 dVgiC5xV61ZAL6CqogNlfoKng+MN2sqSmlAs1y00zR1TKIz/C6CE1BVAWPagS1/LWwPt0
	 A9GcMQ4KhRJVq117XZNgRhCzbz8TVhMqERTAGlbdciK902czUsyhExyv5vp765w3EjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkrhOp0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E75606A31A;
	Mon, 26 Oct 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkrhOp0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799B21F01828;
	Mon, 26 Oct 2026 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002333;
	bh=788vu28/RmpbuxZcV5D6HBDXw42mfNytDK356zbWFxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SkrhOp0e/e07xdOA0NDEcNPwlL2Nasi5VA7pBzAWQODpGpG9ijvkEVaxFupqoizIL
	 2Uj5ucNWlMY7KR2dj2lF+aT+B2UA4NKpSrTK5Qgx8uBl9F0sHSIEoFVBIF02kRkfp6
	 32Xy42c2RUPwIX81GkNaK4/kQ7UNu8bzeuTwRsM+iDE8e+WujeZ8IKIMgWCD62iznl
	 Byss+a7f2GeKaArfI6iiM1AaeIgTYNA8QLfxQ9NRAGSHGxiLwMFFxDEi37sHDBXWPP
	 NpVRWDpqZ2RWQUeY0JJD3mglfrXetvjjULZkXB8MMbvb7LdNk1aZwFKAukBJ7OPrTr
	 Yhl4wJXOnkzOw==
Date: Mon, 26 Oct 2026 09:12:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, 
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <20261026-able-complex-skunk-d7db4c@quoll>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-2-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023093045.3248630-2-Jelly.Jia@cixtech.com>

On Fri, Oct 23, 2026 at 05:30:41PM +0800, Jelly Jia wrote:
>  examples:
>    - |
> -    audss_cru: clock-controller@7110000 {
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gic: interrupt-controller {
> +        #address-cells = <2>;
> +        #interrupt-cells = <4>;
> +        interrupt-controller;
> +    };

Drop node, not relevant.

Best regards,
Krzysztof

