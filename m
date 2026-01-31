Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A42E5D17
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847108; cv=none; b=dC0/RkNn3oSQlKgPyT8Tz7f5Ijf3H4gxlSJ8aBqtv8hxOccVpSPb3yK2j0kUeTaQfy3JYklXZS38f+MBjLv6N7yKCks4/F60h3agt9uwE6d5kRna8iyFPB7L1GoBxYlptdqXx+kQVPkLWWmlbOZhfFEKXpF5BCuX/FVU7QjHWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847108; c=relaxed/simple;
	bh=9OAQjhZI4G9NDVTt9f0prwiTo7Qoj04+zj9JpK/zoHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxjUprMWamdPUolljaBvQgpm0tcNAlNk+LzHl07dYcKTLUUCMppOgkOuHWnCqHIEpPa+YSB51JcmZtZ4UglMIKu79M6B1BYBJL4DyVo8xPAGWJPuXyRf9grxswkuQauPos0QSQAHB6+SEklH2B5Hd63T4PnC+pYsV2oZM2SvV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZ/Eo5LA; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZ/Eo5LA"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so20189955ad.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847106; x=1770451906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=IZ/Eo5LADarTchcYf5LfYhz+JW5qdzj6qiuXGPH72zSwZmCay4kRAPUcHhpIqN0i4+
         VZBpg5T2id4lbKyW4+lT00xdAT/7OoTuGzPhDwucBMqh2HQPzYzv/akR6sn4vD3cQ4XG
         kL8j/EltSDxluEM43+tL8xx449BnZRHSGKVyewaEB50xLTjWIBHlGgZ70cTi3FWDsJAj
         FRtuvE5bnZE0RmNA1PIaRgN1nJeOHMQrV60A3TmOoWFRYLgUFZWGf+29uP7foC7VYYEe
         iqjekl/2G/rPVZNuAwVwLlH5W1CNw8AInrr9v+XMrEHif4KbZVprQrYN1+zwQSEtXGBO
         0ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847106; x=1770451906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=MZ424DBAu70ZNeNSI5ztLecFRANnI0bq9AkKUQs8HyRBNO/lbUOQF09iQyqZqib+2J
         6dZ3HMk6zppj669W0wb4RKsVCNLQ0UXAuF0bw/ePZCIu7jHGplNMKGtRlBcZrghLq/bt
         H8+0rMFe+xA28G+0e5OT8Rf3QzgDDuquYAkjs2Jki+7hmDuBl+SydtekMw6IuKxy4OU3
         8vR0edR/cLAqm/kiQJBTb0wNGqOp8a01aQkkR2XyeAgsEZzEX6be2FeY4oHlyEDD6p0m
         AYGvLk8H+EuWhv6OmYSmhO2RvI0P2PcU+jAUgj6ya0g9+PNSnDGdsD225PuAXz4A9Cay
         ljJg==
X-Gm-Message-State: AOJu0YwMOAsDoELJhy4BRaWOMXwAShYUU+xUaBu/Rofcrjc95avVALw6
	Nwnqr55pLau1XnFCkM8c8wNG1aODINA4y4QSwlVTSQlXiQjrm1z6mOMVvlvlDxZgpxs=
X-Gm-Gg: AZuq6aIyn17K4tEXsJYD4ACxEfdftR3Wo5GwBow+MSpTPWkxLcuHJmojCZ5WMGmuzPC
	aurUTZevFym/1buT5bG/Ru6fSt2MDBeByYiXnpQ+knY7w9kdg1BfmNsw6H9+zU0FxviGQPTm8zW
	EpTNRvGI7LKxRYziYzLFNszk+LtfNMkMlkuWeX/9+r50aRpZ/ZWX2h3UHVjV7srT0lhlpBB07Ar
	NMtlsu/ACkXdPCTBxS/dMlONvCdhRoi+cHxIrBHTT2otV/YLCg6uHwc+8fmbjTh3HzHzfvMDhDH
	C0632me0gZFzsONnXniiCk9FO/TeGYtr1xkI5rfvMHB9v/rEdzZUs1ANHMItCluyjB8YmVlDpcN
	Fd/IbiX/sGmxqF1SP5Fj8S1SiAtAfueJwzgmq9Bn61xp3+3UEZmWmN4Z2W0XcXSO6YdhYWjlWmT
	z3Gv/HZcw=
X-Received: by 2002:a17:902:8218:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a8d96a221fmr44250135ad.18.1769847105996;
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:34 +0800
Subject: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
In-Reply-To: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1258;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=9OAQjhZI4G9NDVTt9f0prwiTo7Qoj04+zj9JpK/zoHA=;
 b=Amf+HD1p3lcCeTT2eWu8v7JUo6k/cHzSXe1AmMAfSN8hyokQgHe/dh6dj/P7sHbmDWKqueAlg
 HSqNr6tFh10C/GLl9mZ/HUETAF9ASs8izJZ1BX+ZQlQJkLbXzj1mf8y
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..1d8e8f0891a3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	of_node_put(clkspec.np);
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

-- 
2.43.0

