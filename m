Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966C63ACA74
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130363; cv=none; b=aCCjVdfvRWJhrTbYuokHQTs/micJhBR6+NNCL0lZu8T+y1XAZhVGL7krWfLxNN19DJCvwFqtdnIqMJYzi/jApwfNjJfFksNaCtR9hbgE9mcZDXgLo1jpFFNRuX3N19YkpZ0Ps5Aqm91F9M3cELzp/xY7Hjv67FjUMySOPW02qKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130363; c=relaxed/simple;
	bh=dVx/NTBKTBYer1sAELG6RU2I0c4yRgXuu2CweMfhYDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CId0F885O7wrc9+W/br2RdCnGlYjW9QyUtA/OI4l6L/DTZgHqo2fD4A2Gg7pGiu7elEax31w7e0nzXlychAgG+Z0Ygp/CthaebkMF0F1XzLqGmTEvYHe2S/SrfZmoeu4tUISt1bEIYhOuEV06UjFJcJGq0HfteeGGIfYor7z7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uss+FDHD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uss+FDHD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4801963f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 06:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130360; x=1770735160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=Uss+FDHDHClLgQwLQ0cObhsr608dKfcuY6WETeXB65+MvmGVhsL2qrrSig8GqdHnlx
         2aag7c1sPErmixQppwAe+GZBrGkmeQh536us2a3lNKzAdFUnnRE7b9//WIhcpNKgaPrw
         /xm3ycsCzhuXYFvbTkcjN5kHEVH8n1Fm73NCrxQIJDlhgl2NETWL/yGoEGCyNpVG9xL5
         h9WpskxZi5UKSE/NS+lhrdGygkhuCTdXlKcZ3J6mvz5wtJXwhV/njsAV1eYrOWGTph1a
         VRoUWu8N7Y4oirzhtL8kZ3hoJFvjjs5qUnrB+xNaEKCTQVW7IcBvfdqnd6GyYNeixKpM
         25eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130360; x=1770735160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=pGACLRwZQ1Qb/9ZLR1+jDC4GswiF+Fj20NxFlq+k5j+gte5lmy8drwzcKyhAYbIfSG
         /E/1mztZSRf4VSPCm1N2K1nw6lC06SQPduz0WsOhAzOxemr8QlimuB0RFRYtxLmCgJar
         Kwvw3aviEHmMajnrCQEHIWyxZ5K1z+n6d4v3tysxiI37Q6nVCHy6iZo4vDp/bq25+QoK
         +EDu07CHfTFe7wJdPFMGw+dJnYFcAysZLnp4/lVWkv9OkVEkwctE+Q5WhALnhmKNaifL
         xmQhoCZyM6n1F1+K8hiCyaLu1FvWW+4tP3v8OjXZq0mjvQb+8RKbQNisNJaIX5HMtaRN
         46Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWKqSifB9uE0t+KriBI35Kns6DrovICCVoIxobvReJFTsAI/UheywWAHHua4XyqdOb1LfC4GJGcIjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO3G0lds+o+c/YA8PC2oeW40P+8ru7ogKTMpYKKpwHrVgJ9fiF
	xZvmqg8hi1iy22mg7tw/JlgBjVTt7FZXZ/T85/ZjzAkA93VfTdjPwHd6g+3PBcV1
X-Gm-Gg: AZuq6aKKlW4+vTl3oQ1Uk5y2EBhKq3qPtxA0fSKxWyZyibjk+r9/8bRZ4vKN+V6OVoK
	7rVsqIVS8PB9LGj38JITn5FY/0Tt16xDLM0fPNIGi6jKTZFxFF06mzlIECmHALxPlDPHtR8Rj+g
	pCbIlLONPJAxAzBGEG7QxNZ5s1v7q2oWcdoSB5qfhham0jNxIdu38KNQDI7+xrawZenSooOTex6
	UoZyu3fqL8i6ZVocuoBYT1df9Icc3/Z417m99xe+8GBy2la3EgItQ7kH2JTJAe3qyjIgb1lDM2t
	bno0ZaSPAAG8YUR/QsYnGjCsiKbaw5ovsje9kau2hYwm3zcsgHXMXZ+mOYjqgEvysff/aCDn6BN
	heDcjN4CIvgrrFF8ST1GOTnp8Fj9fd+HSp7/FZBlWWDCCqw7XgsB0hzWCV9Ox67TrOPVf53wZGX
	bTcxGFmbTlKPPnMs4lyw==
X-Received: by 2002:a05:600c:4e12:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-482db481b62mr184164265e9.19.1770124252099;
        Tue, 03 Feb 2026 05:10:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:51 -0800 (PST)
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
Subject: [PATCH v2 00/10] Add Renesas RZ/G3L PINCONTROL support
Date: Tue,  3 Feb 2026 13:10:23 +0000
Message-ID: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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

The clock patches depend upon [1]
The dtsi/dts patches depend upon [2]
[1] https://lore.kernel.org/all/20260203110220.265748-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203123503.314755-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (10):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
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

