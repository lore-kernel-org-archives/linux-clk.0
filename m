Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55661A0B15;
	Thu, 24 Oct 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754160; cv=none; b=uvPlL1Z/H3ZUw86sNrL5wfb3jc2a9qECaiNmI5rFRutloGj5b4CC+sXXJzUA3n+wPs/SqcdoZPGSpwwG3CkHRfE760c0+CD6qN9lF5xcSzTeezERTWsz6/7tbc3Ho/KJKYFT1uEggpj1VIw205h1S5CuNP31BEegZpxUYbzpKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754160; c=relaxed/simple;
	bh=LtkRyFa+ptwpI3BjcDqChmf25+0CofX0xNDvVdF3tjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7LIWlbxn/nXZhfhP9TlWFFxGL7w3izGePEAoUbTGeQEcd0DZRqyZRa/F6LuoJ1GHuJROt6sbzkfP31Qa+ov0QyqKwkwQgCaWHJnJThFV6GD5dxvXFFkVeAS72J3Ox+XN/6USRSX8k3FvmjJzEKq3X5cq9K9HampWtM6TDM5oNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e21QQXKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e21QQXKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D103CC4CECC;
	Thu, 24 Oct 2024 07:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729754159;
	bh=LtkRyFa+ptwpI3BjcDqChmf25+0CofX0xNDvVdF3tjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e21QQXKbd//X8OwJs3bVISaxQiWtu3fneFc3BZayNh/BwxO89zUaGZauxCeoJ5kao
	 UbI4PvEouuSFfPGfZISFvMCLF0ryd0boaYZp0yfXDsWsg3KSaV8Qr3phweel8nE9En
	 GYpqdARDfy3VXLRQRACLv4Rbc1f8Luk6TiG1DlgOQrpLQ4OZUZ9GMnQR/vYXWzD0fz
	 gyRNFNfwLyHayyBlY6I5XAeFFhhXl7k3GvPmGQiyj93xhLEPKdETZL1WQvsHl8URJg
	 9LY4wIQ3Ibz2IzUkJlf2vEsT+rJiAOukekGxobroD7ehkBs1KrothEAKQGQ3rLXKHD
	 X02d11SX0X52w==
Date: Thu, 24 Oct 2024 09:15:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Chris Morgan <macroalpha82@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: allwinner: add H616 sun4i audio
 codec binding
Message-ID: <6sj56amrx3dtnznafzsycgq6r6do65uq3z3v3pwbcgwdktqqgo@qbrfpmx22b4s>
References: <20241023075917.186835-1-ryan@testtoast.com>
 <20241023075917.186835-3-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023075917.186835-3-ryan@testtoast.com>

On Wed, Oct 23, 2024 at 08:56:58PM +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.
> 
> The codec is relatively cut down compared to some of the other Allwinner
> SoCs and only has a single line-out route (relying on a separate digital
> microphone IP block for input). HDMI and SPDIF audio are handled
> separately by an audio hub IP block, which is not currently implemented
> in mainline kernels. This requires some additional flexibility in the
> DMA bindings.
> 
> Add compatible string and routing for the H616 audio codec, and update
> the required DMA descriptions.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v1..v2:
> - Remove PLL_AUDIO_4X clock from definition (defined internally but
>   not used by driver and so not required in DTSI)
> - Restrict TX-only DMA definition to H616
> 
> Changelog v2..v3:
> 
> - Fix missing - in H616 conditional binding reported by dt_binding_check.
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index 78273647f7665..ebc9097f936ad 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -22,6 +22,7 @@ properties:
>        - allwinner,sun8i-a23-codec
>        - allwinner,sun8i-h3-codec
>        - allwinner,sun8i-v3s-codec
> +      - allwinner,sun50i-h616-codec

Are you keeping preferred ordering of entries? Usually it is
alphanumerical, but you introduce now by model number.

>  
>    reg:
>      maxItems: 1
> @@ -40,14 +41,20 @@ properties:
>        - const: codec

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

