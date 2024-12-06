Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F21DFDAE
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483637; cv=none; b=FvEdV5aHZV9YGVUmzOzWoCI9uNUzpJptQIR/3+D5upMykEV8aSjDZobRmGD6uRSpM1yAFtvcNAqYnwBikAf2QchGbHUQnzAt1eQtD2Fb1e65JMj0OjeIws3h41BxslL4vAMBa3XoeMPgpAHFbTY5zItY436rGE2V8J20kjgW+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483637; c=relaxed/simple;
	bh=dDR4+Q0bwup8XiwfT7f6n2a0gDrV0vi56ih3uackW5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=an9x/F+QZDBpc3hpxcsMWcYz4P670LO0O0bEAPtwfjhbiUlTo1r7RuFy7IKY2wzoQSY+WlZY0QEjtzRoftLi4OqQdk0IvaziThapk2kX1fREgIavwiny2D2YpIaGVk2vJ/B4TGksy8zgQzORSS+Y9GK+JXglOY5yFZp7mG1isTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dABlAaeK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dABlAaeK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so5368698a12.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483633; x=1734088433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNv2zbazDCZ/pWBKvIEuI2Pxd+zGHz/To3nXkUZrj8k=;
        b=dABlAaeKFe2g0SBgd2s1oTOHlV6y/JXrGEIbqbVZgAaFRA/WmSNy2FHxMFXD0d2eZi
         t3LxiM0jwHHLmkPXuKy+TXx2mUJwKTZO3Huj8sDlCaYIdrdYJxgKFXJkUKwweeGI3AvX
         yG4YsNZNLvdrdlrTl3oRu8FVcGLq8reUEZ0pAqRx/l0dOJLH+XFth/oE84/JkTkjNjE8
         +Ke9WjhkA0N4VfK6/2VV8aHJdPbq61+NEa5uGVYaDkgSHiyrmuL8fTa1sD0cR7pw2I1n
         lWEQzh5RdQlww6uhQxTk4JaqsA4tccmAAzVU+2rOQqT4ygsyJfx+Dm5P1MNCh22J5iaN
         o+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483633; x=1734088433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNv2zbazDCZ/pWBKvIEuI2Pxd+zGHz/To3nXkUZrj8k=;
        b=kAqSKB8Pllq2Bq4ASlIB9HOUBFC/tFkEwTn8UBlLObLIA8rj1r8jSie2aJV4QhYCi6
         /ptM/3GsA4jaR3pORyyFrszVG+LOoetPKYxrNvcHDumxlxBP0yXpeAF6sx6kZrvAeN4W
         7gH3Z39J7TYoTPAMgwNd4/2SrLUglRwlpwdvwDkHfxRWfhB6HJjia6xZifHhDZ+79dYM
         EJG6tjHZfNSdoFeVUIUJswX+uf6Kn05Hc3lcPfjxFpwS4Y+pxU61561dd1WmJY8KA8Gy
         HJBI2/RMI26KpOoh+l+Kk4EOjq3sqSCo7YZQvPjYEK+OBjFfX7hrUj86QsGC63AvJP9T
         F6uA==
X-Forwarded-Encrypted: i=1; AJvYcCUP2jgGSCvOJxJEDgUcMcxUk27eG0sSYvPy7scLvh2bwd80dCIwfeIP4eF7rMbb4I0FSi6V4FOEAc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrx4r5BzsZ5EW9zaV/9YltVtVGQ6LDJbR6UDuQ3bFBdtqGNKh
	TVpqln8n3x67AHDieHhugWFv6iI1jhBoLTTHVqOE6JspTF7mVRx64Ut7B8t35cI=
X-Gm-Gg: ASbGncsrjmjmkK30sFP/jztVIWG1J23vNp5jF0wlNIJkb4AgdSgjxpwYNzAsCJpuDzT
	FlMN2cjTFFrpVHaSA6UVtWMh7yTXIKuHRAixDKmld3VlSfMizxEt2nMgL1xN12LLCAuF1FogZpS
	sPdP/F7uYuRtT0B6JbgYHC1PMNEpIi/19eSEJtZGP0spTFSf01wQrdW/E1RZsV7ZWfc6GP461v+
	TFWppdk2VyxSf2QLe3Dhco3CWLGmZzL/44vXC7ES6md68TbQP7VwB7S5LcT1MlJOnFOYuNtClqJ
	E0LR
X-Google-Smtp-Source: AGHT+IHll3lGOqyFO812VEboDgJwa6/Nx08MKrC77gJO3Ig+etbaCZN0rl3zYI2kKOz7kmgwe+LwuQ==
X-Received: by 2002:a17:907:3a0f:b0:aa6:2b21:ab5b with SMTP id a640c23a62f3a-aa63739e4e9mr254496166b.12.1733483633411;
        Fri, 06 Dec 2024 03:13:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:13:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/15] iio: adc: rzg2l_adc: Add support for RZ/G3S
Date: Fri,  6 Dec 2024 13:13:22 +0200
Message-Id: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
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

This series adds ADC support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patch 01/15:		adds clocks, reset and power domain support
			for ADC
- patches 02-07/15:	cleanup patches to ease the addition of RZ/G3S
			support
- patches 08/15:	enables runtime PM autosuspend support
- patches 09-13/15:	add RZ/G3S support, including suspend-to-RAM
			functionality
- patches 14-15/15:	add device tree support

Merge strategy, if any:
- patch 01/15 can go through the Renesas tree
- patches 02-13/15 can go through the IIO tree
- patch 14-15/15 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v2:
- added patch "iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()"
  as requested in the review process
- addressed review comments
- collected tags
- each patch includes a detailed description of its changes


Claudiu Beznea (15):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the ADC IP
  iio: adc: rzg2l_adc: Convert dev_err() to dev_err_probe()
  iio: adc: rzg2l_adc: Use devres helpers to request pre-deasserted
    reset controls
  iio: adc: rzg2l_adc: Simplify the runtime PM code
  iio: adc: rzg2l_adc: Switch to RUNTIME_PM_OPS() and pm_ptr()
  iio: adc: rzg2l_adc: Use read_poll_timeout()
  iio: adc: rzg2l_adc: Simplify the locking scheme in
    rzg2l_adc_read_raw()
  iio: adc: rzg2l_adc: Enable runtime PM autosuspend support
  iio: adc: rzg2l_adc: Prepare for the addition of RZ/G3S support
  iio: adc: rzg2l_adc: Add support for channel 8
  iio: adc: rzg2l_adc: Add suspend/resume support
  dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3S SoC
  iio: adc: rzg2l_adc: Add support for Renesas RZ/G3S
  arm64: dts: renesas: r9a08g045: Add ADC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable ADC

 .../bindings/iio/adc/renesas,rzg2l-adc.yaml   |  37 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  53 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   7 +
 drivers/iio/adc/rzg2l_adc.c                   | 423 ++++++++++--------
 5 files changed, 316 insertions(+), 208 deletions(-)

-- 
2.39.2

