Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795257914;
	b=TPnf7LxWnmz7V4KKoL830LRd/X9s3yvVGidqVJwjDY2GuY5Br4joMFiR9w7jHfHu3Nq4
	 fh5Rxeka7LOH+yxkoVp9ODhwVOgpKFINL4Vfcx66Vt0U2GGa6HfVsKr/Qa74NDFxDYESp
	 r5C/PSAl+rM1sKMmf3Czvh68+2U+J3p9PCwk+Zham+1PIzHTmNrbmjKf5GStqNylaVN+r
	 T3UEZGKHl7JhfzgfjZ7vtbwZ7oEC0e5F81NzDMOYO5BvS7ILejpIL05k7vNSgjYjgx0IW
	 gXFciJmXHwgx0U0TuD3vrgJvhJRh2cdZqzKDmP6R8ZvGgb3VLKNcwe5zrR5W/WTIYrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=RrcRHbj/G9MLcSU8nLl8yl6T1TR9Wr4lqQ3X9FOvOBE=;
	b=wiYELql0OCknxIyPIjWdDw2M1zGaLXvPnvt+agz7LrapaHO9DYni1TBWx3yCiXjZxiud
	 n8B3kJzWFKOodYWjLYLBnkczz6OJ/SPQ81mmfUBRwwNx0AVUKsVWNctouiqNPwTM23M2I
	 oN4t0TFzW8iL53SCATy/pXJzfqQv6EERX4bTlRABwBv/9xmu/jLXuq2HwyCj/1jkEyrH3
	 XcrB9Z5fwYhPFyRsloGTiRyBWOS6R8KmxUV5q5qDQF/ZG2u3AuXDUAsiKae1JHQ1CSBBz
	 b6JvFt42y0lzhSnPC9foamz/W8UhShAhOTyvs8EY6K0ZbhrtkPR7AvKUax/shamDJGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ggPe8m/O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16B606A332;
	Sat, 21 Nov 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggPe8m/O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795257914;
	b=QP0ymJrh6W+qJG3c84J2pzvzSsH6g9VhZWRXyScpqw91nzdMnnwWzAath+up5A+thyIB
	 2f0HHuFyLSGu4hCYg1NaF/DsjEcW1gWUF3fKNq/Q4eey9NVv3pKNZtyKIVeh/A+mvG7s3
	 tw7u/xKOfl9e/MHN9L9zMcB96b3PljTGnBwlry0fJXqFqU4CQ0LEX2ib4AIUgNWfMFQg3
	 fYY3fOZlDsYzW6WF3ZMebDmvzISy+PBCFWS5oRrLZ1hd/WpSpaSe6E5drU+5EZCo/eGk4
	 cHQFGCf/qNSRxCnoVdeKBf/74ht9pdRAAnc5TvOkxb6gfx+Hzf9msw6VEEgMYXVTF9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257914;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RrcRHbj/G9MLcSU8nLl8yl6T1TR9Wr4lqQ3X9FOvOBE=;
	b=BQf+9YGO60AJQkXE0IDlKvXDSvilxd6l3k8Z33SNdGpt4kErwYBd8j2pW4EJs3Pixs9G
	 nFEvGnQWkr0f5LhyiiBYow4q27mi6zBp5Ml23iM/8i0sdvMRIss67QPPVIr4YANtcshXX
	 yTV76PdxPoYDvQGc9I5qZTdL7DdpoxF73qNB1JtK5VukanTqqGzehYv3e7za9cf9ptpza
	 ivWdyms2cl+H5IuFIKVsAf1EO7YxH+8RFrKd1N++cfyswxTfxDEimh01TxH3QcS42RGqu
	 QB3It2qxwHDhLillPhsjZr7TASZ+cSFuxRcgGVVwvlzFkTH2rtIDjpd83B3wU7QRHow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B3E81F000C0;
	Sat, 21 Nov 2026 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795257914;
	bh=RrcRHbj/G9MLcSU8nLl8yl6T1TR9Wr4lqQ3X9FOvOBE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ggPe8m/OyPhCuWezzjMAG0Mvlbrz4d9kJmMvvJMEDsb45U8Q5P8+JMAW29uuWz2ar
	 MmZVrVsOELR6nB+AU90A0qxKEN0Py209GHPBi0ZVmXpDH+h4KDCZsSJ6Rfl9ie2xut
	 xSwywTHiRBlVOLsFsEbItyPs5yMBQmSa2UaoE++CyjzX8wMOhxmHItogod2Dij9Xw1
	 S5f43Bkrgv2RfFHux4YERJLybVa0rElYnl0D9aDp0PARkIM+aBkV0Of2wogOLEVeEY
	 hpZ1k3WnGm0mXG8nk40GJs+pufo7dLzv5+As0LRD/2DCkH4LSp3xFHBH0XAtmOcqUi
	 QoVzJUjN6c71w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 639A34BBEB;
	Sat, 21 Nov 2026 10:45:13 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 10:45:12 +0000
