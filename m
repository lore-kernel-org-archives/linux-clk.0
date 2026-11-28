Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858802;
	b=LOeBMv331/44wLvLVhH+rt1WRe4WCaamSxx4d2ise6NBsiYuwa0siW9SNcKWSozEftte
	 /UVDrmZWYW1a88wCCdLAAMqjpVXXTORBiPvkUoNEkrGetXAxUS63Nxy3t3JsRvwHLIZcg
	 JoHlPyXW9WhBJekqMdoqxZZi6QotL9uGrBzJ3F1He9+2xZGZa2Y3yLcnPpj8aqos+Eehk
	 fPKX6SyVkpwmuWvT1llEP5PvXBVb2XTrRtZJaE11fyHRjljhcmp4Wfs/FqpklXOpFr0N+
	 KlW3ZomvOXdQn7j2j7YFqqbLBTxxlYmThco62JBnL2lSdE3hMKmlCnN7quYvvXMr+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858802;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=J7Fs05yPvDNnxfp5t8iZasYTqJjHjlzO5ppNysDHxVA=;
	b=uQdByDeccyuJEvWjytOIP1eCqvIa8UYioGrgxPmXUWL3qa/cfKtXFVM37rOzpiJGr1jR
	 atUgZ1QA05P4kkr9yAS5f+cSdQkyQiWhM3HrrRLrM3vVA/nn76sNa1JQ+4UdW1OsmfXdS
	 1e2PthB3yfb6CdkCjwH7gNOsMaACfGt3+JeNF5uLKh91vWhDH9ReO0e0nV9BDLH5gro/1
	 ytsHM1r5U+TDwSj6RB9m1SF8P+6c29lbVynQ5kOt403YvT18a5XgaoWrozPg2SUiaTJca
	 6BMwd2kLKwyJw6YqijX74u1WAnK20z2flpZB9uvHAOh9UAlKP4K8GyuKgieJr5RVZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hgfrwKOf;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58F606A31F
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A58F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=hgfrwKOf
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07c2;
	Sat, 28 Nov 2026 17:39:51 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] clk: sunxi: Release the platform mod0 clock before unmapping it
Date: Sat, 28 Nov 2026 17:39:51 +0800
Message-ID: <20261128-f81b700d6c-u17-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa221867d9303a1kunmd7238825451bd9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaShlNVhlNQ0hNTx4aTE5DGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hgfrwKOflp+uwRyH9vL2MQC/os7gbFacmpgeuD0Ga5uN6sgfTTJHupzO4XbwpK+yK0F/ZY2lQzJr8c6AjliJZHAecbF7Q/rUdpIfsE0AuqlosQ56RVg5kBHnJnXbkGuPg8d7GsrUSaQbt9v6tXcYjCQP8gl68hsfwirppVRo/Uo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=J7Fs05yPvDNnxfp5t8iZasYTqJjHjlzO5ppNysDHxVA=;
	h=date:mime-version:subject:message-id:from;

The mod0 platform driver leaves the composite clock and its OF provider
registered when devres unmaps the clock registers. Save the clock
created by the platform probe and unregister it on remove.

The unregister helper receives the composite clk_hw. Use its rate
component to recover the factors, then release the composite and its
parts.

This issue was found by our static analysis tool under development.

Fixes: 6ea3953da4e6 ("clk: sunxi: Make the mod0 clk driver also a platform driver")
Fixes: 4cbeaebb8af1 ("clk: sunxi: factors: Add unregister function")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-factors.c |  5 ++---
 drivers/clk/sunxi/clk-mod0.c    | 12 ++++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index 149187f189d6..14a84534011e 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -293,11 +293,10 @@ void sunxi_factors_unregister(struct device_node *node, struct clk *clk)
 	if (!hw)
 		return;
 
-	factors = to_clk_factors(hw);
+	factors = to_clk_factors(to_clk_composite(hw)->rate_hw);
 
 	of_clk_del_provider(node);
-	/* TODO: The composite clock stuff will leak a bit here. */
-	clk_unregister(clk);
+	clk_unregister_composite(clk);
 	kfree(factors->mux);
 	kfree(factors->gate);
 	kfree(factors);
diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index b409a8d70962..e9ecdbe02fe8 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -89,6 +89,7 @@ static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	void __iomem *reg;
+	struct clk *clk;
 
 	if (!np)
 		return -ENODEV;
@@ -97,11 +98,17 @@ static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-	sunxi_factors_register(np, &sun4i_a10_mod0_data,
-			       &sun4i_a10_mod0_lock, reg);
+	clk = sunxi_factors_register(np, &sun4i_a10_mod0_data,
+				     &sun4i_a10_mod0_lock, reg);
+	platform_set_drvdata(pdev, clk);
 	return 0;
 }
 
+static void sun4i_a10_mod0_clk_remove(struct platform_device *pdev)
+{
+	sunxi_factors_unregister(pdev->dev.of_node, platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id sun4i_a10_mod0_clk_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-mod0-clk" },
 	{ /* sentinel */ }
@@ -113,6 +120,7 @@ static struct platform_driver sun4i_a10_mod0_clk_driver = {
 		.of_match_table = sun4i_a10_mod0_clk_dt_ids,
 	},
 	.probe = sun4i_a10_mod0_clk_probe,
+	.remove = sun4i_a10_mod0_clk_remove,
 };
 builtin_platform_driver(sun4i_a10_mod0_clk_driver);
 

-- 
2.43.0

