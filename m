Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73D393DFD;
	Wed, 25 Feb 2026 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017620; cv=none; b=UWeqrvVizjhvTyAs/KesMoNieykfazxK0mBaR0hwIDj1BT8dai9pxToo9mXv18U38qz7giohz37fORwD9aamCBltsnAhrcdCVdHmAS9w+mwlRtlVdXSuRb0MhCtcLAJ2RJjcbZuybJKru0AqzaCdzA2Y3QR5jErDiMBOe1WOIoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017620; c=relaxed/simple;
	bh=/vE7uvuaCXSs7YmOxiPnT+lQCznNjU9pP7qljs6QuPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osr6BRKjqwY9ZJw3Z4umbH4FURd4vAySMyEo/+UbmXYkXndWxYr1KhTkBXhJs8+FZtH9qVyALPirPxrPo1BfaHjFx1Le63/WGoo2PkTkZ3s6/0/AJ/gA5Sh+gviQsAT7OJpZ1YRyyMyhEg59Bj5/NQzVeV/PACBMf5v6T8RdRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMN5sQ7y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMN5sQ7y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C11FC116D0;
	Wed, 25 Feb 2026 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772017620;
	bh=/vE7uvuaCXSs7YmOxiPnT+lQCznNjU9pP7qljs6QuPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMN5sQ7yP4uqqJVZf/sKJtP9eCukvfMRWRCAcmEQPku8ckfbYtaqNVVMQJ0pGikIy
	 6i+bEZErCpHVyCWFe9yqpkHt2dRFD0c0PccUGIJuprBTGlQ55cGMQJjs5QtDYl/7+E
	 pxs51vKFJDxhSE4lnC4xMQnCmRClQqPSYt0lmQz1SgoLymgtGVhq8wcY+Inv97KQod
	 oxXfhSd8I5PfZFH7qsqiX29NCUyXwXsOn3T66dU7GGvtmudg9ZL6fKzYnFTsjZPXJ2
	 QdUisfY+zuMSYPn0YEsovwQc8mbvC49ZA6ExEW9no1MjBwas2NvsE689Xvfp2rjWxn
	 4lW1bKFhczwLQ==
Date: Wed, 25 Feb 2026 12:06:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonios Christidis <a-christidis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: gpu: img: Add J721e SoC specific
 compatible
Message-ID: <20260225-malamute-of-perpetual-typhoon-2f0f65@quoll>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
 <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-gpu_dts-v1-2-cc5ddffe140c@ti.com>

On Tue, Feb 24, 2026 at 12:09:16PM -0600, Antonios Christidis wrote:
> Add J721e SoC specific compatible.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index a1f54dbae3f3..56249d1e65aa 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -44,7 +44,11 @@ properties:
>                - ti,j721s2-gpu
>            - const: img,img-bxs-4-64
>            - const: img,img-rogue
> -
> +      - items:
> +          - enum:
> +              - ti,j721e-gpu
> +          - const: img,img-ge8430
> +          - const: img,img-rogue
>        # This legacy combination of compatible strings was introduced early on
>        # before the more specific GPU identifiers were used.
>        - items:
> @@ -103,6 +107,7 @@ allOf:
>                - ti,am62-gpu
>                - ti,am62p-gpu
>                - ti,j721s2-gpu
> +              - ti,j721e-gpu

What about img,img-ge8430? Why this one does not have constraints?

What about all other constraints?

>      then:
>        properties:
>          clocks:

Best regards,
Krzysztof

