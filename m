Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744584;
	b=VY1JzArXO94TKAIqhzVwwNt4CWj7jU+kDTVcX+yrIAyfxpIPUYoCrOi0li4JUYlq7KPD
	 1j0K/GdPeD+VVvmc5DXuqEs/MaF1vhb4z2wq+QyU2PN7J3Q1HKw21ETGtAF8Gjmhop1Dm
	 7O54DGgoFdXrnavmB3UfvGHBvor7ddWJR0GhhkrSQ7qG2E/X+eA/77Anr+rj/6SsuZ6w+
	 9TVkKnzAKndnXBQHg29tk3NvG9wXA9v2kCiN3eaoxa27NpNFhN8/qgLzPX8PGQUHnYByc
	 nI0A2InEyEgxLJZltX7OkVCtsoxrBVhr0QWsxMkXeo0ftqvNSwx/7DjsYMZaraPt27w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744584;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=2xp0eogThoE+rovAfkLgs59Clib+FqRuadwEreWDQ+Y=;
	b=YChH0RsrgoyY9e4/zO+vU5u+GlveBrtryONU/NwEQwEYhS0NteM/D3L0Da693LIkrMH4
	 u0C4NoodygM15x235zaWeEy1rphSkJhrGQJyeiOYQyCLieH2l2dVBDZaGz/Y7mu0BW+9b
	 /CepS+GhuhPbQGhmLMD2if95KseZ3VSDcQBAp0r2yM6HwWsuTLnOX3ofi/XLJJtcF4mO6
	 yYcv64ufneUap1L41C0vxBHSbwvnw/tJIRImVmyWEpcngnSbug4ELqxlyLuDE6+AnZmkI
	 MiE0CnTnK7aHyALXkLX4d5q4Z4CWvnuURXxNSNkvPz5VQ1hOOpcQ1SNE8xbvgxjJIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIAb3eAK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F9606A31A;
	Sun, 15 Nov 2026 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIAb3eAK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6001F000C4;
	Sun, 15 Nov 2026 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744584;
	bh=2xp0eogThoE+rovAfkLgs59Clib+FqRuadwEreWDQ+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DIAb3eAKgNniFbOJwEDkQkBz9z+WB2l6R5hN5iFMBnAOW9aV9DDBeCS8xb+bsLzLG
	 01csHw3w6kebtIozMHxRp4NBkp8f/r2SWC/YNRJz0Ehnv9z49A+UI6vae7UGHr1wFt
	 YchQYn2wB/ghIVce8v6DroPEUZzydvs0Hgc+iVpE7Ppkr7RtG4dKKcil/Wf9hntH48
	 RPI0BTeehAEno6IKUDAOc18O/aeDfYArcbemwj2SuuQZ4Pq6MP3+ciMpg9dB5ch6D5
	 X5HR0U3J0ybHdS3sLZxNFBatl0PnR0m85if88FfZphFen6Qdaa0IIZdTvx9Li3dPJc
	 eWZ9I+OMqzUNg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Enzo Adriano <enzo.adriano.code@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
Message-Id: <179474458009.3130971.4987693724545718972.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:40 +0800
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

On Wed, 30 Sep 2026 01:26:07 +0800, Junhui Liu wrote:
> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture is derived from the previous
> A523 design, with the MCU_CCU removed and the clock tree extended for
> the additional functional blocks found on the A733.
> 
> The A733 introduces a "pll-ref" clock that normalizes the physical
> oscillator frequency, which can be 19.2MHz, 24MHz, or 26MHz, into a
> consistent 24MHz reference for the PLL clock tree.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/8] dt-bindings: clk: sun60i-a733-ccu: Add Allwinner A733 support
      https://git.kernel.org/sunxi/linux/c/39e4303e8bbc
[2/8] clk: sunxi-ng: sdm: Add dual patterns support
      https://git.kernel.org/sunxi/linux/c/b213bddd53ab
[3/8] clk: sunxi-ng: a733: Add PRCM CCU
      https://git.kernel.org/sunxi/linux/c/2a5ae6df088b
[4/8] clk: sunxi-ng: a733: Add PLL clocks support
      https://git.kernel.org/sunxi/linux/c/93c637ce9f0a
[5/8] clk: sunxi-ng: a733: Add bus clocks support
      https://git.kernel.org/sunxi/linux/c/103168ac6eec
[6/8] clk: sunxi-ng: a733: Add mod clocks support
      https://git.kernel.org/sunxi/linux/c/4646c19620e6
[7/8] clk: sunxi-ng: a733: Add bus clock gates
      https://git.kernel.org/sunxi/linux/c/ed757071ac3d
[8/8] clk: sunxi-ng: a733: Add reset lines
      https://git.kernel.org/sunxi/linux/c/308e4087bbda

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

