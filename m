Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571409;
	b=m2omQAVr4PMbVS0d4g3chRXHiLs9kpxBV9fWVlQhqXP7S+Hm3mn7a/tz7jedgtENuRL2
	 aG3ltaLcslzHrvOZpW+Iaif5ysch6oFCqRTVgkcpkK7QSR3KEH6gZ1SxGPa0nHkCgv14w
	 qsi4IAfG8mzUgMEp5zZEHCmTX/FZBrAY0jMUH8P00Lvi75aNx9l6fll/QqWga+QwK2ffn
	 IX4jIKpRv/tiamOFq14Qrn9dJ8n1JMvbcqatp8SUfziEvY1G6ZbaBIFg/NtDKXrytOG1u
	 qWqAdU+CsQOjVTnQycBw9VzpfhVcdmZ17M2vFomErT+G2vANoGtxm+cw6l9/3tcu2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571409;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=goW7RQ5gSG9M8ONyPtIuBcVGXFA2Uc2cLxCG2sGG9h0=;
	b=lEUcrQCgTZChaqzDDefyBvz0oUCcS07dH0fWSnO57ozkKO5wWj+cwl7FmZn+sqKbRgxY
	 H0K29XRNnc8+9vwFEkJCPeuVy/9xM7RrL7LDJOdqqAnOi0KSmqA/BEGSS18Biv+ytt/w9
	 Hm6gJA86bEeXqxLFe/q1XQXjQo0l+AlBvtN2IocrABqAMTdNra+RkJys9tw5tx7kJyzMI
	 BCpTCEWk1IH0gQj3avWp3DFdO00McaZR+jFYimmtxGx28cgZUtjYxLnb/FyOK0h/fZrPe
	 pNV6SPXyhTiGSgrYavjdrolMRaCxpRwgEHQjkUeuecuZQ7RFb1f0vOeIpbFjKAKBEgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e521Ynih;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5460A382B;
	Sun,  1 Nov 2026 22:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF5460A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=e521Ynih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=goW7RQ5gSG9M8ONyPtIuBcVGXFA2Uc2cLxCG2sGG9h0=; b=e521Ynih/0ZP2WcELufGS4Msny
	QdmO24BM/lDHX5CE3zgpiWVRcnsQaJImAxf2Ywz4CoNaqjYyj+CD6VeQqsbvoj9pcZU/bjrPFBTMC
	o706mrEcaXYw9aO/SGEHyT+iBxU5YAgiA3l47huvw/w0FebKqIp6TaNx6VBz7aa9fxu9YKpVgja7M
	ltNPL6rZKBs3AHzKTwf5idni0QRBld7Gwm1EUmozDxIiG53q33PW3EDvEQQhLfW2SmgCSa/p5JTDx
	eUFZ6jCOBCaCjOjjVTrfo19al7nXPVWswzKxl+Xt68zDzLjjku8wlMymL61GLuzJIhVeHRAIseYkY
	q358SY3Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] Rockchip softrst cleanup
Date: Sun,  1 Nov 2026 23:16:35 +0100
Message-ID: <179357139340.4108484.8828443894202280653.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
References: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
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


On Tue, 01 Sep 2026 17:13:33 +0200, Nicolas Frattaroli wrote:
> A small bit of cleanup, prompted by me looking at the softrst driver
> during a patch review and noticing that there's some dead code in this
> here reset driver.
> 
> Testbooted on an RK3588.
> 
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: Remove dead code from softrst driver
      commit: 3c1db9e5bea27e658c9fd2b0e5dede0949ffc0f9
[2/2] clk: rockchip: softrst: Remove unused num_regs member
      commit: ac718d9a906b7c85ab94f9e77d5734ae5e675249

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
