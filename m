Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D53803E1
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787262449; cv=none; b=F/nwDrzoF2dywz8MAwGkFaRI2DB9RsHPfhoqStjTh70ATtiWFAaqaRivyRkvc02wjb4ScLXDeavUS9lO6oJTPUugOIGiTEEg40a+7JVKucClo0jLHD7f7ETU8M2P9y7TNCvmTX5rAgsTIbP3lFXEpomnn6kJKtdWKq/leO8NS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787262449; c=relaxed/simple;
	bh=JhG4NqL6xdCiPKoBwOJleJchuXI/zA+DtNmBh2rXsdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNlZjfKvnHmTzgZ3mMeKpRc63Ml1C37eDIEss60elGF9Ijy/PdGV7E6RHA7SUrbSK4zbyZ9WKai1hLRbBLR1q6rCtdu5tmgfUItGk7g2tYz6ieQG8KreqsP51LvukUkyzbVkWDu+1QazABbqBQEebk9biVfRBCDbtNd7LhG31f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8X0U5iT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8X0U5iT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so465635a12.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787262446; x=1787867246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5ocIiFd6KFZwrrDp1pILTG65RoVNAY9CNuzSL/XjFc=;
        b=R8X0U5iTyj4YLJNTjwomSzEa8h/d3k39WKeb2xK+Nd3vlxRrfoM0l8A0W1YXtxlHjw
         bcK6UgBFuqojx+2ANek3YDsKBZT6nDEpXhjNYr+iE6C0HsYQ+Blxj58qHd28+e9iZVb3
         ZYgqJxNO4aqmaFsUE9javw8AcoyFJjN/2NJzOxViBJ9nuhjFoxNjpTnE1kyCGT7VQQVi
         8Ua3cz2dmLwDKbb4joBl0TU0uUsIZKXKaYoS8qsHUf7/NFDkcigXjEZ/XvyU30VhF4RQ
         bcvFDgpToid0bArLMAxri0QNAR5rk1Rx5diIJvUXDoW1fQJ8jjEBknYY6jX/Tky0zJSH
         ij1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262446; x=1787867246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5ocIiFd6KFZwrrDp1pILTG65RoVNAY9CNuzSL/XjFc=;
        b=clAaXsS03HhEJ6UGAMKI0+bIeqYwoj9eR7ECDzJD3EarrafXT1+XPvFbmM9AizE/ee
         bHhXt3ryHr1rP41a058jMV7SHjV6pVMjD2fKQ5xgsBWS5p6LTHiOUvxBN45rrxCW20nv
         7EMAWBxNFbFF+1+d5hTIGMU6g7z3UfjPBJeUhjdLkhCBjzO2OSbyVIY6/2+CFQHgwLkp
         MkJn6wezgNj56jEnB6BJLJwLJvdwgRYJHxOa+X+uGoPL99oDWH2LnRupFWvV4WIBCJgX
         GTJMy6Lt4avfRlbmP86PKTNBQd9hq8+gX1iWiAHGIglVQp4ror5M81AlPWBurQcLdOn2
         7JDg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8U1gmwis+V0g6uCiBZ9TuslQvqvSGt2zzPEzLtWwV/CMigVjzSUUxJMls8Un7qjLw0nIrwCiHiXw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMguznkWIhlRuT+T9qasVDiZyrsbVUiqymZP7n4WuPuDgW8qaM
	RSEUI9LI2n5wOBZCE/pcBVBwmUq1Fmaq9pqrK730KvRiF1TA54m4qCnq
X-Gm-Gg: AR+sD121ZLnbG3KpBpdSUPjrUwIDxlb3mwzfcukr1Ne1osy9C0v268c9+AR4fV1u/KL
	WZteHqFyKe4mNuAZ7ECUF5EWmVbDFg8ryYDMrQa9eGQVQh9uapwH+BdEVtuIWXuAil735I1i3ci
	FrsAdESTnqnL8gWo2TpeggFjIgijNC8n7HARBgSbFh+cOUO4qLJv6kXCi1d3o0Wy+k2agbvHJ53
	bp+eAialrKoZmpO1rxGx1ynsZSPcAEpW8VoKYPHZcbDzBaSVFnBt32kSUuvrGQDeaw22H4vmxOk
	q0LwawI3n+YmXoq8PleLDX+qx8f1Y++qFNc1vHEJOVoEuyrivfVRzBEZkdjhC0+f1x2Ta3IgXJ2
	n4a9cJq1CTWM18Jsv+tYsHnLAfXe9eQD3MS/UvIWtrRVnSN3ZMmeqsrYsqWUuzhXtByi13GUH1f
	HysB27at4PB5Xj8aEfLR+sGd8UZIhxceem43sgSaKGK/7YSChR5l5Hesez8vFiLmKqe8RYwv3RN
	fAWTPLP7AQJoBsPhRxop1/pXHGWfF1rrO4ErZtT/L2qHW11r+WpDo8nGw==
