Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793191471;
	b=lPxdqJCuGLg+dtWK7C2fSrI7QhZ2iXjsSf6eWFkV3E8DzGV70HO1Hfu+vEILjmQiAC7s
	 zdkf3lFuNoPAR5BLWZB9gSC9HxWt2Nu3uXEcatw0Z75aNK1VZqxR45S3EnhzkGZx5ZO3p
	 tsS5siXwq95GMtITws4aH/L1Ww5hoD65EsAFxpOAq9f7fVKK7xmOAVbl7FT+2qMf76RYI
	 XxQngAxdxcbjR6xgnJlcmO6tou7zxt4eAOBKGbYqEEh31c0OcroMNeqrL3TYVIhtixILV
	 JE8nizwAohVnNuX2soemTwQOTrgbe+d83Sf44EeERGSnBZsK5CJw5v/G1MkwPbCBiXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191471;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=;
	b=FmXRnFQH9AvPE5+NCwSsckAQMYYFxC5EuG5w7ZU1G/EzeJZQwpAKKi0BvWoUpOeBGtdi
	 J6Cn3FM/ZBYpJdTDTgbK7jPteAeDSvQXlRhjF7Z5EtfHa4L2Y6eemOLqhtIKUG96j4ISd
	 89xxWBBWR5o4EqgG7TTgkXSvl4/zRKBJSojc2Kzc7UAPZkgtVGO0HZdh1YP1M1TIwRiqy
	 wppVhcNH1/nRyKnJsl3WbtvwbZM1/FX9TI7sc95AVR+b6IgZ2fJ5frHBaKY8SbBaDOSeN
	 lcwxvgW4Vlp/7wt3X3/IMIZmlPqZEyQfTEGt+CoDmFeaPtD6Ul1XNU+R6ExSB25aIag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McjKoNXk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39557606A31A;
	Wed, 28 Oct 2026 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=McjKoNXk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793191470;
	b=3qQfLR9M3Jz/X+wc5XvOARSMs4LT12IgLNnd/cXpAexOk1pO8/SEY0GdGzQXjJqZRVbn
	 gXnTpKlq0k45xFAnyNARpJFB1JGwk7CcIwATiUfHJzD69UoKgDiQl5L8Ea06aNKltlsRQ
	 6WIbdOXPy6OM8hn6Qly5XNfftIxn7LoRAw4Bcwckjq8Un++eTmUnZkPSNW5Rg5xcYww7z
	 iy3XlOYbLgILpOitQTlUDVYHmcwHoYGi99HAWfmp0TuJ53lkXOIj5QV1L0S85daclOHdA
	 5ycn2Ti+2aJmalMZ6g3UHn9PQXE1iP42BjruJIUHGI0davPUCJrOjzGk9m2XgqW2YjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793191470;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=;
	b=n7J/Uaa3Q4Z7KCPqirp0LWeSoKfYcw8287Xfq/oKgEtZjNLcFfCHix3y7TS6gSMpb4w8
	 0ZMwqwVCZUoSt6fpB9YsjTGsc390UFOIxO/Y28vLIy4PmcfJHCSVVx0XaIJkqL/b4qB1f
	 7ZCTQTt8zM33pDsAHwj+U/oe7Iq9TxhOM8kZYWwDlsI6aKttMJXy5rrpL0R+ywbzdZdb5
	 KbmT06LXqh0I9eVZHVoFE6yUX3UeEeS5sk0VJG0pbEr/20lha/l95V9ukn24f3xh1qr8i
	 4TwZWawU1FcUDuAugweyA6peMGeRHvFuqlTzWF6nTCb79htvp1lqqqIThW9L+B7K0xA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E8D51F01825;
	Wed, 28 Oct 2026 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191470;
	bh=+BPqdivArSTnDxx/nLyMyQqfSMjb+Q3SA/a4HI7G+OU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=McjKoNXkLY6iD9z0dXPBPVukRkuMf7R+qpuFS/FS+BLMNL2M9SfiUlWwHndDJhBzC
	 EoAZspVJ5JoG4yBksohrVwYPfo3qKybSt7K6KkI5yuY3Gf57JpeiLQIq63wxtRoYeH
	 PwGjgJ78HN8GzikEDzzMSYOrkhv6fBfEOEzxEE7i0zcVl2IN5A5QPLEb0M441I8wbE
	 h7ASsH2Hc4FUpkx57BMtUzOBHtmGK1ozdnWRWh1tUs8RjzaojcKNmvE5w7+9v9ourn
	 MkNqfXAU8Pv16xD1sY1NLE7hKaFzZ92gchvZ3MItvdjrwZBTBASIWMfKTe7Uuoexr7
	 6RRIEhB3fByWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DD9245466;
	Wed, 28 Oct 2026 12:44:29 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 28 Oct 2026 20:44:27 +0800
Subject: [PATCH] clk: meson: Fix PLL enable timing
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
Message-Id: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACru4WoC/x2MUQqAIBAFrxL7naAiJV0lIqxWWygLjQiku7fEf
 A3MewUyJsIMXVUg4U2Zjsii6grm1cWAghZ20FI3SupWeHpGjG7acLxopxiENXryzpqFAd6dCTn
 6P/vhfT9ze29gYwAAAA==
X-Change-ID: 20261027-fix_enable_timing-842bfa84d4d4
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191468; l=2238;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=YfHg1NjHkAGSOc2XXMaHJKDSXCBv1aRkCpS0Jq7/gDQ=;
 b=qTW8KkZNLM3nV9LOBSEEfQv+uKohpmDxYarjmNUCZ87YMmcC+ZjOFJeNXG7A7twBX6tKFMe48
 rrpR1N39P4PDMv+hoT7jDY1Y1lqjTL1eiOqT7SGtztMv14yYImlyOrh
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com
Content-Transfer-Encoding: 7bit

From: Jian Hu <jian.hu@amlogic.com>

The hardware requires a 50us delay after setting the PLL enable
bit to meet its timing requirements.

Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
may fail to lock under stress testing.

For example, enabling the GP0 PLL at 1512MHz may lose lock and
result in an output I/O error:

echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
sh: write error: I/O error

Add the required 50us delay after enabling the PLL.

Testing on GXL shows that the PLL works correctly without the
additional delay and continues to lock successfully after the
50us delay is added.

On A1, remove the redundant 10us delay before enabling the
self-adaption current module, as the new PLL enable delay already
covers this timing requirement.

Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.

Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..77ea2960120f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -368,6 +368,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
+	udelay(50);
 
 	/* Take the pll out reset */
 	if (MESON_PARM_APPLICABLE(&pll->rst))
@@ -377,12 +378,11 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
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


