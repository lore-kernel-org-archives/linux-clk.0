Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202D2857FA
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134584; cv=none; b=lD3bXywIkpTfTojZWgiXwr8EijHa9u1a/mAy5WnnWjelC/VfveSeQ4CF1Y8RcqnAUxxO1xPFriep4pGGbzkBhJlI0cDG3LqI8UPXRIYEvBV0Xm5e3XZPE6N1L6AWJhWxPadtWi7WrIinyZCml6oq17JZXiTCpr/Hv+ep/7NBLZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134584; c=relaxed/simple;
	bh=JowWEV5lcIHxp4u92sNNMOfatfjQ7ZENC4xcufj7568=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSDgrlwKA4KK8TJY6ih1wLvL8f6yre8lgmylB4AiXjhC5y5/jWxZGhlrI+/0iixTvtuyJzb4KxdTYJFGFyWrTaTc1iGKqP0aa8jWteHhAyCv2FNwjouKv/YY6U8CiXR9gTkRjivO5GhK8Vk+kHemIr5ceCFFMk2CYC1wTjXuB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SGHwEaCs; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SGHwEaCs"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e202e0so4006583a91.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134582; x=1756739382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=SGHwEaCsTl/Ya7s9iAkJnQRXcAZFGvMvtq4IQCcTLwUtJ38d4a0Fa9wilNhDB1RLeo
         4ikks68V7f0PVZiY3OaaBVrHMy8REu9Th1zi7GzRPvaY3d2zdqGo7kdbqguRbqZYyHjD
         lU2zB43Ef8lfzbgfItJS5+P4+EiDN+S1B+mxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134582; x=1756739382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=lWn2G0bRlubQNP868IFnq/hPNiqHMxhz+F7f/YOndCC/htzolqefQMlmyj/VqmEXzu
         wKZFBMBvVzCoREeedCLaPaLIPmm+XGxJiL7cTBRrkQCKUDM3lBBwd8e8lj0z2JqtV0zK
         UNcvh9KfMWqxmWlQ5Z5sM8Ppkbs6FAnBD+u56K05TU8aTbH8ltHFl1mh6m0zglxKo7Lz
         IVFpXyMZffsvjFhWTn0ssuxOtNWHV7mnm6w0zQCAymR23/sNe2ZOxaDIn4WXWfjWjj6F
         xtPQx77PSdFQU6ZQw7hRvuO7zJnEvC9/5h6UkSBz21WpleAH8TxBYJHr5kOIgsYzuOxW
         6sow==
X-Forwarded-Encrypted: i=1; AJvYcCXWK9RmEEu4qxsyhyC+qI6H+Hp9NSQi06fI2YZ58pp/UQ9PkOWla6CQmw1K7Ay4go3bUXgWfVfW75Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lOAtGbsJB+xZcV49rbG3BGP1Lw6+6uAy69m3PCA5kqeav1mO
	iPbp38XW3NcJ5m39hVcf6Ji/8Q9wCxP6D52qUwrmLH6X0vkMFatjPIymFH5oRzQggA==
X-Gm-Gg: ASbGncuLT3HZvefz8g5WK5GbHuPEmfGAF2D+RuI075Gbo8LOnLyO50zBoxC/Q5w4J1i
	VNConBjoV9/UNdFpH3VdkDyxcNrJ3QXbmrgiGSnBsfHo5bTVydodwdYvzUTbRsNFc6csDgV57wM
	OgzXZBqM7HoMIJKpGS9Qg/K8oQu2Qp/hnbBmmJbFhbKNf8SSXIf1U+/K/z0jbXqjlwAQi2qv4F+
	U05j3jhwCicHrG3PAAClHslIODsr2X4xZA6wgmFGXmBjgN0cqIZcrMB5XmJEDB/XTYfEFR95LIj
	XH64eoG9WTEgZWOI1IfrAiHzYZwMfka4IML/MHvU1475Vnh6qmzfnywYiimwfTiwDIvwoLUMnuo
	421UosETR1hNs3j3Ax0nXuEzJVA5Y8MTbErGGmbB2
X-Google-Smtp-Source: AGHT+IHPJV4TXa61Ud+4jPZUdeIqShsQV2PbYlibNvBybfblxKwhUtY23QymfLSEF6L//QSRFz+xzQ==
X-Received: by 2002:a17:90b:3e44:b0:313:f9fc:7213 with SMTP id 98e67ed59e1d1-3251744bd41mr15706597a91.21.1756134582435;
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d5a9:711e:13f5:e60f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254a1e4067sm7481215a91.10.2025.08.25.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Mon, 25 Aug 2025 23:09:31 +0800
Message-ID: <20250825150932.3695931-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unused variable
---
 drivers/clk/mediatek/clk-mux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..9a12e58230be 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -146,9 +146,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog

