Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859081;
	b=4ZzMiDABlZd4gTEE2cf435OGP5VzGddWFkKdz889tMNfC3XWt5obSsi8e+6HZnyyM72g
	 59AbmBI8ZF8K6huu3BhvFJlV8LrrwzzIITyWS/3iUiu3rXHkkSbzLi+jsg74OHL+IQw+b
	 Nrpd3SNLtW6xJ8IlPnOaNiJwdKqZM8KaNTHgvs8GL82vvdZHSe898mdJoOq9RHHYqDejP
	 kEQR7Sgappcuy5Hjcix2uFUKz84n2pK2e+LGjYUMGzvcBsIhtLnnkmQrHcDDsvnRxpnfd
	 lYNmflNT0rVR5Ngbr2sXKOV7MlQdyTMQVVsdasg3crRABF3aSbHZIMXRdvl2fLWQZ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859081;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=LdOdnNp80lpQwHfGFbDptzi6TOVJcdWug3BPeKjkwAo=;
	b=pA+x563FuPfe9OoM73eLIljzueP6ZIExyZkQqOraKXOKVYThh4rD/Kc99BmWAeKzuez8
	 YyiMRpZrw/sfvkX/x01F1iTDM/vSY2lgXyGIhNdVR7ggPwZHaMsZ/E1HxEX9dXhus+yUp
	 RZu5T9BBL2/mECIsBwz3/DqrEP3mbia23HnjjqQurQfn13bcaTjIW3An3Mq7xN0ic6/df
	 XMlMui2yUU7jesTxjljANDULwIcXQ469R1ielP7uo8RSeC89YjcvUTHZnVJ03gaXJDwoH
	 t7eqY41kvHiGZT3IJqQJOTVWBIkOpGvwwzRSy2h1qCHMeUZzSs3HQ2ogavy9dSTMCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gCagrhta;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B528606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B528606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gCagrhta
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083e;
	Sat, 28 Nov 2026 17:44:36 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	eric@anholt.net,
	swarren@wwwdotorg.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] clk: bcm2835: aux: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:44:35 +0800
Message-ID: <20261128-f81b700d6c-u05-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2218ad4ed03a1kunmb78794ce451fda
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUIeVkgYHhlNTE4aGUkeTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=gCagrhtasHzoAaHhmB/8UIk2esjZnrt22Qq8mW8h/Wz9/xF6k9gxRUQhcpmc/FCg83GsDmeiTYWvUyzH+lJL70M+DMD0KH0Cy67drRD5jihDiYcsYmwWNkjKhKffX9Ca6A/y8LlQwvwNFgcSV9HwVZsKJ/L0iGBYC9ij85xp9hQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=LdOdnNp80lpQwHfGFbDptzi6TOVJcdWug3BPeKjkwAo=;
	h=date:mime-version:subject:message-id:from;

The OF clock provider remains registered when the driver is unbound,
although its onecell data is released by devres. A later clock lookup
can access that freed data.

Manage the provider so it is removed before its data is released.

This issue was found by our static analysis tool under development.

Fixes: 5e63dcc74b30 ("clk: bcm2835: Add a driver for the auxiliary peripheral clock gates.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/bcm/clk-bcm2835-aux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
index 351a63e5cdfc..0b0bb35f3f84 100644
--- a/drivers/clk/bcm/clk-bcm2835-aux.c
+++ b/drivers/clk/bcm/clk-bcm2835-aux.c
@@ -45,8 +45,7 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 	onecell->hws[BCM2835_AUX_CLOCK_SPI2] =
 		clk_hw_register_gate(dev, "aux_spi2", parent, 0, gate, 2, 0, NULL);
 
-	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
-				      onecell);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, onecell);
 }
 
 static const struct of_device_id bcm2835_aux_clk_of_match[] = {
-- 
2.43.0

