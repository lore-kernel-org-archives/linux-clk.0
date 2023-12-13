Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ifXDnd4V"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C89EB;
	Wed, 13 Dec 2023 10:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493477;
	bh=5rhOg385ALxMZC2NP0YG1CGe+OyMaqjG1bdXKQfeSHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifXDnd4V8vmvYonESSOBvL0+iP/UdhuF2m1wTzv24d5htZ6Gl6JzHCQixWDXLX16z
	 vscNm0IsIPFBql21BU1/KFEWNXd5EgWp+SLSLjsnscQgjh6NM2LqzG4c4Z6GhoSQvZ
	 h6+a9SHKYRdn5HTetpjrywy/Tkl5B9S97HKoVH1/imLq9TS++yj5LtTFaYfEekr9tq
	 0T6GC6/Q5iE0ce4LjzOw62lbg7Qzit7t2k6mOWbkklhTkJR8KxXRjNbgJuaoP/zEVO
	 o/brZDIDPrJnNlbNRFjT+1NnRIKEts7jsrTmCuH6Vh3gcbODwgMpJ7l3YvJpIomAj3
	 uEl9NBjJpkOvw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 318C637814A0;
	Wed, 13 Dec 2023 18:51:17 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3C265480107; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v7 5/7] clk: rockchip: rk3588: fix indent
Date: Wed, 13 Dec 2023 19:46:50 +0100
Message-ID: <20231213185114.47565-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213185114.47565-1-sebastian.reichel@collabora.com>
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pclk_mailbox2 is the only RK3588 clock indented with one tab instead of
two tabs. Let's fix this.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 26330d655159..2e8bdd93c625 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1004,7 +1004,7 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE(PCLK_MAILBOX1, "pclk_mailbox1", "pclk_top_root", 0,
 			RK3588_CLKGATE_CON(16), 12, GFLAGS),
 	GATE(PCLK_MAILBOX2, "pclk_mailbox2", "pclk_top_root", 0,
-		RK3588_CLKGATE_CON(16), 13, GFLAGS),
+			RK3588_CLKGATE_CON(16), 13, GFLAGS),
 	GATE(PCLK_PMU2, "pclk_pmu2", "pclk_top_root", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(19), 3, GFLAGS),
 	GATE(PCLK_PMUCM0_INTMUX, "pclk_pmucm0_intmux", "pclk_top_root", CLK_IS_CRITICAL,
-- 
2.43.0

