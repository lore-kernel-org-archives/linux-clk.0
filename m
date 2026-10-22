Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705988;
	b=hZuH1tNGc1FcdvdBR0VylBqo0xdnACgI0P+ChUacP9B6hCEvhilr9AyQNr7KjMN/ZEjE
	 Y6qMZZGiFl3miPxIBRnb7D7MkygYlE9OArkTbZvyLOkgKV1V9Jy1BT4TxCq3nBgFGHFdb
	 vqkuuLoCc7Hc8Z0seDh7c0ZW4OJLno43d9yQMrWRfO41CoXSDKyvnA9e5nVsU8o9f0gNM
	 6fAEpdHRWtfgp9yyXz4renA9rNpdZWyVLoaCiX6GvRs3fgZ+rxRFQFha8nNeUiQE6u/k7
	 hHQbKoiYQKPwT4Bw5da+fyjM1jKzVXzJLbYqxFuTkNORQsFgsrvj/QsBmx9I5/G2jXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=;
	b=saU4eqefVBZGILaZpNdt3nAxywT9rKSCZLbO71KURrVDes8qdiOAFjNi1Pzh2gWOQnlq
	 WgRckAhkVqz5RTtDNnaFTAk52MOFbyL2+MM5TYgP1g3VyNgEK7jQv/IkNkAFKE9TcUL9P
	 bag2R+CNeaVcEBDAUj+Bg6+8eDBumcWP1aeBJ0azeP392H8NOjiKoneVU17pVZweZezE3
	 JFaL9Bnfr0JDqkj6HlKaf18cWwH5WHPjzCoiLjWCRw7BUPABqJPJ+tlehHfCDoQSygRL1
	 vP566u6lrTYU9h6bM3kLW4uqROxBk1Hr0/1hvdaU/olzDPHd/orZxI+0avrGpVyznvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eslpcj0l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B4606A322;
	Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eslpcj0l
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705988;
	b=luxNm4dR5zgCo43s67G9HLQfzDMF3bhO/ZQv45q1UVAkjI10Uk7kgFY8Rv6sFenTvgL3
	 qTeR0BO8T3quJyQfRfCJp2fm2PNIfjbCPa5l+mrnkwco8728bxAigv5QikOMgVnNYr+Cw
	 MJZtOAH0Dh/niKq7jerVz4GqLe+dxKRKzG49QBM3lXo4dvZbDi8kJ6LvHT/pBxpBHLmMI
	 q60T29qF5v6+RWBXJaTXZP01ShtD6x1uzhYlNEB8HSJ3QzKxaSGd0Oxo/KhJ7zmplTJp/
	 ZKaDW7JGj26RLAV0KO00BeHvofiwAm9ILgVYIGZW7wN/p9F0kGCd9y3ixJPp4TRvuXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705988;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=;
	b=O+rWwLSKbuh3S4gfxgpxJD8EtKqLRB6zOGTKGpoS2I0+OPl3cdIdF3SBAImVZUlXD9DT
	 DJMxXcioFBl9QxYzNKgyndK4dpuLB/+eF94FNKfS5zwDE9fvlgg2QulH8c1K0sNfZB5KG
	 8EjZwdNw/Au0pDPda6nC+IcV5pWwqJdCSZzdr4AKSjrwf6qTqwxshjCiDAThhA00WU63K
	 p++ZhU9UvNO4dsCBAX0E9fhRonHe6OnId3gUSCaEbkl+I2GuPanZWBFZzV0vhqW4OChWc
	 DHm7o27UkTeQ3uyNQG6yb9Tp0R1u/WyZy4/aLZrApBmG+v61MUCqwoU2A9FsxjtOm/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A7A21F031E3;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705988;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Eslpcj0lxqu+DaCjkV958EkpE77J/GAvbhOgutODDBNjvNavEXrTbIIgqPOHcmDg2
	 JLMzocmnWm2lG6U9L6F0R49IZpbeX3+S0T67vRfGfcTDFGf1CvUFSwqssn8Cplpqtm
	 0UuftOCCZ7RIIslwAfh06Q33Mn5PqqNKgvhQTjkfr5wsAO04KjH6FOmV+MQZ9qNoMv
	 GQM5Ul3VVB+zKrcJLlYj+wRGRhjrmuN58nTCLx7pKLxmt6i3kRgvsYaIWuA1RLrowp
	 ggsJhcjD7zp+IK4+xA3uXDXu42oXl6TUOOumgf7wuwUxWZ9v5l7CxJT0zDKhhW/N95
	 nxugMuqSR47nQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF2DE41F5E;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:39 +0200
Subject: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
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
Message-Id: <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
In-Reply-To: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kmf21z98rptos6YhBfPRKtB/DG5G/xeS94e38Rd7M00=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1j062/vqpNvFbynuv/zmVmqp9x1xU44b11/OfiLw+
 CbTTtWzHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBE7qUz/M9oLN/5IiL8XZ3i
 OlWejYrcvW5rM91kn39Km6B3RHPPAT9GhsnzL94waohu3Fz6avurlIffpgUoyup8Wfkk7P5h9pU
 lE7kA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

g12a_fclk_div2p5 should be fclk divided by 2.5.
The mult has been declared as 1 which results
as fclk/5 instead of fclk/2.5.

Set mult=2 to get the correct div 2.5 rate.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..4ec5f15daf98 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -995,7 +995,7 @@ static struct clk_regmap g12a_fclk_div7 = {
 };
 
 static struct clk_fixed_factor g12a_fclk_div2p5_div = {
-	.mult = 1,
+	.mult = 2,
 	.div = 5,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2p5_div",

-- 
2.43.0


