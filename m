Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299381AE003;
	Mon, 23 Dec 2024 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966407; cv=none; b=L1oWSmi7tmjsC3PktCuoGZZeXtqSSkYzQGSNrXbgUyO+vtIKnF5BTwB6fr9xS9S8iBmQbW6xP+BEvOvD9OYwCO1oRNkRuLTn7xNGqP6FEYdeQ7s+JKJLxmgTFbjskYu4iw4zPeR7zR0Aynub98UUQuXBaZHkNdkMq4Vd9XiyvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966407; c=relaxed/simple;
	bh=gkto7QS9LdR/GtBNVxViKH+qvPII1SzIpBgCHoMbph0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai/sBdzJCV7odaFFmOMB5qOSF00E2CxpzJylJoJsh6bVTlbLyXRXGO1sxpddJld9bdRPsORVb5UHOSN5+xBKNFvce49ulzmWHXuQh8yIxP7g5gKfR4mvdBzmnpEGux2ElMOuZtJ/WrzzKdaSr/UDTPVCM+t7ula/aYkL/eHstp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDhfQCeq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDhfQCeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FD8C4CED4;
	Mon, 23 Dec 2024 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966406;
	bh=gkto7QS9LdR/GtBNVxViKH+qvPII1SzIpBgCHoMbph0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDhfQCeq3nB0Ax3J8VoywUU9YTkgTAltQ5mzmjp+X6GheNrZIxObQUslcfQJi3YLF
	 YrhJzATvmcBHd4FTqS9NfcXfxGHlxrJ69Vl5VQrBlGrkot2bN2Ir+ZZZBcxaeXRoYf
	 AD1WJkR88TftMaycZuzngqFpuvWDCzoQLAWtAR9cz0Ew0wwcM2VkQw/0yniiN3E1rV
	 sCqnbPSP6qteqTNCamWf7RB9QZ0r75y8TDmZAWBU1fxIGzw2GhT2t7GyYui7YsXmAR
	 oaRfozW+g+4JC5wP1K5YH/6REV4b/z8GGMErHnJi2LAyOBn8oJA9gkPnC9lkVNptTH
	 WE+xqLNm1UOmw==
Date: Mon, 23 Dec 2024 16:06:44 +0100
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
Subject: Re: [PATCH v6 12/18] dt-bindings: clock: imx8m-clock: add PLLs
Message-ID: <ftlezlv6cjgtj7qigebbkqhfsdhrxbde7x7vnemvuag5cs74v3@ww3t3zgs7c7y>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
 <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241222170534.3621453-13-dario.binacchi@amarulasolutions.com>

On Sun, Dec 22, 2024 at 06:04:27PM +0100, Dario Binacchi wrote:
> Though adding the PLLs to clocks and clock-names properties will break
> the ABI, it is required to accurately describe the hardware. Indeed,
> the Clock Control Module (CCM) receives clocks from the PLLs and
> oscillators and generates clocks for on-chip peripherals.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - New

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

