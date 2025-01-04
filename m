Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D27846D;
	Sat,  4 Jan 2025 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976446; cv=none; b=iYW0HYlJUf4ipaZU+DhSLk/C7dfrsiSUhfss8iz4v+33BYcWeDtmYI+RQ/Smn9btk/Ra0WcneDuv6s0Y1qNrpm1ydKumZTqT416vE/WRP1i2YZQfxSiemyj2sMzvAjjfjIh5w1Y/p+quC+G8zp/jxkI5oLp99eDJ1WcolRpxg1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976446; c=relaxed/simple;
	bh=kuH1EVNAyoVixaWKyWINyW5BBhFmvv3Gv6Zp5f2CECQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxPrydosAd5BRaN4pu3eVJ8JyG5J69CvqqzAw7mcdJGH6+QU07bfTwQdy0kCcfn9JZEUck7FO7DEzWanAxc5w9Z/r4kU0kt4UFgycBMEzZ+K7Dk9xapWPZnbM/bOAYo3VAuiF5CzTmdmdAz/+KiQpgdTEOOavqLpgdzFSuuwo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaB18HJg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaB18HJg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21661be2c2dso165122965ad.1;
        Fri, 03 Jan 2025 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976443; x=1736581243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=ZaB18HJgIZY+u9dGhb4wg0A7fGn9BUNo4++GvduAetmRqSiOi4pUyYiV3A1C1RbbHS
         Os3RLWqIr2kX/uari4kWNn4xgD7B3RAGYeECnMItzPRrEXerw9cgtAaW7D60d0VynEDZ
         4irHD6gjUXKaMsmjJBmj4oVmkFZrgXoHkvgnw5eUQFPXqwGtub8301gWcCrM+ScFkpt2
         WNx9W4OiLWIPkfFh+SzbPfrPOZnCvd0ZqQA56w4MmkhJ1DzpK0Kq4GFKVzmmQ/us+Tq9
         M5G5lOoiocewVsgTNDk6txyCuK2Re3T58TOiA5sqTX2Pm7EyfKZcAri+6dxOOledb9iW
         UaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976443; x=1736581243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=XKqOQMGs6gBoELJsDQ7VHDVN3J6CIr0hLR+tzf3uMkzlcurIw3KWyqDJ0E5wgKVY3X
         zVYSPlnmk28kCOMcObLw1onholj2fba7Zvw7NhnglH99E1fwajnf49luYvY2o4krmiDw
         SYusc3WYkllh+Q/LOAi629uwC86eIzmNJmfczqFSKMo2t6xMXxcFlS+bI7QhdzpaKuTQ
         LKq6nZrMxk22svZoJ/8kDtcBs5+8P5iMQ+8lY4awf8xPOrpN96YPxUliiO2YhurKbyAK
         /5TvhfjPyjBhiZzQHVhB0Z6ufeeUoNWTGpfcxAGstjdFHSkLVrp/q1XyBnG6V4mv0DNF
         X+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUPThNL2qzgIV+9rEz9dCEwIhlU7z2tTZUyXUpoBdQT3bwlHsfafy/0F//k/ltK37nhgGsqhVRv54Ay@vger.kernel.org, AJvYcCWIVuV90dcvpWIzxTDBTqO7GnK94skjyD8CV++ukcljAGx7mQwSOur7nb661lzyGdbLWnWKR88hhL5J@vger.kernel.org, AJvYcCWxg7KlsaNQOmavL+5b65qrToe1+rKvuIxbNYflvbb7u+WQdbwn1l5l/IPSGu2Nrg/QPK39mUKL2OaBTeqC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67Tret9SRZJVrxTaPHTgO2G2RRx30SnV6dgqSyRh5PmVQczAU
	NHMdxrMrhaAw6SSQvEK2Surp9PxOcomLkfiRrTuHJz1bqa9xPfU9F48/LXIX
X-Gm-Gg: ASbGncuSt0caN8/vpq5zbQ7JtGV8gdoIIp7Yg1JrKlApCREz4cgj4Op4/OVzHjJOMGx
	WT3goQnWZYAEdBwjFUMXjpGaK9EA0DscaB69BSmckNUJns0+vmRSGW9abzl9tbOdpLx1cii42ip
	E+BurddkMma3O53uIfL0lFm/n2+aADw3SpIQLupZaSIrCKR6YI3JpaMdYIrF5MEkF3MXh8WbASJ
	NfuEsN/18Holun4kpO0lnv9J0ah8KCtvvoJ7vWkXweqBUYFyA==
X-Google-Smtp-Source: AGHT+IFLa1cMRqlQ9BB286TlpwABGnbwaJvMsE4Ob1+XZGsWNekaNd7fepzhC39fUKHuoMyTfGW+JA==
X-Received: by 2002:a17:902:c943:b0:216:6901:d588 with SMTP id d9443c01a7336-219e6e9d949mr797755625ad.15.1735976442692;
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 0/4] arm64: allwinner: a64: fix video output on Pinebook
Date: Fri,  3 Jan 2025 23:36:56 -0800
Message-ID: <20250104074035.1611136-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI
in TCON0 mux"), TCON0 clock parent is always set to PLL_MIPI, but
unfortunately it breaks video output on Pinebook.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock
parent, the video output stops working.

To fix the issue, I partially reverted mentioned commit and added explicit
TCON0 clock parent assignment to device tree. By default, it will be
PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
override it in their dts.

v2:
  - split device tree binding change into its own patch
  - add rationale into commit message and into comment in the code
  - gather the tags

Vasily Khoruzhick (4):
  dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
  clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 .../boot/dts/allwinner/sun50i-a64-pinebook.dts      |  2 ++
 .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi       |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c               | 13 ++++---------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h               |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h          |  2 ++
 6 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.47.1

