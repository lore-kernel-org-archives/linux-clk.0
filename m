Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94350EBE9;
	Fri,  4 Sep 2026 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537552; cv=none; b=svtrCp2XWdi8UaQkDvQvtGZB561OYfR+cT8mVH3q9F65vO31lItdvwNXrK8PYTLasxSzl1pBomFAgwuTx8u9ltn7wC5R9qtyLo12P2p1ozNk1Cb4eYWc+U3bE7CtkM3itpHUFlM8/ywkcyeN1NFd5Di7UHBOilzG2eWUQ/DQ8ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537552; c=relaxed/simple;
	bh=AjWZadrtSiC8GDg0pLJcG+NWHWGZanfk+LgDY0etyOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV9OKQEVk0XbX+Bd2HRGBvhnA4w8D6FeWdBb8OcPvNRfH63NOG18zdVn8t7OgwLMhKPLry0GmAlYJG59WLwvfBrmCFSLMSC7nDrRmwzq5+ZQEZmnOh9In1ua1GsinXmeJUHRHFQiFwXwj18nSYMnUZ1YBDFLioJqsA+6CcjplJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b8Qj4MD+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b8Qj4MD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537548;
	bh=AjWZadrtSiC8GDg0pLJcG+NWHWGZanfk+LgDY0etyOM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8Qj4MD+vJc4xmAk6oqtWw7bZTjA3i4sL/2giMjIXKqQtm8fjwIM+oCg9CORD8dIx
	 XjRE/5zZXFiiPDXxU63RjYPlVBEyfPjncn8vSvqBICyuc5vNwMEJ/LYxfApsD6rq3T
	 F7hZ38TZ+bTDcS7Bq0GFyeuedcysVpNOjXENJesbt2V/3RhvDeQ8KDK5MkTSduaqul
	 G1FyxpwtitPthOE0OeM8GSICGUDRszEOpnyef0aOAdAxRYgFVZMQmdFiNbrFbzFlGP
	 kMe0mfKDEzK48NW//VwAXOfHoL868LhDwUw2C0sMJ2M2Xl9FTVf5JSeq6C3NZl1AAq
	 5QXqPmP1TkQqA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B2B517E075D;
	Fri, 04 Sep 2026 17:59:07 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:28 +0200
Subject: [PATCH v6 17/27] clk: mediatek: pllfh: clear state data in
 mtk_clk_cleanup_pllfhs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-17-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=1162;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=AjWZadrtSiC8GDg0pLJcG+NWHWGZanfk+LgDY0etyOM=;
 b=w4ppgXFeiUJ/ZE3L7QLNPm/6CukSJEtWcDH58QkUDxCepyfL1dLJumsqpG34qMYMXVrl3jPc9
 h98KyNf6ZFNAIwcOKpVzZg/mxqiS35y1nv2x/Fw7tr+0dUdb9Jjeqeu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Currently, fhctl_parse_dt function sets some state variables that are
never cleared in the unregister nominal path or register error one.
As they are stored in a static array variable, given as parameter from
the caller function, they retain their values until they are initialized
again by another fhctl_parse_dt call.

So, add a loop to clear these state variables in mtk_clk_cleanup_pllfhs
function.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 398edad2a69e..ae56d4ad66dc 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -244,6 +244,14 @@ static void mtk_clk_cleanup_pllfhs(void __iomem *iomem_base,
 		clk_data->hws[pll->id] = ERR_PTR(-ENOENT);
 	}
 
+	for (i = 0; i < num_fhs; i++) {
+		struct mtk_pllfh_data *pllfh = &pllfhs[i];
+
+		pllfh->state.fh_enable = 0;
+		pllfh->state.ssc_rate = 0;
+		pllfh->state.base = NULL;
+	}
+
 	if (fhctl_base)
 		iounmap(fhctl_base);
 

-- 
2.55.0

