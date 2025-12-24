Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F71F0994;
	Wed, 24 Dec 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561432; cv=none; b=YdVfetYu2FQWqD837+qUEg3IyHNV2mLDEmqU/MWX6CucOrzGLhAvvEpgJKXTdDBfDX03LnpvIrhjE+URMwOV7uFBV+vQFd/z5Cjod/YBAOeDrlKdQBgU4g3TRShitjMf8zPB4obOL28FCB2gJHZf6yCgr1U+G4eIl7MyNImcW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561432; c=relaxed/simple;
	bh=p9EApc/81gnQlU/LhWQkv1EujxBdHond5uKb1PR5F2k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qBKx/cCajD309lrAOm2HIZgWOu+JyXEpsZFVjNB7Uw0bReJrtxMWQfznmUod5bmoNqm8L0xiqfvXtlDEbn+rLBT6Xs9Jw16SSAFUO8lE1kOTrxB2XH1w4jbGEYF4pEYs3uVhMW3HiTrk9HdtjM0TflJePdpEJpnjRU95DzuPnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b6IkRrtC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b6IkRrtC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=p9EApc/81gnQlU/LhWQkv1EujxBdHond5uKb1PR5F2k=;
	h=From:Subject:Date:To:Cc:From;
	b=b6IkRrtCO/zl01DcGcHmlGgXYzJN5M8H9DRZ9I9D0jd5BhvE4b6rLvBopQp/Li5YB
	 7NUlBZb+Q/Fo24cP3c/CfY1axDQ//CX/t+2BLI0C23J9q/4XxKtn591/iEQa8rKXHy
	 uCRExOWtDv+XeSm9rebi+P7tjzgIDOcD+oSXj0mtD6qCq/+I2iw/oje0gLFb8bLIPu
	 FOTv2uZyBLVurw7jcXdwJlp7QZqSZGEYEPhnj3jwipSYBKVS0UQZJRO2JjQq/4+rK+
	 k8sCE2tc2JKN9qHIZ+pK0Atpz8D7fKgqvJaQZGTlMeJDrk1XbwyeAxM9E2K+dO21kO
	 2Fn721VI/xToQ==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531:0:f337:3245:2545:b505])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13A1017E0463;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id B565811A3A2D3; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Subject: [PATCH 0/4] clk: mediatek: Fix no-gate mux declarations
Date: Wed, 24 Dec 2025 08:30:09 +0100
Message-Id: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIGWS2kC/x3MQQqAIBBA0avErBtQKZGuEi2sJhsiDZUIwrsnL
 d/i/xcSRaYEQ/NCpJsTB18h2waW3XpHyGs1KKF6qVSHZz7Qh4wWnc2EtIhZz9r00hqo0RVp4+c
 fjlMpH3XKLrRgAAAA
X-Change-ID: 20251224-mtk-not-a-gate-ec0b6b6851a8
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3

When booting a MT7981 board (OpenWRT One) with UBSAN, the following
error showed up:

```
UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
shift exponent 255 is too large for 64-bit type 'long unsigned int'
```

This is due to various infra muxes being declared as MUX_GATE_ even
though they don't actually have a gate.

First patch in this series adds a helper to make it easier to declare
muxes that neither have a gate nor update registers. This seems common
for MT798* infra muxes. The following ones corrects the incorrect mux
definitions by transitioning to this new declaration.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
Sjoerd Simons (4):
      clk: mediatek: clk-mux: Add helper for muxes without UPD
      clk: mediatek: Declare MT7981 infra muxes as no-gate muxes
      clk: mediatek: Declare MT7986 infra muxes as no-gate muxes
      clk: mediatek: Declare MT7988 infra muxes as no-gate muxes

 drivers/clk/mediatek/clk-mt7981-infracfg.c | 55 ++++++++-----------
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 45 ++++++---------
 drivers/clk/mediatek/clk-mt7988-infracfg.c | 88 ++++++++++++++++--------------
 drivers/clk/mediatek/clk-mux.h             |  7 +++
 4 files changed, 93 insertions(+), 102 deletions(-)
---
base-commit: b927546677c876e26eba308550207c2ddf812a43
change-id: 20251224-mtk-not-a-gate-ec0b6b6851a8

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>

