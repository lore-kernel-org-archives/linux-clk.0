Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7F3AFCE8
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879184; cv=none; b=S0xeQxrqn++fuLgDmhqX/u1l4YYN+qtNsyBpXPCvl2RysbGLzrqufWXtcdK8U4W2ZyZEIMdK6YIOuibqATqpeO8SCqa4jYY/ipaMgTBZN5AicS/fp/Hzsv7EJKRZnzfS70q77/w9tjPAq/3Q/l1VvXXWz3PR59dstXqq/XiEL34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879184; c=relaxed/simple;
	bh=KyldzKIqdW3A1epFIea3b0OO+1ktd89XOtCYJ38/E+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DnE+P+pZp4x84mYjKhDhTC3lE7QAvmQ63k4QOyojc9wBWchnkMHRmDfl3df07voJcNoyhHWSbw/xSjXEALPP0XU1q/TNYODL83hs2o8B+GlTlSMdQ1z08WmSZ84NZd3MXqsu6NTiJPqHCSAAwr9AKIF81WAocHdZbcXUVomkODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjSBSn7E; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjSBSn7E"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38deea72eebso144440a91.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784879180; x=1785483980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwIbnjGCmeH3D3DjgVmMARUl/ZNfC0Cb9elF1xAUD2Y=;
        b=GjSBSn7EOY22CtpRF5wj28vwJX2ZvvhzuSRHx8tbplUu6T/TfpnzfelFZaq/zlocmr
         PqiEkLC3ldIGpGVH/y0MCHgodSrcMB1T7wGE1RPO4qq7ggaGKxY1hDSBCEr7YZAfQCLq
         fIx1M/9NzCQosIJXWRa8fvEdlgtc/6BzHN7DibTOV2BtXBWA98Sy9xHZJYN+6QwWbmF3
         DVrNemp9iO8SEVgRve5Emu2WLBIo5EhWdnB+XtX2qubt66hHNGm70ChjC5gUOL55oVWZ
         7BHmNgq2/bqTFErC/kqUWaTqYDt3KJgAy1soflxhVIfRgypCx0DE3ftrDl+1SkunEpwD
         jfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879180; x=1785483980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwIbnjGCmeH3D3DjgVmMARUl/ZNfC0Cb9elF1xAUD2Y=;
        b=Sng2vgq8+t++68dXQbB1d7+cGZ0FLR6r7P4w4/MAS884qOJt+r7/427c4AwPiJFNlp
         pjmJfiK6vRZg89fr9HGRmNtCBxLRFjwmOmpH+6OIq6oJCEq5uGH4/WnMlC75/Xtc8Meu
         DYeJNawVEeSmedSt+2ycDnsTwV7oKOpngU5/QsvBzbYUTfOxEtXcWtxx0iKFO/vgvudO
         nIAqEVxunEvTq6b2gRAyWdyAQ/dAxBgll5TJEc/GDp2eZjED6fzy9uDxFz1TgOcXcsda
         EzFk1B2dKo3Etm201WyVPyknKM/T/VJSZzgTzj0aZnKX0T3GOLNl7HEwgMkftbHEQzIV
         BQlw==
X-Gm-Message-State: AOJu0Yy+NaiWCojvgVnAh+3pRubqWSgd8rQARI5HjJHd1jnlFBjqTxG4
	APOIwvhxxceHtdTp2715Gu8vGKur7nJpFLQSJHNxLiNZzCnhDVmFGxoH
X-Gm-Gg: AR+sD12SIbxhF4QmSPJn5DaCQyWO0F3hgDjNk0TdLLCsSdSXMrfCiw0lcNcQSscp89L
	L1uH4Jdbx7UJccuwDik4jgus8qNaqFLXEdvETbhAQjL2fBe8fpy2VkU1r31BRlPuvyZm0i8PF7M
	I7hniHO/pqlGyset7mRjDAIwTyd/69CW0w9Hdxf8cAGyL/TeIxsTj//CHMjQi8Zbh/5/NOobnji
	/tzT57kHRVq2g+nGIa8zfSQhKVdnaGJImxUj0ZX8y2KBsE8bdSUTvXo4b10p5v5KyOfQRo9RXTj
	Vng3ee3D2ZfBIxZtDbFElOcvFyl7SjESrdCnGoy2DGAAMwYwupSL0lCOXq2dCh0fckWRrsvLdTr
	TEIvFE2I3auuNZcsYwlbuAHTmWBb5D8MdCOw82f6xZS+FiYHkTOJHel/FLss3naNEJjg79v8Ozt
	r0Y53sNa7UO1ic5C3WTION+7xt0MlGbpaFoF52orFaNl8ZTGyFIPZIzqS5G3xJB1pQ+jJkSVobI
	Bzn05INLQWPQpPdHTNDjQ==
X-Received: by 2002:a17:90a:c107:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-38ec65662acmr6774203a91.27.1784879179712;
        Fri, 24 Jul 2026 00:46:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03ad0e0csm1083073a91.7.2026.07.24.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:46:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: versaclock5: restore cache_only on regcache_sync() failure in resume
Date: Fri, 24 Jul 2026 14:46:03 +0700
Message-ID: <20260724074603.28731-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If regcache_sync() fails in vc5_resume(), the function only logs the
error, leaving regmap with cache_only disabled even though the register
cache has not been synchronized with the hardware.
Re-enable cache_only on failure to restore the state established by
vc5_suspend().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/clk-versaclock5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 913fcc5675f1..d87899118905 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1240,8 +1240,10 @@ static int __maybe_unused vc5_resume(struct device *dev)
 
 	regcache_cache_only(vc5->regmap, false);
 	ret = regcache_sync(vc5->regmap);
-	if (ret)
+	if (ret) {
+		regcache_cache_only(vc5->regmap, true);
 		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	}
 	return ret;
 }
 
-- 
2.43.0

