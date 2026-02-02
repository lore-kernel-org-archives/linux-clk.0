Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07311369986;
	Mon,  2 Feb 2026 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040767; cv=none; b=PbTgRJ1CSCspqvkLzuF947FFF4cyDbskZa/11C19siQn+nlqBfwi6J24erZ3POmM0vB1wuIx8epqvDOySHJpVsJSGvcjdtQzixuinMxL6r6m+hxyIU8SnxFnbcvJsfD2UIkUKNt1SAVvmElgT+ee7fI0KfBzbZGY+QNY6MHrMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040767; c=relaxed/simple;
	bh=RjiQcZo3siwt/g6vfVvfP7zHHenObl9EeExQ2+UyGAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOxaey5naa46KoKmuvI5UimqdUXiqfZp0fkSP023iUwbOJnRVe7rxUswoaM3HWQofq7EI9F3WuEa4nWHHhiM2VDoTgUjGOEfx0qIT5AWgPFklx+ZA5fdRUGZ1zwfLmjk/Hqg5ojExWzDMdHM8LtBviBN0qXMPC+EAmImIKqCIPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=srHzf0q2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="srHzf0q2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6WGi/A54YejTHQzh/fZBfu89v313LcQrf2k4eo/rCf0=; b=srHzf0q28APUNFsImOjs13e8c/
	eB59sWM2qyWGTXxakwYOFsU6ixk6hzbPiDrvMm1542ZLjns1VLGggDMDnOGOYw0ofoQLMf30sHCZj
	leot7h8AD9/2eVqo0T1YGoAU630yDWtkBy8hivB2ME79j/h3cyMmk5ljrw8TMfQ2rURs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuSW-005pd1-JZ; Mon, 02 Feb 2026 14:59:20 +0100
Date: Mon, 2 Feb 2026 14:59:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ryan.wanner@microchip.com
Subject: Re: [PATCH 4/5] ARM: dts: microchip: sam9x7: Remove the tx_clk from
 gmac node
Message-ID: <87e0938c-20da-48bc-9bb7-8ca963800dae@lunn.ch>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
 <20260202104025.3781-5-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202104025.3781-5-mihai.sain@microchip.com>

On Mon, Feb 02, 2026 at 12:40:24PM +0200, Mihai Sain wrote:
> The gmac controller on sam9x7 has no internal pll to generate
> the 125MHz clock source for rgmii mode.
> This clock is generated on external board by eth-phy or
> clock oscillator.
> This change drops the tx_clk entry from gmac node.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index 46dacbbd201d..da94865c57e9 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -991,7 +991,7 @@ gmac: ethernet@f802c000 {
>  				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
>  				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
>  			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
> -			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
> +			clock-names = "hclk", "pclk", "tsu_clk";

You drop a clock name, but not a clock?

    Andrew
