Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731593;
	b=WrwMW9OsrSGS03zIfI6RUQVKWmLCezH6yGuU96lblsivDyuieotiAa7oiYLF4dx9xiS0
	 Vpppf0FAouieup7Kd2SerKhhBDruEbgKFtUcP1fNQUdJpaO/QEPW3Jy5gA+LXT+3/4mR+
	 LJsm9h/pWRDX/YDRzr9480wV0NXRkA9HBT+/RDg12Ee20Lz1NiBVuCRFKk60U/ofwKCrf
	 fXA9G4lC/Zy8gdOnJnhfpuVR+KRM+ynCPiG3ZaeUcqb7eB+JHkxklAGjTwFjG5pAjPVvX
	 A6xqP+X/gVXT1JCFhJXf9IYpQR7uHexv6eGnV2xNL44UmSVUIoVUG+iDObe0Yr7pBbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731593;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=0a7XVhGn17V8TFpaVOhUo8oPFMgmTGrO/81W2zXpJmE=;
	b=wVe7x0UzaI4NS4T3aJ4WkjyoxwjYoGUK/521d5prkqBkbB9KozkN3RYEunGbWE852/Fp
	 YvnBAasSGCuNbdayEuRps/ARDgfhQFE1s6BFWWbfuQ4bXau8ZXQZBrqlXNNSKjc9XRDUv
	 wCghfq7y4+A3j+dC6xSBZR6HvXIZ+VBRMxo8J2cN1NVqcIaoZa7rijSek6pcumXv9Uyql
	 tS6qpy2lS0bkaGzjl6HMS70il6d0JUlKAPVnr2LehgGmeCwvTwRMjIln06hK1XI8QgTj2
	 7MDK7hSmvQ6Jrk1T1ZKUhj1i8siFMeek2o9Hw5nTjO5PoWb/N5s5uRODyRBLXOT1cBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgo3lIre;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A182606A31D;
	Sun, 15 Nov 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgo3lIre
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D672E1F000C4;
	Sun, 15 Nov 2026 08:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794731593;
	bh=0a7XVhGn17V8TFpaVOhUo8oPFMgmTGrO/81W2zXpJmE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Dgo3lIre3q7XG6O5LKbYyGKtZBbPw8+BzJSBCXZp8MBIns/SWJ3FWeI64HN5r6/jS
	 iNPy6I3xlxW34GoIcGrNNLDyUhHtxXLec4ezJecpVaiEl/p5sRqN8RT4bNF4nuvnof
	 6kWmkGxcIsuVD2HFa1JJRLKwg7lMevlGAIPNcC74W3tY+2NcqR/YsNOQqrEkl3/7CS
	 3ZhQ9c1gBvzCSOBmHFEltL85e8sjBvopTzy2pAHBP/LAUw+vap/8EIWTZsFEx755vi
	 5zBqy92Rqdl982HJiT5XQou01qVQF+yJRqYExa7NyDN+nlSepY8/Eh/vyBXc+iiamH
	 M+mGmHuW1mbpA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Ripard <mripard@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>, 
 linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate
 calculations
Message-Id: <179473159063.3023207.9708704432594076650.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 16:33:10 +0800
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

On Sun, 01 Nov 2026 21:33:36 +0100, Romain TISSERAND wrote:
> The N-K-M rate code computes parent * n * k / m in an unsigned long,
> which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.
> 
> On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
> M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
> 4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
> picks these factors for a 288 MHz request, and clk_get_rate() reports
> 287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
> ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
> 594 Mbit/s instead of 288 and the picture broke up.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/1] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
      https://git.kernel.org/sunxi/linux/c/e9d9dae0d248

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

