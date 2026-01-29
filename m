Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630C289340
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688533; cv=none; b=js0dqrPxpGMxRXZgqQn4EvumRxqvoA5PPW2nUVWTQ6ig4mp6NabdJw5g5MVS8O7La4xcr2BvCTYI6AWi4+ctncq/a3Dkf5gbJuNUHqjR4QrN04qv8Y+PclZoBc/o0y4B8p7MM3YkX3HnEgh9DdMu9zBfQm0KCNCSd+uz4X/xaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688533; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tk0tXWkZLOhhFzhNdJc+haPtimgMK2iQZ1cmOhfAmZqOADlRXzFq8qa3Ve6KIi8JQYvmaKXyNFpaozgXXuCLL53ehetu7LvSMdGG8G8C31+w39MCDdZg8YLYQkluCuD6wWf4o87YHbBM0G98m4oJMaIf8kQ36gfIOIfTWXEgmC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8/kyVfg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8/kyVfg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b885e8c679bso149406466b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769688530; x=1770293330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=W8/kyVfgEHwn7pZDmQ101ES0uIhutci8lhbMSoRKx4B5R3n35pcGcovgtokCs80Goc
         uyenbrKH3kzHWWpoRfhbejqFQT29Zcria+l8DJhmAXTrElESnF6An46xc/dgSOutCHIt
         zSPB0VjinH4IC3jSlzXqXAHKtPGpF2aWdDRj27LMRzgJ3gRc0+jLhcQGdCSHQg+t0Hfx
         TSMeCfZcPLB8Vg39/pEN2HcvDqBBdWoU07JACDrzNTvWYPt7Yyg5/zhpikUm4IXFdQHx
         3fO7XfD24g0FCEdEhHruIJVNbP8Iu1IqiBoz9aZVR0Q4z9TrBxVeNlbGjXlrN61oX4EQ
         ia7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688530; x=1770293330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=NUSsBtcrB9cvRpm79n3f5FMtkJivbADSS9eE9CYWYj/N4cEB4YpBAYZgttyOiOVU29
         lyJ8EMM1/qdelwlRq3KjOiVUub+v4CUMr8r5PX+gP8SX1ZZ+PaYgqR6Tt4HLjC26Iqhb
         aaH3Gk3jSgzW4oPvulA0WzUQMwNvl9sCgzHvFuFHTEW3ewZtQmQvHGT9c4myojADIg6i
         RUfxoeBI6QCVny24UR5U+W4gsVIKn72fEacJDKDGEX9TBJC6K5VhaXhf6lRPRUIM0KUO
         KxP/gKxv+dUtC1vUn0C1/zxX37iyAlxAeJd7IbOW8I7f1J8ntb6kJwljS0L/tFg5kyEK
         wobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOLe8mFxmjCTBVhuBQoy6HtBHMnY65Nt81VM9YSX2ghao+YwLOC8QRd3ncG7rnh6KVl6iGqBGPNCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw141hg5cUNkDSoq5H8KJi82mEjHWpGyGcxutntNpakrmdz7eop
	tzRGb9iVRmObcdaBGvGlI+RU3DWNquLmqmHmRcenSjGjU03A+xuZyKqSW7QL/A==
X-Gm-Gg: AZuq6aI+xVfd+ue4WSDw3aDUIJRr3GdqhGzlAQjlcfo02u9NpIFQBEi+18k423j/vni
	Ayb0z7xW2WnhL+T6RZ+r9NHaoIpPzedbz2IH54IIJJcjqUvILb3/h4FxoctuJfjKAkqsNaSkONl
	FxXIgmcDYhkqQvivLqJSEXG1izZeUOCSiCRb0UmOBKvzzmZVJ0TyFS3kS/3VUOMGRCsvsw07n/1
	PiFlulCokYB0/sDV6IqHbIdFP2Y19f3DBVXp6b7PkdwVnhJJ+HFZarJbKU0yXEUzZ8sXC5XotG0
	kMOjomvNVWSNiM/ELl0EyRgoQvnfEtJuCdkg65G8ShOs53b1RmfCHxySAtM+fQ+B7308chcXPcs
	2nIY/Xl0uP21FjnIzJajtLZF6zEFvrQHi6x36nwjFF1IsiSguvDn7Ol4wQO9VwZBUcPhOkjIwjQ
	nRw5PYpjQAwdkUh3Vi
X-Received: by 2002:a05:600c:3b86:b0:47e:e5c5:f3a3 with SMTP id 5b1f17b1804b1-48069c5414fmr115342325e9.24.1769681810702;
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 10:16:35 +0000
Message-ID: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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

