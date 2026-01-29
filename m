Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379A26CE39
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686832; cv=none; b=ow2Lyp64wXVcFjZhOeEDWpWrAsAPFHojQmLdw3ISUv5mJK9kjOBNKjCryAtlnbdZpv16iIYjuAA+O5vWvbjPpUILGj6Oo9VzeODsgPah4hUSTXlnjTwjfm8rVRuMfH9fzFpPk7xOChERkXm+99H+k2IRwTYLv3XYKnOBPDFc+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686832; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCLeypHkVGAx2d4xJxQKWt41crC0luEnOii1pzl+pL+GbGE32UKcJrjhFEsJabkJoMMPaCfGr/79i5wd2IZfEXosuZ8Hp47FZYdmlWoGaQa6Qiwja02Ec2grkqotGch944rd1/qYq0r8Ife9jUj1pC/hBpJMW3KLbq3DfzHfBnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P95th2NT; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P95th2NT"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-385c6c727fcso8306811fa.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686829; x=1770291629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=P95th2NTMNC8vCRDY34Diw4/GoTyg10SlKZa3+OBoxl8Eu9y7lzX/Jq6Wr0utC7zFL
         xRi8NQemzIXAPqgZMXpsLvuNMGbrXn93YjLkZIIM6+bjtz22kz8EQz/+5jyO0uiWfD4e
         Cpq5jfMO10LXIHWnHTmXGiTIRpPYOOc/+ldPVg4oZj9hPk5OIJEYIQihPG0/wTK4gfxs
         pDaBoLkqUvzjz5fvsMgV4PUIC3rCV//xAcqLgV4mc5r4NU/qriDyreo9ks27fkDhHRyg
         d5BHTFNYGguehC8iODEbeIk6s7Avngtx2ogmBgTGUSOW+becinq5ffhc5XHuMXryiSQ2
         rWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686829; x=1770291629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=wNNFEOah+3ZRFe2fP2Q7swUq6UIu38bwYiIUnBctOVwhBseO5MEqGp46DS3+lKhLJA
         ZEJDPtyvrxE5lOiaKsL2lt3I0ImPNWQB435BF8MtzVMIFukyMe8cst/RE5xX64Ii5Hk+
         HjyKizCK5q5KhqXpwuMG3lj4mAtvEvkGY8l6nQCv5f9XB7PeelckrxHDZiDwnr2+2Rkr
         4a43iNKeu4L9HKvjY7Vwo1EH2e1uk+Kw3sRujRv2Y0E8uloMz1qxeCSct4uh83U+6GPw
         YWK7Tj1hRSEhe79Hs4R6uCyfxYF3Tb0NuEj0RSyt0Ct6V44XumxQmkF5DVex/InqnZ7V
         yELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLsztrQLzby/6E43XKZRQN5GYA8qHbaFLpTM3u8lhT72pCsBqwlDqJ4/+VMt5qhjoEzYNUVSCHQ7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqfledsk6p9/tR1Egy0XoBtwINS8fjjaHycfZXzlA3AlO+ojLP
	n7RqYGj/C93/DW4eApgw+ZXh8ay5nNtzJcZWhSa6tGun7EGxY8hGMw913jjeew==
X-Gm-Gg: AZuq6aJxxOCi7WlKEDciEG25pvOIsThFF7ROYV0Q9RM3f7Tkf23N0eVS1CQhlTAAAkV
	6rp1uMv73pYFCbYGZzy3zLHk35qttxfqgPDCayOAO8QiUhKwl/Q+8gkb2gLpKtG7luV/FH43z0f
	yYIi4Ze2yd29q0AFahG1hDGrewZb8o5Y4zQdNZybc+wqi4SlXhHG+x/k5mGoRL26wY8MpR9JQ19
	Piguc6WTKMOOyjebhCj8X6+zAvFHVyAQckdH9IJVp1HvKdTgd+tRogJsK+hpTMKh4YkY0Psto9u
	ukgD1PDldARHRE0ddnoXh9TRNJlGP7IOlaHNI3c4g09RY4ZuEZDSAieo0wohFTAuZHBf5ZW2l0P
	PqhipgFCxR8zZmLKF4H/LRmo0vEPaUpvTSllbCVIZh0R23yXTzVkYd5zIx14mW+ZG2jAxRcjebH
	DZAZMfLbcNijcynMzu
X-Received: by 2002:a05:6000:428a:b0:435:91b6:f53 with SMTP id ffacd0b85a97d-435dd02450fmr10964058f8f.8.1769680573611;
        Thu, 29 Jan 2026 01:56:13 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm13285141f8f.36.2026.01.29.01.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:56:13 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:56:09 +0000
Message-ID: <20260129095611.95622-1-biju.das.jz@bp.renesas.com>
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

