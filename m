Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08301375F93;
	Fri,  6 Mar 2026 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784756; cv=none; b=mMrcyBDWIS4fcdu4XGbzFV60OGqsYHef02DJbhlJj2gIeKq5AK2eFwI75NFuB0NwpQBpglvqlFKCqjRi30nER9jqaJEj2R45w1phEN8z58wOfp8wCktCHzMH3ZZ1saEp+g6FrjQsco8OR3FIONaOzwZ/Nr8Ciz7esKR0OEu5Z/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784756; c=relaxed/simple;
	bh=h+z249gV6PAJH9owWYSdR8qaCEpXc1fgT56hlLiF91g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJLr68eghadw/FpWBVjOzBcZcF7PVRR/f2Bn4pVvxfKmegNbolmSlRbu/qE4z8wT8yXIcre5/FNm8uvvtiBp7TZno2xLjiMH94boDyJKzkvv0Rtvfkkzw4g42dygJ73z2x8M72XEXVk//NCSDqjBk3x8N/0cNvSMncdfgBDqsCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/MtQQK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/MtQQK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C86C4CEF7;
	Fri,  6 Mar 2026 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784755;
	bh=h+z249gV6PAJH9owWYSdR8qaCEpXc1fgT56hlLiF91g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/MtQQK35+UL1G4MEUOMiP/QhBn6qCoG3+kg/aoqkPqouo2jWMblRH/6EOGkkbYFB
	 qdR3LE7bD2m0x6N/IjNNV05sB4U9aACZi0azgBxYIaPgNpRSHbeYJpSJLZdOIM29tl
	 t+4vnDaYJmATS0YHs8zKjM2wIHqv/aqKTPkcFMwMGiVF37DKcGyyfwbKDeBvn94Rpy
	 wtw9d7Lhs7/cOjx9iHwkfFNpXyyTewj7qTiQYDSGpXnB3g01YZa8evSzIDQR6VNu2w
	 uY3OHPQWnRNQ7d1HveUYrcvaXnztZg+6vjXhgiQMN1lXzgCoP61/p8mXGhN/QpAH0J
	 KHenjzGkj7y1g==
Date: Fri, 6 Mar 2026 09:12:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
Message-ID: <20260306-monumental-nuthatch-from-avalon-bf108b@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305074328.639993-3-jian.hu@amlogic.com>

On Thu, Mar 05, 2026 at 03:43:26PM +0800, Jian Hu wrote:
> The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> Add it to enable proper clock parent configuration for these peripherals.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-peripherals-clkc.yaml       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> index 55bb73707d58..27cc1f331587 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
> @@ -24,7 +24,7 @@ properties:
>      const: 1
>  
>    clocks:
> -    minItems: 14
> +    minItems: 15
>      items:
>        - description: input oscillator
>        - description: input sys clk
> @@ -40,12 +40,13 @@ properties:
>        - description: input gp1 pll
>        - description: input mpll1
>        - description: input mpll2
> +      - description: input mpll3

Nah, ABI break. You add it to the end of the list or provide arguments
on ABI impact.

Best regards,
Krzysztof

