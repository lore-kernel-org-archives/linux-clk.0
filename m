Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859084;
	b=FgCybnLPoufXcToqI76u7A5r7jd3o5O/Gs/OYa+yEGQEy7QtaHvJrHcmDYjcH+E2BXlu
	 wlUFDfTpxVWEj+GgQ1YpL9SpJnZhNl56HnrLQyLMCDdQ/7Pw+GVxYISVqqI6yPR8CbKoB
	 CvLp7j6fAFCSbMArVcESnLKolWWkpACaJ+f3+dsEShZuGR/1Wu43Jyrm6lWCGc7VRVWvU
	 A9KeDIqIueg5CYseBr6GiySO1kdDIzuDXnjlOka6Fii/dP+ZfWQLtgvFJw+yceAa0aOt1
	 JH+XmYVDjQwRFTkwDPhiaurh1TVfPPSuXCflKnD2JToCtp1D2jCyVIgZ/T+N8ZdDXSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859084;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=2F9+UIFjXyl8E+cBoEl3XN/WAmI7L6Ci3kyI3dG+pGs=;
	b=JA8odVLj2YWEhAYi0jrgtzGnppFJFdZhPeivxghaUm9TkPD28cLjm5+v7VuVs6t4TAQ4
	 IVkLzzMm33FTdhmS94PVtBOw7QZpCSu6lx9A3m9czY/5K8DG0qRyHqQMOI5p9dp4Ko4J8
	 o1C2fU47zc7VCAkLTmoNHg/IoAuUZnetlTeztaY5RfR548ZrZmZxGtWW9+bFsZwUjPFn0
	 v8ZB68h/bSHUmm/PIyQz3LbvNJCGSGk+BQTKIWyFVrwyj0MGYr6OwwjlMApmzPFnfp82H
	 32DUrtE0Fw1B3jPLCL3lgbm0B8cAlq9NTUx+W0lYzAzEE9I50rHDg04t3bfzVE/FuIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ud+5qX5O;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF37606A31C
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ud+5qX5O
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083f;
	Sat, 28 Nov 2026 17:44:38 +0800 (GMT+08:00)
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
Subject: [PATCH 2/2] clk: bcm2835: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:44:37 +0800
Message-ID: <20261128-f81b700d6c-u05-2@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2218ade3c03a1kunm53a27565451fdf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEkfVktLQhgYTR1OTktOSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=Ud+5qX5O8tLaxElZYoQuCpbTAEVUYBF1yHVbkwytMXHhs4lWRf5FVCnWBhmWqwFAriePpTwS+72c3VztdXhjxfIzRepm4ZurwTJgbQCCp/HdIQIsR9JHr++v8IMoRbHs7jlt6HH6rGbKsKVKnToAZPS9lJP9kBv0fe469+4FJho=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=2F9+UIFjXyl8E+cBoEl3XN/WAmI7L6Ci3kyI3dG+pGs=;
	h=date:mime-version:subject:message-id:from;

The OF clock provider outlives the managed CPRMAN data when the
driver is unbound. Subsequent lookups can access the freed onecell
array.

Use managed provider registration to remove it before releasing the
clock data.

This issue was found by our static analysis tool under development.

Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/bcm/clk-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index b668c406512a..34eb318285a4 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -2322,8 +2322,8 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				      &cprman->onecell);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					 &cprman->onecell);
 }
 
 static const struct cprman_plat_data cprman_bcm2835_plat_data = {
-- 
2.43.0

