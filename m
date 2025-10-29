Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED03563D2
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746178; cv=none; b=WWrDz5jSg4ykU5lOLxm5/UmftcWhG8OT6WRZNQjb2otyZb4WYlmBhZIK9gN0PXN9KpuyIuy7Svk3gadTrQW0dS+QDE7SU6uxavAYlNl7+KcxACthVoVNnbnWiEgawg9i+KFjZjM6tYVr7Q3fKAxNOxfDmJt3bY/t/TiB8Dappp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746178; c=relaxed/simple;
	bh=3WHCmAX49xY50ns2nAwuW9SNvqdcTJpimMT/AP061rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmmIXX2x8VfckPXk+PhituSpcpl304HjOLV9tprn7flJtTlcDOU2HvjuiWbEl4sesDGHZn+f1wkleqOJR8LOGHv9P3ICTyXpaXzan72kNujpEtMU3HhI92nrm0JkogFT/MvaI9uOWhNTXxlip4hIYFqJAJxEo4euQeAhaI0IJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G66XqZgJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G66XqZgJ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b5a8184144dso1139638266b.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746175; x=1762350975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=G66XqZgJwGiP75Gkevmyg4VGmPfLZUyCAXn47ygQBFy4jDA4Gh/un0ys7O6mfxyy7I
         YRze/wQVNEufCiZLuiw15h8JQxiZ/6IHN0YOvHZwrNrqTaneAwyRRgxxkrWsqg0Yk3yf
         lIAimOViLw4C8ZxKzOPFw4do1dbnhMu6dzP/0zzNXwqL6/Hfmyv6CE9sllBo2xXUF9hj
         Uppp0pW18vTOcUk5bpQaf4QzdFvQrxzZ1KvLIr4XM7UsHK3oGqUpBkB/Kt6R1t4PbR8p
         tym7G4psZ35vNYPwtWICFCk74en8loNWWPXZKSXIlqy/R/V0gTQW2wSV30oHXleMdqg9
         BXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746175; x=1762350975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=kVGrFNR/DqvUMjGhCdhnt8xBs6brlUSUnIPIFm/GTi0ajNPKKrwHm/6SoM/zX2yeQV
         tImWpw6frRK84ncD5xx4TZcdKnxwEBa9yOeLrHKRe8lEeIMa8ZCFVF55RT+y7FX/RJOL
         rHsoxKhTneE+r6/vHWWi8IjHK1IAHxBxKhmI+fs/InO1uamSmgrHYpfC0TCdH6uczV8A
         WsOlX55P85Zlq57ZMeXGwMY1XgFsrMilp/RO5RY7Yzu0CasYU+OwZSlQMZER9gTCPvy+
         udqL05p9kxNyrqmOZakQbHqqFmLSe6K+eKGv/sMOBASlC/IWK3v7NjSWdOBoUTeB6Uca
         buCQ==
X-Gm-Message-State: AOJu0YwYAzI1Mvj5atPwTzftSJiCL5TUljKCk/z075lsXj+BWiO39yJA
	bQo7jfNLjNNZvYp86y0QYYOnUagbidpNQcJ0cVdpcw86IF8bZSsuMYfj
X-Gm-Gg: ASbGnctyaSAoSVkhEqiEg/A+hI4Bo/+tHb2+XqLGr2dxdR6xNxnknCc4RT+L8RijHIp
	6dwe4bm32Xf1mCkOCKeARFiB0F/kT124B/Xm3as6wr4ZX/0W/Q68c0KYv3TUTHAEm3tbC9XMbZc
	rY5s2jI5fa+1+gbkEkMrYQak6/VrB0aGqieUS3a5eYqkvdhIpfcySoi9QuksqU+2HeHDoxSDI++
	kjKoUfG39goXj1EV0JJ6jc74R7Dy80+T755cXf/YX3iQ5MzcbE2J3zULCry7kVJ/qa2vFpYn6Hj
	Novm7EpYzba7iQeQuT+5yviTQAuehH6MECcScO3gyWlmcks4GP58XK4cyfj+PfLBNcSYR2GnR3K
	pJehrbG7GSq7CzE69djUl8AhstqbBqjoV1kIGPCyyWDtXDn8avDgkC5dNnB9kfBiUhsVMsLxm6c
	V+z9/GtE00oNc1f9PWGTJ8lzZ0sQ==
X-Google-Smtp-Source: AGHT+IF7YQSNedMcBfqEpnFNryZkQPX09Rcf45htF6l7ea4hMqG4HFL94wsmN4DEcSgePcpQLPZJMQ==
X-Received: by 2002:a17:907:7f14:b0:b40:6e13:1a82 with SMTP id a640c23a62f3a-b703d327464mr285687566b.26.1761746174508;
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
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
Subject: [PATCH v3 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Wed, 29 Oct 2025 06:52:27 -0700
Message-ID: <20251029135229.890-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Replace the previous approach, in which a single reset map is used, by a
per-driver approach, in which each auxiliary device driver holds a
reference to a certain reset map.

This change is needed to allow the driver to be reused for other NXP block
control IPs such as i.MX8ULP's SIM LPAV.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 3f6d11270918..5ee5a32c6950 100644
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
@@ -41,10 +46,16 @@ static const struct imx8mp_reset_map reset_map[] = {
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
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -140,7 +152,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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

