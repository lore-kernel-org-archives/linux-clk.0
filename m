Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5911CA9F
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721217567; cv=none; b=cMObb1oAwCwlTr4Rwrouypqp8b+sFi04YRoMuymfo4HDMEzhawbn0iWlT+WzTPv2EUSfg9+5ZpQPiRctPMerO0HO9BPkbgE/stpOwD0BW73xnDMpzpFJQXnyMPczDtOUChX83p1apXwyFqN2ClL6AI7QC9d8m7vtrtRIZkDVcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721217567; c=relaxed/simple;
	bh=KH1+6eSbxrB1U64vYzIFihUaz/eu4frVte02WfURPuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEss3llm+ii33QATG+/UUtp6yNI4rw4O8Kk9iQ2vIkEiSOFQH0w5MNdciALZnl21NNgGCqkO5xlr9eeJ9bd3D/yPgmTG7+8TfJxO4PLGljfpptadzCdgEpreTKKWDzXB9XWuXiOiw/5qwNdLD2vsmwGxzWb2E2UUtVfC4fmhNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JhLI8e9e; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JhLI8e9e"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2cb52e2cb33so343299a91.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721217565; x=1721822365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcTlzdSbCPYBa7vAri6YqB9ZoXDHn//E8DaLgVTWQzY=;
        b=JhLI8e9emxYmzJRT/L5LOOMg+NVG9WDV2UPKhn5eID0f0GCPilxt5awOgwG7xIYvD6
         UbEONuCF4AEaI9yZfNs7A57eULJR5sLncCR2EDWlMLGtxFKzB5E762YPLFiY11e0DC0t
         45rIGPA4rkcgDxA6LeR2SgPnPwYolJ9/t5yVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721217565; x=1721822365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcTlzdSbCPYBa7vAri6YqB9ZoXDHn//E8DaLgVTWQzY=;
        b=GRH1wXlMeBCxUbZVKqCodFFijVJNlEqlSFE+C05DX4S6ycCsPqv+Qy9qS8Icpi7ah6
         goRotWgsAAepP5waJSrQXtMGbL45V+91ZVqaIZfgUboTCCAct55R63pakp8q+qs+WSre
         r4RLgC6elbGse4+LFi63/PLkVrI1W149wzGNBhupWtk+/NeNEM4Asf2RbY1vP8+lmAJv
         6npgemcwrzvGVuTc0vb/94V/hUmyznv5gcKitpBF0N0DmW/o/UKEVxHzsaZ1HWPT7K50
         9y5bbefGwsu8IcYENPKxi87mNd+SzTD+xNhldLDb1w3/XvJXuAi3hyKK3HG+vaBakrGl
         8vLA==
X-Forwarded-Encrypted: i=1; AJvYcCUB/TMz3QfB1ex4ExzQ7HhivZRiEo8/dSyUhZD06ekZs4wbspMY1D0xdmU6buk8ZN2V/Y/qSg38P+67WA9vmG9hQDZ6/fY+ZaKP
X-Gm-Message-State: AOJu0YyhL/kCUiVyWAr7+BBUSAuUz60jdzNL7L5f9LR7wPAEjZurwKPI
	yYjqJPyXDuh/Lmmpx++kjobl779jKT1sKYARR2hMGwq1jIz5gu3IyUTki9CcCA==
X-Google-Smtp-Source: AGHT+IE8xpZ5IZDUMHdNrgUQW2/WR8g1HkPeRhtTiLALcp2Xt/UQv21YSG9GEN31UQfbsAOI8lOinw==
X-Received: by 2002:a17:90a:c7d1:b0:2cb:5654:8367 with SMTP id 98e67ed59e1d1-2cb56548442mr722546a91.26.1721217565184;
        Wed, 17 Jul 2024 04:59:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:97dd:ecf:8796:54cd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd41a01asm10006858a91.32.2024.07.17.04.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:59:24 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: reset: Return regmap's error code
Date: Wed, 17 Jul 2024 19:58:52 +0800
Message-ID: <20240717115919.975474-1-fshao@chromium.org>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_node_to_regmap() can return different errors, and it's better
practice to pass them to callers.

Clean up the hardcoded -EINVAL and use PTR_ERR(regmap) instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/clk/mediatek/reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 290ceda84ce4..f8c0fd031512 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -138,7 +138,7 @@ int mtk_register_reset_controller(struct device_node *np,
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
@@ -198,7 +198,7 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		dev_err(dev, "Cannot find regmap %pe\n", regmap);
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-- 
2.45.2.993.g49e7a77208-goog

