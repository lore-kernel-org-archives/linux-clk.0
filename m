Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231F362137;
	Thu, 21 May 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349460; cv=none; b=a6uitMTUSQDN5Z9DZgO8Ql82zoe8iQFM1iQGTo1jAGUen1bWwWCt6Y8MiPFfnqbjuoz3GsCO2tUqB3RfOBcw9eRuN5S3uUBzdg70dyUFKNxAk/M4gub7y3tSyYYH2MYZVm6PnnP1ZEVEZrpUnE78oJ7Jxthrglsrydmd/z+esKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349460; c=relaxed/simple;
	bh=1XR1e1Wc94h2Y5OOR23tD7kV8xBSqMvhWnOqbzUMRsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua9sUF38G/xBeJWz7hAng8Csl3HU0r8K23Yci/itTctuAOB3W279ao8OJfwaRo0n+QoebnlMGq55q6KfcxtCJyQ4P7tB/OjCVpnf5gNzE9ysP5ln5RZ4C/fNPi7Cok/zY3N+bNeDLbAOFGYEd1qsNlX8Cvphl0r+t505iZgxO1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBeFB6id; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBeFB6id"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBB41F000E9;
	Thu, 21 May 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779349458;
	bh=guo2ILE14Lv+AGNJMGuUpi1UMFrXaU2PnmPGdYeEOdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XBeFB6idp4SgHemQhi4cfn957vDcpkBr322AaimEK+s8p96r3daWDX29in1ZPfuL0
	 5v+aLLoYECRJ3Zel/TIEU8VfOhyaKD8pAPeqx1yl8SMY02HwdSomkynOobdYoavmRh
	 h3FcGkz23yBIurIZuNwgOm5G9zPfdO7KsclQOKT+ksF2e3U4IRH7LjR5JvOe5wSL61
	 pHmKMdiIyJjB7LFhQtx0XFv0j7VqDZJKQqyjTggN488Gyjbvaz2DJke35/BylOLZ+a
	 G1EIYbj/h5Obw2RWLLf+c9rYcYylPyqHUz5cTfjMOJ6YdlqASXfqinF2UHeZ3gUW+0
	 SlO2mjb7XpKFA==
Date: Thu, 21 May 2026 09:44:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20260521-ambrosial-abiding-lyrebird-9dc86f@quoll>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
 <20260520150912.11614-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520150912.11614-3-ansuelsmth@gmail.com>

On Wed, May 20, 2026 at 05:09:07PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node.


^^^ here - required but:

> +  phys:
> +    items:
> +      - description: phandle to Serdes PHY
> +
> +  '#phy-cells':
> +    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
> +      as defined in dt-bindings/phy/phy.h.
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel

'phys' is not required? I think you need it to configure the serdes
correctly, no?

> +  - '#phy-cells'
> +
> +additionalProperties: false

Best regards,
Krzysztof

