Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59A38F940
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308043; cv=none; b=EfRw65rPLKw4LOSOdQqfEi5riVzdjUV56Ls0V2ndmIZvRO1wTK2FGbrfj4x3Btp8i6GJiwAL8jswWKAzXvRg29t/2NMi8bIEnhMfIhCdXb+nhgxfNKRNhB3VOOszc4GZcO0/1tWSAcePMVUDagX2cW3uDvR5qAV7rs3GypdD07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308043; c=relaxed/simple;
	bh=WarqN185cyd7Pe1rhKwns4DKNXdydx2g5SvCDtgbdiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bosh4yqu/8OSf1siQKPTVapVRGuEX7mCZ++ebwvZMNmiiCi1OxHRInVFh6ziqOOe195U7DGVTrUBNGvA2KvYLrPi1wa/oDFPCASjusSNb9gYlSzylSgRoCtpjaBD5DEtkLZSrd8gMGXgaTmwzLQSkSc5XOwJEAYlzUafYq9TfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfdhQ-0005zD-Be; Tue, 13 Jan 2026 13:40:40 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Date: Tue, 13 Jan 2026 13:40:33 +0100
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v2-0-44567319aef7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEE9ZmkC/43NQQ7CIBCF4as0rB3TgQaNK+9hukA6tBMbIFBJT
 dO7iz2By+8t/reJTIkpi1uziUSFMwdfIU+NsJPxIwEP1UK2UreICooGvMISIluw8wtcMtbDGOM
 8g3aoOmWl6qwStRATOV6P+qOvnjgvIX2Os4K/9b9uQWgBtSZ96Yx5OrxH8uN7ScHzeh5I9Pu+f
 wGunHfVywAAAA==
X-Change-ID: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Primoz Fiser <primoz.fiser@norik.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi,

this adds two new PLL frequencies for the i.MX FRACN GPLL.

Patch-1 was previously part of [1]. The new version of [1] will drop the
the patch which is now part of this patchset.
 
[1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/

Regard,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260113-v6-18-topic-clk-fracn-gppll-v1-0-166e674aabf1@pengutronix.de
- add already provided r-b [1] from primoz

---
Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

 drivers/clk/imx/clk-fracn-gppll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260113-v6-18-topic-clk-fracn-gppll-6f1343c234c3

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

