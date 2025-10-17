Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D022A4EA
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688170; cv=none; b=kmw99GS4hnQmB9Ql487sg5pNimr3WOgTi6g5Ogn0yRzjV5ObKCzOYEtrH5LeI06zRuKzIkZyBW04/BH8QJd6XXr5TkhE5R9RfpSSXX4+f8Gvvq+dc5VQRFvR3LKK30ijqzc3wpRvYLvB6kPT7cRL1er1xFU8zruNv1pNSITwb9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688170; c=relaxed/simple;
	bh=+Zz86raGXQ4tEA6M4IJ4q4AZu+RYhIAQ0gpsL4WG+Og=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GhoVcA4rTN8u+iNU3HEmdZn7NO8HUV7eVVrh2VYm4KXtkHxC9Md6goO6gD3lwxPGmzjElNQDWtPHJAf+2IvJS+m9yhS43+AVOfLlKEHZglF5lgMCKqEa8nBS+APX3cESloJdSi5V51x7m9UX0Ydk69cxX1wWVMZIife1+NfxCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IOIcl56y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IOIcl56y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4060b4b1200so1446858f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 01:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760688167; x=1761292967; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6jUScl2NITZ+PoGEq7AwOuZFPu/G6TgC/xMdzTqEyA=;
        b=IOIcl56ypedoZC49+uSoe3y1328eMGiPMbrWp5qmwmZqUG6bxn+xEXJ3KeA3B2H7eE
         elb3UWhXa0C4aaeD/hudbPo7sxeRtKcS4xb8vthzqTQB1hlqXYlxUS8++MKSAvNweHjQ
         wPa/jXLvaVZQQ/O4K5D7o6Wujk/f/ZCEo8eOEDqlWsu2ygqJNdV72uwjsMoETpX/shsD
         bW/7ar9zyM12sywZ94gT5SDQDyntvEK96oMib7PU+g+3O/L1XkVl8LzFxwxOWMdLkbHo
         HQ64ygdN7nl3OjeJrgvigRGXSOZlMVgxV2x8nL1E36k+bx8aNVv39sOCPLpXIqlPbxv3
         kK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688167; x=1761292967;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6jUScl2NITZ+PoGEq7AwOuZFPu/G6TgC/xMdzTqEyA=;
        b=Ci4YHr+4tB1n9aGqQfcJeoEjvd3cEBsWaqSowREFx1Ri6PXNOkezaxWazyNXjX3Et8
         fJk3rCC4besc36mtTo79npmf7nOEfp5WoqxIvn9L0W8WUIb0hXqiQN0rOSEk/fWE3hRA
         MT2Mth7cPPhHzkiWf4GU6SLg7qsAC7HZ9PrETy8yM1iNFa9JPktNU4N59/MTOganaIFP
         FqfJbEW3lCTKH6qx84FsRpx0XsW2OTdGeLNvV/U5wPk9vQWMqe6XDK/SllStOW52tYAQ
         5rRrEP8U/Rk1sKSgYv0hkEJ35roDOrNQDgZufvbN/k9h690aUGMwaVG7LplNquVQ04Ww
         g64g==
X-Gm-Message-State: AOJu0Ywd89CPfdFa9wl9x4t772f2uDiYiXWuCKDzNuLeI7KN/AQ+Cgx6
	sQXNErYkz3o5mSkfEvVrJafjqoxicbVgADgN4u+XZp7bsJPCiBIkFaEKtB3oiRuuBIW5GOOYPZ2
	ycS8c8j53lA==
X-Gm-Gg: ASbGncvyBqRggHrscHXutFIKnQhHli8yz3CMj7ZzIpcO6rtM543XxhamYvNtQjPgRgk
	5s1KPY9rqyPsjLKZDAoCEAuugGonUL4C/SLRXuz7SmlaabkRV8gmLwyHYy1Lb1PTaRw8lTj+Gli
	7nOLe9bXoO/W+xUmwQUg4FmYGAdD19s7CpK1vNq+GQYaGvE5gUl0QOSA6W7MNJLKU1RpfwpE4UD
	nYQXzTL/R67xUle7KhC2r+EPs645z7nUJGBssa2LpGXnF+x5DlbeeM4//yVT0AngWmX5g00Zp5k
	oRckskGslX367Fa4QqEOLtAa0khKxD+MLNt3NrIbEh52KNB6nY2HwpR2scUiPfeSEBNR3MLdeiz
	v4sE4cQVkHLhlVmA1K1KALoclyIztxq0P2LmmGxlJRdsAdfc/oUmvVPbWhAR8LKuJgRErs4o=
