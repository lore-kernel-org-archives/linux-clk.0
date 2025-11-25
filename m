Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45F265CBE
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 12:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072382; cv=none; b=ljUQIzrhWKdIYcB3ZulaEZ2fua89XT/x3N8HZe46VXrmEPrwnR4w2tltWR8lh3G0xtzYhgXz70k+Qp3uNeUpqbTXRLG0xgfqcfUBB+2+4qTuUMLRLG4ocsYYJz8XmEXwbcK5mmLRnkY1/KBP9O8fdvBNILGroNMDe6CSyU1lZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072382; c=relaxed/simple;
	bh=fQuCm3yVvrbhWBVd7I+43ZxQG3uqjhF1nzecABEWEzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjUJf5R0fbI8ogUGfG9xAWGY3vyeCccsTS6kEP4dBEkUZdlvgpYyBjbfy7NCjIsC1nMHrBbud/wrs3fCTwvrT3gmqNjAIzqVG1sR1yXqkz45VExrt+Evhnv4gsYSX+0jdeO06hAaeOnzhsXjO+GwxaYNiN5mumO6v9t7ec8FwEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU06mM61; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU06mM61"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594285c6509so5631936e87.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072378; x=1764677178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMKSnXZvXFWxstn6Wmt0f2cu30nxjUQkf102sfmvkHQ=;
        b=fU06mM61RvceKoi868Rmd50KYSbyekQdnapBzNgSLtDZtNpvEyAchg97gli56zRuVc
         Q1iIyvKq7V/My2nW0jL+8iYAsc9Bx+3258ebqGgZxrwVQmKWv3pTC6a/HDJuJvZdR7o7
         OTb7dCJfCxtvu4S/dnMoKyWiIlg64lE5tQ8ND78BxoSNfprDi9gBcA/t0MafYW1GSpIP
         fv2O2HcZmMLzdTJ/5EWxZare/6uhytq0GX9VB9/e3pt4BvOk/T47jbWms9m+XhmfczjF
         LfJ4tNE+Ps5wMCDYYUwdvfe7FLwEokCIHalr+Bb291DxUsokUtVhSPrWO3nPqn41ieRj
         biKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072378; x=1764677178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMKSnXZvXFWxstn6Wmt0f2cu30nxjUQkf102sfmvkHQ=;
        b=wLvZB4tcwX1UA1YGR1hYUVG6F3wDOXwVIPAuJiZeDwh+BLtQJ8t4wVxVPpRthUOBRa
         S2svOpkFYxFDRbXeUrcJbqMgPSwJQv1j3uIn54BmxJ0n6cVYR7q6WnVxuHgpHprkrEC6
         bp7Pz2y7SUqjz0ICAu+vI6Hqi3bh4SUEE/LiKgfvAxE1pfHli6Yoq8H1hY0VpdnC54mR
         gs35onS3GJlhnWaJm6xCGBpMbvE5PhHOJn9FKiaDcTpQg20MiecPkirs9SFx+Z+aMEcQ
         ridzMpk5V8yi+YaOuXxKuJUUn9+epvDnT3IJpStiXxt7aV+wqgGPaGUEo4XEGq6w7cPG
         zDRA==
X-Forwarded-Encrypted: i=1; AJvYcCUcTQvveLu/vZO4YHKeOiGqUkCQZn3o8sdKuLD5hJKR1ZrVOdn7HYgyTNkj+kjymA6X7VggWX/2nUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmU/O317Df79SCo7lUnc7I/x7Viwjm8ewxqwjjYUkIwPLyydT9
	appWAmicUsztGXxu2h/DPpETawV3vDTUD+fd6UtOie10Iac7DpBd529Dr53AFA==
