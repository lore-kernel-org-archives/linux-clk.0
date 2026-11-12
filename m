Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475425;
	b=rivjUQW/jPq0lSbH430HA3X01hjx5fZAZcXk9TKyT0VUNyDAsAH6FZpkTU6f63HIq4kJ
	 Vrpqzq7/tnAIV2bCIzAL4oyvJzhHPtrKzlM9vi+njZIEgDSISYsuS3sgEiFbfdeObzMhC
	 0NoKFCvDbTdsuK56TMT8V/3s9/UdNnv7kTWeRzgAdQkZem8qnZDJX0I0PfXuWKrGPozj2
	 iWRfDQJEoPyH7ht+s2HL6dIM1ZfqpL8Rt0/D/eYB+sPIcgP0G5qcMUWEqSBpL0wI4Wno9
	 jVuVFtAmH+ntXpECT/W6gbsaJj6b9d/YKcKJYRI5xC5rVb5NVbAUY7q/eRIUtwJNqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475425;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p3/q9baVarjH5p8c4QmSR6WdUwezO7jqcS3keXwu9c4=;
	b=3Ct7gwxRDQGxs7Owgcqv59ad92u+e45tPO4JxxGjzHhyvW5c46AMzv24QmP2tk+r9iRe
	 UJTcjcIP3XAmdvmGFpySjwySHMU5Ji5CTGWUhQJL31RkLMyzzJlTTsmCCIhBiR1olPmgF
	 5KBHDWiK8MFxrD2v4DPYBXCLZxIijCPyV9kzVq4ezGp3dq2A5F89qetf+Ey8zUS5dFyGN
	 VUR+rvxBn7chZdnKDcynnHVuHylPVcO7tZ7Le4HDqilYy5fM6mPlVbeT0jBc9bzuGu7VC
	 HU7V0e10q+N4YFI/dvGf0Y8A9xMGddnPJgbdhhCHmDK1AOIVCLtojpbC3RaOSZU2I0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhHNOE5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CED606A8AF;
	Thu, 12 Nov 2026 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhHNOE5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073F11F00A05;
	Thu, 12 Nov 2026 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475425;
	bh=p3/q9baVarjH5p8c4QmSR6WdUwezO7jqcS3keXwu9c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhHNOE5HJlI8/HZF95GSqvbXlSXOQPBaAfqlsslRFWBOsuCJ1cc49EeQo6a0GhP+J
	 XzC4TmZF4fo5QqA4i5DfSg8io7p+GbY8BzJcT/aExqxZc4rUVpHe8zN/utOXn7zoJk
	 7Wj6/VXk42pstkDZfPZ7gLAeWWDUNiiYyTwkB8Af1AaxvnIzehd0crik/tglyPIkpl
	 gT26cZHHHdQRnpWYcZde/AZfiSPFw4GjBFJ1Rj2wGpwC9LfF9c10MlAUDlo9Ce/HQ3
	 VLlo7ZwLGvrRmxfSUbVvjSxZVJn2kn/JBsieOBFiX117GB986z9aJky/m7/OHe3Wqo
	 HyfwwuyESt7KA==
Date: Thu, 12 Nov 2026 10:23:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v16 1/9] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20261112-screeching-marvellous-crocodile-f7bc0b@quoll>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-2-eleanor.lin@realtek.com>
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
In-Reply-To: <20261112052544.555563-2-eleanor.lin@realtek.com>

On Thu, Nov 12, 2026 at 01:25:36PM +0800, Yu-Chun Lin wrote:
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External 27 MHz oscillator
> +            - description: CRT SYS clock input
> +            - description: CRT SYSH clock input
> +            - description: CRT DDSA divide-by-four clock input
> +            - description: CRT miscellaneous gate clock input
> +
> +        clock-names:
> +          items:
> +            - const: osc27m
> +            - const: clk_sys
> +            - const: clk_sysh
> +            - const: clk_ddsa_div4
> +            - const: clk_en_misc

Put the list in the top level with minItems: 1, then here you only set
minItems: 5 or maxItems: 1.

> +
> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External 27 MHz oscillator
> +
> +        clock-names:
> +          items:
> +            - const: osc27m

Best regards,
Krzysztof

