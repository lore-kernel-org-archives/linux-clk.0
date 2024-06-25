Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C5152780
	for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317663; cv=none; b=WF2Cu8Ns0l1/2sUlsjOCPuO6kZcN65+S/40QH0l5RnN791s9ytDxUCK6O6ZM5fU429pu1l0JXGOmDkkpQ3HNA7kur+pFfiK69QA8xIqO9pSgRSuZCTpqcV+RYwAsUhKwK1iiMO6MjWJeZg041obrpwxYsMrKIll59BE3ZJ3hB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317663; c=relaxed/simple;
	bh=idPQeyWspSOYK9aQfE5d70UuHZFrItY0K6EWba5EaLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aQ2XdJZxmRg8H1rMsEpR6NdjB/IEWC7FZXTSFDR7BY3TRC9wkszT9TtMEoQtAxSF4IzJlIg0HFXKQJx9hRsy6vlqlGiXkKimOGZHn4VD/XHdVfSxWDJlZ2ZvwZvu5xjw3vV9mFgvKezAeeGIGWQu/fOlpw0waaye+7fiYf4cLkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PSeuY2kT; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PSeuY2kT"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso61810851fa.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 05:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719317660; x=1719922460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=giiYhFtEnxQIqEEkjgAn3jwXftBpviVw0I+kAsd6PJM=;
        b=PSeuY2kTkVd/DGhrUKY1dxEN1fn7hWeI3FA0u5V/a8q1oVAgC6onFgHS1bzOS3c02o
         5388vhfouSwYpj67sNmhud99ga0iWIhbadN1BtLtZYu5/kBv9tqhBjQRcvJFElp1g9g9
         6aP4YtH1rSIYD8JlY8SM7Hf3QNNz4CgHdO8Y6yp2vonyVLi+G4TLUrRPHlQ9H7ZNtYl0
         mibi1rqc7ssUV7Aon4HcvCWKaDYWC4ad05EAcGSzh1SOJHSqkUSgmvp72uO7FMMTc4Nd
         kvXnPFy4pHzqjUT0z9eG3BHXfOqEbHJWiuKXcv5EjtPBr5PgmgKe3m4ZvdwF7nX7ID+6
         6ssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719317660; x=1719922460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giiYhFtEnxQIqEEkjgAn3jwXftBpviVw0I+kAsd6PJM=;
        b=J3usv6uyM/ioRS7u8rFxFzA8SZuDOuEdo7+pMdWmmvMZt055o/0vG/v7iAVMcdVjfA
         xMOFsiCKcytN60tVMM40odwdadwTcc8D3zWvHyZZw/OVR+DzroWffV8TYnlQGsUSEITS
         KSE4DgmFCAYUxGz9zxIM72n0M0OB0GddoP5du9LaGFQKxRJk2y4H0I4zkF4W1me5ub66
         9I7h1Oo3AFhhDd46TjEv8dSd79KHtnOrDwRXoOu3m70F/wfO7LVLNIqLEy+Xvu3kOtX2
         gw1n7ty0t74R2B7FHYAeSooOUwlq/2wQoW1LQNjsdHcjE8z2MpGkUV1EqQS8uPsVNoIU
         SU4g==
X-Forwarded-Encrypted: i=1; AJvYcCU+IjsRgS45zBF/Kj/lqZ1mX/uJW0sL7lXqtMRRLtPeg13eqyFPdSmjMX6KhGHrXu5PuZnR97Hmf8AVD5NLaRAFysadnZpMuTAz
X-Gm-Message-State: AOJu0YwoKpPEq1788EHwx0sbak4pl9Hg5M4w4ZQD5/I7jSb03S1pNHBF
	01EzdqqB5t4MfM3jw+TFdjk6YJnQiQYmC5lgpXLJaSOHNsLD+LSupY4R4J6MXYk=
X-Google-Smtp-Source: AGHT+IF3Xj+dQee669e9P0ubfqBuwtjyt2JBWssz1nxN7eVQYZNX6hX5GHpL4DDBTEv9QR0Ta0Bg6w==
X-Received: by 2002:a2e:8513:0:b0:2ec:3ca1:e53e with SMTP id 38308e7fff4ca-2ec595876damr44742311fa.51.1719317659791;
        Tue, 25 Jun 2024 05:14:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b32sm12798437f8f.92.2024.06.25.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:14:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/12] i2c: riic: Add support for Renesas RZ/G3S
Date: Tue, 25 Jun 2024 15:13:46 +0300
Message-Id: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds I2C support for the Renesas RZ/G3S SoC.

Series is split as follows:
- patch 01/12      - add clock, reset and PM domain support
- patch 02-03/12   - add some cleanups on RIIC driver
- patch 05/12      - enable runtime autosuspend support on the RIIC driver
- patch 06/12      - add suspend to RAM support on the RIIC driver
- patch 07/12      - prepares for the addition of fast mode plus
- patch 08/12      - updates the I2C documentation for the RZ/G3S SoC
- patch 09/12      - add fast mode plus support on the RIIC driver
- patches 10-12/12 - device tree support

Thank you,
Claudiu Beznea

Changes in v2:
- change the i2c clock names to match the documentation
- update commit description for patch "i2c: riic: Use temporary
  variable for struct device"
- addressed review comments
- dropped renesas,riic-no-fast-mode-plus DT property and associated code

Claudiu Beznea (12):
  clk: renesas: r9a08g045: Add clock, reset and power domain support for
    I2C
  i2c: riic: Use temporary variable for struct device
  i2c: riic: Call pm_runtime_get_sync() when need to access registers
  i2c: riic: Use pm_runtime_resume_and_get()
  i2c: riic: Enable runtime PM autosuspend support
  i2c: riic: Add suspend/resume support
  i2c: riic: Define individual arrays to describe the register offsets
  dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
  i2c: riic: Add support for fast mode plus
  arm64: dts: renesas: r9a08g045: Add I2C nodes
  arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
  arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

 .../devicetree/bindings/i2c/renesas,riic.yaml |   4 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  88 +++++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   7 +
 drivers/clk/renesas/r9a08g045-cpg.c           |  20 ++
 drivers/i2c/busses/i2c-riic.c                 | 237 ++++++++++++------
 6 files changed, 289 insertions(+), 72 deletions(-)

-- 
2.39.2

