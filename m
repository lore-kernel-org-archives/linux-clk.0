Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3214287;
	Mon, 23 Dec 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966316; cv=none; b=NMdOzVZ78Qi4Fqlp9zCg+MCJTPEmtKbOtjc3g+zZlQqU0sA1OoqrZBJMWS+2yCYuqi+qDJT77XyoPnL7i7wHHg2V9TMs6Q5ChJe694iEMr89fFpOZE66cL6gsH/UcEtkCt7r/MjMkfZQFk3Wh1eP5ND/hrx9rrmS9CJP+rYD628=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966316; c=relaxed/simple;
	bh=ZSFSwUdh17PN8qMjBCNnNMp0UkGdSy9sZ8jzplMgCQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmKvwg1ZzhTCnrebGdqecHXc4QJxmNgpIl8MeIT4UGN97laL+1J81BoUaVdVG/fEtDQbMFwiYYDNKOjdak8yA1ezq6chEHuXZzeWLc8cGoPQtOy20on8hKQTdKM7cvesYv9AqRRVPFkuWIooapKSWNEDkxPwGvpQutNeUXH29jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AycW+0Eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AycW+0Eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44250C4CED3;
	Mon, 23 Dec 2024 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966315;
	bh=ZSFSwUdh17PN8qMjBCNnNMp0UkGdSy9sZ8jzplMgCQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AycW+0EqnqWDzlGESOVYSlQ+ZtaDgzzSFgvuEUFZyg37B4/fZ7MpaJE+gEcLbdqX/
	 2LpYBzxFt/oGXl6tf2BL0eXQHXgcf7GAbcydecaIuyTRO91nYUCsAn2/cjKlYMONPS
	 CX9zioBfB6F7I+rzgxCF4xplmupmq6vfYJGp/PjpO31/27JgPnh80LH0AJcy4phs2D
	 2aMpCl1JdWOzUGYyuQanmKVIg57dmuQpX8Re/ZSs9wAmIz+DRq0nUibpEyLZdKHwfY
	 IMUS1sI+5WsuDA6dgcl/gP02SW2JgICDlBT6x3HJ3R2rkvwGVs3hj0I/U70YGGrR6u
	 jrMjDFrt3hPFg==
Date: Mon, 23 Dec 2024 16:05:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 16/18] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
Message-ID: <mne4dgxr2yl2gpzk2mzf7gcqynqupmqa6q6ibb6pa5xtao47sl@ylv2mhwboyzn>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-17-dario.binacchi@amarulasolutions.com>

On Sun, Dec 22, 2024 at 06:04:31PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation can be applied specifically to the PLLs.
> 
> The "" value for the fsl,ssc-method property is specifically intended to
> specify a "no SSC" case, as in the example, when you don't want to
> configure spread spectrum for one of the PLLs, thus avoiding the use of
> a method that would only make sense if SSC were being set.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - Improve the commit message
> - change minItems from 7 to 1 for all the ssc properties added
> - change maxItems from 10 to 4 for alle the ssc properties added
> - update the DTS example
> 
> Changes in v4:
> - Drop "fsl,ssc-clocks" property. The other added properties now refer
>   to the clock list.
> - Updated minItems and maxItems of
>   - clocks
>   - clock-names
>   - fsl,ssc-modfreq-hz
>   - fsl,ssc-modrate-percent
>   - fsl,ssc-modmethod
> - Updated the dts examples
> 
> Changes in v3:
> - Added in v3
> - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
>   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
>   indeed more or less a syscon, so it represents a memory area
>   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> 
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
> 
>  .../bindings/clock/imx8m-clock.yaml           | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 05bc01960045..37cc6a6e89d4 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,37 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>  
> +  fsl,ssc-modfreq-hz:
> +    description:
> +      The values of modulation frequency (Hz unit) for each clock
> +      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
> +      dram_pll and video_pll).
> +    minItems: 1
> +    maxItems: 4

Please list the items. You rely here on this being in strict order, so
this should be explicit, instead of just "in example" in the
description.

items:
  - description: audio_pll1

> +
> +  fsl,ssc-modrate-percent:
> +    description:
> +      The percentage values of modulation rate for each clock
> +      supporting spread spectrum (i. e. audio_pll1, audio_pll2,
> +      dram_pll and video_pll).
> +    minItems: 1
> +    maxItems: 4

Ditto

> +
> +  fsl,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for each clock supporting spread
> +      spectrum (i. e. audio_pll1, audio_pll2, dram_pll and
> +      video_pll).

I guess here listing items might not work, so:

  The modulation techniques for each clock supporting spread
  spectrum, in this order: audio_pll1, audio_pll2, dram_pll and video_pll

Everything looks good for me, so with above changes:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

