Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4315B102
	for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393409; cv=none; b=JNmaY8wGxoeTE46YIHDsUoHQdNvrQHeTzs5KX9s1LmTO5yW6ByekAi5Tgf4hItYM0p0iJ2O2Hd71BSUlgdO4DOeo3VLN+CR7PpnzeP13DhbT9A9Q0OBkRFNLP31p/CzXIt/AUYawkvXj/Pw+58EvHQkhdCiFBL0Nb4OhuPSELWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393409; c=relaxed/simple;
	bh=k1IIV9DSBPIvFUEiqJP0rcFyaxltvdBOco23nV5sRPs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MWEI7+jilwnGDrj+gUl01z00ylqNyxHlRJmbSGjeuUWrFMLFwAfX2ThPQsR0Tesb3R7/O9iJKCXDEern2dCaBeuvPv0RM1PfXfYa+wrzDA8rnQzJuATRguixqncFilC68g3MrDk5LM0cdzM586d5VR79X83x5/fD3nD3r/fVn+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XT1yuFZW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XT1yuFZW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35823755e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2025 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393405; x=1737998205; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbB8qm0bkBEJ3fYSZMX1yugmevQ3Tpm+Yk5pP0ec+Jc=;
        b=XT1yuFZWBNWH3ipMYE2n0B/Fz044TnW9jUYSRdr+vUzKNRKURChQr0qhYkAkewi9Q/
         k1JiHBHB5TVRWz4c7ggN1xRfQ/7dybc+UXwzFT2ddOZRXrfRaHMdTf1S5G5nd7pcHWIH
         Cp3jj/VZcUvULl3nM+QJXvwyYCG9vCfsTzJXFhOtSnWapanL0YG0RgzwgIrf4E0siSR4
         I5yhYCOKe5dBGLdv3OL8CEF5MdZu1HaSPYKxPeJBEWUO1fqiCDX6UNURkefNmcqOoRxF
         7ZQjNe+7queO63ENvh++crDI1cxAngO1/ig5fpk2XMkC6TQxzFHHA2U5QIAEQ1JqHOAC
         jBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393405; x=1737998205;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbB8qm0bkBEJ3fYSZMX1yugmevQ3Tpm+Yk5pP0ec+Jc=;
        b=SrAMtYw34fDjsuLm1m9Akoo06ige+BVP7R59jOn+eLkRtOQAQoBEbSMOjRssU5CVEl
         8JuatsgPeIQUYIVhwL7P6XaE1tEoENu34i4Ckg9T8b91/nfqddJzVy6ysmctdgVAwFPu
         H/ni2VZIMsOpnn8ia1xd6h5QcwPUxqT0cknLaBhbYSL26dbeEJGk4s0hzZhn61z6ubk+
         tr7T8M7W9WfKOd1mdh54aXoaCfiHbs8VyBhMuZErI+TYtdNHlV18ha8CsMic15UqQ472
         RxtPjiylY7rIJtZyt8+04IUokAQMGa48dYK8EC7Ykyc8d5honCJtcaQO3EB6dVKl1zXt
         t4lg==
X-Gm-Message-State: AOJu0YzJalRsfJthnU8ajpQyf1P5ItOlm9roHkS5mzThypO0umH5Oe/h
	Wb0mcZ2lWo0z7CCjd+G2qcsmtOlGClXNhsXeufeyJ/BvswhSDHLkNmexwSlaYXU=
X-Gm-Gg: ASbGncuCQAMI1t+EAhMDYfYowdVAHgE/LNtjMApORyfPDneDApGDtiyx9W1lZMvQmud
	yZJAMG4fTUs+m3smXVsUxcEKxF4iky/POox9ep6Ti/c200yIBO2S7ACNKwYQgP3N1diEnq3fmN+
	I0xXU1H6goI2AJcG1cwVRLMSTJM3R0lJTz9PZVOvrSh3e78xngByLWFwV7e9sIVFMI5zqvayUQr
	f1UR/84J4J/V33gT6bYg6eOy655YgL4fjxw0bwQcS7ceWr/M++UtAiFoqEtrR5C4lRD0YjkGDDK
	KvnWtYj3
X-Google-Smtp-Source: AGHT+IG5o4k9tK/Vhm1L7A9XvrUAF/5ZROZXG66cuSFDp1cGjAPzlnO10DMoMkcNakTaJusKA0zDvw==
X-Received: by 2002:a05:600c:8712:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438918d9008mr128996795e9.9.1737393404184;
        Mon, 20 Jan 2025 09:16:44 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/4] clk: amlogic: drop clk_regmap tables
