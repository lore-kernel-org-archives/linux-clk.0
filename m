Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799951C4C;
	Tue, 27 Feb 2024 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709068621; cv=none; b=t47FJ2pRtbPcbaEnuAFkFbhWDkyAN8C1iDGcaoT0s5Hhg5paqkJB4N4MeVWWRA6mJ7Es6Cyr7gdrPEjtSocgQh0FqiP5Y3VzngswVHlIDBT2a8fDJ9/dT+lSG782Y/wXxJwkabArOQq0qgw8+vDpfx0mj5I/3rg4vCaAti12Hzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709068621; c=relaxed/simple;
	bh=2rqAKlRCAAyEc+DozMwqJ3AxIegAjAmc1Bv0FpH7pMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDxYZ9QwJa2shZoHzwIkuDv9qK0xja7ZufnWrzq0Cr3GWZd2c+wH0KGvYHm2illbHE5jsV2uq7yVnCdNnj4Nep8h/421vUCrrAUUW6JNGM4QmXxD9Gu2iLjUyV/9TLLyy6UFBPBHXlPxlXl8LTZAjzcmdDccy6NWuTKgYysNOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rf4op-0001Cx-FU; Tue, 27 Feb 2024 22:16:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	kernel@collabora.com,
	huangtao@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-rockchip@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	andy.yan@rock-chips.com
Subject: Re: (subset) [PATCH v8 0/7] rockchip: clk: improve GATE_LINK support
Date: Tue, 27 Feb 2024 22:16:53 +0100
Message-Id: <170906852031.753268.5145089861354297384.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 26 Jan 2024 19:18:21 +0100, Sebastian Reichel wrote:
> This is a follow-up for Elaine's series. These patches are written from
> scratch, though. There are two parts:
> 
> part 1:
> Elaine's series used to contain patches for the VO1GRF handling, but they were
> dropped at some point because of the CLK_NR_CLKS feedback from the DT
> maintainers. I added some code, that should hopefully fix everyones concerns by
> figuring out the right number at runtime. I also moved the correct handling of
> pclk_vo0grf/pclk_vo1grf before proper handling of GATE_LINK clocks, so that it
> can be merged ASAP. These patches are needed for HDMI RX/TX support on RK3588.
> 
> [...]

Applied, thanks!

[1/7] clk: rockchip: rk3588: fix CLK_NR_CLKS usage
      commit: 2dc66a5ab2c6fb532fbb16107ee7efcb0effbfa5
[2/7] dt-bindings: clock: rk3588: drop CLK_NR_CLKS
      commit: 11a29dc2e41ead2be78cfa9d532edf924b461acc
[3/7] dt-bindings: clock: rk3588: add missing PCLK_VO1GRF
      commit: c81798cf9dd2f324934585b2b52a0398caefb88e

First part that needs to be shared between clock-tree
and the devicetree change I sent out some minutes ago [0]


[0] https://lore.kernel.org/linux-rockchip/20240227210521.724754-1-heiko@sntech.de


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
