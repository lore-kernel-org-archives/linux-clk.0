Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC13BE155;
	Fri, 21 Aug 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302398; cv=none; b=cazOZxtDnACY82F1mALEFMAoaHRgqD/u7BXUJxcPz6pYYdCTihpWlBSspHZVTWPKgLgA1i7mnKB+oEFnTmq/EWwuzCCUsiDuMw+Tkp7W6PV9sr9S+Knb2OT9/oCMGRWbFiel9cZBJVNiOpSTCYrUAJquy1RC6gwrDXFcCHulb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302398; c=relaxed/simple;
	bh=5oZVaPo4l7oFhFMbAiNFw+RxleDJkRD0WclOy5p3nec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azxkdHLC2bGDNvWVlcY92UCeFqZWUNrxFcw5ibk4PgCxzxQ13bPqmgFOuku2qYg03eaz6Cfke5Iffz+syLlMqwE0VVM5CGomKYVCqLpu6y6cf2LpEQYVzySy7S+AnmKz+X+P/blo6drD0IEtqwqqHsOix5Yaub/SKIg/dgt9Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B7A1F000E9;
	Fri, 21 Aug 2026 08:53:14 +0000 (UTC)
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
Subject: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:57 +0200
Message-ID: <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
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
 sound/soc/codecs/tlv320aic32x4-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index deed61650e09db0b..ad15ce9c607915e4 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -451,8 +451,8 @@ static struct aic32x4_clkdesc aic32x4_clkdesc_array[] = {
 static struct clk *aic32x4_register_clk(struct device *dev,
 					struct aic32x4_clkdesc *desc)
 {
-	struct clk_init_data init;
 	struct clk_aic32x4 *priv;
+	struct clk_init_data init = {};
 	const char *devname = dev_name(dev);
 
 	init.ops = desc->ops;
-- 
2.43.0

