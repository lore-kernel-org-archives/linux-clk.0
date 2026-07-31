Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F63CB57C
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 14:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508762; cv=none; b=AHDJwAq7qDA8DG/BbL3saXgzJRfl0syBX2E9eqmezdGjaiOEIUU6Yr4Tr8kcmhXUbYhKOspRIhhadiRW8AKz+V0vuhbCpCJYO47fMEhL90L6uUYZoDvTsGDYOQz5of5+9NRIiIyHDUYv07dl4tPmLo1E/b0bRefBDrAUBxdSBsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508762; c=relaxed/simple;
	bh=WI905lkwRzVJ2gJQ0wbSKB/Ay0OjjsuqTei5IgbscSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f9qyG9lxraJ1cYAiotrIo4GznW8F8nKX+7ICp9jNvN+7fnBXDjBPqBPKHN1j437YCK5TubO+e/FifpuqN2tbbNLrfjBhnlV/KUodnHu9eLfSZydqSnsETHCkZJagN443u993xUEPUvi13hwJHGzSBaA5GmcIYnS4AGZIhp1TQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=F1O7s8Bw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="F1O7s8Bw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47640541585so810230f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785508758; x=1786113558; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCKevl6YxRFJFbxhCw3NWepdi2CAzAF5zYo3iucQI1o=;
        b=F1O7s8BwrTNacPo675a9lqEHU3Xq8fFncE0eow6pq6Qpi5kYBw9XE5aH579KtDWfvG
         yOvRDN+HmaQfvM2eKxsRvjfYBx2jJzXK1erM3xi5WwbdLnAbOOyV/qMU61koO7GxmIbf
         WJm3CoreIHVXCinLVsxR3n5k08zJ3FRqVK0bXO4ph0q4uiRrslnU/Z29ukVylLFlHXzr
         HIsVnXr14HUTNdE/qsITF4bQqwKgcqAY0KCEWkaxh/45OS6DtICjkhxMC44Z+vgw0PVF
         VGEoC8qUfB83YqEAI6RkkXqGp8cORmc1p/cYM5fGByEAHwYMsvd/2hxSapKR14WxV1YV
         HNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508758; x=1786113558;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gCKevl6YxRFJFbxhCw3NWepdi2CAzAF5zYo3iucQI1o=;
        b=R9aR0jXeIcGA2NTtPhZ4euiGhtrrWdvlCNGUuztzEbHVCK1RZEV0jQjr8kOUwBvPp6
         pXrB31yvy3P317cxWuANMU4C712I2lbzWEtPTNlIcrZYrqB6iTqS2Z2Brh8NMPDocFIy
         DRMUWO8lxSyuRMwEG80de+vO56N3BFBJ4Ag2h2iRl3N/Q4KB+/a5Ne5RXd+c17Pg7wUE
         FoaibtzpRFqkZMiEUE/kMhLYF9EO/S79kgu2NTgUZac79cUOkUALgmdwnK/lywfwsmao
         P49wBOekJa/cIO7s2ulhDUaj5sqWOh020JbFo4y8cHg3kH8sHfkNnAEr6iViUMUdKtPb
         63dQ==
X-Gm-Message-State: AOJu0YzEJYM/jBP1HZRoYDvtao4aCjRcNNXLE91K+IhNWMo6UiNfUDUb
	Mojx1RB45gboR5RDOB071GIIfwHm3bbGhpPlKtMWHYsGMu7htIPdx22IMjRCY7+wcF5xpKy09z4
	O0AC5
X-Gm-Gg: AR+sD10GZ4uAECTuxL9qpF/1OVMjwasHT5wG+WdGKpG00RzDRdT0uztcxVmJNan+FBU
	tXjR/RRUfT6/S+7+7Q9RsiPHon9fOBLTElM4lCLZFwz4adHuD21Zv/SKwiBQFJZGHvSQRzoNrPb
	YRGDemL+a5YGzY7lKERiAVdOguI9wKG1fY9yzQAD82cWF0uH1o+tDfKKplJ3KLVAh5cSvC1b87V
	xgPPaZobzLsX5blKLzS6YkOfHn4ObKRC4AMumKZ7ZN4IKanvbM8dOSVPFaGycaTJbL44cgz2wSn
	dc3+Ox31+XCah/t2BViLcxpGHbYoLOH7ZM6Nv5TLUpW3Cpy1IhNr2ZvpfwtNWx0vwWOBBBe/x8q
	pt51Ol2YEIDTY5VyycBCnyya3c8po7xNSNiDLoYC+R8O6EumxEEbe/K5q1nE1bM4ilMl4rfCJzk
	ALjBUTqcqIBSlrF6t5cht74iaVro3KWdkRKZOT53Q2hbUEvLk3iex5hK24mC8gs4EK3Uon
X-Received: by 2002:a05:6000:1843:b0:47f:cf99:b0bc with SMTP id ffacd0b85a97d-47fd2b32c4emr5244188f8f.38.1785508757730;
        Fri, 31 Jul 2026 07:39:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd45a1240sm5269996f8f.36.2026.07.31.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:39:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] clk: meson: Amlogic clock changes for v7.3
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 16:39:15 +0200
Message-ID: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Stephen,

Here are the Amlogic clock changes for v7.3
Nothing out of the ordinary, 1 fix for an old chip and 2 new controllers
for a new chip.

Please Pull.

Cheers
Jerome

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.3-1

for you to fetch changes up to 6f809ca8104b01dff31a20e91fa748b49fe2971f:

  clk: amlogic: Add A9 peripherals clock controller driver (2026-07-24 18:09:37 +0200)

----------------------------------------------------------------
Amlogic clock changes for v7.3

* Fix the incorrect parent number of the 32k clock on GXBB
* Add the AO and peripheral clock controllers for the new A9 chip

----------------------------------------------------------------
Jian Hu (4):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

Martin Blumenstingl (1):
      clk: meson: align gxbb_32k_clk_sel number of parents with actual count

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |   76 +
 .../clock/amlogic,a9-peripherals-clkc.yaml         |  164 ++
 drivers/clk/meson/Kconfig                          |   27 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/a9-aoclk.c                       |  489 +++++
 drivers/clk/meson/a9-peripherals.c                 | 2089 ++++++++++++++++++++
 drivers/clk/meson/gxbb.c                           |    2 +-
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |   76 +
 .../clock/amlogic,a9-peripherals-clkc.h            |  351 ++++
 9 files changed, 3275 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
 create mode 100644 drivers/clk/meson/a9-aoclk.c
 create mode 100644 drivers/clk/meson/a9-peripherals.c
 create mode 100644 include/dt-bindings/clock/amlogic,a9-aoclkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,a9-peripherals-clkc.h

