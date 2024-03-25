Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE901946C;
	Mon, 25 Mar 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395375; cv=none; b=pTfOUo2WTscQ9Kw/P4eg2Bdy1t6bQr0Qg1exlReg38Kaf6nUB8GyqyqEXIcSNoA9mQs0udmYkJn9xyKBTf+4vdKca8PU+r9uklgu/RdpPdMcjn5JoNYsjJOJbgV6sM+k2pEpprSmqqjleQJ83oKCP6ojtKvcKxCEsIa4XWKOtRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395375; c=relaxed/simple;
	bh=dWB1ebbOPIt/t+07nVYRoz6saCSS1xYln+HgtgNynjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twf15GFdjvVciLexWALAyryfjnzuFKDufseWErnGragrY0PQcgnfCLzR7SP4QmOOjhyJrryq8dnBKfuqyFRm2KchyZb2shRUJ9S/iM00QNpwUBcq7bSlbNqutPPamWNT+H11Q79qzxtEtDIll/khwQIAkvu+2FN5/TyqUKFs08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3hCh56Hp; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3hCh56Hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395371;
	bh=dWB1ebbOPIt/t+07nVYRoz6saCSS1xYln+HgtgNynjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=3hCh56Hp9p7c5J1NqhZvIgRUpHQPQqWjn6XJWYZvFMzOkI/Q+uH6AD/AYZa0zLMGX
	 P5xlYPlDImP9/xHVy5UpEunzMlNY0IO3diUI9vJ6e6XGz4RYQ7hgTdcHCzGCd24wmQ
	 fm/d8jNUNe6ZKK6MGl0qBWbq6VFrvcBD3HonX5qtpUPuxNQDTrLb1F5kUFQUC6IOap
	 bj6wa7AcjoDJAHGYRl04jefn20mVwXQy+tcP2iiQsE6F1NgKqd5CqD3yfE1NKhkgnv
	 /4zy4Ny6t/9sJ56iJe8bOSwG9s/bTxFrH2QonqwIjMJH3RBYAznSdAYx4gorA+soxk
	 FndC32utK53BA==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B49937820E4;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 109B94800CB; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v9 1/7] clk: rockchip: rk3588: drop unused code
Date: Mon, 25 Mar 2024 20:33:32 +0100
Message-ID: <20240325193609.237182-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325193609.237182-1-sebastian.reichel@collabora.com>
References: <20240325193609.237182-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All clocks are registered early using CLK_OF_DECLARE(), which marks
the DT node as processed. For the processed DT node the probe routine
is never called. Thus this whole code is never executed. This could
be "fixed" by using CLK_OF_DECLARE_DRIVER, which avoids marking the
DT node as processed. But then the probe routine would re-register
all the clocks by calling rk3588_clk_init() again.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 40 -------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index b30279a96dc8..74051277ecea 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2502,43 +2502,3 @@ static void __init rk3588_clk_init(struct device_node *np)
 }
 
 CLK_OF_DECLARE(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_init);
-
-struct clk_rk3588_inits {
-	void (*inits)(struct device_node *np);
-};
-
-static const struct clk_rk3588_inits clk_3588_cru_init = {
-	.inits = rk3588_clk_init,
-};
-
-static const struct of_device_id clk_rk3588_match_table[] = {
-	{
-		.compatible = "rockchip,rk3588-cru",
-		.data = &clk_3588_cru_init,
-	},
-	{ }
-};
-
-static int __init clk_rk3588_probe(struct platform_device *pdev)
-{
-	const struct clk_rk3588_inits *init_data;
-	struct device *dev = &pdev->dev;
-
-	init_data = device_get_match_data(dev);
-	if (!init_data)
-		return -EINVAL;
-
-	if (init_data->inits)
-		init_data->inits(dev->of_node);
-
-	return 0;
-}
-
-static struct platform_driver clk_rk3588_driver = {
-	.driver		= {
-		.name	= "clk-rk3588",
-		.of_match_table = clk_rk3588_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
-builtin_platform_driver_probe(clk_rk3588_driver, clk_rk3588_probe);
-- 
2.43.0