X-Gm-Gg: ASbGnctNxtJOLWSvjn6qbidywNV7LHGNzC+IrsnOtwOVR1b9a5bb7H5IFZMLI4B4PcE
	XPsHjDnHGtz+43b26Ne9twTTx24y6ZNMfzwZKKilufAPXgD1OzaJfwV7+BO8ggQqbsbG3Q+v1Mk
	UIEZ2e2LNn0cyyOqGGAAjHHrc7lf9mgBqnv8CdgfehL7I1pytX0GC161/6tUgBHaRf9NEddicY0
	Y1uN5+xyoPtppkQgSjsRHoW8RehH99wgJPmN/QSK4lUlKa1RJjYgce22mesajWjoXCBgKkzC6w7
	xynrYZmMeaJuzY7RPVJmLf40fUuzbLzL+1YuCP0Ot119pCyt2KJRSiYo03vUQJ2lAGtVsPG7opj
	zRbac8ff7FBg4I/Rilrk+/XyYYw4bdPcG+BPNZtVaahbVfndukazyFvyv0o1GvVYHYejXoX/5MR
	U=
X-Google-Smtp-Source: AGHT+IF56otrGriTfA9UvJPBnGRevOk1eZ6opICTPkgG1WVGE7MGrd1ZjER/ONAVY4mquR51YjO8wg==
X-Received: by 2002:a05:6512:695:b0:594:2db8:312b with SMTP id 2adb3069b0e04-596a3ea66bfmr5947719e87.7.1764072377467;
        Tue, 25 Nov 2025 04:06:17 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:17 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 00/12] Tegra114: implement EMC support
Date: Tue, 25 Nov 2025 14:05:47 +0200
Message-ID: <20251125120559.158860-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for External Memory Controller found in Tegra 4 SoC along
with adjustments required for it to work properly.

Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.

---
Changes in v2:
- fix programming completion detection (changed EMC reg to MC reg reading)
- Tegra114 incorporated into Tegra124 dt-bindings schema

Changes in v3:
- adjusted MC and EMC schema to move description and ref into common property
- added Tegra114 support into devfreq driver
- added MC/EMC to DC interconnections

Changes in v4:
- fix number of EMC clocks required by activity counter transaction
- set minItems/maxItems for MC and EMC registers
- removed CONFIG_TEGRA124_CLK_EMC ifdefs from clk-tegra114
- minimized changes to tegra114_clock_init
- switch to devm_tegra_core_dev_init_opp_table
- switch to readl_poll_timeout_atomic for polling
- adjust DLL_CHANGE logic
- drop touching EMC_CLKCHANGE_SR_ENABLE
- use for_each_child_of_node_scoped for timing iteration
- add emc-mc timing check
- added print for amount of timings and ramcode
- align commit and code style
---

Svyatoslav Ryhel (12):
  devfreq: tegra30-devfreq: add support for Tegra114
  ARM: tegra: Add ACTMON node to Tegra114 device tree
  dt-bindings: memory: Document Tegra114 Memory Controller
  memory: tegra: implement EMEM regs and ICC ops for Tegra114
  dt-bindings: memory: Add Tegra114 memory client IDs
  clk: tegra: set up proper EMC clock implementation for Tegra114
  dt-bindings: memory: Document Tegra114 External Memory Controller
  soc: tegra: common: add Tegra114 support to
    devm_tegra_core_dev_init_opp_table
  memory: tegra: Add Tegra114 EMC driver
  ARM: tegra: Add External Memory Controller node on Tegra114
  ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC and ACTMON
    device-tree nodes
  ARM: tegra: add DC interconnections for Tegra114

 .../nvidia,tegra124-emc.yaml                  |  174 +-
 .../nvidia,tegra124-mc.yaml                   |   31 +-
 .../dts/nvidia/tegra114-peripherals-opp.dtsi  |  151 ++
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |   55 +
 drivers/clk/tegra/clk-tegra114.c              |   39 +-
 drivers/devfreq/tegra30-devfreq.c             |   17 +-
 drivers/memory/tegra/Kconfig                  |   12 +
 drivers/memory/tegra/Makefile                 |    1 +
 drivers/memory/tegra/tegra114-emc.c           | 1463 +++++++++++++++++
 drivers/memory/tegra/tegra114.c               |  193 +++
 drivers/soc/tegra/common.c                    |    5 +-
 include/dt-bindings/memory/tegra114-mc.h      |   67 +
 12 files changed, 2016 insertions(+), 192 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
 create mode 100644 drivers/memory/tegra/tegra114-emc.c

-- 
2.51.0

