Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434843;
	b=i/drbbZFJHmCsAyj+I0orfylGF9efSMhe6SiWeFFIXMze8lzyMF8YiPso6SEjtA7LZNZ
	 zzX0nolYBBB8M+u/qUYuI1HoKtDN3opnh8PpET59zn0cVK6vT1iEJwT6vh7KpIwmXkyi+
	 3e2rOj82AfXyk+iDvL8lnAtccefoV+p4bGt/g8fEotpEUe/ljUMo1Sn1V/GTD/Gij8aM8
	 ZNqN4SvQCLOXpqYvLweweFW0EK7uuScroZk3e/ZNt58OvQYnryricwfqSPeLbsoii85xl
	 Lg2PnNPKGKx4WO/k8NezP8UJtxEw2FHB164KiMQo1DUlIdNTgilAoo/i8j9I0Wo0i/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434843;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=wQB6avLROIXiPmK+n8cCsjZDDZknF7IBNV5dCVVCAcA=;
	b=0ApYmjXxxjpx5pOP49PMplbB3nVZ3FESLSie52rkjVkApqnxtgSDoB7MC5g3be8Stl89
	 7vX8APRt1wKteWqlVPScYg4Vv3xL8CAM4/jSrPMqxou1U0kb5DX9a35Ud1OpmROc8W0jd
	 e2mQlvB6ItjF1mPse9q01k1GRvvQseUtnU2UIupghDr2XRlXjOQYyZdoOoAOqAvH3zhHg
	 KWJ+heRlvhEqGv6FRM1O9l2By7vOMLzP1RVq5eqtw/dCXPjcocu3cIKPyYdh6mBWY1mfd
	 TJtP086tRAZ7b9M3qMINq/U5JT5g0cHlRZ0pQ2XYyBLcAS/8vaDDfMosNCpdGIfdPzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timsurber.de;
	spf=pass smtp.mailfrom=timsurber.de;
	dkim=pass header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=ryJfnEPi;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2715606A31C;
	Wed, 11 Nov 2026 22:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2715606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=timsurber.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timsurber.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timsurber.de header.i=@timsurber.de header.a=rsa-sha256 header.s=MBO0001 header.b=ryJfnEPi
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jPyLF3sDBz8vP5;
	Wed, 11 Nov 2026 23:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timsurber.de;
	s=MBO0001; t=1794434837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wQB6avLROIXiPmK+n8cCsjZDDZknF7IBNV5dCVVCAcA=;
	b=ryJfnEPisdqIlArnTysAbzBAJCgavQE64PJnUt1pGqADXESLfYa+XLNL6w10dYJzE6v5n4
	vb3n0BYkBxM9rsyUb2EXgl4oZ2HY5vqFTu40khtAFy8HfqGroeNQguR3+k/WuGISLjoaRA
	IucobyuzLzfCAmI5bW65amPGJUPjwb+AD51SUeDnggqtTwOUt3fbH4mWYmpT2/1+ic8aMj
	nYyR2oQ882e1OpP89Ter54bR2+ON9L1LXLQB2ayPQYe143f1KHLHYpNA9gTnT3KAYt3V+I
	T1qarE7lQRwfyM96pUKcoBJ8VoMPHsqaDDSrfr9ESlEaUIMA6pdQg3yjNiNhXg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@timsurber.de designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=me@timsurber.de
From: Tim Surber <me@timsurber.de>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Tim Surber <me@timsurber.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3588: Allow I2S5 TX and I2S6 RX frac to set parent rate
Date: Wed, 11 Nov 2026 23:06:53 +0100
Message-ID: <20261111220656.3603628-1-me@timsurber.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jPyLF3sDBz8vP5

All RK3588 audio fractional dividers except clk_i2s5_8ch_tx_frac and
clk_i2s6_8ch_rx_frac are registered with CLK_SET_RATE_PARENT. Without it
the divider cannot raise the rate of its *_src parent again once the
parent has been lowered.

