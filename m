Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27401A8;
	Tue, 28 Nov 2023 01:56:36 -0800 (PST)
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r7upR-0002pQ-SP; Tue, 28 Nov 2023 10:56:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] RK3128 clock fixes
Date: Tue, 28 Nov 2023 10:56:28 +0100
Message-Id: <170116536542.2181089.13845527972157638659.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127181415.11735-2-knaerzche@gmail.com>
References: <20231127181415.11735-2-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Nov 2023 19:14:14 +0100, Alex Bee wrote:
> This series has 2 patches which fix some clock driver issues for RK3128.
> 
> In v2 [0] there was one more patch [1] which I dropped now, since
> it has been merged already (was submitted by somebody else [2]).
> 
> [0] https://lore.kernel.org/linux-arm-kernel/20230829192958.250248-1-knaerzche@gmail.com/
> [1] https://lore.kernel.org/linux-arm-kernel/20230829192958.250248-3-knaerzche@gmail.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20231031111816.8777-1-cn.liweihao@gmail.com/
> 
> [...]

Applied, thanks!

[1/2] clk: rockchip: rk3128: Fix aclk_peri_src's parent
      commit: 98dcc6be3859fb15257750b8e1d4e0eefd2c5e1e
[2/2] clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
      commit: 99fe9ee56bd2f7358f1bc72551c2f3a6bbddf80a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
