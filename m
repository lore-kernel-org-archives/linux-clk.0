Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC13FECC;
	Sat, 11 Jan 2025 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588150; cv=none; b=NqhJYpzQXoJty7YZrNv1x/jbj251IbCZyZGyuuNjvgXvVmMoVyaE4+Kg7HhKwjPWP5iI3ROkK+wfRq9Rl+R/YaZTQvcx4/4VA2WDw+hlX/XH2crgUQPNz5BwjhVyyknJFm9uPs7MFVrEfupHqvXsNKl8xHR2yP45NF1IQIo9C3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588150; c=relaxed/simple;
	bh=b1v5az9Rhjck/8X+15gw7h4MM9uVSzGc2DvIDCHaoPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KALOvRMfj8MrEwuSgU1gvk4VIg7asArm7Mm95veKGBxELDaHxw2eIaRT9qmzbV5fTRA9m1f1kNmFy2mfW5wmjyJx01K+dnZL52MW88JD4OBIWkSMp24orYlBdVE6MGuNAk4a+mf/AbTMYVB1GtYWizkzm86x/g9EJi1Ft4AhYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoT8UlOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoT8UlOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB7C4CED2;
	Sat, 11 Jan 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736588150;
	bh=b1v5az9Rhjck/8X+15gw7h4MM9uVSzGc2DvIDCHaoPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoT8UlOqW/eF6WkeivwAzK7CEJSWobEBtU7lQ+uojeo0Z2P74DrATmYQCWCcWw3Sd
	 2uL1S2pZhBOTj1AlVj2S6jZixHaCRlJAy5y2uFldByYRPvg3MGsb4oOL0kg8pe68Uz
	 I9U8aFI8exnV1VohPv5WKaLtoo33kFFT74/HobjSMZWFCbyEtZh0sjdJ+2h6pubaE8
	 Y3sZgQFaPJU5a1AZYZ9kuEoTVTBqWKN/Mnia8GaOg+SzQaCYegvktDgJEaNtP7geZP
	 AUm9+vurZ213pryTKQsqR1rlGvlZ1mk7O8d9mdVfZvVcolDDnLWrIPNANmd31ZRpKf
	 IaHpXVsQPfKnw==
Date: Sat, 11 Jan 2025 10:35:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
Message-ID: <qz74fbq57yhhqywhge3fiqcbduias2hib7rmpyieoylass4ei6@tee6nwzl4lto>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>

On Thu, Jan 09, 2025 at 10:18:29PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