X-Received: by 2002:a05:6402:24c8:b0:6a3:f4fe:9d5f with SMTP id 4fb4d7f45d1cf-6a42f1a34e6mr1355647a12.11.1787262445589;
        Thu, 20 Aug 2026 14:47:25 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-74.loc.akton.net. [82.214.103.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm3288724a12.14.2026.08.20.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:47:25 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ben Peled <bpeled@marvell.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH] clk: mvebu: ap806: fix legacy binding failing to probe
Date: Thu, 20 Aug 2026 23:47:21 +0200
Message-ID: <20260820214721.11879-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of
AP807 clock support") factored the probe path into
ap806_syscon_common_probe() and added a test that picks the Sample at
Reset decoding table from the device node's compatible string:

	if (of_device_is_compatible(pdev->dev.of_node,
				    "marvell,ap806-clock")) {
		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
	} else if (of_device_is_compatible(pdev->dev.of_node,
					   "marvell,ap807-clock")) {
		ret = ap807_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
	} else {
		dev_err(dev, "compatible not supported\n");
		return -EINVAL;
	}

That is correct for the current binding, where the clock node carries
"marvell,ap806-clock" or "marvell,ap807-clock".  It is however also
reached from ap806_syscon_legacy_probe(), whose device node carries
"marvell,ap806-system-controller" and "syscon" - neither of the two
compatibles being tested for.  The legacy path therefore prints its
three deprecation warnings and then fails unconditionally:

  marvell-ap806-system-controller f06f4000.system-controller:
    [Firmware Warn]: Using legacy device tree binding
    [Firmware Warn]: Update your device tree:
    [Firmware Warn]: This binding won't be supported in future kernel
    compatible not supported
    probe with driver marvell-ap806-system-controller failed, error -22

The AP806 system controller is the provider of the AP clocks, so no
clock is registered at all and every consumer defers indefinitely.  On
an Armada 8040 that includes the console UART:

  platform f0512000.serial: deferred probe pending: platform:
    supplier f06f4000.system-controller not ready

which turns the failure into an apparent silent hang once userspace
starts, rather than a visible probe error.

Before v5.4, ap806_syscon_common_probe() had no compatible test and went
straight from reading Sample at Reset to decoding freq_mode, so the
legacy binding did work.  The commit introducing the test described
itself as "No functional changes", ap806_syscon_legacy_of_match[] still
advertises the legacy compatible, and the warnings above state only that
the binding is deprecated.  The breakage therefore looks unintentional.

Accept the legacy compatible in the AP806 branch so that the legacy
binding works again as it did before v5.4, keeping the deprecation
warnings intact.

Fixes: be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of AP807 clock support")
Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Found while booting mainline Linux with U-Boot's control FDT on a
SolidRun MACCHIATObin (Armada 8040). U-Boot's arch/arm/dts/armada-ap80x.dtsi
still uses the legacy binding, so any board booting Linux via U-Boot's EFI
handover with the firmware-supplied FDT hits this.

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 948bd1e71aea..332e7c21ea07 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -152,7 +152,9 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	freq_mode = reg & AP806_SAR_CLKFREQ_MODE_MASK;
 
 	if (of_device_is_compatible(pdev->dev.of_node,
-				    "marvell,ap806-clock")) {
+				    "marvell,ap806-clock") ||
+	    of_device_is_compatible(pdev->dev.of_node,
+				    "marvell,ap806-system-controller")) {
 		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
 	} else if (of_device_is_compatible(pdev->dev.of_node,
 					   "marvell,ap807-clock")) {
-- 
2.43.0
