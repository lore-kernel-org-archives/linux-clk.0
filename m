Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339340F737
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766699; cv=none; b=Os1kR0BIlLK7/q9yEaWYq/xWkpcuWj9f5w4qmzuw88O/kVG+H4JZP0KeNtiGsz5R99+2vI79akxneRb5kT0pe6D+zFa5ZpIz0uIMlmYYBMVWW1DYL1Z4AbRGGwlqDf6gC3NvlaurMVqs7URqAQwI1hCOfJUgMGMLo0NQeI1MYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766699; c=relaxed/simple;
	bh=MXdYkoJOWU7nHQn0EZ6AYJo6j4YPL0512kkd9ogUwIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E758JKZqelr+l5p1pQkatMgE/+j+EQTQ+B9zJP0eq4GIjuovyMF00EYDp2myZmL3uQ86+KbXwX1RG7P0l/fPRl6A8b/K0RbLRpZpI9hvlNxspyMm1c0MHl/RPw2+B2dCSuB+59cAncK/7KE4oN+F4yaSJ+4Fxc6hxwlVOxEmjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJMBTMA8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJMBTMA8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2831953a91.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766697; x=1786371497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=GJMBTMA8X+gqZB1NPVsAO2/G1KZI/g4AqbS2hEUUx1+bRI9+1Vnycai7uxCDVIgcj8
         4X6tb8IBbXgk0j4C9mtES6LzrA9NaUWJjRRl74xiNVkCxYVc1Lfa0k67UvPR47NG/f/5
         uGsAPGh28Mz5jwasnTVO5132Sq1LDKP2zgRRBJZu+o8xZIj+p4d/9u/oazjvtKj+xUKI
         Igh+/8y1gygARYYss1TRAwNiqZE9mw+JvmPKdVrfAhPa6D4iagTJZZHXGWEXwQJ5Ql+P
         TqKdeaxVFh8LDRpRUMkQj1ym7J2lriXmNlGugN2M80sOsXEYWJ8abA/Hf1AHwDR0FGj5
         2f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766697; x=1786371497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=hIxsuTrgyCVwgoSHfg+pw475yKSDweVeZN4THPTLTgBZZJY6pS9JFy3PijRXfcNbp/
         L4+RrEt7OTaVS8FgRgtCa4Bs38Pngpr229kOQf5MYmxwVsfqHW/WvwzhydyMPtj6WVzy
         7rl9Xb48+0WUcdaXQnenodwSSR4+vj7dHZDjl3mO/gAJ5XM6THQJ5N9XiPZlHCPvFdnP
         6HSlIK0MnQYSr6yeDqG8uuTl9Gfa4sxyBmBM06ebRpDtvHY+CEa3chMhQQcv2z4SCIwS
         OHP3jC5e6NTffj4Qnd0gofPQNdW1aUT2b0MI2o3Iutpr7X+PNaYldnsDn5/EWs0cVwmp
         C3vg==
X-Forwarded-Encrypted: i=1; AHgh+Rp40xRyi5CO7zJmJYiBXkum/4o7r0xUi7Ni4JA3B2MM4lJArIFlreuZwq9AvOxeM2dBUH+RxyvSQKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQd69bOvGZQ4MJNzZWDzUQvt5/5aUxQ0Al7VDI85ivdjp5N3I
	2G6V7uA3s9iYih2TskbZ+3BaKlKIdKVZbWF5bAFk4m11VLaDTzkisppW
X-Gm-Gg: AR+sD13E03aJH2uAjxG7Tc9K8WfPshUxFQX1pBouwiOW0iB9VjB+MuUxnlLeKSk08Xj
	iWR6Gd6ycTpt657vKliYhlbRw3J+JrAhzeg5wihCgtP6JXJ3S4RCUEAIl0l3wdfGVF3MuiT6+Cv
	moXmDrBOdVvK34Y5VRWyvpyHsHKfX4RFiU/HIjk4y7BXuCqo7TAdOXMK0/4Wo16LZfyVBClV7Ma
	8y3b6UEdEMG10VEMG1MOOw9zSvv8eeaX++o6DTc1i3kGZbuA6vEL2M3O5XHtOTmG3GtNgvKAgRz
	SaWo6FMLq+34F/sIWR7SFztWuWeGEiGfMlL/PjmhHikMBHKUg6PnadM7+onhdxLI/6IcWbBqHMO
	lz7DVWdTklxkEDNZsjuWl+YkA5QcOVKKW6BlKErz2CEm+g/Lp1TIXo1GbMD6rSUeAJBPDa76KuX
	362aUdTt9kbwvuFmalcj0XiM+kyL1U3MIlvsvuppRb24b2BZ9rNLw/4bBHQheCg4jJd5Rmr5hRl
	d6DniEASCa5D+FyKcx6
X-Received: by 2002:a17:90a:d004:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38fbc4d615emr9615843a91.21.1785766696772;
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices support in simple probe
Date: Mon,  3 Aug 2026 23:16:38 +0900
Message-ID: <20260803141659.559129-12-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek audio clock drivers call devm_of_platform_populate() after
mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
devm_of_platform_populate() when the new 'populate_children' flag is
set, reducing boilerplate.

Note that explicit of_platform_depopulate() calls in remove functions
are unnecessary because devm_of_platform_populate() is managed by
devres and cleans up automatically.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 7 +++++++
 drivers/clk/mediatek/clk-mtk.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index c3369a04cdec..71d70b5a9990 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
 
+	if (mcd->populate_children) {
+		r = devm_of_platform_populate(&pdev->dev);
+		if (r)
+			goto unregister_clks;
+	}
+
 	return r;
 
 unregister_clks:
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index b6504b3e77ed..11939e3e0b38 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -265,6 +265,7 @@ struct mtk_clk_desc {
 	unsigned int mfg_clk_idx;
 
 	bool need_runtime_pm;
+	bool populate_children;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.55.0

