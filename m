Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49A471415;
	Fri, 21 Aug 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306695; cv=none; b=NrfTGzN4sX3l+QrJgoJEc+kw5qyvx50M0aof08+jSTLfu7Eo/5pdvaG4Z6KIAD5tjyT7zYd8UhnPZMa/bYx/3q/ZdZQYdtwdGGTW1wxI/2aCpro4nNl1i0QqnslXD3crO+Om1/R4N61QuS1pXy3Pi9S6KcP4KdDhiErLTw0gBBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306695; c=relaxed/simple;
	bh=To7vyG7S8WVuaTVrTZ/xL3g3igge1x/p+fRyyG5urJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlKVaUgwlTQB8WFrY1nzoRAxA2YDPQBblZnjjNIs6AgRsnVRCIj1u60sSJgGHkRSg0dzvNPkuvQA11DOa8K715nQljy7HmTiZQ9BlKtL71JVXhJwthengaSGGtWqKBWVgJm5Xkb5a5gwd8G1AzsVpfSBPng290j5g8rFjoSXHCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D948F1F00A3E;
	Fri, 21 Aug 2026 10:04:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] media: samsung: exynos4-is: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:30 +0200
Message-ID: <2cace1b92cc8333eca63874de17dd5d5b1f9e5d6.1787240035.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
References: <cover.1787240035.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
index 2e08c4435859e8d2..638babf52822113c 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
@@ -1313,7 +1313,7 @@ static int fimc_md_register_clk_provider(struct fimc_md *fmd)
 
 	for (i = 0; i < FIMC_MAX_CAMCLKS; i++) {
 		struct cam_clk *camclk = &cp->camclk[i];
-		struct clk_init_data init;
+		struct clk_init_data init = {};
 		const char *p_name;
 
 		ret = of_property_read_string_index(dev->of_node,
-- 
2.43.0

