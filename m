Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744589;
	b=Cx+dFpnWtW55uNVNJS3+m/+qQCCOFH/PWxlsSF31WLdxJpGITSB/kJUl096nHWXW67wO
	 UKoBe6NcQr5bSQ2eyjUDE2BjDLM6AWEkbPMZSPETns6a6ooizQjWs//lLxtfqNnPU320G
	 Xh9NZIBAlnkT7yWjH48iGaVNndlxfrLGOOGyisBjk77PqDU1l26x3wJFGvwARRyMDe5le
	 r2X28RHhBFzuOfEUnkpH5H3W6+btyfh0Nwxz/gRSmbkDpJE+UCBVPGvomrdHSlbw7xXoL
	 x7PE+60a+XDTvTHLAxjTPQR+Wmz9VCzUBZ1LSiCCyoajrZMWQqvPVXA2u++vWkZgndA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744589;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FNh/mYJ+0jsVySuFyl1eF/vkWOtkKDGeVp6wS/ZBews=;
	b=YUIUregmZVsjdeQXxg4nCW7HtwNAbEICcvtXmdRa0W/X8yrsYNVJMCMoCSTgBnCMkRYi
	 sBY6SyUyXc1RXmfKGxPF9/tkpDNbIeySEwgZDYQroTNUH5qDj8yl+sW6LJBv7ALll7aVB
	 /YyMGodrM/IS/Sz8lqO+V5bDnu3880fUL3FscSAk+KRtGVVIOqOdsObTT8FZVC0FYtaZL
	 G9s7KByD587VxMWD6vlfv1Hk1HkQbacEG8z/asd8tZvU77wgUGX0ogf4cDqVXP9IR0xB2
	 /6lGqGt5Y3hl/DiCT9VA4yf8g1Ez/WKNoOB7idHEi/T2pFf4eLovobjzzTD/SexIFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COQR12yc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75018606A31E;
	Sun, 15 Nov 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COQR12yc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E8E1F000C5;
	Sun, 15 Nov 2026 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744589;
	bh=FNh/mYJ+0jsVySuFyl1eF/vkWOtkKDGeVp6wS/ZBews=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=COQR12ycgObj/tV9ywWCW5uOL6FzCyVdAqEyCCOkqcWAMBoIsZ8+0eCVe3GiqLntm
	 nxCHBsePYJaWCeZop9ugxWHjlb16dOzKOCe/vdsb9SoXo/+PSl2LmVwP8sIClw25XF
	 JEolYk1mjcto2obTzm2rdyLvpgzeIZuuHioWYMSnEuxfynPxTxrBIJlSnwQ9H7HLy5
	 slZnoZ191iSiPiHqeBLScoG3de8cv7HOonAFbGYzA6GSzB+idNwm6EP2Dr/tuOwF57
	 ZrHQ48I3rKqzYQqW2GBk4mUUICYx0nDCHzwRjdL/7uhZqERMPqjQuA4W4KowrbUeB4
	 zieXkY1lpVoyg==
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
 Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
Subject: Re: [PATCH v7 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
Message-Id: <179474458449.3130971.12008198786411487989.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:44 +0800
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

On Thu, 12 Nov 2026 15:11:49 +0800, Junhui Liu wrote:
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

