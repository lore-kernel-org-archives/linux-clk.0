Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8651B195
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904701; cv=none; b=ja2k3kqDi6OVWKfGRk3Jr6CZSfoKHw5PFV6ZJHYvmCR4OKMScHT+lTvHSnec2/WSU1/v8VQiB2ujHsSpzYGs1HrS+6xkHmsAeTqCJ3UL0nW8tEJxpK+D4ofhIco1aVfJvCzLMtemSWvIlFKhgVx4yFDjJ3NVJme00Mz8/dgz7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904701; c=relaxed/simple;
	bh=4+GfQyXsSLAaCGQTxF4OfH8XhOmFeLya9+t5OyxeHWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2tDWd1ZSaZeM4G/UVCv0AT7iuoMzbVapDEtng4dEZNutrMPTXLJJj6w/AqyvzU3x0+Yx+tpuM/ndRRyI9iZE2ZNvc6I2iqf22z+LdwK9SfjhKeMi2km5Atgs7AwL0vGWiurslfEoZu6ryvg2UvGGXXqsSxfRq3MCu9+DJWXZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TF0/aQG7; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TF0/aQG7"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1026545a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904699; x=1792509499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=TF0/aQG7or7ApNOLSN8JGOO9ytFTTPOMHEPZ8DfMTkU9xGakJGExf8voW4IIDV3NxF
         LijKC70D+PK14kY16AEG5I8zPtU9jehHWX3VPRx5d6Un2YRT79LQ7s56ArVmiuoUedmK
         00GS/xNG0YxdkuXE4AQEy4qenSl0CsAc5U9apOQ6wAhxjU2qXQ5WLD4rgcDsA2Wak2IH
         fYrVvEAkp4TYTRNE6uYXTfPKHP/tVQ5IuJOVrd4l7wyaKG25fuSxgz2ZHYzdNw0UTizw
         afbrDU7wz/g4oPCKlWGUg6zH9LqYBvNL0wQ9rDIk/aKOOtQgr2m7zFF2PQpLEiOgE9XV
         BGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904699; x=1792509499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=KcVp0xDdlh0vpcLkLHUyiv/4LdZAa8sRiru15KJb20ZIn7zIZRpld+M8rjFH2ex+av
         UrR4Y/WmqTFOeA+BqDntkaRcpKkZDIxeRDfLrf+ltPuWaCu4hzciOB71v43X+pWd/nPk
         9xOax86Dhr5rMCWAAEqFT4ibKtXNmWtVu7Z7QWVXcQaGQOBeVGt5TrtE75YL4WsxJ+/3
         6gJeru1/nCQCFvY9EpWZj5eaauqMSEDo+IXX23o4xRbxFGjozhRiVpdSOhXEZIO+nzAE
         2y2wGfP8ElyUdmAVZkP9tTwUtDap+lX3w0sA3VM5zyDM8o8oDqtqcBh5PLd2hu45nzmm
         VHqg==
X-Forwarded-Encrypted: i=1; AKwUvBzr44/nQh9q8ETUPk67/MDi0y2LOE1hPxGFFZGO8SUazrGYzGUf3XcOqcAXnrHfykpnZkqkTEqSQys=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoOX8Ku6ZE++GUjiqQTX+lEISUNAqbOsiv8cbs3J/byfnQe6Wo
	5UWh6gbXxtRGQB4fvKtS7JvU0Lfwzg3hnKpSNkyg9reticJhplTP3eVA
X-Gm-Gg: AYBFou1khCe9YuAGgeoZBc0TuyDz9e8PVVmeR5pOCcZ5ReYSb3d1DqIv1DGkBA4I4Ug
	Wgqg6H1kWciqOCx4oIXr0wfZsaBfeDQtSKuAu3nLiaMNOM8LQyocYc7PxrCTLt6vRz6sRyNVQfM
	gB7PklHIwwaOUEyfljC0aK6Wn8hE2Wx97FnWQ20DNUJgIsGxb/hADDjLOoCW2FqXiV7I+U8o4Y9
	WheflV+potEzzy+/Rj5fCXOlMix293opM2eeVDMEh47YHOBdRYoO8gWxXrZ4i3SDvzSPvVaT7RK
	WFDgGxEsY8AECQiXt4KNpqsUDAx/ovXc9fIrSTRwOa2RT8Gbn3rOXnijaFTJxnjOlSDOps+5KJX
	UhQGc7xZUw/zHfngaYHB4Vx9xBf/9Mln+bs3r+STw6yXx3WeC8PrCcacxe9sWAT/85H5rFd/zZ0
	GjK5Pw/wWtS1FHfxqu13fd1YJXf/3LiBAZpS0LRU1HRbTab1UQtnCnGBEuyxtX1I9RumUpprOPx
	TrR/ejeA2Z+F+w9W0YSVNFqfTi9
X-Received: by 2002:a05:6a20:9c98:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e1c04b92fdmr2161022637.70.1791904698979;
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
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
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 04/35] clk: mediatek: mt8135: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:03 +0900
Message-ID: <20261013151734.3177690-5-akkun11.open@gmail.com>
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
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
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
2.56.0

