Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BE91F582A
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907054; cv=none; b=eV8BSsQnKL7ayhvX1qwTSeWMx2uXNbk9yuB8LPcP7D6a3UavDp47RD4EXVLs4NEPoQkxt3rMuGcpTPW9eTDBXLTG+JCx9lFpVPjJgyY480G6bmJDyPC7rN6MP7CcIqNgvUh04R1O/GmQEv9yxWyPz7HQfxPYTsRgHume7TGZN4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907054; c=relaxed/simple;
	bh=RfNdAqHaKYXIX+EYOkQ5lgsT/Z6MiVQ0NUsu4u5DgDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2ADmsPmzc/2Yl6MiqlVpbgtUX7fN7d+86QHZA6e+YufYrSLOMew2LFMN4EFwo6k8N8KDVoBax4owsAAl5ukSMz6Ko+/hXdbq8Jy4hxxmAF5S0M/KD3Fc6X2ZGjfUJZZSSCjrBUkyDVhwkvsjrEUg4vWr44quHEApSCmSpmv6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cBgDL0iJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cBgDL0iJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso4412608a12.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907051; x=1740511851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=cBgDL0iJiAiR3wj5cwBqhlcg3CezOnwe0hvHo2dKVh15VdH6Jxic+DtNXZq67TGeRb
         zgUsK3n6XPlbyCqfl7LwD4+ReYuabu2ys6f9ugwufdKJJc/YbAZKerKhlexltXQrS4Xy
         +viZUSS+/p5NPcUj/PgcUbHzwjJGT4MdLBaAvgB8seZ+vCSLjQbX1rkLiwL6Jytd2lY/
         f0KzrTHblUe59LwoOHARWP2YgaudB7KBhCreQ3PskhwORw2pn/ibCszMiHAytnsImerH
         qS92b6NU8lRY4YsF2MqR7t3lg3VBdI9zY2ASSGmzEvdBOz8L4WJD8sn48+M+D0Ow0/y+
         06/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907051; x=1740511851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=qAzAvFeINiOOprj/DxoVrpe0mTYc1YHDVqNxqmOlWM2iNx7vX/Ht+dNmi4FnIY/wwF
         2026P4rmDfraPHBsaX4wCYtJ9s84eU6ASS6wShHqNFQCiD3/drlSuYykchxAgG5aegNo
         Uip4XYIBSE95ICO+dmhihcSbCTCLk8PfuJ23gtfEHyGuTpkAas3E+ssOFUHBrSROP361
         ctrLC8SBJbYQoAyK0Lld/7kceYWzyhwk3D1Zn2KgLVR28JlqvQxoh/l7iwhYvW0HBq9P
         /APPFzWWwDM5i/FUChvkXmTsMnWR+PcN5P7m5h/p4+DdYriTsKUsOygSgBwOxd5UG4rz
         CZeg==
X-Forwarded-Encrypted: i=1; AJvYcCWU7KnPDBHSG7ML9RItD8p2mL24A2kDCbw/sZX4yx0CvBCwrYe4oWFMrYLzbEvkm7g08Gxbbnd+Y2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLHNmzrQ+b57Teh/M6R/dHM15Bc2b0HdjWf2eBeSMcgOWXZ6V
	ZYLDsK2NBXoll15PKbNd/decoFIwYTSUZ9ue43k4WR66OlFj7/Bh9fJzKfZ+c/0=
X-Gm-Gg: ASbGncuiEgkp1a9x3+cgI6VSvSVWmUTK3yHc7I/Bic5B0P2D0DQHuoPK8VuDDccDE5j
	BjjclUqxBigLkah+wtH+Tpf8xeX8DzkhqTAmt9kts9xYoBX07w0ternu0Xnoz5nLvYhVAEpjz+7
	QZOLYO4299F8/82udGpol7e0/d7//nBL4gN8PDzqMjkdH0kxVh23RzTANqzW/e91tmyyHuFh2ts
	Z1ItqEqr8A3i9eDD6fF7xHHuW+168I+lqWT2ixbPhXFIOX+QF42c2UtVX5zJN0C8oD+UkMfI5Zh
	gbHxNaCZai0/CHbLhOk9qV+k/EP7
X-Google-Smtp-Source: AGHT+IHXtRDavoFEuaxpZTZMT0EqHfm1KbVfaahxr8Qdj+LPqSMJy9KjmSUTGyYJHs3yvBW2gyEYug==
X-Received: by 2002:a05:6402:1ec8:b0:5e0:69b3:441c with SMTP id 4fb4d7f45d1cf-5e069b34491mr6798656a12.26.1739907050796;
        Tue, 18 Feb 2025 11:30:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:51 +0100
Subject: [PATCH v4 6/8] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-aux-device-create-helper-v4-6-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ay58eJ7ot5/ul3WJ0A2vWFebi7iz9JDlKKz/MQBcPk0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/UNRwYRSxCacN/wjpG+gTD5T1KG1hcBQsMM
 QnDuvUYONiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1AAKCRDm/A8cN/La
 hWCyEACe+SnGCN6YdYLKgHmg2tCmpB+scSaVfptOtiiCaNmkm2ceymUua+hl4HQuc+cggoymEAI
 NRoyFjvpDwxEsenxo50indBSo4J+xKz/BxfWgchbJ5jBN98rcIbG8qbRJoK6bofmL8VieWY/C9n
 QziuMeen3+L6VIqwheLwS89czpdFIbtEchmvyO7447kPZT/f9tcqTtHyZZQ9ZWmUEPqyytQH3g1
 FXnb/QkITd2cOjX8fiWKCwqHnHuZZioCk73ybWlnXFChDFTJO1C/Kubw+Ku8ou5Oi1eNm5DpAKD
 AnhlKqHvcd9jAybx2STZQG34ILyCq0PGKCqdShGQNi3dEiokHFL3C08wZwHaieTJgG/BRqHDLxd
 +zWCAJ1BPN4sHUG0VUhEU1N3y5PLQTlN+fqW1PfZs66fZF3RWN2m6IST2cjtFQqOp9qEe9VL2m9
 h+b2UEflNPJZnzrxvGsMYOa1GOe3xEDN35bjBbnpOKh+SqsEnFVFvC/O08+02k2pGEvuCJgPAjN
 cmFW/PiIsKprUWk5c8WAdIAGfcL4OPNoHW/au92eXmWfXnZY45TkkT8Hkk2hgbQosUEC1eOtFKf
 MF1kq+BTKv4twjueAZWSPLgmQ+t+yWBdXZDVBktP2ocMRM8KOEqTeFZuMEw7Sebi/SXGVa4YK25
 DPOtNJY5VIKPj0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Théo Lebrun <theo.lebrun@bootlin.com>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..8018fa895427bb1e51ea23b99803dc7fe6108421 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.47.2

