Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0523B8BBB;
	Mon, 27 Apr 2026 12:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292623; cv=none; b=dGdF6HJ9fRrZc9dwKWmKy+cnHVgTPNqDswjuCxDQeBSEPPith7/3tAeYda/y0uNtB1AEn5S34cH5+rQsedL2tU6gtXRUtpi5v6w9SYsYPXDvF/9T6GoAzZ9SMsIHu1wzKPf105wfT6PiaCRZq7IKrdVOqwdCBGkjXuvUkr5B75U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292623; c=relaxed/simple;
	bh=5L5LUDTfFwN+G9RkjEMRbWrHXt1VPez++wKTPqDVgZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCSmwL/vUn2XSPpNL8z63k7NHg990OPl89CFHIr7i5XXpC9yy+27nnc1zJaMi88SxnM1VlKxBI+WrWOO29ppOnv66A0HetorW2UYAtxS0Yslfdq34lIm71JhkR6hJgk+EXSJ0XMc040d2m2f0rJ40P4TnVHeKbbRhfZbNN+hnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qzViLN7H; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qzViLN7H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jjfLTmcyKD0hrkOGEYEgBYNd9aUyIP8bdXAALh7Ab8g=; b=qzViLN7HGQxYtfONvHpZgmKw3o
	eJMHy8bhLVX624B78Rb2+FrCMB67RXfZmovbCA5qe6ZgW8NrKkaX0hqZc9E0OFTik5ldpsxIThJf7
	GEZihLQ135ZMQVp6/ZgRxZdr/Z78OmQXVSR3m3mZvUbgMl2RLDpx/L/0kRVV1gYRvsbflv7hApfmE
	v24OrauXEdTct7U2yFuqi6DPCuJm6gTwTByvqvk9MiRtcc9OkxCMDAxQ3HQ9aPIJQyswmhQYHMmZ0
	4IXHF8KiLfY2HCv+DH3HBbqCTwA8Wk6XfdO5KGTx8NboZyFYtuRQFPy2ZbvDJQFH6PDfxu7g164Zy
	Ti0PyRiw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 0/5] clk: rockchip: rk3588: add I2S MCLK output gate clocks
Date: Mon, 27 Apr 2026 14:23:21 +0200
Message-ID: <177729258228.1866089.5793149531492182650.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Apr 2026 13:43:05 +0200, Daniele Briguglio wrote:
> On RK3588, the four I2S master clock (MCLK) outputs to external IO
> pins are gated by bits in SYS_GRF SOC_CON6 (offset 0x0318). These
> are set-to-disable gates with hiword mask semantics.
> 
> The TRM documents the reset value of these bits as 0 (gate open),
> but in practice the Rockchip firmware (BL31) may set them during
> early boot, preventing the MCLK signal from reaching external audio
> codecs. The kernel should manage these gates explicitly so that
> audio functionality does not depend on bootloader register state.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      commit: 56c2ca0ae7cb9254c4c2b82baa0afe29feaa274e
[2/5] clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      commit: 28820fc7983b9c8e160c0095067a570bdfcae1f0
[3/5] clk: rockchip: add helper to register auxiliary GRFs
      commit: 32d1d88c4165d0da31d3bfda912e80e8110d6fc1
[4/5] soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      commit: 06c990bffdbea7cf655e728f4423ecd13fb030f6
[5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
      commit: 02b9b0bb626989b947d82bbe4e050f0254e2046d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
