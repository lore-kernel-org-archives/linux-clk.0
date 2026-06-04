Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDA33D6D5
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586342; cv=none; b=I2f0i5FncIjFEPcjOpEeJ3oPJ0NGCmk64ViaWH3mCuJ9BA5t6RlEdXKK4v63l0GYsy8X6f3l3svVbW7J/sXBb3qmQSuPe/mxIUQeQ1wjwZ1W0CmALf3NSBOfCdfG49W8m8EPype5Xf8TY/o3vKJkCALgS2iKtlj1ncjEZnN6Ezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586342; c=relaxed/simple;
	bh=FsJzusXRvjkVBK8CC4DoLzl0EEg02IPeRG+NSu1x/s8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IS5cH34DaEv9vcA6nvwXeeXSqEUsSvhOdvWPSw6SDHgWHzrtdOEWOuWXn+7ly60ivCTX2XRZpfu9YEyLATOsC8iJKyqgsClH9Tn/w4s9ApyFmzUBD28zEIeUsMtIztKIVv6I+6XrMtdrCCNGGuBnWt+dMpKES48KfTaSc5G1lNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2JuDYDM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2JuDYDM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so6866065e9.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586339; x=1781191139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5Yo1OVsaBzd6nBAtTG4s9KPM7zpBpOTGHL8RzytDbE=;
        b=o2JuDYDMnnaKL72OufOMaJTrWIxe8MvV4t7cgEQWQ0sKAoOm3mGDKWFc0X4mc/uBbm
         feD0ngnBXt7RUBGIvaP7dVcLILHn5waHybtPpBSSERJsBDZvFRrL/VXuml5DYPjVMTpe
         rITvAW8Zi+c91u48xon3sO/w1L9+fYfqjYpMi/hc6e1329JV9RqW0dlnSxwEiPdjo6Ju
         LAcSm5cMteooyViGW0jjeG5+fuc/joiSuWhRflTg+D5sgPpIRT/wjgBhnHUcTe07svVp
         KHgrlUPQJYlP6PXy3oDdb5PEXex3qNBF5goUM8PNIZU+gKVhOO54ef1hoA0xQ3NI8sGn
         ewaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586339; x=1781191139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Yo1OVsaBzd6nBAtTG4s9KPM7zpBpOTGHL8RzytDbE=;
        b=expRAqTXUrwgUFeOwIsx19JfWNKm7nSiismcLA1vxdRFaxxzTyU4eoLt6Cs+287Gan
         CvWJw63g3zDTytmk4o6Dlaimq5pINSXwlqN3u4+F9tlKt/Epcx9H2mTUb6PAOKBBStmP
         qmXFsAPy/9NZWJfbeFVUsM/i21O5gfFlEpTzuAlMRIp73J8Kbgv5+0XgwzWucf3yGgNC
         wH/ykLmnvI1hhrGQokOUL7oEwBUxtmmCnCCVysoa1aqlhu5PxfG+uoDXkjoWg7KWTOZq
         R0GqOpcfC4g2q2+yzTvea2FwtOuaUjyAIFYvdkDCxqh0X60gA5YhE7nWZ2Z+e+VE4aji
         4s7A==
X-Forwarded-Encrypted: i=1; AFNElJ+gG2Y14JFfKBae0sW77j/VsIM4HhaGE/MIItqcxPkWFEzmoj4ZR2Y4l97RLvseooR+8ZTlXAzzisQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDT6XvMLBTh8ka3ttEpQK7lmIE9vbg5kletkR+dyJeFgEwDG7c
	c6Gj9NSzkSS6gfjiLkbsL/ByO75HMUm3miXHs4B5KpgwV3cGlmnZ1xzG
X-Gm-Gg: Acq92OFLKuKXa7TtJo73CSVBwOOM/V+Qke8ZoxyalQhNQOhOik1SrIOju2ctTFEJ8qa
	IUezRyDdCSSKFkLyHcQFtq21esrXfdXie0MGbKD4UgEuIzSKtGMqoYDrLZXKTskesey0fleydSp
	OKG05IfdB3DluMqK1EshyUHdGVmpbB21IPz6sQPBaL8n39z8+dI1KHD+fqlx+mJlT8NIayV8V74
	aNAhHkiZUv3eF3oojwryCU9s9f0GSuSXRxv8Jsu027y5gSav2ytXfeBSpV753+1sgmFLfR9CRGF
	YK2cHRiUXoDpPNQhWY3/OefqtM800GU4sTwJZLjMmX6vw7siRrgMmOuYGm7lYmX9FeN6dVk6Gn2
	ZZeRRO25b9wrSgEvkZpBKR4CnfU25ONNV2KBVxQnk/HByzNgBLldZfSHss442kjo8fLCH98KE/c
	Jhztt32jzk+mcL+U3IxCGzTdgCjJeO0CgwwhKtm77r/ybajJSC+LHEcFMQjk4=
X-Received: by 2002:a05:600c:470e:b0:490:601f:d775 with SMTP id 5b1f17b1804b1-490b5e83527mr132886395e9.5.1780586338813;
        Thu, 04 Jun 2026 08:18:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:18:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add GFX support for RZ/G3L SoC
Date: Thu,  4 Jun 2026 16:18:48 +0100
Message-ID: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi all,

This patch series aims to add GFX support for RZ/G3L SoC

This patch series depend upon[1] for clk and dtsi patches
[1] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  clk: renesas: r9a08g046: Add clock and reset entries for GE3D
  arm64: dts: renesas: r9a08g046: Add Mali-G31 GPU node
  arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 126 ++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  14 ++
 drivers/clk/renesas/r9a08g046-cpg.c           |  23 ++++
 3 files changed, 163 insertions(+)

-- 
2.43.0

