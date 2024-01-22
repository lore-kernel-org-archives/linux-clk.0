Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F3A3B18C
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921902; cv=none; b=rOAzIo22UGtm38WfaYmVZBiXmdeOgMMAFsa1hp4w+x3F7XNHhh2hEZZN4eY+yzZ1kCEy1cUpdRmybCW1E5INQ7pTqOBdZU+F+4M6KoexDXIrhCNfjP+h49mFn58PQ/wLUlxbJfTMCqxsq8iOIL+oml2oPdRgrPr1FcixPhPoKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921902; c=relaxed/simple;
	bh=UxyTRYJrjqQ5DKtv4x7xt8N6ofKWsaiz0ZFqC7P9iQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MRDERvDw89hmrt5dn0As/givSDOq/gUfMEQFPurc6fVw7mIsPnd5qALSA/o24m4rzWeaT7jvTeZM8FOb+uThWT1dWrgBU5ioT6yDfSCaVPvQ2MN4jnCJPrm2roT0aN+wxovgDjr0bogFsw7giu7q2lSM+NJPRVs8ZavOZq49b0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aqNLgk52; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aqNLgk52"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-559edcee47eso2504981a12.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921899; x=1706526699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=aqNLgk5275sDX48SHiN/znMn0nYhbuic4/hP5/FA/YaBtKuZ4/P3q/fT6ZwvhH1W65
         rfJTwX0UwvOl6iedQ2JoKWw+THqznadPcRevqKCXVp2sM6lLGAAgiAl4gsp2ieDWfSZ4
         OpsuDDBjks/qq8E/q+1NlJws5QX92jzKFhcMPfCUZVPulSXb/cSr8gMi8PhNyBBhFVXE
         gjWD+gEGkYqdsQjPPYn5sTRB9uxbc3hWF5AJoVGdhFYnPuSc2gfiC0w99HRzuDCrHCIJ
         oxqhSgZYK1ZT5IL+Ho68Si0XmB9tBjZYiv5txVqL3JttSqTAnjonY25tFEDDKxAFveeN
         LTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921899; x=1706526699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=sUVm4YWBD4gKSwBTk+26pLwrvaxrkeafTboAeHVSR5cHld7wpOt+XnyGSh0QEpbJnP
         WN0StNa0D8jqak6dYaFjssb1fbfe9QVXUBqqOS3dm1s0b93yEpD36hUk6MZtdoIv5XuR
         C8iEyQX5Zw0SeZmb3TYDzS9+vofQvVX6os838BStr/Unt+EKGwoo97uVvJBaCCJQO1on
         oTpSB8i4uPk/7p8c5VKKZjs+XN/SzNRAEF+/7BF2AEIDQtsL2XXxEOtARpOWTdFohuBz
         mV6GXt0bf7eMmj3cVJB0LfkhkANAhtp2Zx6k5M8/BcOImv0blhtecRZkbc11BF/V7i+W
         EOqg==
X-Gm-Message-State: AOJu0YxLqYfqC4Q0hrRsZG5DAdLK/dcOsXgXLs0btpvteEKjUuVYA0k8
	EOZyvWjmv8BvXHOuzbvlvP7I8aGDk8qzaetL0UU/uUX8N7oCNfDuzPoowIY9VXI=
X-Google-Smtp-Source: AGHT+IHTI3lS82Shzhgaq78IcSLYXJWf0bXqAjyhj0u6OR9ZSFyNceOlihdHtJoisQ6VBe9RQdQutw==
X-Received: by 2002:aa7:c618:0:b0:55a:8430:834d with SMTP id h24-20020aa7c618000000b0055a8430834dmr1650512edq.65.1705921898698;
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Mon, 22 Jan 2024 13:11:05 +0200
Message-Id: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/10 adds clock and reset support for watchdog
- patches 2-6/10 adds fixes and cleanup for the watchdog driver
- patch 7/10 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 8/10 documents the RZ/G3S support
- patches 9-10/10 add device tree support

It is expected that the clock and device tree support will go through
Geert's tree while the rest of the patches through the watchdog tree.

Thank you,
Claudiu Beznea

Claudiu Beznea (10):
  clk: renesas: r9a08g045: Add clock and reset support for watchdog
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
  arm64: dts: renesas: r9a08g045: Add watchdog node
  arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  14 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/watchdog/rzg2l_wdt.c                  | 100 ++++++++++--------
 5 files changed, 76 insertions(+), 47 deletions(-)

-- 
2.39.2

