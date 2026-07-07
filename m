Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF713A3ED
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 00:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385783; cv=none; b=r2bdlUpJVrl0sYSOSAKjbHk8M2eCN4KWBRdeQyrk6rt5WqVkKOMObFtwJh6Dwj74q9sRvXPByamjBtw7kLD+zVqjw65BD/lglIlqSVYAfQX3uJS04nZtG5Ll0w1lb7fVPDsd/WCbH2MCn+wt+AH7Mq5VST3QjhupEYe0IsMRfw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385783; c=relaxed/simple;
	bh=AtP1ly62yHRiqJ1z0VVHy+4e1Wq02i/Dfs5QoupcSNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5qhgfjVlN2SYQb3vkFnQUJJaBzx0KTYCKHnIhqNrQWkp2Vol4Nt5nCjc8aVrk++CX8ndLq4JEOLKzHszLWk5EKFIa58bEPWW2XZIheYMtSdO2M01RH0mRIM5igAtzmkmJkO7z7/0F/UYSfGD/5dBTnYyThvV95BKIP+XM7npKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K51h6lkb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K51h6lkb"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso2646534a91.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 17:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783385781; x=1783990581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwT1m+lGw989aBCp7ntY5F2Cxo1vcQEFm2G6bjMfeX8=;
        b=K51h6lkbWkOGC7mcaZV3zNv5sQ38Zto64XHNjxgNQCv7v2em1NW/LQhDGgUXEI+Bmj
         ODRqkcIq0uQl8G5YpAvJJYQMFsA6MaWylIdxNFFYnGUzbN6Dpozr4tbb7s0ArBGmo0eh
         Zg1dr+P50yu6Mvil5OqjMSbFWIO4OzctTqr+WXEAvGdsEbal+w+RnYaVjl+vMrMbSbjP
         5lNDAj4DA5OFL2pAWnVr0Wwe9icakKmZ+QTEzPl4pd9z3S/vc9wnOlxA9MXjBxHOewvy
         lyMtEgpnVwe+/lEJ9UfOqlD6CqKUp7sW5VVSZBvxLzKEsemTlfGULtSeILN6wwiSIsvm
         ZIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385781; x=1783990581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwT1m+lGw989aBCp7ntY5F2Cxo1vcQEFm2G6bjMfeX8=;
        b=Z7KzTcqaUbEmPldSFKW6O1CPklY6dZJbvw/pxqXsnqixUWkcDLFHB86Iw6YMreH8cv
         0CLpulankr5KjpkOxXz8MMMnaFQw/meXjGfccGxnIFUKoXg4W3vJP/4kXGFApelR2aO5
         ckNjgpAPrMAb9axe1fGplqTdOoXqHF51EyjO2ZIoWKUzRCQxgqbabAstQQ66X1f9kUGj
         f2pb6YNlt7Bpj/6Wpv1VOh9kFJBaau7MazfHMw0cdzx5Vk2RqUxd1ZkcGkXzp/rNhQma
         HUHUxNU4cV8XECpmjzd7f4lVQJLhtmJKL8Mswnl6HP5p0bWeVtfs1bBDhYZoixmMEt69
         kQEA==
X-Gm-Message-State: AOJu0YxvokESvSuO+zuoB38cUlqDXMtR4b+lIq3O/1Apnk/8McEI8ert
	K6gvGAO23WDRabC9vVGMM22g33MZzRMR0DKRYwu5METsHvyNE+l4sBhC4FbD6RBT
X-Gm-Gg: AfdE7cmKeQahzJo8NNiYwJppf/cWyBEAIIGogMt44eBrOD/Nr8N5zVTQQNJToSRN2vb
	kksTsekVH/IHaXlkKwlSmhsevxk2ev0xMNhERbYjDAdz24+pBX2ZZkxjbssLtwJNJJQg8kHOZIe
	PszZ7T6BklCg+Y8x4NKtfl63CzhjtIcbcKq1CiOX47LFeWVPDN0qyeFeoIX8UbEL7kIgSKJkphA
	2bhvsXXTTUjwX9QnZYDdLLBdW7dIYsnPrml6T72v/fQSJGGodlMWbyJo2A8RFWvvodH4GNljlUV
	5Fc1rg7ELD/2+VwNsV/LJYf5gG06J4fkECjwMWm/a9AsctSAmS2YZuNQ1kUrwjUbp3kBP2OBapJ
	6Hw6wDrPUF9mQrY8YmmvwgUOidtRZ+C2pd8Wz4sJP5hZOMie0oY79WZwNaMsLfPQ6wpWhARPZie
	hhRDAN2EUU2xSs4OUnzq0dFO2QGdeI9RlitJ/pFpOg7tM2/HjBpWhsA42UlDVeiJkLZEby8Bhao
	4bNhsUQ0g==
X-Received: by 2002:a17:90b:1d01:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-38755768660mr3288581a91.5.1783385781345;
        Mon, 06 Jul 2026 17:56:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b7acsm176090a91.4.2026.07.06.17.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:56:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Date: Mon,  6 Jul 2026 17:56:19 -0700
Message-ID: <20260707005619.1229238-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the pattern of many other directories in this Makefile (sunxi-ng,
tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
select the driver without having CONFIG_ARCH_THEAD enabled

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/thead/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use obj-y
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f6a71fd6d872..bbcedf5d60ea 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
-obj-$(CONFIG_ARCH_THEAD)		+= thead/
+obj-y					+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
 obj-$(CONFIG_ARCH_U8500)		+= ux500/
-- 
2.55.0

