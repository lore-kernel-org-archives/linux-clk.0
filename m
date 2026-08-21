Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FCA3BE155;
	Fri, 21 Aug 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302395; cv=none; b=mnQsx5cJ/LGYFPDqFgdyq/K9Z0H8vkUFRe8UPEwU0fMK1RqSSv8lTO6SLpYXNffQ+jAPwnB7aFhS7HHf8kIrnKUeniR9os6eNqif59nDB7JpmSa6ruWGSc4coAe5O88+a4DGBEb5ZSzrlVe0epgHLZodgMGZBs2ozJc8SO5GbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302395; c=relaxed/simple;
	bh=TFuo5mQoZ0yuC8ZrxhnXF7jKIInP8rZwf1NvcTuLU44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLo9+SAGzNFYFkwuTcXzRM877mD1nXdzmfOv9Ji3OqUC9aoc3R81kfvvFrNxcs/CVcwTWz53VJnx9JRPeyJnxmTPoMF+CmDJFHJcy1NRLGTxKI6KBIEQAzFDu03ektDMAdW46WdrWGLKfhUkeNLB981nHvA2GN7XS/iScb/pAWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746781F00A3A;
	Fri, 21 Aug 2026 08:53:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:56 +0200
Message-ID: <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239902.git.geert+renesas@glider.be>
References: <cover.1787239902.git.geert+renesas@glider.be>
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
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index caca5cc2510040d6..0ed24cca088f8392 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2130,9 +2130,9 @@ static struct clk *wcd934x_register_mclk_output(struct wcd934x_codec *wcd)
 	struct device *dev = wcd->dev;
 	struct device_node *np = dev->parent->of_node;
 	const char *parent_clk_name = NULL;
+	struct clk_init_data init = {};
 	const char *clk_name = "mclk";
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (of_property_read_u32(np, "clock-frequency", &wcd->rate))
-- 
2.43.0

