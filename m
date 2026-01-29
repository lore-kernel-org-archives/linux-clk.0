Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE662C11CB
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685332; cv=none; b=GfwRuLBg7wgCwAxkqHHJIHRf+V/7T2yWQOPZMakKLzxcwyUc0YcMIDb/4fMmoea8JjS/knkEJyh8/+7fxguUG84/fsSgYuTstrNr6zENCHdzoubLW6RwdOqwE5aJZIvJiX9S1onZgeCT/cdxD3yUckZOTcUn0diPlHMEBHgC8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685332; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h48kBohtsPfVBGvUiNTprxLbMqhHr6cba8TJL6PaJfZj4onL+V7dOAsusAN29KWKpsX4mmxgQUOJDvIpaP308+Qm6xNwMVaNgIYt+pJAm+OtXrNI1Ruwt2KEBERsHTmCQbsc7xp1sVxjxCeK/i4D0a6WwOYdntSg/Z9YmbMSU4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ+m+/xE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ+m+/xE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso1534834a12.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685329; x=1770290129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=lQ+m+/xEjLhWH6CN72W4T8Bb9jopVXSSQ3kOJgGhELKzOmi0+nrIDnafLyMKoJBJco
         ida7ImM2zuBQFls1Xq7lgtW4vfYE83D0xLOPO5Nf5JGFBrfH+XH4KAFiG00vG6wKFH1O
         Rf/YqGkDWIxTMzRo6g2FCdVosd6jkuM2/UGi7v40687F8BVaOu7umbbU1aE8uZdHrV4L
         aGgo/AO1veW9OQr9EHtvt+s8uNXPq/IgjT/GBiRNGZS7AMrInNdjSOQU68MjP10xvrdx
         fQ+s26SwT7PmYI8CzBcdkWwaKponmLDK/fL1RQ24GDbWtr6rW6rNffqKyh0W5zyMS9sm
         fdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685329; x=1770290129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=q21QnerYHo7IrcrfdtyabvlWnhbUDqLcdzqh9lnb4DMUsdOCrAW+e/6auOURX6Bpok
         VPI4n/+k+h/QnQsN7Q6vIifAMmt12Ny/7YGNrnxJjXFCmOXsB7fBQwBZvN2VZ34EsVi5
         DEaFCplEpr3scWGoGN2URN6ZvDP+bpjtFa6mHXpEzHui+kTZbtNbhhj7b+MESD//gKF0
         0MH4nbXnctzpZu7BfPfgpCUF9anR0nzuG6TYIiiwIHudjSz2rt21jS6YI5UpG8xpYkqm
         VthK2BItUbj/4OCAHV72xf8wqJ4veZt2nWYMrdjR044jDm1qj/ibOuUAWzY1qvKBoL0/
         cBtg==
X-Forwarded-Encrypted: i=1; AJvYcCWJA+vr17iXmxoUHNhEXg32i+xIkf8NtrGPre7/PzP9bBdnCYMX35qyJF2SrFILEivgYghJLu2uzy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UGA2cqoxUbI0GRvKpuASnDExwlAbkLaZv1F652AvQPV3pTCO
	vG7GAywxkQ2cMyybj/v5zIv/iCno36irbtsK4aKo7IsK3SJ+nkkqJlKQ
X-Gm-Gg: AZuq6aJH/VEDws1yedAf/QwzN1soBUIuLYYGN3+CCd1DwFjbUIsV1f8QrW7yT9X/Rff
	20rFvanK5dzV2Dqjt4QvjhkpvEjG0wWuNiba9Y98wpmTWovdDEHQwNMVowH4/lZK+5mDD7wNEJ/
	6wtSoTebwGUNeKgneo9M72UUjsMaIg77RMPkJwuRnlF9DRl6x3bvwIgvhe9xYoSCmLIiIxjqXty
	G7IGGGCwkVF4lVaVHo8tBuZYnV9RWBK9RhTokbnrnOZuj7J5K11NPIfjeQPYVBRvEa6nivoHH6x
	n/b5zl9C2ux8qH8xh9zNYl72Y4hJ+qbEuFGNxugClK89RHPf62mYwhLn0wrQSN4guuDvG+wR/fK
	hF23vJh+fursIFSlUpmwlo2wi5pcZGMivgwO99VvRV1irOav0EN9E1EIBRASBhxcxBWXiOufcZs
	46aFLdSH2uPLiHC+QK
X-Received: by 2002:a05:600c:8b61:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-48069babf02mr104749815e9.0.1769678490897;
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm13999753f8f.22.2026.01.29.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:21:24 +0000
Message-ID: <20260129092127.95378-1-biju.das.jz@bp.renesas.com>
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

