Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0662D77F1
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707094; cv=none; b=alAQbpKaf6zcv1+phDbe2g6eVbF3t/JmG4Ruyxr8BU5R7w24oTCLRa0mEjtqmRYmbtHaaLXAwNK5JD1QtSQIsdztyPHaQ83BgRsGSt0ikW0Jvx65f2Tytcr+H57Ldt49NyvJUoy0rL+xAqlRrDUTXAFfi+TNyQMAlRtTjgOuZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707094; c=relaxed/simple;
	bh=uNHbTldTgM5pqxwOKdBk8x8AHCvIBLnCk7TiJXDtqYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mr2EcxX7OncqgfBt/vzTm9GbaRZ/EvshFXpghBbo5rOLVR+eGRKupf9GcMyju0xfcOzv0Rx7WMqKT0xXigXndJ7+7TQR5NMFadZ3RpjT6NYuno2p1qDVBkRANAaS+nX8Lu4PfdzKDpmcgSxdAnJz9jB8Q0GmEVcv01gwD5QJ8HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krFXQDtg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krFXQDtg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46dfd711172so25239395e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758707087; x=1759311887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
        b=krFXQDtgAZG5jnbZZz3P/FP+fE33B354BvXGKiYozhv31VZGHxUyoSZbnH5ucQDpmz
         6b1uDINDLm+pTs4PezRYeLXSI21ZXw3qkVHxbIfJ8wCe18ZjC5bjxzfP7AJEHF33leh8
         TXafhIKZPYIeJN+hM0ksXSQIM2PIIyAk1gmFjezNwC8PkZ+UkUFxqpuGAcDAsYUvwBiW
         cIFirnU9TjrIrGB+i+KQGGgEJtVNmQWxKNSeUIX3lSYxv50mmJTe2ILDVHT6cX//R3SK
         ignh9t33vKOB1uuXr2QRt8W8DYrq70Ukne3WMXyU+/SK9PqIwpNOOEKirvB/840Er+8e
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758707087; x=1759311887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU7V00+zuQKk7Voi/XulM/d8ejeausZ1gHzc4r7h4R8=;
        b=u+fe1hJuzff1hVbfktv1YMIF5mwoc5VChz8HvGzQL85kt4CFP3YjMFjVmiVj5FZYWi
         cJmLObn++AY3ZzgTE2QvJKyw3hvlfDYWHkIfq1GODnojkZQUPWuaYmmNMyjDFoDugYr1
         4PeZz0AMU8wpo9eiLWlLzMUH7w79jgjcKcXas49cpn3zQuYot1Afvwrlh1dK2TjWawbf
         GCZA1k8yB3zdRAzYum6+apwvC5xfVA8w9yuRL/yC4SPTpY/Cq7nC191t+LGZOZrBr8gA
         fJ2JWQQj8sNlmN+NCJA1wqkhBYAveRq20DzakV2cvxsDr7GdyveiVtNXccVN8xeVO2bQ
         NoPg==
X-Gm-Message-State: AOJu0YxNAUPybNCe5FY1KFIoQo0wwWktejUMNBAFImSCrKUmXa2SLZQh
	RFoYVVIH7FcXalIKR5pgHDoNOGFr3YxllSgYIfmrYRZxN8hZ4/XFDtgWdY8mJA==
X-Gm-Gg: ASbGnct8OAQl8MV0S6E72Wm1OiaWJZpWjC7U01xWtlO/XczOD3ILk42TlFhXyyiqtMZ
	3R2cdk2UkZ3xQHa3Bo9D+AjDpT8/Ini2NT8nebi5DeuJB8kPby0OB/NY5E5DVl00zRPqWb9ir9X
	xXhviBgiMngMXFgydsnoj5QaMIk2iEzgxVNwvhNUfTrKr5dKabJPC7+e/wPvOr40cL8bSsAx0Wu
	MCngIsQANEsRY6E5TywJRSpSQhw4QhdyMADcZFbLR1jWwCIbcUz3NDOIsYxgPNNTUOW7O8UZSTQ
	8AeoO8b3a5/P+48ulbvm6ddQu3xCRj+w7lLvNCHOngMYn7e22UfwwSa3JEFteSOXWbLKr6BtNcW
	y0UgAMbWuswhq7CpVDQwhJvOQxCeacOT5W8847zvnbU6slcSSKajRwpZSbpH4U0+CD684dLpn5Q
	1VD0b/dFViE6MXhw==
X-Google-Smtp-Source: AGHT+IFpHasan3pFJOdP5ZGB5ynPDa66E5OeJLF7PLwNIJrHXHfWU8ia57w+wOsWZehdESEd0RRK+Q==
X-Received: by 2002:a05:6000:208a:b0:3ea:6680:8fcd with SMTP id ffacd0b85a97d-405c49a250fmr4780811f8f.13.1758707087081;
        Wed, 24 Sep 2025 02:44:47 -0700 (PDT)
Received: from localhost (2a02-8440-7503-805b-0076-f865-8f03-23d3.rev.sfr.net. [2a02:8440:7503:805b:76:f865:8f03:23d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a9ac55esm28446145e9.6.2025.09.24.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:44:46 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v8 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Wed, 24 Sep 2025 11:44:41 +0200
Message-Id: <20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIm902gC/2WP0Y6CMBBFf4XM83bTFiiFJ//D+DC0M9oERFtk1
 xj+3SoPa7KP9yZz5twHJIqBEnTFAyItIYXpnIP9KsCd8HwkEXzOoKWuZauM6CsRnRO3S5oj4Sg
 sWsIS2aD0kK8ukTj8von7w5YjXW8ZPG8l9JhIuGkcw9wVsiHdoFembFtk501b9pSfKdVLz0imJ
 GlUzfAp1BWfOhwi/eAw/Dl5Jltbi1qx7ZYGXh6nkOYp3t9Dc/US2SBa/9u0NEIK7dlVJJXlSu6
 OI4bhO0vDYV3XJzN1wsI2AQAA
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4

The STM32MP25 RCC peripheral as an access controller is allowed to know
whether the clocks are secured or not.
The STM32MP25 RCC peripheral knows about the clock secure configuration
of all non RIF-aware peripheral.
In parallel all the RIF-aware peripheral configuration information
are known by the RIFSC peripheral which is already an access
controller.

Changes in v8:
- Use uppercase for peripheral name in commit message
- Add the '#access-controller-cells' property to the RCC in
  stm32mp231.dtsi
- Link to v7: https://lore.kernel.org/r/20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com

The v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (3):
      dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set RCC as an access-controller

 .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  1 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
 drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
 4 files changed, 48 insertions(+), 1 deletion(-)
---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v7
prerequisite-patch-id: 1ead960f405c7a2dcc9111acd0bb4c95ed33954f

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>

