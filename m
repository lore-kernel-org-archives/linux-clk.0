Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387860;
	b=h+PvD5PF7NAIZCvvVL8BEilZxsU4l95RxiCaJEwqMjP3s6QFXNqRm+IgAQtcWrd6XRHK
	 gqprVRbjRNAEPSpWLv8THASPqvqgyfdo6MI0BzuVrZO65vRxLQa8j5KuClKA+lagwiwrg
	 fhVv4WG4/DFdT9l12QHv8sa/0izHd0TQhs7Qm2JhYKJ0naJWT8cO8C4eIRPDZ8H7SMvYR
	 OhaqlTeaDHT5+WBwWXlXAUMJ6wJx6w70bcYiHGIzty75P3/Pio9OXFkQr4hm0dx+J8C6o
	 7CDJZa0NflA5h5cL/pIW8RNhJUW0PK1bvC3b90l/grdedD9KJ0p7Bd+4j8QpFJSyQkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387860;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WDxhkF33TpclfX5h060G3+KBXmy0Dwtz0cCnAQsQB6c=;
	b=of5G8NWZfaGnRRakg3Si9RhBthcCpRC8AXGa9QMvUwarcWGLTgfs7/Mmc2sSVkXBz7N+
	 aZTXfXAVtQT4k3Tyr+NNH1m/LnjYsUQc8y4Y2BiOi7S5xT1KcI028B9WGKeSn7GY3shXL
	 h+W1oOdnOd7muvIQWCMegfN2NiKRTZOyGH5RLHB+5QQ0pv2+Apmt+WlyAcMAqb/jKyQsr
	 W+EqDrUO8Z81JwhxcSVR7UFFkaGFzHqsJd3g+1n/KcPECn5h9ZmqnIDm+PsnbCOpbAh+/
	 UMhJT8dhieAhzC166sryc/IKJn56pHEAMhg1wF+iAk1Te7A0wUfGl80ES7xFnCGw4xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KhwzlGAA;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4E606A338;
	Sun, 22 Nov 2026 22:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD4E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KhwzlGAA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WDxhkF33TpclfX5h060G3+KBXmy0Dwtz0cCnAQsQB6c=; b=KhwzlGAAxWJcLMcTRnCExkVRgc
	njifOQ+uyKTCfhVBAeTjEAjUALzZR3ZUTU0Snq3xkM9OFaJXVTaCx4LrrK5oqreJfpxFRfKmrtPWr
	0wVpeV8DXCjByDy/25NfAsN5asixOvb3IaWqVE7wLDqUXhL9aKcmceoBRJ+mlhhG7/TMY1vke/mLp
	SgsnzAeF5cr1TEe+s5zQytZHpYTmXEFH5x/jcUYhtR0mx5tG+IkV9H+uV2IqEzejbz+qq+3MkTdDF
	lDTTacG2PdBiAYQsVVlwmIAIeEiAJA3LezixGQoYSvTom/O8FbL4wKM12stuXj0ocrx1C/JpPhUaQ
	Liteyshg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	YouMin Chen <cym@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH] clk: rockchip: rk3576: create proper platform device
Date: Sun, 22 Nov 2026 23:50:29 +0100
Message-ID: <179538782489.3150822.15047892656895127141.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
References: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
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
Content-Transfer-Encoding: 8bit


On Thu, 12 Nov 2026 03:36:40 +0100, Sebastian Reichel wrote:
> When RK3576 clock controller support was upstreamed, it copied the
> vendor kernel's logic. That code makes no sense as it contains a
> bunch of unused code (clk_rk3576_probe is never called as the DT
> node is already initialized; if it would be called, the clock tree
> would be registered twice).
> 
> Let's switch the driver to use the same style as RK3588: Continue to
> initialize the clock tree early via rk3576_clk_init executed by
> CLK_OF_DECLARE_DRIVER before the device model is initialized, but
> don't mark the DT node as processed.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3576: create proper platform device
      commit: e8a4084724e114295aa3a077d9458726e7ef4e90

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
