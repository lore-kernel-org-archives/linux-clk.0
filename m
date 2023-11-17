Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13ECAAD;
	Fri, 17 Nov 2023 01:50:45 -0800 (PST)
Received: from i5e861935.versanet.de ([94.134.25.53] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r3vUp-0003ER-CA; Fri, 17 Nov 2023 10:50:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	Weihao Li <cn.liweihao@gmail.com>,
	sboyd@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: rk3128: Fix HCLK_OTG gate register
Date: Fri, 17 Nov 2023 10:50:33 +0100
Message-Id: <170021461022.1221251.9951712126746337546.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031111816.8777-1-cn.liweihao@gmail.com>
References: <20231031111816.8777-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 31 Oct 2023 19:18:16 +0800, Weihao Li wrote:
> The HCLK_OTG gate control is in CRU_CLKGATE5_CON, not CRU_CLKGATE3_CON.
> 
> 

Applied, thanks!

[1/1] clk: rockchip: rk3128: Fix HCLK_OTG gate register
      commit: c6c5a5580dcb6631aa6369dabe12ef3ce784d1d2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
