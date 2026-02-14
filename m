Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CEB3B28D;
	Sat, 14 Feb 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101601; cv=none; b=ct1ZP4RS0Chs97LZ26rcTBm5iiW4hSJy5ZvvXDhdjhCSium3Kff8ST7R4Y8wa0yrYukX9FcPtm0rgQFJosHLXii74SUIwCCTnnoO39F0ey/RWzGhCNWH4xQbfhnp/FAo3zjl0SgHsQkwntcO0Ws0iPg6Bt/oB4wzAkmpZcEV67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101601; c=relaxed/simple;
	bh=uR9B4ebgelLywAoG/46ok9n3fnFnuoidR+Wpv1gOhNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmCuyMOlJHV8kWgXRjBnVUwLkEI/qqOtEMjc3fHavr90fpUIG8er6J5fvuBTa9rdN2ViVGV4oxjYpxPh8gi84cNYe1uLiiV+AiRs+vAMX7Cv42jXzLl4JeBy8k7p3VOI28Eu8rnHqUIAbNsGKZJ+mMix7nSLPTepK4igMVGRG7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9bDlOLd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9bDlOLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC9FC16AAE;
	Sat, 14 Feb 2026 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101600;
	bh=uR9B4ebgelLywAoG/46ok9n3fnFnuoidR+Wpv1gOhNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9bDlOLdPKAoVeoLZchi1xERAHSh/HMGPvw2WhoicijUrpcuTvj/Fjo35OWZJkku1
	 gWBZLG/B0nqvtsGp0DatuSJokeroE0I0qXddcdYamghyj7T/ljUwd2ZhTFuOqrE+m3
	 o6/V/X2jucd/a/5txApq7bCgHIkx+gnwSD3BdSR9ezFoAVyp3Gs3O9+AJnF4WHT2Q6
	 Lh0eAxiQ1yO01RKjyPWPAM9335XTKnbGxIlIu54m1GUy8BjcRru+riYQUsM8qpbYpq
	 uswaw2YEYBfIH7SFm0dCcCs07olVWlnn1fXiJZFwtLd42p+1aHlO45HMCK528WYZIX
	 Rih/3aZ24+SxQ==
Date: Sat, 14 Feb 2026 21:39:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harry Austen <hpausten@protonmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of
 user monitor interrupt
Message-ID: <20260214-daffy-roadrunner-of-inquire-babdce@quoll>
References: <20260214180933.42143-1-hpausten@protonmail.com>
 <20260214180933.42143-2-hpausten@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-2-hpausten@protonmail.com>

On Sat, Feb 14, 2026 at 06:10:16PM +0000, Harry Austen wrote:
> This Xilinx clocking wizard IP core outputs this interrupt signal to
> indicate when one of the four optional user clock inputs is either
> stopped, overruns, underruns or glitches.
> 
> This functionality was only added from version 6.0 onwards, so restrict
> it to particular compatible strings.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag

What exactly changed that you removed the tag? Rebase is not a reason.
You MUST be here specific about the reason, otherwise why would I like
to review if next time any rebase and slight rework will drop my tag?


> v2 -> v3: Add Krzysztof's R-b tag
> v1 -> v2: Fix binding errors by moving interrupts up front, restrict later
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> index b497c28e8094f..7688601f1f31b 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -38,6 +38,14 @@ properties:
>        - const: clk_in1
>        - const: s_axi_aclk
>  
> +  interrupts:
> +    items:
> +      - description: user clock monitor interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: monitor
> +
>    xlnx,static-config:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> @@ -66,12 +74,24 @@ required:
>    - xlnx,speed-grade
>    - xlnx,nr-outputs
>  
> +if:

Why isn't this in allOf? Code is fine, but why changing it?

Best regards,
Krzysztof

