Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B9A411FB6
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766666; cv=none; b=cPFZz0abA4cnlfCV1LJuN3zsnItSVzW4EkEXTVgS5GKUIdiTV3DTZ8MP3ltJYaBUJFkuEvki+R6e2ySUN626AIkn1ZqxHI5rEF0ZC+CLzxrwPN4t7WPHeZ6p1AMbgxk98uU/UH+Ramfyqo6/+KO/HEztMaW5kFqLernvAtFNWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766666; c=relaxed/simple;
	bh=PU2WLxTCykVfv59jdFKxJyVwUaIMow5rckLVbB9Wydk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgFiU93/D/2rv+gnPiB2t2Lc/K+YumDvg1EUdruuqgW0yB/Wjd+DUHxQjSHvE51qU87PyuXagf7Zioj2JMuktdBXqi8JmeO6jfwPYH9G/6RJZZVw8NeDiLn9Yw6QZ1aPn0h2nkd96c2gaRrVqN9JCJwhMR1QFcMYbjXgvfVI1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyyC1YIm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyyC1YIm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3217523a91.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766665; x=1786371465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13/m9BHJpTOrbyiXp3UlB7/KUp3A1MVFY837aXZLXF8=;
        b=AyyC1YImsRsLna/FCB8mGB1hdUoZGaaldEh9POag7q3AdyiZJAbudh4KQwgllQ/R79
         TdPxY+3HqXH6jzyBzhtHEJhcBxXjlrhWJushMn0I+SqdNVkuAWkA+w5hqT8GfTUSVzTk
         1ZceJi/0IjJvMcm5L+lMxOlIU6CnseejzoUgCAwOIrwD0pKgAaflm1TzzTlOcK8RUJMe
         iIsRwKHJ5LUAci/reLfjuR4QqqcyqS6+f+1P2DyRFRmG48dXnjm2Sao1zpdsBtlF3h7v
         yRKSNqykXy3Sz3nq4MwawChGBuN4CRE600tXQ7y1ihxMuZZC9s0qmSSQPR/pUjq2mH4z
         79jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766665; x=1786371465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13/m9BHJpTOrbyiXp3UlB7/KUp3A1MVFY837aXZLXF8=;
        b=HvjLn20wLqh0yIuJzTT2zwrUVwOgZrQrgusBDgb6gMruMqAoNZLSqzUiOZ30g7dyEA
         tD/aaBQkoCA3IdO7ESItReU81iLuzVuA3W0HtLqjnGKpKCJc8Lchp6ExYgmgY37e+nBv
         NMgcqa6YmEIChZ/HkYsIkExeY06d5ox/NI76SHn9rgZbUHTR6+ZAyphZdZPd4jG3kgRW
         vlLyrgxxPTxeFCYXkooMqO1vN8Sp6+v8uP3MIxBXhybchehf5zVXhXYwiCMz3t+vbhF5
         UoqejycsupBNnINLtsr3z7J1kQhSU4geb5+SzkACaJ4zvDhAddFX6/Wlvva4ACPZp8Op
         ciaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/8h1wcb1ZTz6IVO47cdD8gV+KM58XMpfWP5P5LfOr0E06kVMBKSBDy8lAZ5j23/8mMj/aJgNehVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVA3VMxqWPiWkdJ1Ge2hVbv6tcmC/quOTLA7J/7C8v9ecayOTf
	5fvzoq4ev1VNePpWOh3VtSqiiyJpKYOI/esqEfPqDm5jJifK0zf433iG
X-Gm-Gg: AR+sD115GVfoKUn/1oZ+2i0DaYzgetqZEVOgT7jj1iWoiYrHB4yH2KVaAyDm4UpyL/e
	lfQqb+RTixE9UB5W+CHlSgzLl92KKw8ihSSnTK/8V3IUgu2yi1SUME/tNxNSc8PSCqF8xvbdxgx
	Rf/QOxLVu+0wdic7a0V554ZIxm2c13wPgwBGvGl32ysGR4z3WSr6LL9EMfOrr2utnfZS4RhvM1L
	OUT1EyJQxDDdwGucd/nJe4zovJH70Cq2A4FgdpxhEXF8RL4C7AIjgEQXcMJqg8oVfpUrnjc7UiI
	QGwLfRHXkRBPGwjjqwpyHfnz7B0mdJmbK2bkPF6/xLFxnX5kDvTx3378rLs6LBExMghpB3P0C2q
	7UjJ4PZ9vRjPrOjL6ly0btJsJFq8VjyxJb3gcrSNriswWYu+l2yHbw6FkHgIOLGU83cgvWpMwSW
	ppZIL/bjIH3sBch1UfqmTbS1nme2U5+uyxPdMNyUBvVKmGuzqGbgbkv3SEUrNE6RosBPW8YbraG
	hIZoprHcd8xmCogVRh0
X-Received: by 2002:a17:90b:544b:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38fbc3fe415mr9386869a91.2.1785766664794;
        Mon, 03 Aug 2026 07:17:44 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:44 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 04/32] clk: mediatek: mt8135: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:31 +0900
Message-ID: <20260803141659.559129-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.55.0

