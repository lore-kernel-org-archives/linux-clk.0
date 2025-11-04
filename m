Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC92F5339
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257851; cv=none; b=pu7UsNKDyGO0h99x2NkLtqiEX1Ebvq5rx5WRm5cPM6IjiqKF8Eu0UZ8xcA+H2NNlG+isGxw/fvauYgl0LHUv/l5NaqDkRSrYF24uL0Hd4pNLxEtKH1m0kAfN7eWTqn8GZMyUSOdxm9ZducqSTO03dxbYewjuJC8/qCxEtFBUBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257851; c=relaxed/simple;
	bh=0QxHrm9C2RbfZnvci62gAmEYua+kGV1/O6mGjSHQSUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxBBk5wNKnAHHwswXa/HeQn1KmGgMGRHq3wg7IdQDvfGkousjgLhix3WUw0jJARCvy1Iw0E06C65jJC77KKkSOLEjoMd/elD5lDcaNK/34Mvu1CtSaR0R/D6YVmxuyub73ZzoJX4Sj10+n3vitUkqn7BFw6buzZnhA94L1BYp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNlrS3IZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNlrS3IZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b403bb7843eso201028766b.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257848; x=1762862648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=bNlrS3IZb9sx57ttYwdoqDRysWYmOkUo3MJyndNkj0GrnDoGmlCYlc6HcPisxfprpo
         du0zjFNjXH/BxKEkLpXYjHltil0Hx0RcpArKozWm+J/C8kogT1VqLSGNTL4sryV0eQPQ
         sMS6ZzAvUI2dITToySaxBM9GbvKQQHZvWvbcC6Dhuul6h9reMhRSF6i7aYNm3kuVBXUA
         /nQ6OOgxTRPT++cOeL3wHhXD2qT1fNtK55AcYUEBXE4Oa7mQ/XwFswnaHCTPZr+lOfYo
         c7AooofcIg/IJ8QBIy1Xg4PmjCP+PD9R2ksr0AtTB2b73M0F1MWwDj/Jal19IZxPnm2l
         mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257848; x=1762862648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfVnfMnUFwyLNqs4rPjMOiNJ9iATrzCn1X86BIPjvdo=;
        b=aAYcMApdSkp00SVKq5QW7ROd4BvChDy5AqtCztAu5LTxSd1BmyR82Xut7vISHW8d4F
         iNhykf7v0zfXLLaQyLbsm7FX9n5H4Pn8mH7C5vH06md3bTYID1/Qo/exnfqUaB10h5uC
         zAvVwAgd6Oqb7ZjDIxJntTuzunB4oqRpVYwr0eIIfcevI2qz/smpRzZjgU46xuXJjoW9
         yqqAvtBtOAsekFYI5Ps1gq+tRF+eSpzMiDNO0N03YZYBgogf4kl2690cGi8W1+U711b/
         CjivuCgcBNIanYN5/pl0XB4ZRAtiPEKVo72zhOCT2/N85ruog6IvXGfJqrmbuLDl7HsG
         y5TQ==
X-Gm-Message-State: AOJu0Yx1EmT1cc2zBo59HxEV7oYCJueMGUrZMnc4QAwkd+KB1iaSbGeJ
	l5/OpFziuL5j82K9vQIErPzi/jerMRerFFYo97mTtq/WQ1VIZwga1COK
X-Gm-Gg: ASbGnctVErHvWP7LsOjxK3nPN9RfruwBiF10X1/JwEt9G/5oaRA9WCwUAACkjv2fcLi
	XqshfntYXxjLksm9ys3as5NhWK4vg74pqm8wXL54MLA43ncdrpsoC0PsZlRR/IksxUmlmMmhSo7
	DtqAc5WvoWWdmEB4e4lcZxM88zrwrDFpdUlqncp0PwVptUS4amMRC+T3VJpd+UuVPnXcB5crN0K
	vMqkmDOYyxeGsOBf2lMsGDOzwrDerq3+ZtILPG2Nc0CfVFOrfuj2GB7HTe0q1VRHk7HVh+gbK16
	WYKX+mRr8VIaAdNvYr4CjHnfDWX7VmFo/VmzBJj992LAVgTC8WrMZhgGjc4fPZMtl1+IVBTw5wD
	blKHFrPI9NBcPhY9989Y7+5aXJWjURYzC3P7rONhAtoh7KaQfuVOqfcoH9GQwG4WfRuYZgweI+U
	zocrqsoJs8gOR74EoKh9br1imC1Q==
X-Google-Smtp-Source: AGHT+IEFmmFqmwF7IJGHYHQFLdfcj+i6AuRD6y5QTSlNabPHEjYgdTalWazPTsjhrKIiVzJb3z4NAQ==
X-Received: by 2002:a17:907:8692:b0:b71:a627:3d8c with SMTP id a640c23a62f3a-b71a6274340mr486414566b.56.1762257848026;
        Tue, 04 Nov 2025 04:04:08 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:07 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Tue,  4 Nov 2025 04:02:59 -0800
Message-ID: <20251104120301.913-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to per-device reset map to allow reusing the driver for other NXP
block control IPs.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 18a7f68aa59f..745b7e22b954 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -23,7 +23,12 @@ struct imx8mp_reset_map {
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
@@ -41,9 +46,15 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,6 +66,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -141,7 +153,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (void *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0

