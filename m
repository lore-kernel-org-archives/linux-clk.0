Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A197495ACD
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633372; cv=none; b=Ppacv3H9iglGn7wCtifV07N1vrfxoZwPErw1N0HGyxxrNzclUgbBkw5TwAl78Ev2AHoNKHe61v5UpYSdVadn6Ow76VaJuHDHXaJ9OKED5HyFWGL15i+0GQLKc/naogAQiouElFEkZVw27nxs/YcAx24CQJgzIByh2pSozvFip3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633372; c=relaxed/simple;
	bh=IVqzU4OEifD0uEUZ2igkwS3l+zxokgSiBujrja3hoAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFOddPd1iiP/+psFD+nIIISY1r4MUPjzdvjyxUl0Qp6l7qaj3sudLQt+kbIHkBdsVgxlhz1CiXNyc63XOahp4fuphSmgZgYN950UCgsHtyKMKPo6ex3KrEh4LpJf6XsJQaEykB1ctOjKLqvCbt1wayMqy0A9jKeXipuB/z0tESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwuHhiWI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwuHhiWI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so1960155e9.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 04:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633369; x=1792238169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=AwuHhiWIkc4L6UaWtUpwJcW3bLEUBy6f1BcuXWzgGVRSFBIDVpv92IxBUdRQuf2Bon
         d9DYRaTS5haYzcG/UyiIfiYdKNyskk0d+ID2hxneuxaHjYc+bUoBezs/3OAERYpVULpi
         lczhhogKVvc6dUBL68pbIULiaEL6Ju38Bg3rBoYp7gb7InXPGw1atqvsKFDeOKtqPTQi
         BKuqL0x2lvhnNvR2t6lW03/9djCh1owbgIRCQAUm0+5g7SUiiGFJfp/U2OlQqJ/OXr+q
         ncJjD5napTr53xhvsaCUY2CvO/e409PjF5kfGTrw2ZlKyctgf4+6jR04iuZwqh2JbyDS
         szqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633369; x=1792238169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7cQlWEs7vG4qRpaZiwY4RuZzcs0XsJM2mV6rRYet5I8=;
        b=Pja9gqkTiwi4LVXgxsE2y5+YGEES6CmzO2Ebs+CD3FBDNbWqXPCVcVqBik6WNVg6UY
         gVEvTTAcRB9kVWGxZzaBBdYQkAC5ycOz019SzCb98fhArgudfOUDkf8kVj6+2YGXajZz
         11ycSuZTwJWfRPVLCQX5DaFflF2a0d7OzhY8B2qbz//5krztDOSsyWeAOUxoCMk7x1lO
         8Cqj37ST51aB5voqGZkZr2DSIMoLJUaydqQChFds6cwT0JW5jz4U10G58/g1NdiXLwtS
         KTflwCGDKbuiM2wN6kkpNMh1m30hjdZm9ojEln3S1ytxpps8oTbO4eaoxW9/on927IJI
         5M6w==
X-Forwarded-Encrypted: i=1; AKwUvBxESu/5fJGZkwtz9OzDQW85MxM5fTRUaR8qOmgI6+HlymlnP8ceJqM7gcKzbZPGnd2y5BPp5PBW9Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMQX4ktvmYIRjkcP4AqAOTTYetglSTt9McPlyMAdxjhOmr2vbp
	V+G7Xxmzmf4SxhGmeQA9qcbZVrMwXDoRBNqTB6GUAy9qKQLFM7mbOiAm
X-Gm-Gg: AYBFou0cX+7lXWvrKWlj09MOWh0bizX5hWgyqfhy4mHPDktFpaQRSWKRROl+WR9dwOg
	+yP7fE1mXvegfYT5MaRwl0IEMtwve6GlIL69pu5Q4MhqOt3D+FbqidkCc4BfiRlZUAPKIKOl7en
	JuVyzdUOngrVBh3VNb38j2UIlmQPzwdbagl005Xtt3yzKcb81faYeD4i0/dG68LKghL3BI7Vnrx
	q95ZWeWfytc8XoGcEyIFdqyRF6w2D6I5r/t9a0qHXHMJVnCcCj2Z7kLFQmJlKfQCHYoRlP4g3KS
	f/S8nEiOS0xVA4t8XAc61/6i/NrXHTZka5rJUlIUZA3bPfjhwQLL0j1Xfjh0qhRZaOl/Gx3BXkS
	GV4KNDWMIwgeIOVg/q9WlMK/V9+cqWjRUIfEryb2pc49l0VxM9NrAKV10nzp7G5QLaFXmNw3mFD
	2VK+8MH/+G+3wvKA3LJx1lWFauLpQHc39SVxY0g+g9oUwH7rsjAqAPLPGXJiYyzzy7+g==
X-Received: by 2002:a5d:5d09:0:b0:48c:6a6b:69b2 with SMTP id ffacd0b85a97d-48dbaae7028mr6208118f8f.27.1791633369101;
        Sat, 10 Oct 2026 04:56:09 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:08 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/mediatek: mtk_hdmi: Set tz_disabled for mt8167
Date: Sat, 10 Oct 2026 13:54:05 +0200
Message-ID: <20261010115539.9237-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like mt2701, MediaTek mt8167 does not require an ARM supervisor mode
call to toggle HDMI output.

Fixes: 511cf7d12331 ("drm/mediatek: hdmi: Add MT8167 configuration")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 738090a47176..9896eaf81e7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1214,6 +1214,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.tz_disabled = true,
 	.cea_modes_only = true,
 	.max_mode_clock = 148500,
 	.ver_conf = &mtk_hdmi_v1_ver_conf
-- 
2.43.0

