Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A0367F30
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686011; cv=none; b=PzKe01IZ68X3EScbA4vKhnqUfoC5EumOufw2IgaALyNVQu/U4bccItvPsAsAHmFntwWjfFHZRc102VeUXSAyO0ZQ32TMf03jhPNoBjt8I9hmzCacXCiD1ZI30n4vdyQ9ZDE8JkYx30BVyoZBhMzQm7jUTry48JQM8GcIdqD2iyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686011; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g5XAPS+P3yeKDPmm2DZ58jrswm9it/ftfEjNZXgSBThph6BYUA9bxCqEbPR/7iwpcpb1qcniLh5PS+NqAAIwlpGSxHdlNHEab4Fm0IcFMSz0Lm7+LTeAVlcp2qVFI18y+hMw1UdKE7cPag2czA1kdbrtuSbNi1nAMvTpgP/gW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MM0rpbYc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MM0rpbYc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so146585866b.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 03:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686008; x=1770290808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=MM0rpbYcH3MHLmqgRuPG+Kw6IzJa20vL4vBP87qHlZhRVm9HBQM+5OUmoxqLg0LLQ7
         sBQxP4mqS7Xnz60jsspdH+usvhdQuPUykfmhKA3+fcunipsuHdyXJgjUs3XMgkwaY0rO
         6rvFiHtHtwNijGP2wGHQXMGyzcP9CQtWIICosloCROKtZLVwcFI/471tOboZlo1Bt41Q
         B7Mc8qaUVJqDKa3cPGV4+Y5tK0DktFDmcGIPqO4wHNCinpn3p/mPNcc9gmy6ru5wJuEo
         OGaLflF3vorS2uAuFG4LIcJpAgjxyb+5itbJ1X76KcY8fVe3QE5MBG2BfCRofCLaa6LV
         oRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686008; x=1770290808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=be8r+XSNFPz0Vpon3SxX0MyBIiDvck1eoWxixusxoP9R9pDs1gD+xO3K9KQivp0hnp
         V9qZjShjEVjCvHnx2SzvsFIS0AHUVb9zenYoUM8u2r7XqT0BOu+ChXVaCU5x2BuAZby2
         6eihpFH6c12YrMh/L8RsWJ2Noq7DyrQoB5ndhpTw8fDChzSnKjH8GLQCfuv7VSmz0zus
         Pb8riqPN/R1aSxQmfD4unsADaTmYmZ22BIo/3enlTSbSFVF6rhx6/Wp6lWhU1FgRQYr5
         R7X2MkIcPrkySaM+dXwwlXyZQncrblpDRwbRVw4+1N/WZ8GwutZy4u+89k5uX5LYcFMJ
         syTw==
X-Forwarded-Encrypted: i=1; AJvYcCWFUFKbhkhb2zXSDR0lpS9/VYPNXldRJdUDJVWBCjN83uB9qn/oZwW89tY37a9S5SAEsiJJClXDYVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxupHfdXLw0t3hj5uQLcU9BkU9v2OBi01IqdCdBomqdGKsPLK/W
	ACzKhyKtBEhH9tsB2DxUf21ZKvOZACoK3zXXW6j4iA+0zTjiqxI1ccl/QyAwvw==
X-Gm-Gg: AZuq6aJYxwk1qV7mU8p1+AYLRiwFZAjLm9cXlS02BmcUDg54O6acMWCR5di37iNHJnQ
	QQpAKP4WMPaRk3aTZg9deoQ8L9lQgTme8pZCWcDUYbnx9X0RioFlbOLc/RkxEzE/Q3bi76oYfRL
	CQDbMDv48dBzuXkz89/EH7kbDn75iPleUYUZaIymaLvdGVJE3+QHcCdFAIh+i4OWYqVF7X+XFhe
	6VB+cA60bD4Nv3ozKeUx+4Kk42799l3MSjA4HbDgcCgnWC4smcWvxFdgi1Eqc+zrPqFVrQiMeZX
	wk3XDdM44r5rWt9TB4Dys/aCF0AOUXaW3Xed00gZ25sCbbIHl6YakgG/mJX5h28rsnmuvJiAfZC
	rM0FKHuUDyAKLuSQ6i12VURzKsaUr9YIEN5WuTERgFI/F0gnX9I2nhRMWzxs3n9DE6vpFCqgnMX
	jOlpW7Imfqifk89o8WLFXATvNApCg=
X-Received: by 2002:a05:600c:468f:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-48069c6948fmr113671415e9.22.1769678710765;
        Thu, 29 Jan 2026 01:25:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm109580735e9.13.2026.01.29.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:25:10 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 09:24:57 +0000
Message-ID: <20260129092504.95418-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pincontrol support for RZ/G3L SoC. The
RZ/G3L pinctrl has OTHER_POC register compared to other SoCs for setting
IO domain volage for AWO, ISO and WDT.

Document the reset-names as all SOCs has multiple resets.

Document the bindings for RZ/G3L SOC and add pinctrl definitions in
driver.

Add pincontrol device node and add pincontrol support for SCIF0 and GBETH
nodes.

Note:
Some IPs needs to set the register IPCONT_SEL_CLONECH in SYSC to control
the clone channel of the IP. Plan to add clone channel control support
later. The IP's involing clone channel needs to do the setup as per the
below flow

(1) Set SYS_IPCONT_SEL_CLONECH register as necessary
(2) Set the PWPR register to allow writing to the PFC_m register.
    After setting the PWPR.B0WI bit to “0” (initial value = 1), 
    set the PWPR.PFCWE bit to “1” (initial value = 0).
    Select the required function from Functions 0-15.
    (Hereafter, Function1 setting example)
(3) Set PFC_m = 0001b and switch to Function1.
(4) Set the PMC_m register to “1” (initial value = 0).
(5) Set the PFC_m register to write-protected. After setting
    the PWPR.PFCWE bit to “0”, set the PWPR.B0WI bit to “1”.

The clock and dtsi/dts patches depend upon [1]
[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (9):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  16 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  10 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  92 ++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 285 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 +++
 14 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0

