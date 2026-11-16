Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818709;
	b=x1SK1W0N18c1hsSb9zTfinqhIRLrjG+V9lkvXunxkvxboEJGqSK76Vho/OC4QBON1aCo
	 2dotGk+8RZ1ZcMpk2hFvS7Ov3WT5lx7mpoFEuubW895gyiYDlPvtD84kmYDhq5xg/UI+Q
	 BuLRSTDXwGDy1ftC3pztosP0DZ4hLDS4jpXG76qVa7tROJKmbhqUYD6dV5LR+5zecIjCi
	 0LQjnc7JBy4Ft/bDwYVGkoCOWpxr+YCTHN9ZKozGX/A4vEHgagmcuSuldNM7g8KHTsV6j
	 ZUWHJ0kPEDhu00pE7mjOu8C1+dwI+PZX5lLb6WWRHq9ZHc8hQueiaXf5D7rO7J3g2LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818709;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=;
	b=uclWl8q/bRh3zPVe5GUTL8jjEdCc44JDSeKS0R9X+D69uGVA9P3iosWlDW5QH/LvD0Pg
	 aLAXEc8diVmw0priXq3nScT9GaxhTZezSAlMFPwR/9I1j2t79dDTtubqvUFYT3/hPt5xI
	 td4p7JL7io/3/mXChQI3Vu/PVYoSyR/WMWmW6DsWxNJhNlaFecTDCEfmrT3wpcdIW56ki
	 Bgs07jSojnJ02IpW07mfBrf6CpudkKtcX+TZXX87ENNhqQWsw9PjhBWrWC/z2eSVNtNtg
	 rAhV5DQ2qAWmn/XozOYaUlL9QgIbp4hDVKCencidl4J293znIiKG76k9fRKk66uCAIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4pcMMA4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C5606A32C;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4pcMMA4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794818708;
	b=yw+ctRDtUPXtaLb0/SPqvwx3UUgEXrslQ7cyP0wmtWdAcFbOv4qTmqtRVSLNwe7k4xBn
	 JXAJPdjOTk6ZNT5GIxw7lr+v1jFlg28JnP/v/r1RaI7G5ilsUa7GeucbQW7f9VE6EBpwY
	 VIuNwtFHKdl4hzA9ZSUU9bC6MbnVI1itnNfpC4iGr3Kg6Wc4nhE5eYBb4LOC54lHBllWw
	 olK9QSSNs3VnZ/3KfCrUxG7LhQVIMoHhG/C+UqpLY4hifsi0R5NEq/hwguq9YI/bEmTjd
	 it2DQ8Nc/cvlDJ3GICm2nOn9SnbdyGPtzr/ZOVn3p035aHtNmcexTkb43lJDPOlOlgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794818708;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=;
	b=uo3lO7OS9lnp3fwMgrkSbs3xWLa+7MdnBy4Ac32bwLwv8D7WVh/tioEtUcHeaQttYVou
	 F1F3cm8FPADVEbyxz2x/1M3KgA0zCmTltD8NDLr+wIgQRm6tl64vLWngN8rwC8D06zO7v
	 RLFV3bCmQMwrMGtl+1i6SvWeiqqJTXamgLAFjwUNIbBpej3rpe8rnV0PLSBgiiTahmnCU
	 AHNZdA7Pd7fMJd6d3nR0yvxKwVYKpIAG+iXVH9kDEjt/Wqf/oDzM8RLtjOQLTtqvNE0IM
	 r72hAYZYy/Lg2DhXK7CeDZbAhZUPtfKeFZOr10oc4CGVSAnA/wH7cDvFEr9pCaJUwwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A9D91F000C6;
	Mon, 16 Nov 2026 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794818708;
	bh=78oIkokJZirdbrk9ibRh931gBhzKbqHoRYpE62Jld9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B4pcMMA4BJqIPjhjMnjzKs0EdRb6/d2cskScb/0ONtBSX8ZDRpMighL8FX0/JImPB
	 cherqBXTxCrDKoZxksNTCFsxd3wtItrFSwVLEbbvTnldSt3K9T1CNixhZ9C0ErV1Bd
	 RTJMiWqeO3yZCgsQPaiNujziQcbf8S1YULiqYJU9oTzOB2OfBXtmKoFdIVuVBcH8md
	 W1LzuPR9dhAUdw72Rh6Gs/29KhIQxD1IAUhGTnkCqrbO9VO1A0najE7IcO8xbOskQ1
	 xBun5Zu+c56rZz7PksugmM0rfdhdxVMizNglaxbo4r+HWlrLaAlEHTO9TOalAnqeZB
	 yfenFN24Z04dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 896204A3E2;
	Mon, 16 Nov 2026 08:45:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 08:45:08 +0000
Subject: [PATCH v2 2/2] clk: sunxi-ng: h616: Register GPU PLL notifier
 before mux notifier
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
Message-Id: <20261116-h616-pll-output-gate-v2-2-a418026ffae6@gmail.com>
References: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
In-Reply-To: <20261116-h616-pll-output-gate-v2-0-a418026ffae6@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ilya Titov <ilya.titov@wirenboard.com>, linux-clk@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818707; l=1471;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=QL/weaZ6VGxEBkGAwe9yYKN6VnO0kkiDcNvaqnoXQSE=;
 b=77W17WrT9nFCzC+g6lJHQ5hR7OvFqbPOm6VA8sd65vxexQQJGeaCX4IXRt/PSOBZ0yJZ8Jt5Q
 ZJfHeM/omhGBwPsMy926W+02bT/vUWgreFPRf7oIuJYzzYK6vuEvh8w
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Register the GPU PLL notifier first, so the GPU goes back to the PLL
only after it has re-locked, as required by commit 02ae2bc6febd
("clk: sunxi-ng: Add clk notifier to gate then ungate PLL clocks").
Commit 0ec5e7572ddc ("clk: sunxi-ng: h616: register CPU PLL notifier
before mux notifier") did this for the CPU.

Fixes: eb963d7948ce ("clk: sunxi-ng: h616: Reparent GPU clock during frequency changes")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 4037c5f022a8..8f53605eaafa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1254,13 +1254,16 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
 				  &sun50i_h616_cpu_nb);
 
+	/*
+	 * Re-lock the GPU PLL after any rate changes. Must be registered
+	 * before the mux notifier, so GPU goes back to a locked PLL.
+	 */
+	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
+
 	/* Reparent GPU during GPU PLL rate changes */
 	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
 				  &sun50i_h616_gpu_nb);
 
-	/* Re-lock the GPU PLL after any rate changes */
-	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
-
 	return 0;
 }
 

-- 
2.55.0


