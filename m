Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5D3CC7F3;
	Fri, 21 Aug 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302392; cv=none; b=gW7UYOZCVCwjKi9HV485YB9CA6mZqLLNUA0xVOVfW8hhawLjiimVHvfY+OV0B6+ZT+9TBsv0nUScObVt0scHTQQZYRWhwzrqAg3MYfLxxw/e9eH7h9bD9l30xCNpvaOJxVJbWv2AcH7CA7reR5ktsSlv4NlFqtub+qZ8bHQs4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302392; c=relaxed/simple;
	bh=S/9ee2cw4+ALGgt4gjeCT2zWtiWeyLK79kfRmzJximw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mf/3TPHi3R/AsJhonuLj01IlpS/Q+t2+0GGmbdSTsnSR7CyvTdI8/RjnYHV6yIiQ09e2UA1b+RWa31WWSSJRChpoNBXOkoZrDFwH8HrdRwe3kqCNGJ0FmWpydAg/0rt45r00cOmQLbDXqDEw41mdNSSr3xRBCICNlQUGA2ddwN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F461F000E9;
	Fri, 21 Aug 2026 08:53:08 +0000 (UTC)
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
Subject: [PATCH 1/3] ASoC: codecs: lpass: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:55 +0200
Message-ID: <8f05a164722791336be39c83164a45b7a2d56d1f.1787239902.git.geert+renesas@glider.be>
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
 sound/soc/codecs/lpass-rx-macro.c  | 2 +-
 sound/soc/codecs/lpass-tx-macro.c  | 2 +-
 sound/soc/codecs/lpass-va-macro.c  | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 282a6aaa9986554d..2e74ec1a52f8a0f7 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3732,8 +3732,8 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct device *dev = rx->dev;
 	const char *parent_clk_name = NULL;
 	const char *clk_name = "lpass-rx-mclk";
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (rx->npl)
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a8e83eb60ba2d762..4ac8a11f30621c0b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2210,8 +2210,8 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct device *dev = tx->dev;
 	const char *parent_clk_name = NULL;
 	const char *clk_name = "lpass-tx-mclk";
+	struct clk_init_data init = {};
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (tx->npl)
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index dbc5795b9273f131..a3b3af0d7db3cf1f 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1414,7 +1414,7 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
 	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
 	const char *clk_name = "fsgen";
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int ret;
 
 	if (va->has_npl_clk)
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index cfd2ac0a6cdac4af..f6ef7f188b1ad408 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2638,10 +2638,10 @@ static const struct clk_ops swclk_gate_ops = {
 
 static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 {
+	struct clk_init_data init = {};
 	struct device *dev = wsa->dev;
 	const char *parent_clk_name;
 	struct clk_hw *hw;
-	struct clk_init_data init;
 	int ret;
 
 	if (wsa->npl)
-- 
2.43.0

