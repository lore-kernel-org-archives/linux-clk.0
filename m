Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402233A02B
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580063; cv=none; b=VgDQFt6x5mTJ/oq+DaZm8JQSISY8Hf0txmz08PyAqeU+0D6IcIV6Z+pGsowNMKtjgK/qoi/XCr74n5L9WehbGmq1YjxRAHtsn7Nky/qH4dIIkZGjWyMmQ3AJaPIEH14F2o7K5TIiv4o8bB1sW7KI4jzUKXn2xg/WtIMS9R8iB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580063; c=relaxed/simple;
	bh=YHT6a7gBsHxhI4V4Dok/QsWiB9kb5MK9sR+9lhnmz1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cv3PSfPInVze5bkxshcLwhQQ6y0Dz5GcWUez6M42fhYM7RmOvkFHzcMHXIIHtmQTbh6qEzU1frtr+1SW6awYzOUghIYClXpwbjax0wuoWBLPkui4N/pm6MMThwXg5fEpVH27VgPBUybUnIxJoDbXXyPsM1cfQaFHPBh9Sl8zx1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLCUDEye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLCUDEye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBA01F000FF;
	Mon, 28 Sep 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790580061;
	bh=XcrdfKU3A6deusJ8ZYeLfo9c3Lg+3v5qDALcMQfUIoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XLCUDEyeTn4Hv8mdCR0sHt1R4Gmshkv4pZJ2UMTvvcYFJf0K+s/oj0Yl7jTPBfNrC
	 s0zhr3vkhy00dcZ351Syb7SuerqvlFP8DrzlLHT32Lica2cS2v/aO+W+pmX91Ktwl/
	 oYn7QJ8RBZZFLm4VMM73vz9XY3c1FFqORe8IAdqucIonD85iZwT0//4xQvy/T4o5G6
	 9X6Ie5/e2JlN44Ensp2m+lJ6i2g8rsrr1A+XuusSLImkPgrna3d/6gtLrZD3f8uNz3
	 41B9x98r70haNzgYdil182+20AJLUNGXQREi+F7hGV7HrOaqe9Q2yPILTVV3Uwkmkk
	 YV/h9hK9/4DQQ==
Date: Mon, 28 Sep 2026 10:20:56 +0300
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Kees Cook <kees@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
Message-ID: <p4mkawney7xtb2sghsyss3zgq53gm6a2aqtylc6obnuohdkkti@rin3eqvadu5h>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>

On Fri, Aug 21, 2026 at 02:44:28PM +0200, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to clk-microchip, thanks!
