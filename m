Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEC34AB09
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700120; cv=none; b=OxVoe8XyvzsY5Yuk7nLRErssi3Ya45msQn4614yeKDCwogTs6j3rtSIHzyaMykdKVyQJxNQAl5TSP4bLJt9cazDfvG2vpbvOMDctZJpeiWx9Gia/d6bXxbQQBXRiIcnJ7cFkfeG4Bs2Aa0bd+zNGSGcZnyVJpxEvUZDPt8a4Pf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700120; c=relaxed/simple;
	bh=PNvlbSmiUvii0S6TXSvE0jwb+kfCR5BIL73WNeuBgrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haloxPJuDgyyjZ25t6Xg3vmbEc6egKP/dzfof6Iy/fnK6liZ1snh05Vkk4nG29QallLeNfmsGS1CGIpIbzIeBE3znh3nZQ2HXlKYmXbizNU1f41KYVIPftILAQsrUvD6FltMPAX3Ii1rBuh8fUCOTcMw/iXoMkK/+Tvz1LSKZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAEmCo/F; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAEmCo/F"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b403bb7843eso328590866b.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700117; x=1761304917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=nAEmCo/FVNHalnJWmZJ7ZDKCA8YdTCOqRZyssZEq/egsgk5+6Uw873PoZqcVssGvTW
         cTq7zwQnsnbZw6B0k1krR4lbbcexzhTPXnAqItVqlCLOh/JBCyTyQBCmCjJ61bnro7qS
         AZsX3y/k2JIPpahka38gvt1V03BS86WY792GOJ7aeKDlhzonKa8fYIxyI1lY49djiwcD
         VOatmncwg9aYIL/Rvqd9z+bFjmAhEPxGjL7wqeTK7cR/1gOgpb4DDRTkIgsuaXxSfXf+
         Vqqrwbv/M5arpGW7zphWtFrZ105oZfRtZwPC9PTOGO8DCE4JQFlimBazZuU3/4WH73jB
         BHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700117; x=1761304917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=TV/ASDhjibouN2xsP2c6lnHpXeR/+CptLCUrdl0Cn5PxZb24Y+YD73pnqIC3nGMMdn
         WHXuVGA/uLTlnX7LaaXX2uYj+/CtAfFDDk9Mz8JAw93MLXHgAkkStMmFzfED4D87Vmi3
         FOsmU6oBpl851LHscl/hdot2vbK1swOwrhOCmGW7Orr4+uEpNZ7w+3srrJc2TPCKuTvR
         Oipo2TwOfVZ90oReep6M/zZIu0dfWW7m9d5a8aCeUX4xvGzDg7bihG97MYkUNmBplP09
         w7eJ0TwlnNzYLjUSeWq3fdxmYlpq6Aw5inEtXGdX0/VHDQTo5AVzqap0gRfcQy07Q1cL
         P/BA==
X-Gm-Message-State: AOJu0Yy90tH9eaoKEdXyJjEl2TamS06oqxSgMXbB3Fn6LyvG+/40Y22B
	J9wlJjHYx5xLULVPBqkx5KubT4qG9RjCgBX2zKzYRBFouXDbkKslAJGT
X-Gm-Gg: ASbGncuM6ieActDSgjiUcLk4Qckq5TH8dQJopKez3Qhgbd/eEoYcXvzjRqSpmnnyucx
	srwvoJz2dZut++0VoD6zbLAiJzbmgbQP9FowdO1Kpa5NQ/pDRu2aV8eumxDMEnQq3WVVhlS1pzg
	Yuwzyj7VKhsSNY7GDPES6IrJIjgOMh+yuARId797D/rHHjVhmB8a8PQfuNH7+DV2CR4t8wKuHfL
	sNaMOnLx6X9zrD3Zt4gXblrGAWYUaOMYeiSGXVRWxEo2A+xBLJzYSTOZNUyyp6YTN9fflXcEm6T
	jAazaQr5u3jIqIfYSEYpbzfZyAnVnoahIsYDXcccgVGcax2zHlwqN7uJip5845ISrQtb0WYH8TZ
	9SZBE5/idQpNO0LFxWaA0LvcxxIdPhAWXpDGVuE/KbncClPtSGgEThyxiYRiW7VJmx8gKKXLiTf
	gMwWZsn7UW0HKV4dD8CFcR33z033k=
X-Google-Smtp-Source: AGHT+IHVLr79Aj1wmFsQfBf8luDTxUDCNFd8nKuGaUsCgVTKbksjEKUTdzlfSjzx9IgrO6A4BqLrMw==
X-Received: by 2002:a17:906:f1c9:b0:b64:8464:68ca with SMTP id a640c23a62f3a-b64846468e0mr277225466b.19.1760700117100;
        Fri, 17 Oct 2025 04:21:57 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:56 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Fri, 17 Oct 2025 04:20:23 -0700
Message-ID: <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
which allow users to control the assertion and de-assertion of the
reset lines tied to some peripherals present in said subsystems. Some
examples of such SoCs include i.MX8MP with AUDIOMIX block control and
i.MX8ULP with SIM LPAV.

Some of the aformentioned block control IPs exhibit a common pattern with
respect to the assertion and de-assertion of the reset lines. Namely, the
user is able to control the state of the reset line by toggling a bit from
one of the IP's registers.

Linux can take advantage of this pattern and, instead of having one driver
for each block control IP, a single, more generic driver could be used.

To allow this to happen, the previous approach, in which a single reset
map is used, is replaced by a per-driver approach, in which each auxiliary
device driver holds a reference to a certain reset map.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c74ce6e04177..c370913107f5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -24,7 +24,12 @@ struct imx8mp_reset_map {
 	bool active_low;
 };
 
-static const struct imx8mp_reset_map reset_map[] = {
+struct imx8mp_reset_info {
+	const struct imx8mp_reset_map *map;
+	int num_lines;
+};
+
+static const struct imx8mp_reset_map imx8mp_reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
@@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0

