Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0796043231B
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766781; cv=none; b=toVYXIf4YZCg7En80hUyBt5XqzGobLFylrpCjgfsgu1xEu/LGgQLVChLLNGW1is9xTaec7veDUk4wG7LypxeLsoXjQ5+Sek2c9CA3/LjkC6AVU5h07B9d09+cwHfsieOdpbnG6rkSlmoPGI1uDnb4eu+Hm7MiUa6OzAbnvi4sQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766781; c=relaxed/simple;
	bh=9DC6OuxRhS6bV+aafS5/ocz69vO2xPsOdqeLUmXIr6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsnrOO8xytpBDMQ4vTxrTZWEsBHukePdq+SRaufAnK/rczVAk156r0gVzkWcYt06hAdCRsmbtpKa84jrVhsS3aWIJOkZV5V31YokY91rQ0dxdKYINw5zpKsSLWp0XHogqkGdvFfoF9A6+aWT74gjzofNMrJwVdaIaGkjqM7MP6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8RVM4Bc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8RVM4Bc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3684379a91.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766779; x=1786371579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTRHW9i9TMtUW5FfPYx0JQrWgxJP2eCw3MQffDw7Un4=;
        b=n8RVM4BcHYe85scpxfqc26BKe3RTLidaVwZFlkBUy4JSAE9v51F+VSGRbJmwX2JT2p
         HiJ9O3kNBlgcIELiWej/NtsuVt2TctwCHSkKm8kaPmUISz5hCsZGg63ip5z6w3keoQ02
         +xwKZZQYVi7tLN/3Cd6OvT9bbtv1ILKeg8tzsaMrZwMUyliHDzsTaTHDqVbLMaJ7DeQb
         znfQshGQxN8ZkBKkrCh/DPFqYwb7HljOt6drQHmi7iKIIPHLHYXJmTb7crMKcnB0XjMQ
         wJubPGZci2wpndosQlnf4hf+bpBoPyTWLCYx/CbsV/goCLgtZrqSRJNDzR48P17TNs4n
         J+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766779; x=1786371579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTRHW9i9TMtUW5FfPYx0JQrWgxJP2eCw3MQffDw7Un4=;
        b=aq02D8/EK0NHuOV2MswhA/CP7f7+Lq7ui7LNSk6AMRAsxX6V1ccjp7qkDssP4tTwt1
         mmCw3ajAo+yXTNUS7y+5wH38+KFcQC+YR0gVe7q47YigCGUfBmQHqhZ5Grz5bnkJcrOu
         2s52+UF5/txtxXBrc4qNAkO9UiGUhNvcFOiszTFTjyB94GzWsqMWZmR1uHiAfDZEGClr
         SxJZS6caBXRvKZkKR1aDoUZH2RwIR9bdX+aD2d+TMaYnMQSppOhL7h+K11xyyAkMqTNy
         2vJwQ6Rex6nj99NnZtrj4Eu9iD/Tv2cx0y4DHwlKG10Qj5gd7yxTJ/8FX5t541b3nFKd
         UcPA==
X-Forwarded-Encrypted: i=1; AHgh+RrOkR/D9sn+jqXH8DMejyEuTJk9a5DM2AcRtgcl7z1Nlb7p8X7B5Z1Ove50D4DoY0CTklQWHAtIyw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWrfzhYfUEIct5JyfqWQXzO6BrWpWazxjegrUhj76X5JR3fyg7
	Eu/Al2GcahzrmQnmTNBcHuWX0kytJ3nnkxKyGFw3QQpfLRt2xbZiHHRY
X-Gm-Gg: AR+sD11QiIOR4Rh978hCpZZS4jWSO/wYNpVpUseppkyyJXvs/kOgk6ZjRfXCc8JDe2H
	/vuYLtQM1sfhGqZt/RQazBPBBY98tyQEGHq084CkumrElUxYUWm0On00gAuauKSKcwYew76bb7n
	i6MVPKuC2o5povf4RS66DwncJTDMDV9F8Fl6KiQo+J8bQZhrFLHLab3ltJAOz4cLN+bTTZFgQ5J
	iaMTFp3OYlmGS1vE0puhQ8okDX3Pbq4wpxDWDVnUmZWkeebZFLHS3LkEbFZ8Gm98Po158+ciMA5
	6hH1YUNC6aDoCS6DJC0p9LRtPuTFhpeQINoSRzazeq6MT06scuc76zhlLkK+Zr5yThxfe66Fj0o
	fJ5GZwIvEFYirmoXiAt65xTaKKabsJQBp0kVEji8ZsSJEvkCUH3V/YEn96f+NEq4+YGJNgOCYKU
	seriem5ygadDaqrq3yKDYIa6vPIg3XUG2IwbNmQr1ie+oycG1mIPvicLAKQ3i4ad/sQAumZ1zf8
	bVUwaWMGTuL6RJxyZJ9
X-Received: by 2002:a17:90b:562b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38fbc4053e3mr8606814a91.6.1785766779400;
        Mon, 03 Aug 2026 07:19:39 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:39 -0700 (PDT)
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
Subject: [PATCH 29/32] clk: mediatek: mt8192: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:56 +0900
Message-ID: <20260803141659.559129-30-akkun11.open@gmail.com>
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

The MT8192 clock drivers can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 69 ++++----------------
 drivers/clk/mediatek/clk-mt8192-aud.c        | 26 +-------
 2 files changed, 16 insertions(+), 79 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index e6ac40e2f12d..92593370f23b 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -143,72 +143,29 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_TVDPLL, FH_TVDPLL, 0x154),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8192-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8192_apmixed[] = {
-	{ .compatible = "mediatek,mt8192-apmixedsys" },
+	{ .compatible = "mediatek,mt8192-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_apmixed);
 
-static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8192-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8192_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8192_apmixed_drv = {
 	.driver = {
 		.name = "clk-mt8192-apmixed",
 		.of_match_table = of_match_clk_mt8192_apmixed,
 	},
-	.probe = clk_mt8192_apmixed_probe,
-	.remove = clk_mt8192_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8192_apmixed_drv);
 MODULE_DESCRIPTION("MediaTek MT8192 apmixed clocks driver");
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index f3ebf8713fbb..8625f656a2e4 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -80,29 +80,9 @@ static const struct mtk_gate aud_clks[] = {
 static const struct mtk_clk_desc aud_desc = {
 	.clks = aud_clks,
 	.num_clks = ARRAY_SIZE(aud_clks),
+	.populate_children = true,
 };
 
-static int clk_mt8192_aud_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r)
-		return r;
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		mtk_clk_simple_remove(pdev);
-
-	return r;
-}
-
-static void clk_mt8192_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt8192_aud[] = {
 	{ .compatible = "mediatek,mt8192-audsys", .data = &aud_desc },
 	{ /* sentinel */ }
@@ -110,8 +90,8 @@ static const struct of_device_id of_match_clk_mt8192_aud[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_aud);
 
 static struct platform_driver clk_mt8192_aud_drv = {
-	.probe = clk_mt8192_aud_probe,
-	.remove = clk_mt8192_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-aud",
 		.of_match_table = of_match_clk_mt8192_aud,
-- 
2.55.0

