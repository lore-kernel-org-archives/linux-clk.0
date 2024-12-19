Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A036FC147;
	Thu, 19 Dec 2024 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598264; cv=none; b=NzFsNVWOOGt6qQSA1ncv4EOn7F43Lufi+0yWNSJWW0u2DNskFPa3TOPr5SvSTk6355yAtFTtRTFhCVrUyflAXzSAmam/ISS6t7fZFGHAL1N40VyKPX5PRRFnhUX1Qo+foOxqwCaQ5SbwMcyep9NmAKC5W81YzRsqtSWR6SnZG4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598264; c=relaxed/simple;
	bh=FY7UgRIJY0I7XhQ9puZS3wRTOEvSjmNAtnDfKwmRvoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuHqRXBq0lK38NC41ihywPH2BqQG+ub17r9qnjC5r0mAlfLhGe+qvRg+cHyw3BeARHSdgjRZ25Vk6oC8HFUPyI8+DgPgbkWNfKMnH6oKs7HinRQ3Hy39rA9X0HUZkHxZXT50rIJOa3Gp0gjcsFFVMPI0iG/pfuu22tVLqcQzyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzdojG2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzdojG2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53385C4CECE;
	Thu, 19 Dec 2024 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734598264;
	bh=FY7UgRIJY0I7XhQ9puZS3wRTOEvSjmNAtnDfKwmRvoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzdojG2zOyxT4yrFvM8wd+m2KjjbC5J3JJ08Nfa00J0ivi73jUZ5BAwosifrRN6Ef
	 pr1/QaWpeMJf9YcHJwiOD09vrN5Lg9+Bs1ny/SUOzlhwwkXDMb41UKVyHh+YCb7mr2
	 UArj6uYLs2NM11FcGK8WqlJP6hzJWwyhR051+da9jeJlnTcUX8wbPUNrvcvyrSD22y
	 tI59t0wda6LsmrcSRBGI6OI941vw3/fKvI6Jbi2hLOzjKKfk5GSF5oMxGvyfqfCmTi
	 y7gqOi4F5pN7mmSMD2UCfI3omeWK9XCk/NL2vz1qKcPNuEk4sHGtWKGjMdPkT49BFL
	 62MMTNxyUdoqw==
Date: Thu, 19 Dec 2024 09:51:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <3glyuu4yg7wbykdsfm33m5evnn7fwg4dbplrkgzcceld3cgu2s@t3xjlhryt2y6>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219024631.3145377-2-paulha@opensource.cirrus.com>

On Wed, Dec 18, 2024 at 08:46:30PM -0600, Paul Handrigan wrote:
> +  clock-output-names:
> +    maxItems: 3
> +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> +
> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary output pin
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # CS2600_AUX_OUTPUT_FREQ_UNLOCK: Frequency unlock notification
> +      - 1 # CS2600_AUX_OUTPUT_PHASE_UNLOCK: Phase unlock notification
> +      - 2 # CS2600_AUX_OUTPUT_NO_CLKIN: CLK_IN is not available

I still do not understand how "clk_in", which is required, could be not
available. To me it contradicts itself, but maybe just description is a
bit incomplete.

Anyway, why this cannot be simple string?


> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cirrus,cs2600.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock-controller@2c {
> +        #clock-cells = <1>;

Use order from DTS coding style.

> +        compatible = "cirrus,cs2600";
> +        reg = <0x2c>;
> +        clocks = <&xtl_clk>, <&sync_clock>;
> +        clock-names = "xti", "clk_in";
> +        clock-output-names = "audio_clk_out", "audio_bclk", "audio_lrclk";
> +        vdd-supply = <&vreg>;
> +      };
> +    };
> diff --git a/include/dt-bindings/clock/cirrus,cs2600.h b/include/dt-bindings/clock/cirrus,cs2600.h
> new file mode 100644
> index 000000000000..86065f94a2b2
> --- /dev/null
> +++ b/include/dt-bindings/clock/cirrus,cs2600.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024 Cirrus Logic, Inc. and
> + *		      Cirrus Logic International Simiconductor Ltd.
> + *
> + * Author: Paul Handrigan <paulha@opensource.cirrus.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_CIRRUS_CS2600_H
> +#define _DT_BINDINGS_CLK_CIRRUS_CS2600_H
> +
> +/* CS2600 Clocks  */
> +#define CS2600_PLL      0 /* Internal clock */
> +#define CS2600_CLK		1
> +#define CS2600_BCLK		2
> +#define CS2600_FSYNC	3
> +
> +/* CS2600 Auxiliary Output */
> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2

I still don't see why these three are supposed to be bindings. Drop
them.

Best regards,
Krzysztof

