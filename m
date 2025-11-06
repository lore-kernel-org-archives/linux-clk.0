Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A42C237C
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 19:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459185; cv=none; b=W3LfsIlKRpU566ZVtxfntPYBZAPqMF2kphN9uBZJs/BtwrqzQ2dUm2zkfKGHhGAkZbj+aEq7VnwQH4tRS/0gdktuZh4mJ2HIej7wCX8wYomiTnxB+UKoxlVR1qH2Eu/mIk8M0uJgPW2pMD3KKQvqOKrwzM2+0i7XcuhmQK2UsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459185; c=relaxed/simple;
	bh=t/qaprO29W8nNlhcn2cJ5KDh0nDpS8i3Bz2ryrAj1OE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NKTbqW6Axt4GGy1xvOcPMc2omUrvD/D5Xqtc9Ul+gTqF/oG9ak24yQyuvWMxbOd9ECri03B5ibe1RgFhKVZXnxxHwJE6+xapxnHyhP2Inb4dUFSqzHT9CAn2VGgV5LBM1FAVQ/TSTVgQYYIdQsd5jiXXb/edvBCWPR29Ba04YjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEvelUD2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEvelUD2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so132935e9.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 11:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762459182; x=1763063982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXDqfUWM+p0Z7nN20QoGOJq1S+ZWNbFic52FirlUgMs=;
        b=hEvelUD2fKqsqGWq6zOADkOTob0aRebRw5TIo8LRb0lE36+ehErbdAbtkJFh5/HDHD
         GMycicSqYQGp5kei3Ii7IXLlfWwKjoKgrXglltBY1NKoTMrX3YFfbxmMhnPCuAOUjHjs
         ENGh1L3xU6QfoYWQELW66fIonXpmjSchGExE/X8Izb5AmEaakm2BRpkQwypgO4lrRa9r
         mnLjAsi7wsvQKer9bmvSxmEbJR8Lab5qUzDMANfRCYQR/2CiLpbX0wldplVo6whGCJEz
         pR2xcGSq6aBdH7B+5DoXdyOAvQCVUh7cO1U3Z4Ui2yydift71dz6oMg2oR4Vmvoxt1Pf
         SXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762459182; x=1763063982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXDqfUWM+p0Z7nN20QoGOJq1S+ZWNbFic52FirlUgMs=;
        b=F+T6Q7+TOi6GFCPxigbpCoaHuTfv8n5JRFn9Scdqgvdvw/cqggJQqB1IQbSPvpq02z
         4B1TYMTPuEfrJ2ZN2aG4yuS2keNTHAyUcYnWMF9vcMjuUNS2OAazIdHwrpsysvSybraU
         +8Dgco7DZLZP5jiAwXtWT8dtdHfRuwvFV3puUnTTGm3ZA2bOeqJN08I6aUw0nHKEENmq
         yW9usosYMjHvSY4clkiTpzCZ7/95v3vqT3DWxhL+MUJ+tgMLtxFMw4AaknX0rXANaXPU
         kzEZB2p0pcsJ/xaCHrQBbrnZYs3lwcCUNFZwbeIx74S6YoV0/IGHUcgQmmYkh1LMTYvx
         9flA==
X-Forwarded-Encrypted: i=1; AJvYcCVvOTxzA8EZU9kUHAGKbRkgdhMZDaYRsV9n4YQFHpvUQIcY/TCk6euLOu/b+zNjNnIjENG53iI88F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHSvBToNTsotGu1WKCYv3ZODqDbK0FJVoFKAzsHsHJySfA1vr
	0zsX+p3AcNj4RUb2+GpYg1wCK0mv9Sopr0oVOUMjqj1/tLFVfkZTHpBj
X-Gm-Gg: ASbGnctybr69J+rQ6XLH30uLVc1meLOA8jhYKSJjSKAOhdR05QUqWAzcnoUjcAdPVUp
	VM9owC+XKKxvUYgmrME7ELRXPEGVSNQ6F0roTIPMf2mV1RANxic0JIgGbYzu/GJY3bXtlzbuy/p
	oscD0SLkDU1WjTCxxpx3YhexyQdHrAaaDJFOlkEZ8HuMA4T3uZ5asDkKp0cwxpCMWH23fJ87tyv
	z4Ntln+eiGio9V54klnEfF7w/9Rgh+a8OhGjvOZjZxqmkKsnNO1WpEb8j7o7jfuGoC24Ta/X2z4
	hLinxmy7OLLLPWI7EqwrAKxAlsSRmsat994hfc/FB/iwqYPxtymX+ZYhGK1C0bBJ4BKwnEa6x5q
	VqqWJy/VH0pnnXDPKrxLU2juIbC1K4f3R2Z4YFh2wIBXquKAnwzygM735Bqy7jGd7apR+vtELb6
	zO7Gv+f4iryMBIfOZBBAGGz1s9Aes1MopPofUQxAgo
X-Google-Smtp-Source: AGHT+IH2zuNZAuG//FFua+3NFYrMOZHDAhHafYeLf7JfFRe38hh4R4scyQumglGX8PwDG+TuA7G4XQ==
X-Received: by 2002:a05:600c:3b86:b0:477:5c70:e15d with SMTP id 5b1f17b1804b1-4776bc1f08bmr6914605e9.0.1762459182268;
        Thu, 06 Nov 2025 11:59:42 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe62bfa0sm990037f8f.5.2025.11.06.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:59:41 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/5] clk: add support for Airoha AN7583 clock
Date: Thu,  6 Nov 2025 20:59:27 +0100
Message-ID: <20251106195935.1767696-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Also AN7583 require some additional tune for clock rate so
we introduce support of .set_rate in the driver.

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  clk: en7523: reword and clean clk_probe variables
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |   5 +-
 drivers/clk/clk-en7523.c                      | 543 +++++++++++++-----
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  62 ++
 4 files changed, 473 insertions(+), 140 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.51.0

