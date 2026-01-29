Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD22313E39;
	Thu, 29 Jan 2026 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702823; cv=none; b=q36QKkibKD75TfBNbOX5FlcTcHgUOCp5pdJa0LY/wSDl1gNA926qsDL266H6Hw6R/3KFF3E8vkeu6AEAlGzsEjpYKFGZqycfpgXoCZpF5bohgBCAYaPuZ+ljAl2eA0pj6U8hjzgwJwotov9oowgp6DfwTgmvE5fc9mJunWPAIJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702823; c=relaxed/simple;
	bh=tXLZf586UMlopidhDPd+PLHMkBbfoB3yGad7HOETBIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8a+5aytUV/09e94Ail4LXEciXvCP99ywqsdP0z3Uqpus+TdCtiAX2ybrhIyzvm0kumJhQBpnKlbkUAaGwbXOotSRgahPXHypoS7EsFDXjOEmJOcP40gqKTV/NFpg5E0bYunxq9KblnhoyzzIkIsbmpv2Ud7X5dJH9nY+NdneOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ze3bCGG/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ze3bCGG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECA5C4CEF7;
	Thu, 29 Jan 2026 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702823;
	bh=tXLZf586UMlopidhDPd+PLHMkBbfoB3yGad7HOETBIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ze3bCGG/Hi5NgiKNzxsqJo1h+thuZE83AJGM3VOwqqyq9zuyxXz1YYh0gYxoXT3b6
	 5rY3/sq21LyoYekh9tWhU4sCw6G7n2xC7gZNRDPxvXWQDCMyvm4UA0YCBICNtKOyCf
	 2zIHGuAMaurWjAoyxsWEqvNiePG3VPrRrqrXIpg/IokMcjzzxPcchNHetQ0D3AIOn4
	 Py3Qk6YDAgnMyHZjYBqqv69Jhnjv6DRP7pNDHnM1PCmccf2Hel4JL8iqHSk3cFBkyb
	 l5quNXdS50Oemjhyk8xvtBIFjfpzr7KLzowBh7dJm8pXRot48elOiivmf6Z/asjzic
	 722agsrP7ELAg==
Date: Thu, 29 Jan 2026 10:07:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v6 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20260129160702.GA1111873-robh@kernel.org>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-audio_drvier-v6-1-99e350855bc2@amlogic.com>

On Mon, Jan 26, 2026 at 06:01:42AM +0000, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..1cd9a99e5ff3 100644
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
> @@ -99,7 +100,8 @@ properties:
>  
>    resets:
>      description: internal reset line
> -
> +  power-domains:
> +    maxItems: 1

blank line

Looks fine otherwise except for the DTB warning, so something here 
doesn't match.
