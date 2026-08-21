Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C57391E7A
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316274; cv=none; b=Y1/+gB4RhNjF0QeadDaUFGKqy5spxVEmI2zHOL9tT7sbafTN4b3Zlticf6lW49O6balKeVCW1/G7k2+1YGOAEZvHJyrLZq8n8krLb1Nb4eawQWvaIYDYh2ON72p1vbr2lUxUO/P2EXifcRXPwDP/h94DAXkf1M88bE5SI7yN534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316274; c=relaxed/simple;
	bh=djcYxF2e39/kvENtiMpLEFJgWXgzA4hLWg4OZhV5gJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgihpJcqqCNJGDxK7IPM7Z8GVsrqzRwSwe+DpWbujdD3b8/k3+rJztnLiHj/D3bXcIM84cUUIBPXE6VbAKgEHe1Pi4BIajWeXWj6MIEs8xw8gxbS/yr6SNDDIk0Y8K3XXiR/sUurAlq7x23GnHhxsGaPAAPdhzka6pjg/xKDHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47231F000E9;
	Fri, 21 Aug 2026 12:44:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc()
Date: Fri, 21 Aug 2026 14:44:28 +0200
Message-ID: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When assigning a non-const pointer to a const pointer, no cast is
needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated code.
---
 drivers/clk/at91/clk-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
index 6074ed2a16cede94..77f905e57e1ab4de 100644
--- a/drivers/clk/at91/clk-main.c
+++ b/drivers/clk/at91/clk-main.c
@@ -170,7 +170,7 @@ at91_clk_register_main_osc(struct regmap *regmap,
 	init.name = name;
 	init.ops = &main_osc_ops;
 	if (parent_data)
-		init.parent_data = (const struct clk_parent_data *)parent_data;
+		init.parent_data = parent_data;
 	else
 		init.parent_names = &parent_name;
 	init.num_parents = 1;
-- 
2.43.0

