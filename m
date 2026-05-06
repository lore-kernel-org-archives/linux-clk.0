Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804543D51D
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067565; cv=none; b=gWBSvIKE6FMzNvh6nfzkWiLKdGLp9q59ZBIGxnGEDPdMQCw/1WWCJzScTeNyrNXK8BL/BQBMD+yI0JIV/RqkGcLVKNXQNqW5HIMyuHr/WfX8PiDFe1fEznMVEHt49rYMe9yzQbeMEfwxpUAS0WqHy2GURuF0IZrswj4BXCUwPP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067565; c=relaxed/simple;
	bh=9wjIXq96Ye0zgM2I0ds4oYNVzLtE1yAQNKLV1EIU9V8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GaO78KI6da6dYmyVN5bOWw9NSV88P74b/j8If6bDronhCR9tPAB6VhenmwegM4BMrHr6agu+tQqZ9/FzPCiRFMHxGK2s4eN0EYGFrQIVFJSi5km8c0/RdapNBVYVAGX4hLh7zoKtjY1Wu+DIP2lACQPA6L35GKib2HhSBz+pkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K73V6rrr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K73V6rrr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so5084727f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067562; x=1778672362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=K73V6rrrSE+AMJo3i0ACwCTS1P082p/G0P1XvztAczC06uZAl6DKipDVBjnfc6m9z5
         yMQx7OriVyX7fkPiqpiagpaFjfpVnvBFVH1Vxozp5+yWQqTrcunPIQh8ZAVRT2uVVyEG
         bF5hN+AwE7krMSkzvOdpjwTyYHvTLdMNpiF6ugQZp+U9o3v2GXr0Nb+EwkCAdJtrIAit
         F6snMa4XlDRfRn20J/XIqhlxsR2WQaV0wZEr/7F5rLyLHAIIVBC0PS3qOoO+G6RFldDC
         YAD8Kqb5g8PVF4ioWvWNowp7BV6ZjKd4TdY9RTYYzXHPuq4zJnikXHnhRnPpn6QHaz33
         q07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067562; x=1778672362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=PZZEaB/1FRjvhkbn7AcQOeF7oRb8TTsf01HdshY8nzv0w1HAb3+rmmpaUYVZFwZaiY
         Rg/5DXPJSB8GWaHncTQCbiXfNmX2QU5FUti+tcn6B0QIaY/aFr2jJ6fuaHEu1Ha0TEjD
         QZZ0CAD5IOF+tm3nedK5yVafe0lbkbSsVm0ZLyHLDrvx3Ev8F4YseIntYAykloGt/pOm
         QgIX/wpM5fsPtu1+Fo6x8Gz9clidycXwPZyISawUFp2blVhssI7xdqTmmUP+BMqNwhwx
         9IQ7jlhSMlKxzLkn53lpeJQiIwi/BrcmaWMQnws2XRNjYKWGlFuAZkCoORN+Zsr1shY6
         Nv1A==
X-Forwarded-Encrypted: i=1; AFNElJ+lcEFKUX2fvu6WBxtX170vKVhSx2a1hg11PNcTWSnw3yiII32mlLY7o2OfknDcPn+F7VoHi1MzSyA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnef4CkyAxnoPE2uAYpfW3dHd65dAYQIDNRNYpqzRkUPOloBY6
	Z3ABqnflgnBa7k/s1mDRmDuy2IDmnrUDZzdywBVqrN4UZy7sllrYQ2YyKIr76k4AJ/Y=
X-Gm-Gg: AeBDieuBS0fPvQBxIDXK4nhWFLdF9N8e7M4N/4R97oSF2cK+MQrciJSNYPtfoJCqE7X
	B8SLtJtzwqZUTOCByeUPFBWi6St95i5ZudhA7SUZVJCfteisnGoKSQ/OfsX2HLrglCeY/7Y68rP
	UkEvtyBZT7G924jetPI30ixIgJudghejyDaXzibZyjKvFtfIRrIq8fXWtSTckrvjuSh8r5wFTdk
	Sl6HRhe2Gz5YOAvU4WOAT1nd0DEErxCKvhDYTrij522IQKwFt7Zfkcs31rbm10byJy8/kh/tDDN
	RkGUTXtuhK1N510LcQK50yKAKs1Fxl1Jhcc0S1cAGiI9KmTToPSDOlsN18pJThAug1ngt41OBmw
	Da5nopV5A+mFGL/gTqudqdO7w2PRqw6Du36mMS+Axcfb5WE7VVnWhgXVWUXEBzNxFvLEuU61t4j
	LiRP1YxX5hyV0LstW8f0xv0UclHkL+pP6HZ/GgDYRD4OF1AWbVD+qd8MuDUNfkUJD8Cx+p0MfaY
	4OQZvtN30W8AG1xpw==
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4515ce1c6bcmr5425016f8f.22.1778067561946;
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Wed, 06 May 2026 11:39:02 +0000
Message-Id: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYo+2kC/0XNQQ6DIBCF4asQ1p0GqKjhKo0LxLGSFqGAponx7
 qW66PKf5H2z0YTRYqKKbDTiapP1cwl+IdRMen4g2KE0FUzUTDIJ2gQH2S0w4StgTFAZqUeGYmS
 NoWUWIo72c5D37uyI76XI+Tz+YUUOthK3kz12kHSa7NNDxOBjTqBRtH2Ng5QtV6v8/eh1QjDeO
 ZsVWZsrh2g47fb9C9kMBjfQAAAA
X-Change-ID: 20260505-acpm-tmu-helpers-4c5af0e2f07c
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=3632;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9wjIXq96Ye0zgM2I0ds4oYNVzLtE1yAQNKLV1EIU9V8=;
 b=r8xf8GxAIL1BdWW1vT0QMZLJ3de6b9Cpy9hf2Hon4GLaqnK6iD4XK7jpdzHllGv0zilynV9Wm
 nlU05KGBnMgAK9cl50FBjPbEhD8d5fkX9k59ZWvBPIxJDpcyysnx9mP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Hi all,

This series introduces protocol support for the Exynos
Thermal Management Unit (TMU) to the ACPM driver, alongside several
cleanups.

These patches are split from the following set:
Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org/#t

Dependencies
============

Please note that this series is based on top of the ACPM polling and
LKMM fixes series:
Link: https://lore.kernel.org/linux-samsung-soc/20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org/

The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

Note that when compiling with W=1 one will see the following kdoc
false-positive warning:
  CC [M]  drivers/firmware/samsung/exynos-acpm.o
Warning: drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Warning: linux/drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

This is not a dependency per se, but wanted to let you know that
I proposed the following patch to fix it:
Link: https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

Cheers,
ta

---
Changes since 20260113-acpm-tmu-27e21f0e2c3b:v4:
- reword commit message of first patch emphasizing there's no
  functional change (Krzysztof)
- remove static keyword from `static void acpm_set_xfer`
- replace for loop with memcpy in acpm_tmu_set_threshold()
- update kernel doc on devm_acpm_get_by_phandle()

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 ++-
 10 files changed, 397 insertions(+), 72 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

