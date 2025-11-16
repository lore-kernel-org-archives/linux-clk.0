Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5476B20C023;
	Sun, 16 Nov 2025 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292570; cv=none; b=tfh5KmZq1BOR+HJmUABaj4DMvuDA2qfIwX0r7j1NtakFPGAcXpdrn8g/wCA0uuUqwgD7f8Pm8Ex1R0SbASStstUbytVKrE0VGsoIOmLbz0n6VnBQo8L13Fv9B4MArhxQ/Gx+deoPBT/nrP/BtDz3jlT2WNsNOeVNw4qc5x4AcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292570; c=relaxed/simple;
	bh=mnXvqYmImcinYneeN4zW9LnuvANHy8IWtl4d1UPxOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApON9HvlaLpBouKvTrkKcy8SE8Zb+dl8dJTdKSx5wDNfcP+DzPYcfQ8h3p81/dUP4QpaQ/KJpIHdRQ2Me8OLCr1KiCJUZgOytiZDiI+gVlgyblvsM8imOsVo7m0E8gU4U4vyE5OcsCn9+wXyPhKlM4sfGSqdDLrGQWfjB5l7ZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzunf4+D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzunf4+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A557C4CEF1;
	Sun, 16 Nov 2025 11:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292569;
	bh=mnXvqYmImcinYneeN4zW9LnuvANHy8IWtl4d1UPxOE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wzunf4+Dqpm8I172TRzSWUXI6UzmdSlHBq8WRdCWcS94xCaQm+lKMWs54tSMmFeSu
	 0GmB/twTiwhYFSrxFAG1f3TYhJ7Gd42+wN5/tmmAJRuT3km0Uq2dRgy6vQDE+FSKSG
	 Ks6rda4N7Eam799dwq3KdZDNuxIqAwMe6/i4Iy++9UxUjxAMwD/tZB3XJCg9TygBmi
	 yYG3g3vk3adHL/vlhpDzM0UjZjNeiTH2SelYpRF+zwBb06K7yET+XUXd8Ftwiw67CA
	 p8+z0LYsDz/GVpjoHsbqJqVqSwlQXit2P5MxXdrnVIIAUvONjeYP4QsV9P4aJMlu3n
	 VoSpxAaT3fE+w==
Date: Sun, 16 Nov 2025 12:29:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Message-ID: <20251116-humongous-ant-from-betelgeuse-c0c416@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-5-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-5-jernej.skrabec@gmail.com>

On Sat, Nov 15, 2025 at 03:13:44PM +0100, Jernej Skrabec wrote:
> Allwinner Display Engine 3.3 contains planes, which are shared resources
> between all mixers present in SoC. They can be assigned to specific
> mixer by using registers which reside in display clocks MMIO.
> 
> Add a binding for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> new file mode 100644
> index 000000000000..801e5068a6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H616 Display Engine 3.3 planes
> +
> +maintainers:
> +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Display Engine 3.3 planes are independent of mixers, contrary to
> +  previous generations of Display Engine. Planes can be assigned to
> +  mixers independently and even dynamically during runtime.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h616-de33-planes
> +
> +  reg:
> +    maxItems: 1
> +
> +  allwinner,plane-mapping:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle of Display Engine clock node

You description is almost duplicating property name. You need to explain
here how this device uses them.

Esxpecially that clocks do not go via custom properties.

Best regards,
Krzysztof

