Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9579533BBB8
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684899; cv=none; b=AIkchEzxdZuDmYa3Q5lyloHPaiDy2Ke2iqzPYLIpWP3K9x9LFwR+vwmclrnajGf+TQ/vaZbleZ3sXh5i0fB1g8HIAmJAdDSwPyZqEACD3apj8FFw2M/ekZ1/FQ6XH1RFrkr/adGBRRgiaNSMQEGYZM+y4i8KkitSY3im/0rLtvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684899; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pBWgPfa7vIMTu9iIL2MVhheAWxa7DICYMm/kJBYr52OTC42rgRLOurMcfKZsc7EBlmV4ytJIvm9Koz9JF1kKu8LmGbjJwYsWCY0Jkc1PT5m+0KrUBv3g0+7cv2WSb574zbeLt+hjMy22Kqx9vbxkQWFPOxlWcE+OUYDyejvUleg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAfUAw0J; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAfUAw0J"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso1192198e87.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769684896; x=1770289696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=XAfUAw0J1bOXTYg8Ozok1ioLopSKIxaYzjmerw0bGJGDmNkT4xuJTTtD80UCvONbn4
         5es6370IXxYYedgBNtJjXq9Fh2XxXXfJxHLKPgsHRURaQaY4w8JB18tzX2CzQZMA+HRx
         Qqfz4X/L2kePzkIaclL2lrSSah/Q+PpQRQUJ80Eq0qpMURsOp8JP1wxmWMaOoU9yJ3Iz
         VozT4PpYIQNJC4IXMkNYgS1N4xgHgSKfnqvA7ZduI7CilfrUY8M3Whv5oh9BZLX/ZRIR
         TA9gibVc0Hx9yQx/yTYaCMVparRiDmJpWC+gwzQAPTEfFQc35OfHJaoB1QxUZq29uQZD
         0SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684896; x=1770289696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=KCOqbGCMVbQ+IkxxfgBv8U8qnE2cxletkq4Mv5B20ZWtXsIKxcCRjnre/5JQ/jLCB/
         3uMsZt6CyoVQKjNoOspNuRYtrTo+YvKMEQXB18gXahyTJ/3PgPGqgggshs3IWpKPQGDf
         aIeMH+gSM8qWnTD2XyW6fEeY3R+FuH9Uv96KJmrqbg/vDpLO7wOHSyY0lcOEJp8IH0u9
         Pk4nW5tMtZR6Pe94jHuPBV0Gy75sp29cVYMyFNQUgkEJybB5MbglAow/5yAFMirbcprY
         wWOaXEnKWv9egVc+MPnwFBBcSQqRcHMX0w54kMde7fyn0VthVLqjVjNi6eI6nfstmGhd
         qbyA==
X-Forwarded-Encrypted: i=1; AJvYcCXyj5t3/e84SO/Z9qNjvKb9CvSDkEaNXrEKWrhAa8Nttk0+3rkWUIPZG6sl6Mr0yMJmsnW0kxsR7ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPXFh+NfpndBcYmerIRZOuNPmFzCiVy9mik9tCcMtc+bteSyfE
	62o1cC4SSKQE6/noWysDjuxx+BjgeEM+Utqf8q9lefs8ipThisrb3E1TxzeD5g==
X-Gm-Gg: AZuq6aI2CvbXpCsp6dloZVxSGh2lpKwVyzjyGDO9Gd8lPmhfxs0iZcTgxGWBhXdJ3sM
	bS6ECMMo1j4CYZT/A0sbQCWZ0ltqj3ypuXuSurabfqx3bmw5NxdShpnDu1yUtYIhR+HLl84o1zk
	dQXeSnJ/4/Kj3qqLO2TnXy9EKoUJJmEYFIzXVuj8OQOgHfgxqcn3rvgO+znsL2bYz3jNkjUCZsQ
	XBZFkR4gu7uDrwl2v2PSuh0CyPFkPcQNXkvzmHZXLJ5m6AiWTaQZhO4gWiK5IuRLHWXSb6OhIR1
	5OceYzf8uZh7iSDNju73gf9wbKeCcxUTejsONmjQZGGwqpd5goMOtzNtpgHGxUolugYgw12ygjx
	0ZNtViCdPiBT8Var4WXr68CsewvjjQwJvG4Jrqpn9wVa2DKBo9GXKQkWysembRNP0xWlZr5Tdx9
	LyXQKpo3LJ8AzFXlVj
X-Received: by 2002:a05:600c:4689:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-48069c5bd29mr110958455e9.22.1769677870614;
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:10:51 +0000
Message-ID: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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

