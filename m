Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859190;
	b=421nZ5KQXxWCVXXSie/foe8GLON/tKlGa7TUkC7zdebxP5rlgd81HRdpMyfWxbuLrW3J
	 JLF/eovldnp4LNZSU7cjIc/NMxHStJu2Eu1XbLlFZxoj1rtXp6P0AtvPU2THyQr1gxJ8S
	 BNHohWYGG9s70FqnYycow47QjRbZEwl8/154pTJH1XTFVIXF/b8DLX44QEij8XCFQhTF0
	 RYlLudJ8QBc9WDuMrv+pyywWPvhZYxIc4IOpXgwqmB7MLfVB7iWhKTMuUy1AMUkzF14xE
	 PdLCcJvuEOCbaWtZiXQniivxq8chpXiHIX7lAlE7Y+hHVNTYwkA/B8UMpdLNrPCa6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859190;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=ysEkKO3Bvn0nWC50XbFJHfuTl9LT3CnMuavi4PnMQk0=;
	b=VKz58783npa6zhtQOfKlNv8H8R/Zn6DUNFHliQMeaB4hqbef+Z3R86klPZurM4aN6kCt
	 AdeEEnyN4wwOsbwdQsp0LeEbYaNhqmcVfqFENRGgeQDT70yhy9okG+Jo7M7I/Ur7y49Sy
	 eqtJeFCxmRVYNZQ0kDDhcXqbhUFZ8nA4sS+t1ya+3woKyzyzengZ+pwIty17RhAUPFOTv
	 tY2/YyTS9N8wzVPiO9XOerv0kxcgTFj4zYUkduG798+rkkLb+mUNxN/ZqaE1YWonRa4gn
	 U219tOAce0wvTjmvGOSeJbIi2cvM6FFJVKmOWxrJdtqTs4iAWBAOijUqHL9yCBxi+gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bD2JkDZw;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4C606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bD2JkDZw
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0890;
	Sat, 28 Nov 2026 17:46:25 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nobuhiro.iwamatsu.x90@mail.toshiba
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: visconti: Fix potential use-after-free of provider data
Date: Sat, 28 Nov 2026 17:46:24 +0800
Message-ID: <20261128-f81b700d6c-u18-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa2218c806203a1kunmdccba7b545213a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkpJVkxISE5OH0wZGh4YT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bD2JkDZwvDBpvp8BsZ0KvDXsQhjFXHGIdt4fw+UVzAKPmotki+u/thK7U5yRrsjd0K3Aq/PqoW9N8yuherv0tQqZkZO4HyqH2zrK637GXjDg8VC3Sgcru1bZmnFOxGf24ze+2d8fk9mEPMSkRz0QauD3Fhm7L3ygMu27pPdPa0s=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=ysEkKO3Bvn0nWC50XbFJHfuTl9LT3CnMuavi4PnMQk0=;
	h=date:mime-version:subject:message-id:from;

Unbinding the clock driver frees its managed onecell data without
removing the OF clock provider. A subsequent clock lookup can access
that freed data.

Use managed provider registration to remove it before freeing the data.

This issue was found by our static analysis tool under development.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/visconti/clkc-tmpv770x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 1e2e8d6437fe..df5196f11219 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -347,7 +347,8 @@ static int visconti_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &ctx->clk_data);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					 &ctx->clk_data);
 }
 
 static const struct of_device_id visconti_clk_ids[] = {

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
-- 
2.43.0

