Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1C218592
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687476; cv=none; b=Reo2MKYCIPxXt97aVpl28EHDDhb7eAv9ZzuHa2xIeFQaBFF83C32NTNR1ee50sD0Bq9OsFU9ADjEbCIS8UOgFGZ5LsWixVv+ADeonEn7bInQuZU+KoTahk58YVmhZPlpdydSxLooJAuetFE8d8dX/UTLUlSFMixOEjAfyfO8/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687476; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tF8mG5l6bAAHhe7pMSsFeiWctXEpL04ZgXQPbibZsHZKbXFpUnTuX7Ox1AsGYYrR9mQ2pNkwvVsutgubExI2yYQGXoVtV9n9gFLVFycwh+hNVQIp/bvoN1QwapyQ4acjGxr5z1Qn6o9oTT8GnLSfBLUjSTn8ThQrkuqcOidGAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwxUFlVs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwxUFlVs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-658d3d3ac37so736958a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 03:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769687473; x=1770292273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=HwxUFlVsJ74FEYF5f/JfiDyw4eF+i2SGedT9OZoNjoH1oT6LbKamc15zcSy2B+LgY7
         EhKtQxNGDn3WKoJJLxIa9hZ0VWjoSM+JU+fTUuzz2sEClmsXmJiVm2IcERDcOSKpfVfW
         olWSHcceEGT62V+a96TE4RLL13VjHvj7I/ns75EgQxSVbsrC0BAE0rQ/aBEblTvQ914e
         pA0wS7qBa9Cs4mv6vjurL3ospAQvbq7io95N/QhKNMIWWFarm9bokckAIrc6WhIIVQpy
         pw7oI4Jyyu/oZgQYXzAZZocd7gcow6XdrFe+X0xF9beoQ1Cl38qhSnPDSKbwWHWpNiw8
         paRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687473; x=1770292273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Sa+jCzrnP68eN3t69sqtbkusbg+5a8JGVU13GnsRqaqXbJbBWgU6x7/XGsooIwutlR
         yEU4qqlCt6trw9gdvmdk5zCwYDzF2Yr+5Lucn7TFIDkPGMANVzp8aPNaF1C4iGOKQr0D
         FD8VJ3NjGCMBEsZnH9F2C/HoGyKpI7oG97+5TtKrTtKqWJ4XMYjjxqyuJee1XnzB63Yo
         w9Zi9YpsZp6i5rXP8wTW/Ox++IlxtxoffBqPNJlKvZQLzQWIq6yn4tX+C6rp88oUsbdt
         +Oomfb4DMISMP7BGDixelAFcSoOxzJgs8iqPSbyAWTNFuuhh0XpjZGrcw+SwILsZ2X1C
         Syvw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJ5jgNrweZVRPbwHLznuuWRleqgb8jsy0DuOlK1QP0jf+j2LD1/AISGxRK3dYM+gaX68ExbxlQbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKV86nfgAJQSAJwVxheSbG9IUJ0aCFrY3ViJmJqHKuuX4Ha1r
	le6fN9booW/j6MFm9bzqLjV9W+hkDPfCr/MQzrXbMeMpPYnqoX+uB+VjRUfKYg==
X-Gm-Gg: AZuq6aL+HZJj3Gjb0Oz9OO5EwE8Xr4pglgURFBisfpqXquzjMs1xzD8g0cClFwNdQQ3
	W6gQoqvJbM9tx/IPyryorod73wiiB/YwQ8SYVRV7d0NqpXxRhfw2FdTX+zKrRiVYZw1p5Ty6yGF
	Hcbzag8ESF2PB8XbqvcIakMPleCJRn3tmMO0uzm4biv+rNC+UgIaLBwW7WQ/0UF1Cal4zdRTTts
	gflv8Nb0QTgsam7Rgd5gwgvjXpFSfmoycNZo07xawQ6yrXdcC6nG94CQNxpU3Pv+wGbp1/GfECs
	aNQixd4uFedquSGu/6+JJZm/RLPimUIvcy19mtvQyFUMhS4GBY7SNXhI8hA3JwZF5ByMRM9mCTu
	NtSfn3EipvY+c8/7DYVKzdCA7HdEKG9LecztMrsA2hKQcnpdrDEb1FtSbXJ/h8B6BdnMxUlOTgu
	9aQycKUhF2sqbjMC8X
X-Received: by 2002:a05:600c:524c:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-48069c2c45amr116529645e9.7.1769680895603;
        Thu, 29 Jan 2026 02:01:35 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm111543005e9.13.2026.01.29.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:01:35 -0800 (PST)
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
Date: Thu, 29 Jan 2026 10:01:31 +0000
Message-ID: <20260129100133.95711-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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

