Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388087;
	b=4qDDJEOHG/khR1GVOBmutI1MgVxtJMR/YYCh5lFoSOr04ubfg5FjIAvP1tYyVrJLSkHW
	 c5OGn3z3vSluhzHlTUxmdUrGzkSnKnAb6khv+hsE0va+zYLMsk7ZLcHQxMCxiY5bYuneT
	 TeqI42W6pUlaAXqTLf9woaGgQ9lPVASVXf37igeTcCRaY43RBYRffBMybMoqoYc7hUBTJ
	 e9sfba23NEK7NnPaCogCL5I0cYNY8LxS2hYBUVj+d59uU6WvU0d9tGB+xFP8KquvUSbii
	 v0cH+5UCcnv4yooPRmNDnXB/FvUlhMLsAtldlNuJ8sImJi71DAbMbaiSPvqQpHknxnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388087;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fQpynz/U/r8Ihf0QA0gj96/iqALNmMISQ/47HnazT0s=;
	b=49C1rngXhN2d14vWZ1qqGclu2v5GF0hWUONEG+ioa35qLyKEiH6/1P/P2oeDkFnUq34t
	 sMgEmwT31hzjj1AbX0Dp2SCGcZGMQsZCG3B5Ja2IzGgXQYTt8jXLXRbUSBE409A71ZLB2
	 ssOQudhXZyKk75BuurUdlPeJCN51+LOpVSR2Sry/lQr5xAwvGPw1PzQUbyDOgbQRHZjdP
	 YyBKs7iOp3TANn7q2oJ9FSruolMzVC+izd8+k9DkIv1TlzyiekMalzt/VU1GwwEnOGLnu
	 lgytXiwWAEETvxyoq/uJx43kqSGtkP6gu1bfPUK8mYXAbcWEMLclI8csaxix/Kzh1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4Mm4EH5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B5606A321;
	Wed, 11 Nov 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4Mm4EH5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B581F00A05;
	Wed, 11 Nov 2026 09:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388086;
	bh=fQpynz/U/r8Ihf0QA0gj96/iqALNmMISQ/47HnazT0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R4Mm4EH5tpBex6GKVUdMpA85tYm1jIVj+193GxnPLC540MbymgL/mRceafbmGbGTk
	 zQo611f6N9cZ19+rcXFgQyOrDTykpDCmMpL7a4oeFj1beqOfmd1vDRZsugnTNntMgU
	 Qos7Jf9/sw1cCiEhNdJgDnhMeqMkW42ojBaMvnqAgaAdNqsA4zDKg/lMFRQKeSQuaB
	 ikWFL/jrqPO6uPYcR+UYXYk0RQw8eDKtVE2wr4oqVltF07gQrmq9E91Oykgh99AToW
	 aGZbbNWVradI7nqyeEZZofi0QOUYHvBUXD9mJc2RpngdFPthyISSaCr6bAePR9kjTk
	 GisNLwuoAYqxg==
Date: Wed, 11 Nov 2026 10:08:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, 
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS
 DMA IRQ controller
Message-ID: <20261111-victorious-persimmon-chimera-de9e4e@quoll>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
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
In-Reply-To: <20261106013520.1134450-2-Jelly.Jia@cixtech.com>

On Fri, Nov 06, 2026 at 09:35:16AM +0800, Jelly Jia wrote:
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Combined DMA-350 channel interrupt after the CRU gates.
> +
>    clocks:
>      items:
>        - description: I2S parent clock for sampling rates multiple of 8kHz.
> @@ -75,18 +93,33 @@ required:
>    - power-domains
>    - resets
>  
> +allOf:
> +  - if:
> +      required:
> +        - interrupt-controller
> +    then:
> +      required:
> +        - '#interrupt-cells'

This one you can drop

> +        - interrupts

And everything could be simplified with:

dependentRequired:
  interrupt-controller: [ interrupts ]

> +
>  additionalProperties: false

Best regards,
Krzysztof

