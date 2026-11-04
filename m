Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793758451;
	b=B+1rLcGkpz6DQExmWNXpPoitnEqg7W6nJXMz7jDK2ygYuIZw5NlYvhwxn+fWRM+wSLcd
	 cpB64FzXSy4OXCpkwyLXwy1gPc2C4oQweoUR2QcprYe2m7G858zguxBK9De7xb4pCw7Y7
	 pE/ivRTHqM5L/w3A3ISV3I2BEpd9+P8heb/ZgblGpk4CON3yGB3FumzyreDwRPsVug8ni
	 6BdOGdV80RLBzOOzdrDIqXpWWFPSVe7ONu6uO4w926k4G9wdeSf9oC4WMg7yI/5KYG4e7
	 zwFFcC3GOH5bAylKCcU8TSrnLy0QBBOdYTwMSwCIiTp62fdcEQT5ZDpM9X+REZSLg7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758451;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QuWnynJaFtZ4mUeHAMb8ZXbGT8gjmXFWO9hN7OPXEGM=;
	b=yZyjoWcT7pJyBiuH5yCif9le81zRq521juUE6DbDZPoYyvyu5XlgXFItc407K+rBzQHe
	 RjaaPKTWIvGdzPT5KZFh9NB9vzpKgyJu7uuvL1eMObT2g1JTZrKuuENSlJ5/aqI9S6y/a
	 cJaCMEe+zKc9OADRQrbc9LrcjyM9ksCDheNH5VeqLEDZFN8WqO154jXAWkvBlp8HVp3eI
	 6gyEF6RW9VBVgG5dnbjS+F8dUFImWfoxrPpJt5eCMVni0Ksv3F0ncKE9K6yBTCBkSNfHV
	 GlbgkuOS/S/736YNEP9pFiCeozj5RRHdLKgV4dMZq5VvAAIsMnPaeZGnfPKUyBovFrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9VAbBQK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB9606A329;
	Wed,  4 Nov 2026 02:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z9VAbBQK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793758450;
	b=aFNKdRUX2+JWSIZgrvzWn/cw2aFplahu5cvVHPy6UCoJuHwEV5vGZiJy7x5quLo494WP
	 6LHHL2eytQ9MAWOFQY9XnadkaBuZj9TFkb6WCr9Hyc/xrc9XHL+ub1+HBRZ/8x7TKkFyI
	 HzrGn+2kwRLwalswlgliirIfsFpxwEs6Zz8wHfaNyCD/t+XOkhuuS86obWAL/FQdwqjtG
	 G8Z8OCWwmm1t+pdh44IOqSlvWp7zJNaflWCmbggjjliYSkWEjY+o2cWu0gduIzaDCKjhA
	 lCa8p75QmRZ77yCmBm6foE98KmWnMLXp2rZUOsvRT8TfsNnnwZIMx0zrJHLrGy9uNgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793758450;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QuWnynJaFtZ4mUeHAMb8ZXbGT8gjmXFWO9hN7OPXEGM=;
	b=YP3cQskzF694e/w5lVmfMMdnim+0c2o9GQ+G8JCXm4FazUhSnzDtnRAs5ICHCzmgG2cc
	 NX7wnuj763UkSre32zlH60Mmi9ntr9X7VlIA9Z+Vki+VNiZd8mlURMHMhiNWXKaQa7qqx
	 oehGKraWcbFgL5cvsSqzVgacTqUSZnrxRHYIzQrIaKgWLdp0e9+ykWBhQMpi98XGIeOcC
	 /WjnP64Qr1EJeme8QGbWJnh50zNKqF8/BmL0W5xyytmBIP3iZg3Ay8wPQh2VG1/GpWgxV
	 wQSafkV/3RS7MBXaM5WB9wNhou1se+PPo9FwjTJlcpFcISfM1HUoBBAxetfaxjIQagw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D07D1F00919;
	Wed,  4 Nov 2026 02:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793758450;
	bh=QuWnynJaFtZ4mUeHAMb8ZXbGT8gjmXFWO9hN7OPXEGM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Z9VAbBQKfPvU6iJQrlyB6F6w5GXNLz0eGsV78q2Avwaa8u/lWLDGL7eTGuKDPhp2K
	 0OldadH4+sT874n2OP0UOLIxjQGh4PXAw3gW0p6w5MmPfEopZ0doDaq26xrxxNOHU+
	 zWwY2YBeM5lNvQwrsgBnWNHr/Dg/edD75x8bJF6x46DALoud6P54iKAE8klgCAHzd1
	 9fjv3u6y/NfoEvEDwGYodFlu7Em8urPS5LwBhiW2vD6WCB5UtIX2uKJwkz+KM5YbWj
	 H/H/USBhktkaFMxjXnXJ5vh7ZxzT6LhrFu0zqP+CbFh3fFWFGWwQINTzxnU/S42fk+
	 ffxGO2IfzeQ1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A02FF46BB9;
	Wed,  4 Nov 2026 02:14:09 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 04 Nov 2026 10:13:53 +0800
