Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1D3655EA;
	Fri,  3 Jul 2026 06:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058610; cv=none; b=LFwKddSpVPQ2VQak0gtn7nR4vzKCUHkuC/3+VLvCcFZD2UJmfsfhCiFSPmLsrgRdeCDvumPhMaafprE5x3FzyvfGxXfWggVwhe0RG9TtaYOrVEyEvsvy8H5/bFdrRmsj2oKUx40GIDvMgXMy8yBOVYQ7zC13RhheIhPjz/5nADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058610; c=relaxed/simple;
	bh=Amlg5TyEyS6Ch9Utm7lwW1uokDtg2yzH4rcoMZQ2DHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wkw7G/tkpMiqJ2hiB7bY1iXvCD6Z7xLe7tFLfXGTL8+CLdokK2YPLpjTx29iwVn0s0f6hi+nY0cGBrDhTfJSUz/O1bw9vJ7fkHMSbi+fd9lSxQxu6DN0Q44QFJtGBAXrG+k7swSZ70QWSSkZhqsv3l9xEYjZT7+o9EKFK2b/rZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbzJILcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbzJILcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5C41F00A3D;
	Fri,  3 Jul 2026 06:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783058608;
	bh=u+9sMqB1r9beX3vNKFEtSUw8I/tCjyfUBR2Ob8T7vM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VbzJILclvc1144vvtNYuDfQOGLwOuF1pvQ5GY4HLqVgnXBEGYLBfZu4eQCCCp23GJ
	 6yIebnBefO5vw+jPXXXK/dMPntBQsvREOC4TVwHMFr6p15sRxb0nXMnVaijkYDe94v
	 40M6ymWYkaJelpxd2VE7YGqWkABZxpV60uDjHuvb1tJpSuzUa4YtSlAp+cm1Pphz6g
	 O1zwICQvg8fKjZxcXW15Kea8EFPHXtPLC98r4fWry5as1HxhHnt6f5pS71ZXMJHA5R
	 DOLavsGoo7w9JIC4BQKed0fI4iCF/QEgyYsW+XMSJ1SEhqev0s0mkVAdFY10c+01Wv
	 w2EstqTSwpaBQ==
Date: Fri, 3 Jul 2026 08:03:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 01/12] dt-bindings: soc: zte: Add zx297520v3 top clock
 and reset bindings
Message-ID: <20260703-dynamic-bronze-buffalo-37eac5@quoll>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260702-zx29clk-v6-1-377b704f80c4@gmail.com>

On Thu, Jul 02, 2026 at 11:27:56PM +0300, Stefan D=C3=B6singer wrote:
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  The zx297520v3's top clock and reset controller generates clocks for c=
ore
> +  devices on the board like the main bus, USB and timers. In addition to=
 clocks
> +  it has reset controls for peripherals, a global board reset, watchdog =
reset
> +  controls and a USB status register.
> +
> +  The controller has two clock inputs: a 26 MHz and a 32 KHz external
> +  oscillator. They need to be provided as input clocks. The controller p=
rovides
> +  clocks to the downstream Matrix clock controller.
> +
> +  All available clocks are defined as preprocessor macros in the
> +  'dt-bindings/clock/zte,zx297520v3-clk.h' header. The resets are define=
d in the
> +  'dt-bindings/reset/zte,zx297520v3-reset.h' header.

Use full paths (include/...), so these could be validated by tooling.


> +
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topcrm
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26 MHz external oscillator
> +      - description: 32 KHz external oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc26m
> +      - const: osc32k
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#

Missing: unevaluatedProperties: false

> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

Use consistent quotes, either ' or "

Best regards,
Krzysztof

