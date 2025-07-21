Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950B19DF62
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753093641; cv=none; b=q24RHbiKEPNEGjYMDAh+AQRC7C61DYs6BPIQ53XyxGcYLqmciUXibmPPkzEXciC6e6xHQlNBd4T6AYuaFu4t3+FFeN1EXshrw33ADVMiD9K0opiwJTwqNDofKakHQf1qoTIZQP5tyy4I/n1sRdRPxDOQ4xXs3xVN47SWYOh7aJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753093641; c=relaxed/simple;
	bh=2zrW2fa/puzLsSOSjZapghDlGf3y58LdMnWBQi6r4xI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1EX4XPWaz2lf4BQTKj+c8MbjKqL1+4xldeFw0bH4brT3s7w2HCr4yaro91ZgU2vvSppYxBHE8pwNjeP9j/Xem4OM7j+x305JQdPUQHYW2LND7yM/e9rxlxA401dlApHgSwzY3eLIrGQGcpN3sPL7iN6Z6hJIY/WfjJ4+KmxIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IADuf9Zq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IADuf9Zq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so7276633a12.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753093638; x=1753698438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7iF+C/RzQgkp6Y9B7o2Y9GuAxj+z3zLLuAW6+yrxDY=;
        b=IADuf9ZqNDqiVWYU6RN8jkKZ8GmHLa6zTDPUEFBNz/o70yRYfY2J6F0tRwnC8Yt9yh
         4I2KdHGR7f/yS9AzNMtPZ+JZSawcco3CFrhOtmu3qe7kF3d1kS2UeJYNCRcbFxgGsyDt
         sGTxM45dYPkRoYX8ueTArnkX+Fvo9GTehjPEzIHsBlykf367+L7qVnBs9CESD8iMpS3p
         f7ecN7NKqQqpHA56uEEa27/eNNTxcJ907GRe9ONmKWLUuObvoQBSPGIIGnL2zcdHW4RL
         Oa0Fun4q+uopZyPjnQ2tkxRFhp3lOajDs8DlrlUj3kNJqdWx+STFL/dgACIlyLxfmsiq
         r6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753093638; x=1753698438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7iF+C/RzQgkp6Y9B7o2Y9GuAxj+z3zLLuAW6+yrxDY=;
        b=dvmpHWBtm8QuyPpX+XSLbbUoTVVisnrs/LtIGc5qmB9dPHYSuo7743nvl9Fhyy56sK
         m0/jsOTqpMuLe/3af3gVGAWdt/kdPPH5zCC6rwkZCbxxMcn3IbI8EQ3eOQaut8BVJoJh
         elNm7l3c7dIiYEtvRmiwgho6LfGbiraRm998SIsiwiPjNAoF8m5CxTcRSbTrQqMJRNDY
         SPydR5py4iLnynRpbup7wcfAAnAQszFRWd22Fwfw3rJSQVz6m8x0m0z/pQdBEhcEkFjm
         oOAS6ABIsUFzvN7LUqeUN/ChABPjj/HVkdxoX9l4cFIoojuC3Gbd6kuH6JmzWgh7YufQ
         il4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG9lC6dqI+Nb8LUvkKcxRzWYeCZ/0TxS7mvJFJVm1QJs73nt1vm4f+AoH5zzyNTnUQoYAuYuxnJWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFMwfyKcHP/fOf3YdwM3eCjp2alqVfjyd71hffB7BPf3t7n51Q
	vOybuYAFAvRupLxkl0UGH3iaKM+7vgZbzzrIVws9n5uaUDe7e4xpR8SuDAa7Tpm2qk0=
X-Gm-Gg: ASbGnctdNUZk7/+A5GXEgY509mmiHzFKq8zwYS7isGcoNTD53NGxhyI1y5mo2prgiut
	EOCks7nrxkZqdQwThH2MudfLFhqb940p9BBkd0MwSXsuccSPvv42BzwR4H6j9UN1BW8Eutk0lAL
	UmaShlU87szxdiiSPaIquuoN/qFd5p8QcorQRyX0Z/q3L9ALhFxAd4LVVF4NCQdVHSIYBQANFHj
	bv9eo9H3mgDP0HdaY/CRuOPJ5e5JU9p6Nc5t8W5gkYsiMjtGDY9L582QBmkTyZK3Ottf223vKrz
	0IjnjEoawwF+EOnIyarvwh84GvLiZ6S7xBFRXCSUdhZSuzL6FUHU8l2yXpONo24tuy47y3d8jUL
	0lGQErAx98AUEg5514MXudPeLxlVGdDYiERMWoHaE
X-Google-Smtp-Source: AGHT+IHPhl5LBrz0eCO2gJwD2sbaz5/jb0pOOS3Rz8yl6pKwO1fApgAdJYgSCMEELNn3CXqflpspoQ==
X-Received: by 2002:a05:6402:2683:b0:612:b67d:991d with SMTP id 4fb4d7f45d1cf-612b67d9daamr12657528a12.9.1753093637851;
        Mon, 21 Jul 2025 03:27:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm3475019a12.51.2025.07.21.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:27:17 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v6.17
Date: Mon, 21 Jul 2025 13:27:16 +0300
Message-ID: <20250721102716.569900-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.17

for you to fetch changes up to c7f7ddbd27d55fa552a7269b7bae539adc2a3d46:

  clk: at91: sam9x7: update pll clk ranges (2025-07-18 09:31:33 +0300)

----------------------------------------------------------------
Microchip clock updates for v6.17

This update includes:
- a fix for the PLL output ranges of the SAM9X7, based on the latest
  hardware documentation updates

----------------------------------------------------------------
Varshini Rajendran (1):
      clk: at91: sam9x7: update pll clk ranges

 drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)
