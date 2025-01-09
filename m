Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614A18785B
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457557; cv=none; b=hHyyIKRkwRxWhzeaSGE/Bb/+Q8eRp6P5qIkVsLOMYLfiYssZ4RzXI2CuL2tK0/WyEo0UH3z0NuUR52+RmLtzXWM4NOYAnjmlRdS4StxtU7nGTKybDnOGvd4tdyhqJy1Bbgn2nT6ndusBrrOJ+aEW4VrYqZHyjkpJwTBdvrLznOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457557; c=relaxed/simple;
	bh=4kR3KOquOvIAUcDgyxq24Py1Sqt5uauPaJ1AzQww15w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZzfRpXg6CoOza+AlPXG3A00ReXqcVOZJXpdgLW+WjACiPPZKJHhc1+wpUioYfgxpF7pBXdmevGVkyTUK37fSlkKQW4EhFqnKgioHld0bBFeHGoknBrFDry2QIHCQkbff2Md2UiNGYFJ9A/wojBGWTnvVT3YrwHBAEuauu77qHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZjAGvlaL; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZjAGvlaL"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d437235769so2058080a12.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 13:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457554; x=1737062354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
        b=ZjAGvlaLGRdpfiEJs2KF8uBNysFg2ZUrXbw702sYku9/4MQZz6F7S4UiFRQ+7mBQAa
         1RFBwqLa+VSsjZva+j3PK1GHfVwn5TIrp0xy6smsAlsDAVqolXtl7L41hTVzOQv+N7fI
         kLvQLW6Jkn865rsA3ul6w36kZNp6pu5wnoJSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457554; x=1737062354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
        b=tooI4fZ1QnBz7uFH9yoiqUxD+mEVXqOmq8SkzrvTC1DRjNfDD/XQsy8ZGv44l3D/q4
         4SwUqF7R26XAvILK8SlqGDw/8CVYg0W47MxJVuwG2+fQI6+dK3XZL6uDMqdK+GctKmQU
         Lm095yo2a+B7s5B2kxhnHzvHTCaLxcOSnY1f+i+4fet6eFd3v/lpAM0S6J4HEC6DDkdY
         Z9eb9ZYClkGL2G3vrJJpLsC/gg6C7Gx/xkkNUALJNT+lahrSzXLUcSv1dhIAMIruQCec
         ZSkRbjshEEZuxsTC2r5xgkivnT8ZrGS/mjDXNmxIPAH5ZbAEwDh2WmmhOHhMxjZ3sm2J
         qx9A==
X-Forwarded-Encrypted: i=1; AJvYcCXG+GF8s8CRX8NLPUyWQh8V5yOjX3cj/7/0iNdAmF4kn81wzPc4HxOBpDj6Vf8+k/5bB4a4JocXE0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAoHDzLh+vePWGz+mvGY10ll99/SmYwEX1/E8YSArJaihM4vJ7
	kXYffJnd9FQUQUmVxoX4VBAJ2JW7BBTna4Uyw2EPftMt9aiw39j1Lv/K/7TAI0U=
X-Gm-Gg: ASbGncsF28qTJFyrH7aXxYBcy5OISJrNu/JqSemqys2UfH6bBjNan1wVzLVcLwiDoJH
	wIzQtKxMyjW+ClhxOKr1tN6asvHPLvSv3n9E1tNo/oAQP2pYgt6Cpi3T4V8kWXVrlbF3Q+AQ/z2
	78rsOezJA0SFb+ELcO+/iVGC4oHpMjMCXnOdGIEi0BXmqYYSjcQBLbj0zk8c50H2tkoisyMk/g2
	xg+LhEb4ZVu5+ARd54REMKfADgy+D+PzVHqKoE3sGEvDlAnSxV2d3rIOxlSNAfbDrhspyh3GKtT
	HftkAqMfgDqSiMoENOdrwIPG0vt4X9kTmNPkSH7EUWgXkILs8Ysf1cmO83XYYogoqUEG+cFnFK+
	EO+gY9gqYC1pxgXFM5Q==
X-Google-Smtp-Source: AGHT+IGDVisAyEQwSigpcUtiYjGMdYnHM9AmzlwjHAKTXZuLBmm721gRf+PfVKaw25o+OkloXI5uXA==
X-Received: by 2002:a05:6402:430c:b0:5d3:e45d:ba7c with SMTP id 4fb4d7f45d1cf-5d972e7148bmr6635147a12.29.1736457553855;
        Thu, 09 Jan 2025 13:19:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Thu,  9 Jan 2025 22:18:27 +0100
Message-ID: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of `st,stm32-rcc.txt` according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

Dario Binacchi (4):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 ----------------
 .../bindings/clock/st,stm32-rcc.yaml          | 147 +++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 298 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0

