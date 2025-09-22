Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD502D7813
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528753; cv=none; b=Siruc4a+frkhwJKrYvuOZB1cQ8Dwg07hIwUxL6SGE6WcsfHl6nxBpSjnCn8jmMSw+SRZzmfQE7Cfeh99IBkTHvYzbBJkBMtthwqPFq6d0+1dpLKXFmFy0SUTkUaSk5+UsqSo1kZwMvg9vYvNaw+8YtrDpjnXKAnQS58Mr/D1PKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528753; c=relaxed/simple;
	bh=kJcnOSQAe5fWK1CCfABptkPbTgi9ddHWv8+d/EVmRNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sG7+yYQAfTIf4oy/ar0FAOfcYxJQCpEEqczMhtcYi4rFr6aAsVWe69YQBSj2+hg4cPj5xYK6EEWwgoxYLOcF2KQftY61AkDA8QkMig2hH2xnUYVxGdRTXDkFRPZtcf2PYuQZkpRfwDj/e6GnZC5ojEKVWJzEDJ3pzlSLjn2lKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo3vZNXv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo3vZNXv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so39228135e9.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758528750; x=1759133550; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
        b=mo3vZNXvdr9IpM4vgj5pz4AbR3ECNnC5f7RAo1JYrzwCEtR+Kt+SA3QZZ1FEXSt1T8
         DWFpPCK4Js8wIi8BNZcck4HN8TDv5BpRtN3lQFkC08OuHFYD8Zaj7L7Zvl5owRFQmt7R
         lZcB9W3KR/kulibonVRAFBoMpXhyaT+igFVwRAWbI7VfRn06yW+8VBtBzSIKtA4OTaLN
         axX0uFy3UhUQRrxLuN7CP0djVTZ0ZlkYTF188KdUYFDLD0x8ZY6Fybyf7kuWUWCxGd9y
         VrraYE7Spuj/vQFyrq89IhULUPKjOseWiS79Px+1Yt35xZTTSmkIiFOpKqIK9SBG0lvU
         hzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528750; x=1759133550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYqKhruI45NqfrcmY2IdIDvWyXftG5Pvnt74G18ZyBg=;
        b=Qw5oYIwCcmlYKrRiovmNwTjxp3gdqI/AwAFY4yJPcr1uTMH8zC5eu6BQc1ZfXL5No7
         w8aSJ6CKhFjat7+mBe9GFq40TON9MUiaUa+7dqw1LJV5vyukc+bWN2ushgHCnib0/sCk
         fjlqM481rGR1o6yrrGthl8DW0Gjq4AyVYtAX+W3HYU/6HBUDfZiUHJf0Sih9e/x6DNix
         jtnfhf0FOdmwMR/ZCbrDr9fr36En9P+EvLxW9ggC6/txCe7pFKo9VWAXUdL1/BGLIkUh
         8BP0PXNNlFyTdEpG1X8o+VZUy0/gKjymJWHl2hlKRwuGtBZCJp62gb0a3YF9pA4gYFO6
         Mbcw==
X-Gm-Message-State: AOJu0Yxn8MTox0+pxT4pInrw1hvp6c9GE30zKkzH2nfvefyPrwdWpRio
	63jQUnR+2I/Bt28G5OVaoysO+MZd3hoVaD6DqNq6pRN1Ju0CrmcyQLKLR+NFjQ==
X-Gm-Gg: ASbGncvSxOZCXwMZYT3+hgob3bPYmL9YtX167387XzoVoBOc9bX1O2RGy2pXAyreuY7
	C76dcNlB9g/pusjb4zj7HCBKHz0AiO13lcg8BEqHL/5tdsotDtqrcdQKYnfPLHAkONEXHhFFcs3
	dURLMf0uQ4YJ2EhkALAG67hxam8gHSZ3sg3jspHeu6iAFhfB7dfcJsg3/AICzFgVBBb2MPUGfYR
	1/rLJYKBF1VolYLZ1hx0Ky6ZTgHi9dkhF+n4CIW7iD51mZYL5tgG96g8VbnmSGvvo15+EU88IR+
	nbpNFPokccdsK57chY6kp4BeJ7AjD4jiru1qDTHWX59B5W3FMc4WAx8DeaJ+iEV2PKmNdzezMda
	D/iyVm+OHxKV96ucSBQhw7wuyNF1xDwbCRPbNVHJbSjqogmsNiYniEGOpfpUZSulHw6BZwscdfu
	3lQ5OhtsxmoxZF9MfR
X-Google-Smtp-Source: AGHT+IGaW5mf3l3e9WL0amAUkV4jBYZ9TpBBxRsBaTLr99vQ32yK+2WU4XPkn1fwTjqGvgH00a6hfw==
X-Received: by 2002:a05:600c:3143:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-46d31dcba3dmr18635985e9.29.1758528749751;
        Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3fd84338ca2sm3903576f8f.42.2025.09.22.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:12:29 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Subject: [PATCH v7 0/3] Register the STM32MP25 RCC driver as an access
 controller.
Date: Mon, 22 Sep 2025 10:12:17 +0200
Message-Id: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOEE0WgC/02Oyw6DIBREf8XcdUkAK4K/0ri4wqUl8dGC2ibGf
 y+pi7o8k8zM2SBRDJSgKTaItIYUpjFDfSnAPnC8EwsuM0guK26EYt2VRWvZ8kxzJByYRk1Yolf
 IHeTWM5IPn9/irT040mvJw/MRQoeJmJ2GIcxNwWuSNTqhSmPQW6dM2VE+E6LjziOpkrgSlYezU
 FOcdXyI9Ma+/zs5T7rSGqXwullraPf9CzYPxM3pAAAA
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

This v7 is a subset of the v6 and other prior versions, split to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-2-ce082cc801b5@gmail.com/

Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
Clément Le Goffic (3):
      dt-bindings: stm32: stm32mp25: add `#access-controller-cells` property
      clk: stm32mp25: add firewall grant_access ops
      arm64: dts: st: set rcc as an access-controller

 .../bindings/clock/st,stm32mp25-rcc.yaml           |  7 ++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  1 +
 drivers/clk/stm32/clk-stm32mp25.c                  | 40 +++++++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)
---
base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
change-id: 20250916-b4-rcc-upstream-8a8ea3af6a0d
prerequisite-change-id: 20250916-b4-firewall-upstream-dfe8588a21f8:v7
prerequisite-patch-id: 1ead960f405c7a2dcc9111acd0bb4c95ed33954f

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>

