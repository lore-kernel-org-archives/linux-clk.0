Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735688;
	b=imFeUDIHSzFUPbWMB0ZQQziBQ7TJwI+/oAIb1L9pNZ52n0CByJ/JU/qu0KCV6vsgUpnm
	 PPj38ymJDSilOr+1iRLoTwlCmzDsVyJRuHUc6R0zhV2ecfUtQ3Wt0bshuGtQpwos9waO9
	 58Rdtjhh3mTvxEDKHP9bqBNN3UO5UGqgyoxGeKJFh0OfyKwj3udjsNMysEgwP8KTc7+Cw
	 1e3Brezf/uuH+B8mLgGb3I+5rGbHK5Lwy8CKiGiEsPxNVp639L8RS+69OHajXL00e1qMQ
	 l/snHdRt5Q7VouDVfczmiX/D8+I3c/2S2DEsNHc+9SuOqzIpg/3ayzLgtgJbqGfBa6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735688;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=RX9M2Q9yHe35cQMeMTw9O3Neu5+DoenTf9tNEWOOjXg=;
	b=O0lI+DEU/DUKI982P3ggmOweyGKUGYh459wtokRLFvjNLrzkffKqm4hCZsjPfTQrqU4T
	 PrAdSuzcD4pAS1RELaKv7mh5tmYtHJ8x1eRwoiTdPv4H3yx+frKuCqFib4B8k7soXobAD
	 unJDWO+M/qaAcByH1mcnYBI3sVaVrK8yF21kdmui5WPajzB8taa9UR+s6vwc9QBjfG87r
	 WGDdilR7dZqc7UkC8W8wnAst8bFggxgVG/tC/c0dUp1pTJEsFvawbDJstBvlBzTo1FOC/
	 YhOoQEH0grbfbdmb6ZKIE10WLtU6cUQQ4L8AQa9SLhcVIQRweQaPHd9XjH2Odq5yQ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahOqZNj9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872B606A31D;
	Sun, 15 Nov 2026 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahOqZNj9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2BE1F000C4;
	Sun, 15 Nov 2026 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735687;
	bh=RX9M2Q9yHe35cQMeMTw9O3Neu5+DoenTf9tNEWOOjXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ahOqZNj9pHkSthlPWL8OW7Aua6Zten/GwqyJ51FQc4krJQmLsf5YcdAdb344vBMFG
	 br0JsDqDkTEHpDedsRkPDwFRIyQtnkBdEHMykVmgywDidDfX1jOJ0O/uMiMSqQROoI
	 kqHtQJzDtM1T0ec8M73V41Ag+ObF51sAO+CJaiifEpdWSgL3Wj1sBvtUdfdaYDzPJV
	 wEzAOfqEXdWySoa/fLIOs2Xef9z75uh5WnLcn2k2PVhgRkceJC5GCtHrCF0nWngSrp
	 1OeYGrrDFXJ8hXdvp1PFygJ81LX6RMrtmml9ea3MMAEcKGpfohutqUZHuvzoSo+qkC
	 rm7cZf8mf4qGw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
References: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h6: Keep both parents running while
 switching VP9 clock
Message-Id: <179473568594.3056166.4191724693999844076.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 17:41:25 +0800
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

On Tue, 10 Nov 2026 17:39:04 +0100, Jernej Skrabec wrote:
> The VP9 clock mux only switches while both parents are running. Its
> reset default parent is pll-ve, which is off at boot. When the Hantro
> driver sets the clock rate to 300 MHz, the clock gets reparented to
> pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
> enabled for the video engine. Until then, the VP9 decoder has no clock
> and every frame times out.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
      https://git.kernel.org/sunxi/linux/c/b6844de23cd2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