Date: Mon, 20 Jan 2025 18:15:29 +0100
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGEjmcC/5XNvQ7CIBSG4VtpmMUAlaJO3odx4OfQEmlpoCE2T
 e9d2sTFSbfznuH5FpQgOkjoWi0oQnbJhaFEfaiQ7uTQAnamNGKEnShjBMveh9ZprP0TmxjG/Yj
 Q9nLEk1QeEqZn4NpywWreoAKNEax77SP3R+nOpSnEed/MdPv+xWeKCb40xjRcaGWVuSk5e6ciH
 HXo0baQ2UflhFLxk8qKaqgVxSRC1PClruv6BmtMy0stAQAA
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=k1IIV9DSBPIvFUEiqJP0rcFyaxltvdBOco23nV5sRPs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT21CjqOGkbh6UgB0iHVHF6VxRL1Eju3Abzw
 36s8sm6zmSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E9gAKCRDm/A8cN/La
 hbhkD/4nQv0cuGLB9720y41tXquDMo13LTUI/XLrUPOll1ojBZRRsgY36hT0xbruXlGGSrokoDN
 G8pepnfvHtAG0VgSRngUhr24dnWPGaKV/CjHspTIyp5iOEqm6BGYn424RhCV/yHn+Ju89WZeTTg
 QxfPcxAQnp/BEaWSW4bOxLQLF+fgYEtQVWBs08wBc5rt+sAdbTcdI5WkeQW9je5EIho0iE+uw97
 qwMTQJzzMu3/Xb5xRHRP89t0wC5IEUCE1uVXdADjQ23TBdTXQjL/LNyUE21TbMU5NAOOSsUS5Xt
 pm8vh6TfmZRnGhU2dchGSa/D7ZPJj9cnKPdp9kWzEghM55JUIIfusc7Ky1oH6NQC+xkQgQSq2GG
 tsbUDC4xvQxAwBXt0D4W98JWwhuq3k6ilLnaPcuXRETIvLwdaxOq1QXGSCcZn33x5S5WAkRRAf8
 yor86t/nBkjLwtgNH25tPYbc5NE5c+MVyAth5Z+31mQR/I2M3q4nfd2adm22s8nkAVdAvOikIKx
 y6oFW4XoKiShi0IcUkzvqyJjpR7j8AC9ll+7xTxHXICi24pePfnRG8imcL9ptYrIlnQoi4xMv9t
 rRWQYgk1aml5UTmDQQz4lwVzC5hgdeJyHJm+aJhrd12gGkOO6csjUNgRFi3VrztlgCX+b9mKx56
 s7ZuISeQXvOIxCg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset removes the need for clk_regmap tables in each clock
controller driver. These were used to populate regmap with in the regmap
based clocks.

This saves memory and is the 1st step in a series of rework of Amlogic
clocks, to clean-up, increase code re-use and ease future maintenance.

Changes in v3:
- Fix some typos
- Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (4):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++
 drivers/clk/clk_test.c                  | 116 +++++++--
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +
 drivers/clk/meson/Kconfig               |   1 +
 drivers/clk/meson/a1-peripherals.c      | 163 +-----------
 drivers/clk/meson/a1-pll.c              |  16 +-
 drivers/clk/meson/axg-aoclk.c           |  22 --
 drivers/clk/meson/axg-audio.c           | 433 --------------------------------
 drivers/clk/meson/axg.c                 | 131 ----------
 drivers/clk/meson/c3-peripherals.c      | 210 +---------------
 drivers/clk/meson/c3-pll.c              |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
 drivers/clk/meson/clk-dualdiv.c         |   2 +
 drivers/clk/meson/clk-mpll.c            |   6 +
 drivers/clk/meson/clk-phase.c           |  11 +
 drivers/clk/meson/clk-pll.c             |   7 +
 drivers/clk/meson/clk-regmap.c          |  49 ++++
 drivers/clk/meson/clk-regmap.h          |   4 +
 drivers/clk/meson/g12a-aoclk.c          |  34 ---
 drivers/clk/meson/g12a.c                | 261 -------------------
 drivers/clk/meson/gxbb-aoclk.c          |  19 --
 drivers/clk/meson/gxbb.c                | 393 -----------------------------
 drivers/clk/meson/meson-aoclk.c         |   5 +-
 drivers/clk/meson/meson-aoclk.h         |   2 -
 drivers/clk/meson/meson-eeclk.c         |   4 -
 drivers/clk/meson/meson-eeclk.h         |   2 -
 drivers/clk/meson/meson8-ddr.c          |   9 -
 drivers/clk/meson/meson8b.c             | 200 ---------------
 drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
 drivers/clk/meson/s4-pll.c              |  31 ---
 drivers/clk/meson/sclk-div.c            |   5 +
 drivers/clk/meson/vclk.c                |   2 +
 drivers/clk/meson/vid-pll-div.c         |   1 +
 include/linux/clk-provider.h            |   2 +
 35 files changed, 239 insertions(+), 2320 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome

