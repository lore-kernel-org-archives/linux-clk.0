Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D76204F8B
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770752014; cv=none; b=ORf2+qayo7x36c29Ao17UKKOqoaDSF9lZB+VwflKgwXIPq29vmZLp4qHWOb6nA44tlmDExFofIxyWRu9U1cpVcA63Yay9vt9pxadeqtazM85BHYSHnABTr/iOOThAr/tjKq8rjX30J4qBhtxi4Uoypx2pNKnXn2SuB6ybEl7oRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770752014; c=relaxed/simple;
	bh=IykiMd2uZZOX44SXwVXRT6KB2qguUas2yNtgMqjletA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KCvUNeigWIsu2Ya+wEVDwFDbzIoEqO6mZR+oslIpwP8MZdp1BqA9ofzFBb2vc5OXG1pct/XGhxY3GQ5uqrzYKLlozZ57fXGDocozqh87EwF4xvENR8k/1CPAjYPq2yzw+uWhaEuF4+Um8Z3AsYHoC0KWcXNW6dUqcDWAYdEjFUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk09pqbM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk09pqbM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436317c80f7so101208f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770752010; x=1771356810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
        b=Wk09pqbMcfRZCpdChrelCQQEQjYQWbEmzuX/zD58jsbgYP8mImXezw+ulU32e2dyei
         xyB6MCaN5A0Rn+8OLpLzzsITtRrTdC4oc89SeJig58WZkcldXpf8ff0XbBadVn6cIlGD
         CgvzY84hLiADNuMManHQTZK9iTK7H/6dTBV2zZylsD1BRHusRJIxysSpV3yGydmjy2A0
         AurjJvR8uIUSyxT73S6WWzgvyIIFPyuPZFkHwnf8fQ48klgEWsASqqTVc37sV8Cy/EqF
         l1e6UoLlXxXRj/7ky5CUBzToRZIjx17nhiMkjgrn3+o6zau9Z15fl1nl1z7kP73g7dbi
         xb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770752010; x=1771356810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
        b=d9ys/R83fva1tl5mtdiyagtgGWvjyTadHN+On97HEl8C1CN/4GtAGg+mu6Bs7yY0gw
         SoYoSP6o5khB6Ra9mHE83o6PiTwgKQS+hV22qat4SE3LRXpehxwp2a7I8KkksRRU5+TI
         7wsFX7gGiLCP4pYvRctfI37AtqVfAPXDMHf4vxtvS5dB3+RZ5nNkYQdASwZeBZWdyVsE
         /lQEjQ+r6C7g4krM6EBZBI5hUSSwLVMf69Ga+a+p4zuWLH+cwJVZQQNPv0EUggEisk3N
         FOIp0gq73VYnesMKZrQOn4rET8KDafvnhetqHdO87B9kLHa9EGJBn36d7+0/+Z3QDLQS
         zHzQ==
X-Gm-Message-State: AOJu0Yw0bZLB7xFF5o2ThCaDKErYq6dnH3ZfJTsH9TWOls3enCxgAoWB
	3itno8QIksflpIRvE+X1RrZSDt5cGMrwOuSDENTO/d9D+a8udVOyZrVa
X-Gm-Gg: AZuq6aLhx4t89Sa1yvUaYrpR+VgIC2KuEX0sSRuCqU17ahEfM91OkitIXOiJhfRm6Xc
	Ac61OcBIuJM6GH2gVZDi4gQAh6CsY1rniBrb3fTw1P/maxg/upbsmU34Ill7I9gLw8GDwqYmG0A
	cdRdImWi6shxxyj1NWdfB6h3IOpsgSFyOnF2g9Jxt5DJSF+SI2TxhfIgIAs0NUduhG5j9RZ2E9m
	SgxAErG/Z5yeV9JrBoawWslXC56K+cY+pY2W180f9g+L3VtxD/oRHeiZ2IWSI4vxwIM4MlYykNk
	0M9lGdlDbY2qF7EDoDJiVOlz/JyTG2b8lE5yaszRKLury97t3wm46SYq7dQh6nFEsRaafuQFKTt
	rJROSQa28yVM6DDCN6dmmHJGI/7hdv7Ew9gsH0MCYPoutN9c5HntU9k8sfihw+PwVd0AOm9aMp5
	FqvlZy5e2MacLg7tsvl1i1iqkWmMnDJddi5cqO3z1J6JxwcTGL
X-Received: by 2002:a05:6000:1847:b0:435:8dd5:ad4f with SMTP id ffacd0b85a97d-43779e433b6mr5594134f8f.9.1770752010474;
        Tue, 10 Feb 2026 11:33:30 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc26sm34029966f8f.22.2026.02.10.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:33:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v9 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Tue, 10 Feb 2026 20:32:51 +0100
Message-Id: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WPQW7DIBBFr2KxLhVgwGOveo+qiwGGBCmOU3DcV
 pHvXmovainLP9J7evNghXKiwobmwTItqaTpWkf/0jB/xuuJeAp1MyWUEb203Gmevef3W5kz4cg
 BgbDFaFEEVqlbppi+N+P7x74zfd6reN6PzGEh7qdxTPPQCBM7gh5d37XSWBMAraLWmSDJK2E1G
 CInHDsGDc0xJ6ZMX3i5/DeFSGAAUMkIwwLsr+Ocyjzln+3RpdtCdolSTz8tHRdcheg1CQlRi7f
 TiOnyWqM3V1UeeP3MQ+Vdq4K2sZPYwpFf1/UXYDjcDnYBAAA=
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
X-Mailer: b4 0.15-dev-47773

The STM32MP25 RCC peripheral as an access controller is allowed to know
whether the clocks are secured or not.
The STM32MP25 RCC peripheral knows about the clock secure configuration
of all non RIF-aware peripheral.
In parallel all the RIF-aware peripheral configuration information
are known by the RIFSC peripheral which is already an access
controller.

Changes in v9:
- Rebase on v6.19.0
- Add Gabriel Fernandez's Reviewed-by
- Link to v8: https://lore.kernel.org/r/20250924-b4-rcc-upstream-v8-0-b32d46f71a38@gmail.com

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
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v8
prerequisite-patch-id: e4a708d9c6df5725c9598fbd2169636e4e7dc46b

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>

