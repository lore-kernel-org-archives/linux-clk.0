Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C843AEF4F;
	Thu, 14 May 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760728; cv=none; b=cZqUcWYmzJKHWXmuaONPQekEqm8M7pyHi63qP7Wm/PGyxMhsGBerP8jF7ThgWu0dU97SFtNBRjr56FvP37R+aGnNdIMf/b2nJBL4C4QqVq4kiKWc9Uq47C2Ztkmpl6GeTH4HGlV8aU3rT9RYbKRb/JEQIcz0nhxy5azOX9I4Uus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760728; c=relaxed/simple;
	bh=5iwiGUataS3Aet0+bjaNI17LShBzXko8CYOfIv+JMyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOTgde9HTcemKmV3ljt2JO76G9eKyG1B3hL76HgjVw68A+AzcVaqrthea3QmBE5vaOKnbbaymfSvKEifLc+y3j+knL53Npvk6FfBBt4XsZY1VM/SmwG6iREqY8T38+SK0kDRJQ3vY/c0+NINGkFJxjMslsDG7P9Z/I5R6XXIpV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhrkRwEI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhrkRwEI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2281CC2BCB8;
	Thu, 14 May 2026 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760727;
	bh=5iwiGUataS3Aet0+bjaNI17LShBzXko8CYOfIv+JMyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhrkRwEIKGVxHnNOX1IpNj3lYjD3G5R9c/M4IKBnRs9SXIa3yimiBl4Usy9CkmLIE
	 eIK4yLNCxe8Y3zq2WA1OE2+7R/LjmgbFGAs+FBJsS16WIbF2+b9S9bNYqVltl9ZPdB
	 sZi5cfI51dNYc43hmBfP+9S/PU+VjZy/fGDt2byt0cUj85Aezsx9E8ffn9xPPBW/jT
	 j5ewbNOIOxM1au2c6BvOH92j34X5yejU/rhNyfgY6cV4heLnaR/FZaGcRj0g5f0/GB
	 Us+LDjfssekZ+d0wHABJEDjndbeQx3pNQL23VsMTnsFceyBj0e5sex891rVLYO/G6H
	 cRzVl1pxkfRog==
Date: Thu, 14 May 2026 14:12:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v2 0/2] A proposal to add a gpio-locked fixed clock
 driver.
Message-ID: <20260514-stylish-naughty-orca-bfbf80@quoll>
References: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com>

On Sun, May 10, 2026 at 06:06:21PM +0000, Vyacheslav Yurkov wrote:
> A gpio-locked fixed clock aggregates one or more input clocks and/or one
> or more GPIOs. It's similar to a gated-fixed-clock, but GPIO direction is
> inverted. Consumers can use the output clock to wait until all input
> clocks are locked and only then initialize / access dependent peripherals.
> 
> The usage example for such a driver is when peripherals depend on PLLs in
> a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
> to check whether clock is actually usable. E.g. some of the IPs might not
> have a proper split between registers and IP core, which means that if an
> external clock and/or PLL lock is missing and one tries to access the 
> registers, the response never comes, thus the CPU stalls.
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
> Changes in v2:
> - Renamed to clk-gpio-locked to express intent.
> - Provide enable() / is_enabled() operations so the clock behaves as
>   expected
> - Fixed DTS errors / warnings
> - Link to v1: https://lore.kernel.org/r/20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com
> 
> ---

Please format your submission properly - read DT bindings submitting
patches, add proper blank lines in the schema, use generic node names so
that we can avoid commenting trivialities.

Best regards,
Krzysztof

