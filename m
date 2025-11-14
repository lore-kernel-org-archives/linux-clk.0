Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A031CA54
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129034; cv=none; b=Z9YiqoWgrDb2Bp6ckUkjazkNGO1DNMz4rlk04iZ9IUxoXN17BBxdf8ddmo6gH3uYqO44Jb8nVUB/ZW4pcKnRYp/IFLzJygWqzqkNN+NV/oZtNUWms+2ffuG2QQ2wOy9mAJoFyF2dIwJ9r9f3DPaIVeX0Kb1/2S9Pe3tlOgcatsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129034; c=relaxed/simple;
	bh=7RBQ1rxq9cwOIH31iq0O2exHw9ltAWV8KJdyPMcuMpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLqbVeA5NCF/I4xW+XLGeCJpHK1IAAgSLbVhJvPK1o2wVQxsPrVXpy2P5xRYG7XXUHoRQGyvExFZXwc0zT8ZQ5ul7qvtjWAWJkwy45gtkK/Pqku/x7rfOzyHBhGVLlSp+vXEXd1yg6q/tmV9V0tZWMydD283zstYpmUFpFndsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9aHSEzH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9aHSEzH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b38693c4dso1002770f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129030; x=1763733830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsEhbkw7/qEJclFbO4NyPPkv0/guRdzyvArRrjN0KIE=;
        b=H9aHSEzH3eXI6TUwyG970V+oWJzTRwaWn36++HppMwyAifg1znGOXtvH26NETMoLqP
         gSTN4Al9TK28ph1GcSukPq2Wbp9KCc6FwHiiYB7HxT0xj0V5VZlsqR4B36gw0UsnjcHb
         vjbT0IKL3nZ4HQEj+D8ZEbbWgccQWzfianYsiaP0U/EbW6sDQqAqeEBY2gi8DJAptVr8
         j+TEBy7EhptZI8c7FITwgsqc2QNoHUkuCpFsJFh1MBhzsw9MX5dyA1RoDmMgQgkYLZsj
         sR1EhypYNlJ4kG/YorCYdpMbTF9e6Dd77ftzzcYQrGU5eXasZXKulD89J0jpcjnHwv3S
         vNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129030; x=1763733830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEhbkw7/qEJclFbO4NyPPkv0/guRdzyvArRrjN0KIE=;
        b=UrGgQf27rNoraP56m5o2rKZtbbOQmbJQR1xI/6ZFpDHOU9ifi0tbL5VUpTCGpK8HXw
         1jF8qDlUhwpLAYwnpjbrSKG9JC+cUSUXryAUBINfW+nwl4w5tJVge2J5uWXhH6CT8j16
         v7d3wMRhjqXg+w/9ljGk1kW4lU5nG6U143vFoOO5Sl/gI0lAE9VgZFtHJ5K49lHvL6f5
         oAqwnEmwBY3d5qpYOKbRwDYBSy8WT5INM4o/d61EAFX8eURMrrEOFhdOwtHiQOf0PCMg
         g1gJrX33RNnPLTMxndFIQgZmNl9eJfUyXex0YTjw0JlvzkaOKiOGAj3HdqwmKe9S2cTq
         kJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEPawVqEsZVP+SdK9GNF8f/1wx/HhTzpc6e6O1KLfBhdTGBd1n21lLDdU1j7Y+sl8MVKnS+Ukuj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxweNXKRBrDqRl6BykC66GQDWPKP2z211sUjcXYdju4f3UKTxpy
	jZyolSO9WbPxiisgsegMRkW2t8PQ8YybpnwdVx83iYAQcylo4drKKVoaehMked11mpk=
X-Gm-Gg: ASbGncusewFgiKy4EwG5EOtkICB3+ZNdpRwLc4P78GZOSdy5NTtFMG8pkojxCRfRW8g
	eLOkbIiLF4GZPsB3N/yZW6bZiLHnEI6npkqeIp65YsUusfrgjWppCbksojVN0ZO4OwGqbk5JnmN
	oeIKJiIHO0YOpXvEft3GSmR+foKxd44UI1AUaA8/f/ylkSoWtDipRe2qfVr0N+NBV/MjeviYYOb
	M1FRnSLcO/JKPRV1RTjelSiyqdy4b6euwS6qZ/QdC4cFhhia8dgyGkn/g/E1fwsGl+5hoN+vWaJ
	FFsy1DGwFTqLHxfZlxtOiwqZaG4rS7ohGSmU/HXbJWaaevr7mLLvFi9jQAv3S/GD+mgb1XXx3kY
	A/ua1lyo9UDLxzRAg8dmc8OAv+MIx9cIvGvj4dbupmnaT8mGC/vO3hKf/uoFnEtLyDZtVHO2HOw
	==
X-Google-Smtp-Source: AGHT+IGA/B1SzNJ6LDArjnRCHI7gdzJpdYz7fDscB0tGXVzq/cjWi9I4cngB9uUtqy66QBErU5TPQQ==
X-Received: by 2002:a05:6000:144c:b0:42b:389a:b49 with SMTP id ffacd0b85a97d-42b5935a894mr2976159f8f.28.1763129029328;
        Fri, 14 Nov 2025 06:03:49 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm9852161f8f.38.2025.11.14.06.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:03:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.19
Date: Fri, 14 Nov 2025 15:58:42 +0200
Message-ID: <20251114135842.1473203-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.19

for you to fetch changes up to fdc1dc7dd53b95805d3943ed36785c1ec812915e:

  clk: imx: add driver for imx8ulp's sim lpav (2025-11-11 18:01:25 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.19

- Add delay to the PCC enable/disable in i.MX7ULP composite, needed by
  some specific peripherals.
- Simplify the i.MX8MP auxiomix by using devm_auxiliary_device_create()
- Add the i.MX8ULP SIM LPAV platform specific clock provider.

----------------------------------------------------------------
Jacky Bai (1):
      clk: imx: Add some delay before deassert the reset

Laurentiu Mihalcea (2):
      dt-bindings: clock: document 8ULP's SIM LPAV
      clk: imx: add driver for imx8ulp's sim lpav

Peng Fan (1):
      clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml       |  72 ++++++++++
 drivers/clk/imx/Kconfig                            |   1 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-composite-7ulp.c               |  13 ++
 drivers/clk/imx/clk-imx8mp-audiomix.c              |  39 +-----
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c             | 156 +++++++++++++++++++++
 include/dt-bindings/clock/imx8ulp-clock.h          |   5 +
 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h   |  16 +++
 8 files changed, 268 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
