Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7143F2102;
	Wed, 12 Aug 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534364; cv=none; b=D4y0qRJp+Q/5ykmeNFR03Dpcv0hcrd6fLNWw1rvJkqoiGeOLDLReVdx+bCkkjOXru/MoNp2pVBykJ9Y3DxHRPtq5GQNFf4Mf6dtyII9PYWdXt0tB5VQ9r+mkpB/IC0W3rtVUJ+9hz6Glnucv9EushR6OcuvGgRnhfBapsIgPBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534364; c=relaxed/simple;
	bh=07xUpgZPeveHnmT7Xaev/4PkvvkLrSsNNma2Kk2twQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MshXigTugWtN5QX+P+RqaxBxNylImKcJ2q5dxwgDGQYA8yFLaturGysm7Ts5v4PCDL4dsD14xC5Y8ljWUhI6gAeGZNCK2okxwucUph9A1uHn1Qzt7Loo0W/cHlsfBVapnO2lUqbmlHEKtE1XoS8hnpnr/nVmjBcPKr9a/zcFWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q739QriN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q739QriN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328D41F000E9;
	Wed, 12 Aug 2026 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786534363;
	bh=P8KaAUX9R11bkwR2MOcMBoYfgL/mHkGp9BOIwjZkfIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q739QriNQvrGpHU/2lKsoQrm8IpU7A4ZAMQQZBWkW9tcrZoakv0WOSzn/5yJH7fAU
	 +v8DNA7QZzA0YChDKqbiXCGJ8ojQHkXknz/nPYRbOwPxUIz2g4UOjxP+yCvydbH9jR
	 tXe/OVpKK4Dhwzn0RlEclsFmRnpB+CaBZ+LVfmdsPP2pWNHmkI0cCne5hlpih5e/SK
	 /a/09kMPlTigwx7dlsiQQHAxOxlKoHH+XxvFP3WEpEHJEgNirUv8wI8BuJi97UpXyY
	 Pz9kPrxAJmGxrXQklwz/aFfgEt8ELk7q7EQArBMdQor2ShkWAWU9vq3tDuOdYhn2As
	 18aVW/X989Xew==
Date: Wed, 12 Aug 2026 13:32:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20260812-tan-capuchin-of-faith-12ae0c@quoll>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <85e52e1dd400f39e055196fa1462337285a9b875.1786518803.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85e52e1dd400f39e055196fa1462337285a9b875.1786518803.git.adrian.ho.yin.ng@altera.com>

On Wed, Aug 12, 2026 at 03:32:56PM +0800, Adrian Ng Ho Yin wrote:
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: altr,agilex5-dwc3
> +
> +  reg:
> +    description: DWC3 USB3 controller register region.

Drop description, obvious.

> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Controller reference clock
> +      - description: Controller suspend clock
> +      - description: Master/Core bus clock
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: suspend
> +      - const: bus_early

And the order of entries is taken from?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phys:
> +    minItems: 2
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: usb2-phy
> +      - const: usb3-phy
> +
> +  iommus:
> +    maxItems: 1
> +
> +  resets:
> +    description: Resets for the DWC3 core and its ECC block.

Drop description

> +    items:
> +      - description: DWC3 core reset
> +      - description: DWC3 ECC reset
> +
> +  reset-names:
> +    items:
> +      - const: dwc3

core

> +      - const: dwc3-ecc

ecc

Unless both names are coming from other schema?


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +  - resets
> +  - reset-names

Best regards,
Krzysztof

