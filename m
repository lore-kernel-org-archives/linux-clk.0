Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363921BB6AC
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906363; cv=none; b=mGrl3dfJEMT1MyJPVNNB+OXpDTEDwlxUxszhG8qunsRLTsnd1Z6BgBMa+EtlgfRs9VEsQfWIrTr1jEBX/74ECLwb7hzPKgeclYNYJsBfR7OLi4Fkt8bu8PYQqaFyuBbVENBzmHd3dlS13IS46Y+oHlkzHUeBATzpcf/emWUX2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906363; c=relaxed/simple;
	bh=oTww1XOoHQ1WZkCJUUsZn1fHEHSTJ8ydZDprCFOKPl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sfVqmVRYQus6QKAhWCwgAi1l8gimquQbt15LZclweRkL+KdtW7JLBRyYKWnYVu1EMlNivY/O8A0y/oyxc/2LsA813Pc7eGU3qQPi0FD8JgWYvnDlSUjJV973WSqX5JvuPPhJKOHYaPcsIdsCmL653F8vtXWcx6TOT2VXlOAYDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=OGEufoAX; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="OGEufoAX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f7720e6e8so143605966b.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906359; x=1719511159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+nbkylU75B66T8IPhGtcEUJs01o0nAAuyIYHNhQRcE=;
        b=OGEufoAXxL9IaCsOoTRQCSX68a3AbYH3Vc1UbtZcGseDB/JH3rwGqnuhn3iPUXwfDV
         BM6vfyE73Z2foX92yMl46ia3l8vBynVQlAhxmyg26kumm9PDvyXGX5rXoRNCS3DOwM/i
         nfPWiRtuU9WP3zXgZLTgyDqQXCatlSEoZlLe6gAM4XKBu1GHoWs1UADCMd66LDkoBpFC
         sV6YQh1J48om43ObLI4i3QRAbsl9ElUTO+ioywaqO+TgQ0ITLOvdrICXBhELHLZVl6d1
         wb4UnJnZohTZD8pZqDjsFsZ8zBuw5NIYz4gsF2rlT7bxLKSwYEuyXeJqa+cd+naRkhDg
         Yuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906359; x=1719511159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+nbkylU75B66T8IPhGtcEUJs01o0nAAuyIYHNhQRcE=;
        b=xBWhocHFr5MUt44TVI5xy2P6+bSUKy1//JV6kdsImy0DZuoRjtAAqREBXASZfKUqkV
         o1J1fB1nDfM8ZNCMKEDz59ujjwTMTWjTbuhfq4INOvVXDpoM1HiblOY/FTkSfAGhcvMt
         JPIOmdvVF0HaqWywv2G11yNwSnps/Bzs+YlV+Z1CaGevx8HCFHIp0DQeyWtGXEsOo+bX
         kQ59ftchTNraGbfb9InYbAIFrOoeOsV/Rishj3Lkj0LVmoyawXOsXeEJnJpWadlJgiCq
         hk+I/dU6l9Dgx1vWzPgRGIzI+yfIoQqk17pIJQUgljcpiLx7bvQmAtrUTOGsD/aNbjsp
         T47g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3bv3nd4qkOha8m6aeE4RUAzXsm4sUuZr9EUUTc5/qR1W+YZ5wbdARtPpUwhGNUmQB3N3iGkCWk7fIAWCLk5jUK7E/LuVVkL+
X-Gm-Message-State: AOJu0YyS1CdN7D7cZvHQtnSPDBm0j351VlBiOVVIlrXwjtszJaYTStow
	u3lTWq/MnZp9p0plA44nFCi2s1Lu8CCrVslL7CEHNeuII3sPW/R/Z0LX06KgRxA=
X-Google-Smtp-Source: AGHT+IGwiD3L95St/ehfaodQi7lOhfrdpQHGauU5aloxC0usOuACZecYTLoGty75spYidqSIKDxV5Q==
X-Received: by 2002:a17:907:7293:b0:a6f:6f4a:b25c with SMTP id a640c23a62f3a-a6fab60a2acmr584690566b.14.1718906359615;
        Thu, 20 Jun 2024 10:59:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:59:19 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 05/10] clk: lpc32xx: initialize regmap using parent syscon
Date: Thu, 20 Jun 2024 19:56:36 +0200
Message-Id: <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to share the regmap with other simple-mfd devices like
nxp,lpc32xx-dmamux

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 drivers/clk/Kconfig           |  1 +
 drivers/clk/nxp/clk-lpc32xx.c | 10 ++--------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3e9099504fad..85ef57d5cccf 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -346,6 +346,7 @@ config COMMON_CLK_LOONGSON2
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
+	select MFD_SYSCON if ARCH_LPC32XX
 	select MFD_SYSCON if ARCH_LPC18XX
 	help
 	  Support for clock providers on NXP platforms.
diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index d0f870eff0d6..2a183a9ded93 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of_address.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/lpc32xx-clock.h>
@@ -1511,17 +1512,10 @@ static void __init lpc32xx_clk_init(struct device_node *np)
 		return;
 	}
 
-	base = of_iomap(np, 0);
-	if (!base) {
-		pr_err("failed to map system control block registers\n");
-		return;
-	}
-
-	clk_regmap = regmap_init_mmio(NULL, base, &lpc32xx_scb_regmap_config);
+	clk_regmap = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(clk_regmap)) {
 		pr_err("failed to regmap system control block: %ld\n",
 			PTR_ERR(clk_regmap));
-		iounmap(base);
 		return;
 	}
 
-- 
2.25.1