That happens on HDMI0 (i2s5_8ch) after a 192 kHz stream. Its MCLK of
24.576 MHz (128 * fs) is an integer divisor of AUPLL (786.432 MHz / 32),
so the mux selects clk_i2s5_8ch_tx_src directly and sets its divider to
32. For a following 176.4 kHz stream the mux selects the fractional
divider. rockchip_fractional_approximation() sees that the parent is
less than 20 times the requested rate and computes m/n against the
grandparent (AUPLL) rate, but the parent is never changed. The divider
is then programmed with m/n = 147/160 from 24.576 MHz. The clock
framework reports the requested 22.5792 MHz, but the fractional divider
does not work at such a ratio and the I2S runs at about 54% of the
nominal rate (96000 instead of 176400 frames/s).

Add CLK_SET_RATE_PARENT to both dividers, as on all other I2S and SPDIF
fractional dividers of the RK3588 and as in the vendor kernel:

  https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5c5640a10e9457d2/drivers/clk/rockchip/clk-rk3588.c#L2037
  https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5c5640a10e9457d2/drivers/clk/rockchip/clk-rk3588.c#L2055

To reproduce, on any RK3588 board with HDMI0 audio enabled and a sink
that accepts 192 and 176.4 kHz LPCM: play 192 kHz, then time two
seconds of 176.4 kHz:

  aplay -q -D hw:HDMI0 -t raw -f S16_LE -c 2 -r 192000 -d 1 /dev/zero
  time aplay -q -D hw:HDMI0 -t raw -f S16_LE -c 2 -r 176400 -d 2 /dev/zero

On linux-rockchip for-next the second command takes 3.7 s instead of
2.0 s, and clk_i2s5_8ch_tx_src stays at 24.576 MHz.

Tested on a FriendlyElec CM3588 NAS with HDMI0 cabled into its HDMI
receiver, the receiver's EDID advertising 192 and 176.4 kHz, and the
HDMI sound cards enabled in the device tree. Two 176.4 kHz runs after
boot, then three runs each preceded by a 192 kHz stream:

                          176.4 kHz frames/s   clk_i2s5_8ch_tx_src
                          after boot / after   after the 176.4 kHz
                          192 kHz              stream (Hz)
  for-next                175500 / 95600 (3x)  24576000
  for-next + this patch   175500 / 174800 (3x) 786431991

With this patch the 32 to 192 kHz rates still play at their nominal
rate, and a frame counter played at 176.4 kHz after a 192 kHz stream
was captured bit-exact by the HDMI receiver. I2S6 RX is not used on
this board and was not tested.

Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Signed-off-by: Tim Surber <me@timsurber.de>
---
 drivers/clk/rockchip/clk-rk3588.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9..63aeeb501 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -2024,7 +2024,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(CLK_I2S5_8CH_TX_SRC, "clk_i2s5_8ch_tx_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(140), 10, 1, MFLAGS, 5, 5, DFLAGS,
 			RK3588_CLKGATE_CON(62), 6, GFLAGS),
-	COMPOSITE_FRACMUX(CLK_I2S5_8CH_TX_FRAC, "clk_i2s5_8ch_tx_frac", "clk_i2s5_8ch_tx_src", 0,
+	COMPOSITE_FRACMUX(CLK_I2S5_8CH_TX_FRAC, "clk_i2s5_8ch_tx_frac", "clk_i2s5_8ch_tx_src",
+			CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(141), 0,
 			RK3588_CLKGATE_CON(62), 7, GFLAGS,
 			&rk3588_i2s5_8ch_tx_fracmux),
@@ -2043,7 +2044,8 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(CLK_I2S6_8CH_RX_SRC, "clk_i2s6_8ch_rx_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(146), 7, 1, MFLAGS, 2, 5, DFLAGS,
 			RK3588_CLKGATE_CON(63), 0, GFLAGS),
-	COMPOSITE_FRACMUX(CLK_I2S6_8CH_RX_FRAC, "clk_i2s6_8ch_rx_frac", "clk_i2s6_8ch_rx_src", 0,
+	COMPOSITE_FRACMUX(CLK_I2S6_8CH_RX_FRAC, "clk_i2s6_8ch_rx_frac", "clk_i2s6_8ch_rx_src",
+			CLK_SET_RATE_PARENT,
 			RK3588_CLKSEL_CON(147), 0,
 			RK3588_CLKGATE_CON(63), 1, GFLAGS,
 			&rk3588_i2s6_8ch_rx_fracmux),

base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
-- 
2.55.0

