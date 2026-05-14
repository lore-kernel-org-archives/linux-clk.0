Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5101E393DDA;
	Thu, 14 May 2026 12:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760670; cv=none; b=WRRICHBIY1zWTq0SMyOsGR6gld33sdiffXndc9IZ/lBjbQ2ysP4LZtInosQO6Rhh2fSweurTDMciMx9MOt4yv+UTgKHraO3iomwTCR9MnT6ADLMGFdTOjLjn63//hgFejBlczE4eN5EV371+I35bSm3kPERZmU+o6YbdZvr0hFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760670; c=relaxed/simple;
	bh=9nW2QQRmWeZRagTwX8ss7NBX+bqZPltLBWhvDlxyi+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3qYPouGe7GfyDrAPg/YAioP9L8oB5GBvbkc2Xhm8nA8NeNw9lyFuJ4J06ue+/auR956u5pipkYomK3F4KP6FDxNLa+WOl/ep+JZtCKcDtLfaWKwakzfk5ruFjLhBEaLPIxU6J644oEa5Q3snFXIeUiuFGE+2svQXgswi+F82mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax0GzLvh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax0GzLvh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582CFC2BCB3;
	Thu, 14 May 2026 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760669;
	bh=9nW2QQRmWeZRagTwX8ss7NBX+bqZPltLBWhvDlxyi+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ax0GzLvh6WgDzyeWnbb67Ntz9JpzVgVWcK3nMg6sK1ECQXCeqTCJ3DzmUcocAJv9E
	 q8dJ9+SaX+/zzVsZiJY5o5tE9htpPikeTsrOPe5nrHUY1Pt/dqQpAkarv380bRjeeW
	 3Cf2kpg71PajVG4lQN4DlQC1NMg3Q6z85KHzvyCiZf1WDenUhdO6lRx9itQATq81NR
	 qCfxjln7nVv3FayNBdIjvEq4rnjegbcX3llKBOLLRw5XTHotspTesSmNTS14QTr75e
	 3oxu1IlfDqbmW4HGtq35l+F7A/szUfZ740oDduNDgaqrJASak51huIMAT01BXvDKOB
	 GbZnnqHY+2kLg==
Date: Thu, 14 May 2026 14:11:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add GPIO locked fixed clock
Message-ID: <20260514-authentic-meticulous-baboon-a1eeee@quoll>
References: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>
 <20260510-feature-clock-guard-v2-2-6c25458d5340@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260510-feature-clock-guard-v2-2-6c25458d5340@bruker.com>

On Sun, May 10, 2026 at 06:06:23PM +0000, Vyacheslav Yurkov wrote:
> Describe device tree binding for a fixed clock, which state can only be
> determined by the external GPIO. It's similar to gated-fixed-clock, but
> the GPIO direction is inverted.

v1 comments - do not ask us to repeat them.

"Please explain how I would identify this h/w."

> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> new file mode 100644
> index 000000000000..e0256bbd441d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO Locked Fixed Clock
> +
> +maintainers:
> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> +
> +description: |
> +  Clock controller that aggregates input clocks and/or GPIO
> +  signals and exposes them as a single clock output.

So same comments as before. We gave you multiple comments, multiple
expectations.

I see here no real hardware explanation and I asked for it more than
ONCE.

Best regards,
Krzysztof

