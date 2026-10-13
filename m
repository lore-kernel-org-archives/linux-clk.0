Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6848053D0DB
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904832; cv=none; b=hh46imE3PHl5GZytnqwgaun47olIKV8OYS3laoeBAd4Snm10Jn3fJLtw3VfziwCHsSP3p0M/BFMh6bvUk5BAp328KNZlDxmkDPDm+jdQiljorce4EXVXIN7MZxLKbVsbEZGXQ5QsejZwAFKt4jMMvFmtEcsl1e9t3MBTmK4hZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904832; c=relaxed/simple;
	bh=a/9N3ZE90iZLm11kms5O6T/uEQHwZhKl4e+KlyHs0OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3usf80hD+4RnDGUpSBiR5GmWlFMMm56m3cxpcRjfufzwRzG9bU+fUAYzmW2GYR147BGcJmBk0BmZzKWjLsrxAigA7Lo3Tp8UzBmXVL9sIX9r+cUMthX0yBv/Kq6mR4EPwYF9YAYLgG5maujNDg/g5bS0hcJf8L3TpEnhnhBzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GipfqfCr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GipfqfCr"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8819033dbadso1898309b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904831; x=1792509631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=GipfqfCrmiUbIBJB0tcXltBfzpD7m5Mkr94nbcAs2MFHAMMaiD6o3Iwf3RkmK0cL2u
         uXNGSn560VPVtvXXOKdZGWALWIadviw+gbKauZB/YeWCbkOtdmNrd6dMRfXAVkBiv4R5
         2PVUigxuOSLAyRIjj4AFkX0zvgTUTs5SSPuDofH2sssVVu1UT/B6ScxU9/sVRWF2Kku/
         rL1jng5E53V8BeZKKcoG2DFcPVXWB3tLrWuXtvYHchZO9tIPrb+dmKOK6/iKYF//FII6
         DebPOzTQczF4cRJ13Sn7d/lCg9CGvDYLY5rDzsBSIZHCTe9vuBD8pdU5wiI/GkIoDPMa
         FdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904831; x=1792509631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEXcscvrJtgAmrYVGg0Xg0Qu27fkyZnfR3Z3i2hfldY=;
        b=IIj9EioAPOrgkr/SsK/t/KhHyj0BfxTEoJNhp3YKim1oactl04ZJNR9UdOWPp/rBK7
         HupDv30SVn84OpAvZrOHKQmCz4ssT+WFJ8zcHvYePJWPDYn7JR608ddvPSn5RYKhlH/y
         8W/651iMTx++ulAJhZY/vdpQJA0gMpmMZdaDl4xKwJ3fZBOXHPh0GnzrZy1tm87Dd1+v
         qC44VOgGhBQjHm9EDyC2Hx/gtfis0AxrGb461NXkLsg1v839Sg0PxptkxjMWO8aUJs0N
         I55gZWd4SVWpxRMSS1Wwx+9Pr2V78jxN53FBji8coysxZb0KPapRWHwvsaakl/FGHGy4
         R3AA==
X-Forwarded-Encrypted: i=1; AKwUvBzy20Lu8GsXizHms1DmndCMfNpxL3+bDDWHK1E+DNHQ7um+vy2WkKVIIf36Hc+rmGfaxB8oytZ4ebI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPbEXr0aZ0hbombZE5u48sMji7qRv9N9Tr1uxmz/NroyJh+X/Z
	FUT0v3gBPcSQq01fI5J0x3gSaHJSW462Vtt+oV+cbKkCAf+TViDyb7Wb
X-Gm-Gg: AYBFou14ht6JhtUKafxh/I3wMDk5NU3j+dXMRH7RH/QHKqHjP1cDqbs8f+JdWhYr/Ch
	ni/6slVbulmPQZbcZOxtFXebm5cHNtCmeZz42eWeuE2WBjIpg4V2Qmk+SRRBhdhqkmlHqQpPX4s
	ArDuJCqn8dgfbXpIRNkbQHNJoV2AXZ7qSIup5cn2l3qld2iM7ocIuuvtvTWcQ3/6/3FoFeBVYAk
	35HDJGALrZucG9Tp4eoq7BApU/rLjrdFB7KbjvaXb3m8FJW7IOLnSkbR9OcCbTe24uB/3KOA41S
	D1QYuEazmLqNfI39Bj+LNBoMNLRxQMPtl8iRlA7/c2ptHQr8EjiYosCKvN+ctpZ/H8Y/0IXDaZN
	RFlUd4b2JYHQshpjxVZRWgB1Vt3zsOtY9kqw79NiUSWbneesOaKjZ955Qk0MIkB7Cx4Df/uIof5
	LbQttxaN8A2KS25sPiJnc6M6US4gtoJTD9CP58kXWP94ZLNoJsNNEMV2wvy0jLbN0401jlhe9p/
	dUB/ybLukok9ItCzk2M/3/L4zx8
X-Received: by 2002:a05:6a20:734d:b0:3dd:d887:3e28 with SMTP id adf61e73a8af0-3e16bf4e824mr10572171637.74.1791904830571;
        Tue, 13 Oct 2026 08:20:30 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:29 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 26/35] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:25 +0900
Message-ID: <20261013151734.3177690-27-akkun11.open@gmail.com>
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

The MT8135 apmixedsys driver previously needed custom probe/remove
callbacks to register and unregister PLLs. With PLL support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 50 +++-----------------
 1 file changed, 7 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index e3b7dc13b458..fe868417de48 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -47,56 +47,20 @@ static const struct mtk_pll_data plls[] = {
 	PLL(CLK_APMIXED_VDECPLL, "vdecpll", 0x304, 0x31c, 0x80000000, 0, 21, 0x2b0, 6, 0x0, 0x308, 0),
 };
 
-static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int ret;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return ret;
-}
-
-static void clk_mt8135_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
 
 static const struct of_device_id of_match_clk_mt8135_apmixed[] = {
-	{ .compatible = "mediatek,mt8135-apmixedsys" },
+	{ .compatible = "mediatek,mt8135-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8135_apmixed);
 
 static struct platform_driver clk_mt8135_apmixed_drv = {
-	.probe = clk_mt8135_apmixed_probe,
-	.remove = clk_mt8135_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8135-apmixed",
 		.of_match_table = of_match_clk_mt8135_apmixed,
-- 
2.56.0

