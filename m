Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243315;
	b=m/NRsFOOS8Yz1kFEWxQ0o03Fi7jzMT90OhBsSShXyCCHtM0UjM68gwQ5kLwBWyDGXPV9
	 w4pGmfvZqA7CI2Kacs/P+kUY2ttCAHwvUJZFqqLnqblT5hq4JtRSVmIpWIptRl67LQJWQ
	 w76e4GFApNcbbCZo9YPGtpkUx0PEIlnN5hN4tgpN0tEoxgUvxNh8F4cOgGWQoFO6SCtPi
	 bW7raoEIkfOqntiNCwkeHJEBJ+asgu1D2R4vUIeSorO8CmmyTYUjKPSZmIeSM8DRo1e55
	 sV2YYQyqRpinZL3POKx+rFUHuWFdyR/JoZxvIsNTVh/Oj98sbzcVvcFIFjwQVhSKg4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243315;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=LN7OfULWwyuiTNDpJx71gHGXtOMINgXhvBjanVT0HKo=;
	b=ciRb0XDKVc+Pqdry1HCoKtYnyaA86slPbYPDmod7lqHsVimVjr++FY+3V6Rv6zbIeuNI
	 721wWlnJMNiaXYQUdqmackPi3qGFMIgk6FvqwcmjyyrGrsAIVO0LS+lqYrROmOs+3k9xL
	 kUi14MkDkMuxmKA8Fdfk/Uyu3cE+3H4gQx61ZBcOs7Qr+py/OSWnBbe7b5IjkO3p4v3X1
	 o+FTHrqmTqy5D8omndpGMdjI0xx8EJX2iB8YQatiK0CZ0zUNTJkgkVgX3Pz/P0J7KgxgN
	 XVil0YEKXU1o8yg0RM5WDZIh514ih6/7nSBuexZhmNKMYSno5V0eQQ6jo7Db3fMMnLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BN6v2nd9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656660A2623;
	Mon,  9 Nov 2026 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BN6v2nd9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2881F008BD;
	Mon,  9 Nov 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243315;
	bh=LN7OfULWwyuiTNDpJx71gHGXtOMINgXhvBjanVT0HKo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BN6v2nd9yb9AboaWPxCoS6KZKzGGNZ7nOKlwF+761IoJ9vNo1e7/YJAKzpidP5rJG
	 psZsEfO2xg1d661Xm1ufeEwaYLhE2lTWWuhdmEYfEe4qA2LY4c5C9yIvn3VNmmijBb
	 c5qduoFYJ3Z82DLBioBD6fw9qw7Cdf/UXy8lSlTm6oJ/LzEPIPYBvaJX/6EQaLLJQd
	 V98yUgcmcBwwLXNlaDo+k4RkwxpxOaXR2Ge5fv7/uDM80kLCG+HpQChH/k2drcjdTz
	 UiqG4PHwsFKwJvaGynZjW7EOT0Q5UBq177/DWLGSjsYvj3PfL9fUJlGngQCb1xDHSw
	 17jlWOlzuHdZg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261104185027.883011-1-jernej.skrabec@gmail.com>
References: <20261104185027.883011-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: Let the SPDIF clock set the audio
 PLL rate
Message-Id: <179424331293.1081044.6611467485377241437.b4-ty@kernel.org>
Date: Tue, 10 Nov 2026 00:55:12 +0800
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 04 Nov 2026 19:50:27 +0100, Jernej Skrabec wrote:
> Unlike the I2S clocks, the SPDIF clock can't change the audio PLL rate,
> so it can only divide down the rate the PLL already runs at. That covers
> only one of the 44.1 kHz and 48 kHz sample rate families, and the other
> one is sent at the wrong rate.
> 
> Propagate rate changes to the parent, like the I2S clocks do.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: h6: Let the SPDIF clock set the audio PLL rate
      https://git.kernel.org/sunxi/linux/c/280af24c8605

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