X-Google-Smtp-Source: AGHT+IH+3cqatsdxr7KnVnzTd2G0piwrqv+5MDST6gZ033Fz0Y9dVGarFXa+3uevs+8omXzS46lViQ==
X-Received: by 2002:a05:6000:470a:b0:425:8577:9cd4 with SMTP id ffacd0b85a97d-42704da392fmr1867346f8f.54.1760688167461;
        Fri, 17 Oct 2025 01:02:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6c59:a281:27c9:93a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42708bcea1bsm1082308f8f.14.2025.10.17.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:02:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] reset: remove last remaining user of the legacy lookup
 and drop unused code
Date: Fri, 17 Oct 2025 10:02:40 +0200
Message-Id: <20251017-da850-reset-lookup-v1-0-362a309a9f09@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACD48WgC/x3MQQ5AMBBA0avIrE3SVqS4iliUGUyISotIxN01l
 m/x/wORg3CEJnsg8CVR/Jag8wyG2W0To1AyGGVKrbRFclWpMHDkA1fvl3NHHlxhyZCluocU7oF
 Huf9p273vB/I6i0xkAAAA
X-Change-ID: 20251017-da850-reset-lookup-eca37d2d7d9b
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+Zz86raGXQ4tEA6M4IJ4q4AZu+RYhIAQ0gpsL4WG+Og=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8fgieyvnPPpUx87hUI3kShF3FIW7747ARrkfT
 z88AlKReOGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPH4IgAKCRARpy6gFHHX
 cuK8D/sHa0OZJF7j3ijUfnr6NiZoBEgUXeJHwvw37LgQUgRWVv0/8SZFl+jBB+6bjTQEnMB9eup
 UJh15hLQ/555Xc7KSC9MZSB1MAkmn8sPcagTXxoXZyedkGYaV1Kt/FScT41ZevjQUcfOTcOwy7y
 FjzDf/FtNSrkDlenP3Qotm1mBsNkdmli/nvVwzobKmzLNz5g3w9A/ZzB7h8glS6U0aFQXK3VUbi
 LfhTX1T1uy2rqNdJ/zH3+qWp74gMfzd1QsSagblV0n0X55mDNV8YIeInblU3y8LGkXWgY5EKzJA
 EPlJuNX40GaS4mKc2g8qGrXs81rhMsMPz65l4b7yW9dsdZy5T58QYbfohTF1O+0Z/MZZqBnD/Tw
 tMkctzQrLlsWlKMPlVQWyC3K0QDajWAxILY3U3XN8JtV1Fi+Op8mOD9AItrG48p9BKiD1YJsWID
 5Zf6X0yDGOb3bVAI9RHchmqpiZSzBgKVypIHTDkpkadWTjYcptyUENp95Q79hKBlHX8kujtfSNu
 tqskZtlwF0cMY+gNfx6pLllr0SXmVEnmVWW7RsneVUQR8Vb3nUnanz8OSjcUgGtt/wfJaeHoDDk
 qhtFwkKKviq40FsS9ALv0YGspPt2v8fWmHRvSC4BuAT81PTGYo014wHFI1p87ue21ofX5pdLQrr
 VhqLB7qM+s0YXZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The TI DaVinci platform is the only remaining user of reset platform
lookup. Except that we no longer have any legacy, non-DT boards in
mainline so we can now safely remove it from the PSC driver and drop the
legacy lookup support from reset core.

The DaVinci clock driver doesn't see a lot of traffic these days so I
suggest a simple Ack from the clock maintainers and routing it through
the reset core for v6.19.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      clk: davinci: psc: drop unused reset lookup
      reset: remove legacy reset lookup code

 drivers/clk/davinci/psc-da850.c  |   7 ---
 drivers/reset/core.c             | 120 +--------------------------------------
 include/linux/reset-controller.h |  33 -----------
 3 files changed, 2 insertions(+), 158 deletions(-)
---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251017-da850-reset-lookup-eca37d2d7d9b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

