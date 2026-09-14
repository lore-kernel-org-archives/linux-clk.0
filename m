Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC047ACC9;
	Mon, 14 Sep 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395676; cv=none; b=cCJPM+tsyuFM+tJ+On9h2spqktCTn0FM/avyC/yf25FtMb8fJ2uO/ZeSmef2Li0P5qn+U6qVdm9Dz3NEUdx8MrPAiuK9afLo9+4IljHYVfhOaz1QBrfTgowjLvUqcrtWzqxrrUfMh+ZtGnplheqiuWLvs0MP5b9NPx8eRKveDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395676; c=relaxed/simple;
	bh=RUjuEURudxuA62FC/3YKgFX+Jca+QNqEHhjwHbSSvWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajYxS74HK0lvQ+I8d/TB+akq1zt4asaBYdxK1O5B07YMT/5CUpXAVChLV+HYmG6zwG9wyhrtXRvT1OeZiCe1z8D9RQ9/qLdv3DENa9kMbu/dl1b6Da9dLsZbPJZVFrkXlY210sE+97PngYZAXKxyjRVbRb6uzdU4PuNQKYfx/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OKzWNuKv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OKzWNuKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789395672;
	bh=RUjuEURudxuA62FC/3YKgFX+Jca+QNqEHhjwHbSSvWI=;
	h=From:To:Cc:Subject:Date:From;
	b=OKzWNuKv9eEo3SSOjHFmQr9Bdku02etUWBv5Bzlg0UYBJQsSanvY2FACiBdq1/ErQ
	 xs4tgeVjObiq3UV/hni6D8ZRtdQ4WEb1BcPUeNesTRH7VTAwxWP2LmjonUl1SLwZpe
	 thZ98FgfrFYOAAecbBjCorcITBFhoCICwQz8C1qyqmVqqxQLrzA7tdJncgkeQjDOmB
	 j0VtmUuYK6L/3ro+pDVVgJXb74HxoDa+IBaf0Xm64VtRAIYxkeNDOiWILh8bZpychz
	 Eqh3CS8OzMrDXjWOwK6W11KwVO9UJeBEX8v4zuGbC+pP1kx6qJ9W32fvLjHqR8aub+
	 oWNa1LlSk9lzA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F4817E0075;
	Mon, 14 Sep 2026 16:21:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: bmasney@redhat.com
Cc: sboyd@kernel.org,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
Date: Mon, 14 Sep 2026 16:20:39 +0200
Message-ID: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As asked multiple times by both Stephen Boyd and Brian Masney,
add an entry for MediaTek Clock Drivers with myself as the
submaintainer.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7dd93f200d51..881ada7b2af9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16722,6 +16722,17 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/media/rc/mtk-cir.c
 
+MEDIATEK CLOCK DRIVERS
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-clk@vger.kernel.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git
+F:	Documentation/devicetree/bindings/clock/mediatek,*
+F:	drivers/clk/mediatek/
+F:	include/dt-bindings/clock/mediatek,*.h
+F:	include/dt-bindings/clock/mt*-clk.h
+
 MEDIATEK DMA DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 L:	dmaengine@vger.kernel.org
-- 
2.55.0

