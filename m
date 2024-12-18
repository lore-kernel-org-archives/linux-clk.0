Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313419D898;
	Wed, 18 Dec 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519263; cv=none; b=gMjURHjMviVfxZ9jRelM0hSCdYYVKU7AKVSCNX6dQygjvtf6FEsfsGjKdGmfeFY507qi8FdF1Jx+IuzyjAQ7E/j83iBs+LnrhRBVkQ3oqJ7Xfa26Zaue0UnszfHBOuh4roLjXuBkvPibC0rI7s6qRzFaWi9ogsV0AyzzWRK+vUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519263; c=relaxed/simple;
	bh=9WRshbK6Lw5Z+qnOnvzcmUvJhTEZXWxHgVCSXR4loeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yn69HMWDmj6+DdQ8bdpnj2uPDsR0uc50h8p2MnWaHpNZi82mBTHom/bVbx8npx+ITu3hXfdHR/uMPHLaFORMC12rJr3G1Xcz5p62hkI/eCHgfKuBoXAcQuMHxsnn05NI+PWNVUB0Q+eDSWD+gLW1e5INNE9SbXO55HMb0DvN3e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uj3XC4yU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uj3XC4yU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519260;
	bh=9WRshbK6Lw5Z+qnOnvzcmUvJhTEZXWxHgVCSXR4loeI=;
	h=From:To:Cc:Subject:Date:From;
	b=Uj3XC4yU/HUaZ0jqKXbnmLOVlW0KmxRDlfwxgL0Fp8gs0HjxayTvGISg/ftoRTLyj
	 UB2Q9aY3xHGadZBKYc4yyFmbt/7F2Ypa8y+aDOoY6nwkhPGi95tR8Apt+TUxpd1Fef
	 YKMWC6BAFbqLiyxFBdIJk7+svZpERUUB+XWWxeHr+hswiOAJgPaRryZlBqyUZOHFCU
	 dEklZEGR+Gh+MESNHp0mCU0VuioHWJujz7gChrm/0vLSSqG8E8f4KquHXDZssNU0Jo
	 LfE6way5P05TU0MeWuFwiglYWJ1TZaL4h9W+p6dn3oHUciAnQdeODmKjiixSSxxi+z
	 XE5aGhEydoOVQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5738717E3612;
	Wed, 18 Dec 2024 11:54:19 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 0/2] clk: mediatek: Add missing clock for MT8188 HDMITX
Date: Wed, 18 Dec 2024 11:54:13 +0100
Message-ID: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a missing clock for MT8188's HDMI TX block.

AngeloGioacchino Del Regno (2):
  dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
  clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx

 drivers/clk/mediatek/clk-mt8188-vdo1.c          | 11 +++++++++++
 include/dt-bindings/clock/mediatek,mt8188-clk.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.46.1

