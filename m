Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198927;
	b=G/tP+prhkH2aM2UPwT2ZjojCTaPWKOREPhs7T7r03xnRxjrrqS6k0QVj+w2i7etT7Nfz
	 cC/qnoJgxi/GxO5irEncCC75VQsQ5hDwxQ3i3GOANn+vyr51eXYY1pCAGX8x/PkLgsR7U
	 SG9OjdgMqDfwAUzIAoM5/zWoO+dC53ox+Vi/YLWtRmxMMoeGfMedVwHmW7sTwndQYhx9H
	 LvPADjNBR8R5godjd5jfKtP06GvBIMxcp4NSRW7HG5trnWPecb4bLtf4I8L5zefCvvrwv
	 NI7kNpAUhvCWXQ0Kktl+jDSHywM+fOm6EpRBtlghjPcqi2fIEMjI17EhX2/0YiOcHpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198927;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Dji3XbcxBruXL4du3GW6afPCNwFUKBPPMSrHsKB8V0o=;
	b=OmLH4oYFGlCwmjZumUixCJUZ+x1qecPCL2e7EwM/WTVRRvRJuy5y1XiVqOsIZrm0lZKt
	 aiYgGQN5Z6TponjZZuVZTToYsMje/WIllMOJEn/jzaUhyxtf+pKmKhPCmzUN+Y4AeabbA
	 +FidQZZniYQXEiF5qs2FWJxdTfhigcH4JyZjLjT7ghyVwj4f6qePMXWmp7qOzqIgzofU9
	 QQWQltA3RovEQqyRQczH17ZQdlPcOvVKlX58qDwPYWR+PwpFAs22ONdP8tM8Ve9k7csk0
	 olYYuKfWhXTL07QT+VPyN4jnWPcSXIIgVyFxvgXJC8+Qkups+PWlTpWYJL4K3usfrCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPDjmvlj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E4606A31A;
	Wed, 28 Oct 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPDjmvlj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D111F01825;
	Wed, 28 Oct 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198927;
	bh=Dji3XbcxBruXL4du3GW6afPCNwFUKBPPMSrHsKB8V0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mPDjmvljOWfR2WCxVwsCMCTrrxvR3gprOSt1d3iQG3Qb0xD9wFM1J/3w9sbph10It
	 cfx84oETwlzAKrIiQ1InLY4zxXMSOUETRFKw0qRKkk/gwxI4cFM2FgAVhHFo5R3JRy
	 oo1c1TrYYvEb2eOouY+/Lo5PccLaI6Sb+nUbo4iLkfC3+YC91aqqBUCJBktlfYcmNh
	 BPCHOxSPtKKcMD2o4nAQnmfSa/mbqnRBpWTp9gZpuMAr6ValcNIVVPHrnKu7fHLEsX
	 lEoWiPm+Dcwg93VSIP3LXYCU9pY7ooaZCc4z5Tct5z6CO0IxJQoxu6KN+u9ygxEUjf
	 s3Qp0AyDNNxsw==
Date: Wed, 28 Oct 2026 15:48:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261028-sparkling-objective-cricket-a428bd@quoll>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
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
In-Reply-To: <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>

On Wed, Oct 21, 2026 at 03:08:28PM +0800, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..69f5fef5f14a 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
>  
>    '#clock-cells':
> @@ -100,6 +101,8 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1

Missing blank line.

>  required:
>    - compatible
>    - '#clock-cells'
> @@ -115,6 +118,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,g12a-audio-clkc
> +              - amlogic,s4-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
>        required:
> @@ -122,7 +126,18 @@ allOf:
>      else:
>        properties:
>          '#reset-cells': false
> -
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false

And here as well.

Best regards,
Krzysztof

