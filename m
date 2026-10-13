Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9803C51FCC6
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904708; cv=none; b=qWWzrwM0sU1Egok4zxzdQ/B6GsWVFsKqYjXynDVQvEg3Yuq2tptaIfnp0vUYYsRmFXJk6VixmYFJqiV6crkaSDeT5HvXCwxGQRbWjqPpA/kUTbCp79nBhOavUwBIin3l/Fc2fr7LDf8XbAdBynVk5R/myhvqk3wa4eqC2JoSIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904708; c=relaxed/simple;
	bh=bP+OI5XWAwChiCcP9BrkzwzZMVjZOHDOY48stjGhON8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWBhSpNo6fRBKg3fdSJGU6LxgjnosG1eMWX60cAFdev+Z+7pY/IjB73zmo9v2EO2s4OBXS5fpj2bDwlz3dmhYFihQPgL2Cbc2wfRG6vQRfi85qMsNK4yTEvgn7cyAALuvjVxBl97a43uYr9+rnLDlBNc9eCNsSKm3mUfDkeOcP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/aUIjfb; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/aUIjfb"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8897e83332fso2174812b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904705; x=1792509505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUYTFLfF8KyYjB9jrAOG5HypNcpJe9ONDAWrxzRVXzY=;
        b=X/aUIjfbc7FShqq/ZU0IrOcb2d+D2N4b9WROGw8/uLR5udERWs4dtLFJ1j/v5KZSWT
         fEGVINsEngAeVPO9rt5aZg08w5osfFCEGdAecnIKieT55+DT5ypL+rxj07ExPLXswMLs
         F2/kDt2pz4LBZKIgyfxQb41uMj1puTOYx2G6oSqZhs5wlYiwEXokWJRYnN+2ElLoLakm
         gCUK/WvDAPfOG/SRLiFTpVwmic90FouEaeSOqQNQ77aFRChZ7WrGxQjl2ESlQtraLPso
         C4ctozFgnZRubSVWWcMFY2wiDicSdM90sZuOLew4bc/Y/50mefSA0UZLAMqjyX7mPZX8
         1XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904705; x=1792509505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUYTFLfF8KyYjB9jrAOG5HypNcpJe9ONDAWrxzRVXzY=;
        b=Z5S/K/M9bJNvh+tHv7Y3SL9Eiy7+TgZYv6fS+CZ2AItqAWpAebrjxo/vePpzRNYnOC
         gGZcH3hYRkSzznFeREXHlQrvdUNxPrbZWdFRJLn25bW8M4n8oYgaqQqkUR374zHMPeW/
         TX7R9IEFj2eufiMGYaVLde9QdqolVeEtqOfqcj1x6XTFPg13ZlFopdKUqi6r2NN/5dsn
         PHYXJ1J4UBde840sy0FdhU5flYAzdiJad5tMD5B8G/qPpRbaq0cZBwG7Xh1No69M3Op7
         rmPtRWAk2iUfL4exXqRpxd5wbn4Ca81Bh28xTL/PCJrl0D/+5q4XAv6vGE61CS85ngrR
         E4pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaAA8RgGso85/nGQTSYacDCENtDx165+s8dohBglYbw+tr1R8mbKGCL20KlGA18GWmUfe95Saj6tI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrsJvAuJKVHeDYjOeirIhN+Lt2JZKWatEbSCxaqzO2z9vABt4+
	g/LyakXbi03a8opPAKPcttVd5Jlff2coo3zYFa5oTUZoQhIVXrZqLrX+
X-Gm-Gg: AYBFou1NtKJOkamgqXX3UpBOyuKbvtz+JvBWJvuBHN1qL+mGsjwqsuw3MqbGzrMxkyj
	8AkvZCSdD0u/GdZyUKvTzORfXqDTdGwpqUz5FcGvuuK3JFriB12VNVeHh9gEjGucyZR4E9LypzE
	Pq7J/RBl+1GSub/DPaz+YktwLktXK/z/nqgtJM8y4K2X3bbcmFQPg2yu8hJf2m8rmx6G3XTXT8l
	4fa45QXbSK/4xlpckFh8C2oj1RuWGXz3mS6HNZrMmh7zBz7QgYSB6pjV6EyCx+SO/6/ZYZGZGeI
	d3cOmNxQAkTBCnGsny2X88Wq6AdUeiyLBd2Jx41O6AJAVYpRyDP0JjaSGMH4/Ve4db5k3FYA5wC
	fq2e2pLzrPGoG2aIp4uTVqtk6o0ZwRurXeZTGMkI1AbgnkfYfdQnr98Ri67iAW9jOXzYgkwpKMA
	0JsQP1+qVpskZqdKsu7rXxGljDHQFgxe3bDiR5N4YKueNpPNl+elzTpInC7aqvkdDUfdqCvn1ff
	cikXA9nadZM9tDWeMxsoYqXd6TL
X-Received: by 2002:a05:6372:a80b:b0:3de:ab1e:a63e with SMTP id adf61e73a8af0-3e165032ef1mr7892032637.39.1791904704905;
        Tue, 13 Oct 2026 08:18:24 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:24 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 05/35] clk: mediatek: mt8173: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:04 +0900
Message-ID: <20261013151734.3177690-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..9b8c35897789 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, infra_clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.56.0

