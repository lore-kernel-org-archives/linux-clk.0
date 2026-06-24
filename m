Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39D35B644
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282259; cv=none; b=iTSdF1k8xKAt6iwW5UwMP642rr+L/PDdgLaJjLtkURSgUUcigmuBVrRWa0V+UkrgtlsBeDqBQ6QGAW5ltFKqtme46375+oo88xVovFl+jpuBY8XRbQqUauoSIp61Es1xVqCcquI7Frq2lTVLyK/9S151SvgaMashP1InI+PkEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282259; c=relaxed/simple;
	bh=Gsr0e4mrVkZngQMjtx07cYit/2fBMBwrQJ0lP7xv7hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KIDZ2N18n8+MkaR4/pyYduOWvH3X1eWX+uteipHypcJJ+ejYrpLg81T2Iw2wsc8R/Tv2XX/tOHnLxOirVPgQZj+wgCdhcUhk6JoLFO9p7THH4XIejCM770jKWr1ac2ozqJAHIw/H9VTAiIh6su5aab/khGd6VMbRoDfgu6aukIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keZL7w4d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keZL7w4d"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6d31bfc8aso3856495ad.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282257; x=1782887057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=keZL7w4dhDk6ojuVL/1nrL4HmjFCo9mhucYZ9qpYrYXidGwBXjfRR2WlWNPDQqyock
         T5k777S0ugVmRi/0k4vNLN+5XFuvpqnntYAoHV0Xg/8mbNcV0HWCm2YIy0GSV0U8dYbf
         jjy+TjKa2QZaJiIpEVEULtoluw5vYYa00KZZJvpu5LdBZhk2exKqUZ8zpICIjpJqIAw9
         3x12lZThX/evOKKso7nSqaATYI0X8Mcr+tvdgzavo4gSe5Zaf6FjSld5uLNnUN6+rv7p
         ZbKZaOSx7GtRquD1YDaBzYnHF4rpjtIbjbNYBw0X6xfbDI9QrPC0NQ9x2Dbamjre9kzp
         MDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282257; x=1782887057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaPoWI6eKXUMMpNd+FGpSI6D9zOLXi9bfeJRqIdo4I=;
        b=mel32junufed8KJkecYR1nUgvQng27vfn17AQxuH3Yo9CRoGWrRE8eORTwCCUFA5o+
         7MMJX4QLSW415x/EI3PF4p//e4jxmjNhsxe56lNak8cbXtTIgkr36xmLmBzD/8xHtjZY
         uvFGprcWOhBUSY7nUyA5v9lJUgyrx4eD4mfy1bdXswan0VWRWEON/jZDMFbTmk/UoHeL
         KW3sszUpqrIO4K49LQ3oTjw5/uMBneI+f1Ct2o+03ThqKD4FQ5xzeofnIpxO/eSzVsqw
         hycJJiFIIsfzhg8MvlTScmcIyVaEbYYe4JDaJuZ6LAyebAQ376Wuj4lqu1Gn8B2K2Swq
         qrOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvzjPW+OhcP/JW1yZfAVgLtSSMEUyxSkR4cjyaKnp4AmDP1d716VvU1vC/btTrYdfuSTNTig/dUDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3CyAaQBIbxLnOV66WFf3n4aJGTivw/O59YZ9cIAhhO3UvBHc
	sqUTB/TnmQamvn4OiFqDibPTgn8w7iTYOKN3o3w78yNVJyzW6cBKsTE=
X-Gm-Gg: AfdE7clPL5bgu8Ua8tGXMRktqecI6IWNlENT49GFxInm4CKxD6inE4il3F4y8vVrG4s
	icHhoHn06/aaldyc6ZM2dnngh5AiDhS0hLcgt6SuVLR3PbL9psLnC5V/yr+sdY+KN8wCJEt9LBz
	4iMZyzyvBc+qA+Bx1rkIb/I5q+08XsxK1bQ2YOCY/zazdglZRLq9zzBppgrbVBH4Rnh1BBi+gwS
	bvkcXtXFoaxyACMC25fJVYBYRd+6Rgsdt7RkRSwvN9AKu0KW5H4V86unCiilKatl3CLje3WuQEr
	zsds/CIPnN8Y9a2fW12I3xgHQuIcjg4v0A2NJP5nfrceFkphHZotquS3+GDAEbvhRcrUUiYvZAi
	XZPqnpOXyJzz9jnG4zRs76N4QlJdlj1CebLjYsKnASMYqv8sbx428pd/jVWtfIysDwRsWQ7+yyy
	T/shObIVWZVWqiYwKjK8DTvz6N/Ru4320Du5qSB9B8PtN+HRkRb47WqT10HPVYWXfj
X-Received: by 2002:a17:902:cf10:b0:2c6:95d1:3bbc with SMTP id d9443c01a7336-2c7e157bf30mr22540055ad.24.1782282257477;
        Tue, 23 Jun 2026 23:24:17 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af54dsm126042875ad.11.2026.06.23.23.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 23:24:16 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Wed, 24 Jun 2026 15:23:55 +0900
Message-ID: <20260624062409.45678-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
clk_mt6735_apmixed_remove() unregisters them on driver removal.

If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
probe returns the error directly and the remove callback is not run. This
leaves the registered PLL clocks behind on the probe failure path.

Unregister the PLLs in that failure branch before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Changes in v2:
- Unregister PLLs directly in the provider-registration failure branch.
- Wrap the commit message line flagged by checkpatch.

 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..69d9ce1210 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,9 +102,12 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+					clk_data);
+	}
 
 	return ret;
 }
-- 
2.47.1