Subject: [PATCH] clk: renesas: rzg2l: Don't mark a coupled clock enabled if
 enabling fails
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-rzg2l-coupled-clk-v1-1-c38c8299c176@gmail.com>
X-B4-Tracking: v=1; b=H4sIADh2AWsC/yXMTQqDMBBA4avIrDtg4k+gVyld6GTUsUElURHFu
 5vq8lu8d0BgLxzgnRzgeZUg4xChXglQVw0to9ho0KkuldIK/d5qhzQuk2OL5H5YUmMKm5rM5Ay
 xmzw3st3Pz/dxWOqeaf6P4DwvpwpJMnUAAAA=
X-Change-ID: 20261121-rzg2l-coupled-clk-6cf75d07374e
To: sboyd@kernel.org, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 jbrunet+clk@baylibre.com, bmasney+clk@redhat.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795257912; l=2447;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=3y15QbBzV0RnkTxoTog+ECpsMR9NS7LppzilDPoTG4k=;
 b=rBqqHHjt9+erqhzDjInR2FFJQu+aaY9fmkYHpZb5dHmxnwctDJWsFGz6zgxPgOIp3Fq5F0a2B
 G8yjBTFWrESCs7jEMOcOAQwdPIlUM0WYIb1FlUMr3Hprq1eCWbt+baM
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

For coupled clocks, rzg2l_mod_clock_enable() sets clock->enabled before
it touches the hardware, so that the sibling can see it:

	clock->enabled = true;
	...
	return rzg2l_mod_clock_endisable(hw, true);

If rzg2l_mod_clock_endisable() then fails, for example because polling
the CLK_MON bit times out, the flag stays set. The clock core does not
count the clock as enabled or call its disable callback when enabling
fails, so nothing clears the flag for this failed enable.

A later enable of the sibling then sees the stale flag and returns
success without enabling or checking the hardware. Disabling that
sibling skips the shared clock bit as well, because the failed clock
still looks enabled.

Clear the flag again when enabling fails.

Found with a static analysis tool and checked by hand.

Fixes: 32897e6fff19 ("clk: renesas: rzg2l: Add support to handle coupled clocks")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 with clang (W=1, no new warnings). I don't have an RZ/G2L board.
---
 drivers/clk/renesas/rzg2l-cpg.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index dc2bcbab18f1..18c4ed362295 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2080,10 +2080,11 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	unsigned long flags;
+	int ret;
 
 	if (clock->sibling) {
-		struct rzg2l_cpg_priv *priv = clock->priv;
-		unsigned long flags;
 		bool enabled;
 
 		spin_lock_irqsave(&priv->rmw_lock, flags);
@@ -2094,7 +2095,15 @@ static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 			return 0;
 	}
 
-	return rzg2l_mod_clock_endisable(hw, true);
+	ret = rzg2l_mod_clock_endisable(hw, true);
+	if (ret && clock->sibling) {
+		/* the clock core will not disable it, so don't count it */
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		clock->enabled = false;
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+	}
+
+	return ret;
 }
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)




