Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23D045C6F8;
	Fri, 21 Aug 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306687; cv=none; b=ku17L5n3HufDwjOjTO9TrYBJX8aYAKTnBJqkiGwtl/we/+kFEmJIC/qlVmauTlJj2lhXQekOaTd5eUulU1i3xe9vhGhUt4mQ9fx+QESliFuhh8rJ1t694W0bXlnYTJMzYmze9qwlZ6DxzqHgJBVhFPKs3+2uOpk8o441x5mjuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306687; c=relaxed/simple;
	bh=CqU06J7mp42nyI/Fs0SbLRLKWzGITY9jNT2MwTs8zik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uL72R9PG9bX/X7a/KYj0ww9Nu0KpxNRGRhjwKkocByvkdI6qxIR5nvyNQUBpFp5tCrou7YzEAsVUL+ME911Hyw24aaDzZZ1p//Y1d6mPZvOKunctV5bEkRiF9YFcFCAeNyO400jFTQlKVm9fjZbqbMWOP72Sz8jbpt4v6fM/jWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0111F000E9;
	Fri, 21 Aug 2026 10:04:38 +0000 (UTC)
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
Subject: [PATCH 2/3] media: microchip: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:29 +0200
Message-ID: <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
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
 drivers/media/platform/microchip/microchip-isc-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-clk.c b/drivers/media/platform/microchip/microchip-isc-clk.c
index 24358d804e75d75c..65d5fb8019b341b8 100644
--- a/drivers/media/platform/microchip/microchip-isc-clk.c
+++ b/drivers/media/platform/microchip/microchip-isc-clk.c
@@ -231,7 +231,7 @@ static int isc_clk_register(struct isc_device *isc, unsigned int id)
 	struct regmap *regmap = isc->regmap;
 	struct device_node *np = isc->dev->of_node;
 	struct isc_clk *isc_clk;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *clk_name = np->name;
 	const char *parent_names[3];
 	int num_parents;
-- 
2.43.0

