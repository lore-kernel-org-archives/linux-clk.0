Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC41BD505
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 18:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906472; cv=none; b=B5U4xKqvnCU6rfQ/TSwMsG9zG87SeSPg8XlcWKDmUhBSNXDPgSstvKeXSdgJIhbTOTv7xeco3lwuG82eTtQGFBcIO2oLXrBL/WoI2ahTGHGLCzbXnzRf7SJEgJ2a0S3oayJT5cJoPW/oH/9ULK5t5kxJBBTyrm18OjFcZYgcMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906472; c=relaxed/simple;
	bh=T0AdqBMK9lkL1kcLkmUERSGkLaTYUdQ6VqLsNTB1DZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RK5RBhpiuTZKH3BAcF6U+6MbGMvGV/hBMbQhf71o+aU0v3skQtyazmMIe1KE5Z//4viYUflHLloREGXQ6QRH3cAK0mKoHmmrtF58Vl5ZWwKm4nEr95oN/HaUN5/ZRLK9X03/XNgVaVelh2VbQQ6Q1BKsmtkOHI6cO9QR+Hd7pno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=tqE1e0EM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="tqE1e0EM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6fb696d2e5so135954666b.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906468; x=1719511268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz8kTOxdaIm1u93eV0Is+4r0vyFAn21pP7Hjv/L4wvo=;
        b=tqE1e0EMqUp2C79hQhRClkk6F46UnOwj31dr27M9qmDkJrZxEP3hyNP4zu628BPCqw
         0tSSFPiQxEVpSeif3aXosKjXeITYlIUThl1mw7LalfsMA3qLmumGXhPCQqEm4QghDY/l
         06uJL8I3HpoyFr7fgEW8mjs/fCjz8dgSTjoeCFR1hY7wb2O7KAhRKj6jKtY3fh1SL77G
         l+IaJWqEfSycIPsIDsUZqhpPuPpuM+uRXDbm/Im+Di1YLI5HKfJ8rvlUiVioW3pZ4eLd
         7fAgA4zdtpkeXkAVD6hEEwdjAm+/EQqLSoSzPYHpmL9voXsAlCy8NacJt5jj1+nXbgUQ
         L35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906468; x=1719511268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qz8kTOxdaIm1u93eV0Is+4r0vyFAn21pP7Hjv/L4wvo=;
        b=XCbiHPW5v6FhW1GwcSbTeujDgl9S/hppEzQMtrrUVhW1Q9reqXwcBEwESVXMV9LunW
         YVdh6fESl+mP8fCuMHrY0dvr6hEIL46EGQcfusq2PKYBVBmbj5jaRjeDvjT19LJZUVCZ
         JRGkaReIlVURaTM6ayELNpmiUsiTRK1RQpS1A2tZtNOx+MHaQZcrkx306HSAj7epTII5
         tWXY0w/h9LH21LkjQPdaxiWvSaHFQYLQ/Ha3XBnInEOC6TpThX+rjozDKp600EaGjS0v
         F4jKK9UoucDaxHeyr6GUov6WNoW+liH8pF+zwNGBQp1LDpXlYpGa9b1ZsRX7EhEIAEc5
         X/XA==
X-Forwarded-Encrypted: i=1; AJvYcCUSn9VUFqpMRyRHrYD1wQ6RiCVTZ8Kqhg8tUTLFtkfdfSsk80JJkJ/QV/v889vdB8DA/sTqDLb96MDRfemkVsOR+7AELbPjJiPz
X-Gm-Message-State: AOJu0YyrEKskk6LTo0Vsy245iOVw8SCp6hBJ8jcmf7Z30lGZOIfOMUeS
	XVOgo1mE19zD/0aPOeQOz6NQcmuWW3/X+u2JRXrL3fwuQDV3EmE21hZMKND43UM=
X-Google-Smtp-Source: AGHT+IG8eY8d/PSntzHXSfPtqV/wO9neoC+Na07hB+VY1pAoMYT9SP6YNE1GHB/rvuCByUpgceEg7w==
X-Received: by 2002:a17:907:a80f:b0:a6f:b67d:959e with SMTP id a640c23a62f3a-a6fb67d9870mr344459666b.53.1718906468099;
        Thu, 20 Jun 2024 11:01:08 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:01:07 -0700 (PDT)
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
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
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
Subject: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from del_timer_sync()
Date: Thu, 20 Jun 2024 19:56:41 +0200
Message-Id: <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
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

When del_timer_sync() is called in an interrupt context it throws a warning
because of potential deadlock. Threaded irq handler fixes the potential
problem.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
 drivers/i2c/busses/i2c-pnx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index a12525b3186b..b2ab6fb168bf 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -718,8 +718,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 		ret = alg_data->irq;
 		goto out_clock;
 	}
-	ret = devm_request_irq(&pdev->dev, alg_data->irq, i2c_pnx_interrupt,
-			       0, pdev->name, alg_data);
+	ret = devm_request_threaded_irq(&pdev->dev, alg_data->irq, NULL, i2c_pnx_interrupt,
+					IRQF_ONESHOT, pdev->name, alg_data);
 	if (ret)
 		goto out_clock;
 
-- 
2.25.1

