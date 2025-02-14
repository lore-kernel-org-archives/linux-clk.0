Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4022577E;
	Fri, 14 Feb 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739521812; cv=none; b=BiB3w+17EU/KeMqOHlIRD9xfSgEzrnfTwhYpGBExxWu/b3BEW1RtnNFjP91mNpU48/MJB0KoSHVcaFScHmnsk4oJjPzVBIapsh4sKEYB3kHyrP51AIJScWorqfM4lHsmQWRXWIxJe3oVH3nr8a2dG0AuNEOWPxrx191q0nXSEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739521812; c=relaxed/simple;
	bh=9vpw9wqF0isVUCw/cCYZQrnEEAuV0YY5bi00g2AerzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=od15b3Wss9zeNIUrhWRGVyyFRIW2Uy5MeRJQqR+7IdhMIAu+MGg6mn1U6pVMl6I7x6XQhzXGYRVa3rKI4TahaeOqUPk4vFcDwokLTD0WEbCVSW6ttrROhhiFgKn3+WPwCSqwg87wadwxi2rugnkd2s/j3yQmrlj0xTL3qyOK79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl8eQtgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl8eQtgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0DFC4CED1;
	Fri, 14 Feb 2025 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521812;
	bh=9vpw9wqF0isVUCw/cCYZQrnEEAuV0YY5bi00g2AerzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gl8eQtgHTOlrpuTggu5UgcbLRTiadF/OLxB8aK6YmTElWRvYKxCWDNQabIQ6UBP3M
	 uMESjnjVa7CiPqqL5yRfEQLftzJ4wrHe0oMl10kLPpBDF5sW6r8sDWli5WR5yCuo7b
	 w/5cvnWhOtyCFTbfIlZWSGr0mzULCVaDLKaO1I3dyEx38V+MLNyBR/QfuU/shxvsg4
	 UMxvgCb08tbRUj2Rrx9EX5sYEP3mvrOlQ3VGS5A5t+UwrpR57NcLHsKGjtsWrQoqFz
	 aPUek39qgWeoX3kV0ddSogfiH3nO+mACpVe15CaMQgQ+aLjrRCQMGvAKkJWq++ZgDY
	 2SBhruRCgP7cA==
Date: Fri, 14 Feb 2025 09:30:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add
 missing compatibles
Message-ID: <20250214-helpful-modest-poodle-29fad1@krzk-bin>
References: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>

On Thu, Feb 13, 2025 at 10:26:34AM +0100, Wolfram Sang wrote:
> The driver support more SoCs. Add the missing ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

