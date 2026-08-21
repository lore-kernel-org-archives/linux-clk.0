Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3E4756BA
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306903; cv=none; b=FwOMSL3q1cyW4RqVRI2oqEjmaagIbF23i9MbqSBRHVdlxayFvmvav71jdosV3fOaeyNT4JErBDxl+i9gq36ebZcajqmqJnwTYwlqilae/mZe13KgjV1s7820U6NkPevkrNXdSluph+X8jCwrookZ2kvdb0r+TtT9HD4vNoF3BgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306903; c=relaxed/simple;
	bh=oNhkoDCjQhTdo4QlnP2YPleWcSfKqgKiHw9ARc5VHrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLBVeS3ngwjloVn3y5oL5QbByD4F3IGD9wR4nKCCDiVBE+Y1Pagy07hEnggfx2QGFb2D334vL+9EHBSIcCGlbg9HzKegYgVUI3peGZ1EatEzx9v8Hw2GQBKAtrS+EN/52U8aB7HjrCbS52S2CxFmd6l0h2EJKTTB9ZR93aU9hsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0189B1F000E9;
	Fri, 21 Aug 2026 10:08:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] peci: controller: aspeed: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:05 +0200
Message-ID: <48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This patch is the PECI subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
---
 drivers/peci/controller/peci-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index a0c99ecf7f3805a1..2f4ea0e7d7a77dbd 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -413,7 +413,7 @@ static struct clk *devm_aspeed_peci_register_clk_div(struct device *dev, struct
 						     struct aspeed_peci *priv)
 {
 	struct clk_aspeed_peci *peci_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name;
 	char name[32];
 	int ret;
-- 
2.43.0