Subject: [PATCH v2] clk: meson: Fix PLL enable timing
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-fix_enable_timing-v2-1-05cdaf34fcdb@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAOCU6moC/22NQQqDMBBFryKzbkqSioaueo8iEuMkDmgiiYQW8
 e5Nhe7KrN7n/zc7JIyECe7VDhEzJQq+gLxUYCbtHTIaC4PkshFctszSq0evhxn7jRbyjqlaDla
 reiwHZbdGLKXT+ewKT5S2EN/niyy+6c+m/tiyYIK13PKGo7lZqR96mYMjczVhge44jg9Nqm6Dt
 AAAAA==
X-Change-ID: 20261027-fix_enable_timing-842bfa84d4d4
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793758448; l=2881;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=xxrXTMztdBF0a6VBQPK0bEnfAifBskZXSA2NITGHqh4=;
 b=3C/aE4+3IjlZRhPCE2+cmWyBrKfwj3h7F6xGKTAv7WFzD7Xvq/R7XnrXwbaqnesEhZ/KTy9XC
 HvDa3fB608+Bphq7/Q9ei3vd0wOxU7GPwFeplrgBqV81rLq7WR33XbQ
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jian Hu <jian.hu@amlogic.com>

The hardware requires a 50us delay after setting the PLL enable
bit to allow the PLL power-up sequence to complete.

Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
may fail to lock under stress testing.

Add a 50us delay after enabling the PLL and another 50us delay
after deasserting the PLL reset.

Testing on GXL shows that the PLL works correctly without the
additional delay and continues to lock successfully after the
50us delay is added.

On A1, remove the redundant 10us delay before enabling the
self-adaption current module, as the new PLL enable delay already
covers this timing requirement.

Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
For example, enabling the GP0 PLL at 1512MHz may lose lock and
result in an output I/O error:

echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
sh: write error: I/O error

Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
---
Changes in v2:
- Combine Chuan's patch to this patch.
- Update the Fixes tag.
- Move test details below the commit message.
- Link to Chuan's patch: https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com
- Link to v1: https://lore.kernel.org/r/20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com
---
 drivers/clk/meson/clk-pll.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..477eb9958a8d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -369,20 +369,25 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
+	/* Wait for the PLL power-up sequence to complete */
+	udelay(50);
+
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
+	if (MESON_PARM_APPLICABLE(&pll->rst)) {
 		meson_parm_write(clk->map, &pll->rst, 0);
+		/* Wait for the PLL loop to stabilize */
+		udelay(50);
+	}
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the
 	 * PLL. The sequence is:
-	 * 1. enable the pll, delay for 10us
+	 * 1. enable the pll, delay for 50us
 	 * 2. enable the pll self-adaption current module, delay for 40us
 	 * 3. enable the lock detect module
 	 */
 	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
-		udelay(10);
 		meson_parm_write(clk->map, &pll->current_en, 1);
 		udelay(40);
 	}

---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261027-fix_enable_timing-842bfa84d4d4

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


