Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5408821C16E
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715076; cv=none; b=Kayul7oIQGWvkHqIq8aKjgsIIaIpn3+0IOB2KukPLkmAKSA7Vt+eTOta3rrnVvbs9ezIRdKx7WSj/7b9WVqGCh2644rBX86X4q9Uyti67rl1V7/ra4JC3k7vBsnAREF+oC6z10VJ01pxc14fawDYscUYKNOnWVCFUmgUSif9OmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715076; c=relaxed/simple;
	bh=0/1MgQhSTo4SZ2txed9gv05z9rFjmcWl6hwe7WthPg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gb/JUWhFxOVKVigmKDc17Koy5RBjas016Nh70uxsIc0Tr+1N85r63TjbODgucJzPafrYGWE32I9HNGyQv7zJQIVhY1Utq152nww5xeiZrQGpjuAHs9yXamXRNZDHLLBlyBHETmBCZmTJKlV15SpAfmH1TA52KFgx8EOwS/39X+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mFtZzaoF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mFtZzaoF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436341f575fso23425245e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715071; x=1735319871; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=mFtZzaoFudrq/UNy6PVmNk0lW3paiiuZmueio4lNyOcLa1jmOpzk6xVmJ3r6v+SIhF
         0vwzfkaWZ+7HePHqr9eorP25NoVWTHGklhLatLnvDkqIf7IImDqJxSC3jsrVrfTEg25H
         0zlGg14EnhAkqAGhj3TCBBMvJfl7dsaO6ASrLo14UIh5+QT2sde2UrI+BKjsFZmq1Q6J
         VwjM9BY9npAgi2oJWHaLFYBNKE4/qwiDf41J4A+HwkSmFsHm+4lA7CT0XqtAkcOI1Mio
         qPG0vi/z/tLEjBHFfXci7C9ocxdYqJST3P0zteQ46eq9VR5v6OzV5ddLx5KQkd2oRTz7
         QoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715071; x=1735319871;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=EKcr/OpSVbDaqpHMXazLH6sWkcmG6Wq+5XqotzxOYa8SCnei2V2D0rhR+PubpxIL5W
         bC+97IsJ25aHspZHkZsRuOQeTkz+fKHz8jv783omtUVEPKxIjUqBP2W/+ddgaLf73wRm
         N4aXz7Vwy5LE7uO2VVGhR7hJSWOTvPDpfxQo9LJw36Q/+n9rTzohFFfnCxSgvQqP5aQy
         wivjApTqfdg46WwGlkzsuKvmWf+ZW9GWp5/zb8ADS+t2e+WB2m91qVRq68U+Q42UksuQ
         gsedDwf7ZyoerRN9HV6GxwyGt24Ibb68JcXDkIVIC6YmrNVulSUY7/1AmQsDIIUnJMN7
         +NkQ==
X-Gm-Message-State: AOJu0YwWa/2kwRjxBLB7xTY60xkCDiFbqPLnlnXZAAqQCQ+nQ+E+lYHp
	aYq6X7VbL3heLLdAAy0aJBIPPOuO4BjHFyVAUHQKzYUIvYPuyceeCuKMZaMU0O0=
X-Gm-Gg: ASbGncvsylz8JobXj05OxUXRj5LPcnkN2JIMcIC1b6xRfjZiye20vR54Jc5xtE6zqCe
	5PmXrhlViGc1lmI+Z9K8QmhF7osiUHIn6G3kdWPucxfWR4vXW+T02psYmPeWJwnsRb2fzToCatA
	jDpEUOYLeqv32JvycDA48OaNcRE04MF/58xXF/R9e7xKynnZEIAof2s242mrSHz6+GJuIVcH7az
	CZT68+umLHItgsn6aQ+7lkpl1uaAL0d5uuAqFv/ElJf5vyg177VRV+n+00cv1osPxLy138=
X-Google-Smtp-Source: AGHT+IF9f/T14X1AvJnEvREcpdS8/52lUJw/ZwFZojh7k/RDOYI+PqbwwQJ/BIYRcYtgDvOajktM8w==
X-Received: by 2002:a05:600c:3b13:b0:436:488f:4f5 with SMTP id 5b1f17b1804b1-4366864420bmr36545735e9.19.1734715070689;
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] clk: amlogic: drop clk_regmap tables
Date: Fri, 20 Dec 2024 18:17:41 +0100
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWmZWcC/x2NQQqDMBAAvyJ77oLZNlb8SukhxjUujSZsShHEv
 zd4m7nMHFBYhQsMzQHKPymStirm1oBf3BYYZaoO1NLDELXo1piCePTxg5OmfIFyWF3GrxsjFzQ
 9Wz/bJ91tBzWUlWfZr8nrfZ5/bBey9XQAAAA=
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0/1MgQhSTo4SZ2txed9gv05z9rFjmcWl6hwe7WthPg8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa6K8PagUSRbBXNIVgWlwByGMO32kVHibKpo
 b8WCFcc5WuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmugAKCRDm/A8cN/La
 hRnnD/9f3l83yXUjaKaPT3xakf3kCxkgRh9K6gtDX+UCd3ss7AQ48yYzWirHLZeG5I72h1v7rg4
 +kscCCA+mueRs2+syySFdvGCU1P5EYPn16fO38x5L6n1X7DyDHJtKvpOrireORtgu/WzTETV4Vx
 2uVGKKW9kJNkVGci9iTGNDkEjfKnILkArM5Ogobc/IRnkMgj/ePaQtwzxhRD5SISWa+qChE+Z8u
 cfRfqluWWkN4DTFoG7plqgTBDWLxVIOAHFSxQbvh4pZwsfcqIp5W+LqYkHUzIyvfnQcHWacZOnL
 fVvkWLFh85YYdUKEqq2dhvjqybkiB95jK4wgtqjwnRRSoK/MfmvH6NhFYFPxMWpzke2B/kY0d62
 ai+kR6LbuavihtRF0beq1zJBQ61K0dwsze/Z+M7IDuZ3oCELF5dGgwJatOmqdrC8TJ3jYXO2Szm
 POUns4BVhVQrle6Knpfxz7fZ8eUsrGNdx1dUEkoff0M53YCWvWQ28Xledd8petrrUguM6qiRm+y
 m6/9d6A29thmvYHki1E7HVz4BKO+VDM5GXB3Ao1G/6z2AZZS9iM2YKQlbQuZOn/WTvCxDm0uPVA
 8o0n5uwNq1xGZvI8siNMytDCiq50lIIMkuJ7hls9TbtPhyQPu/awUrQclDEYo81D7w28OdxNyFC
 44cpl3+jhYGv6+w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves a some memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: add a clk_hw helper to get the associate device structure
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/clk.c                  |   6 +
 drivers/clk/meson/a1-peripherals.c | 165 +-------------
 drivers/clk/meson/a1-pll.c         |  18 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 435 +------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 212 +-----------------
 drivers/clk/meson/c3-pll.c         |  34 +--
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  88 ++++++++
 drivers/clk/meson/clk-regmap.h     |   7 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   7 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   6 +-
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |  11 +-
 drivers/clk/meson/s4-peripherals.c | 343 +----------------------------
 drivers/clk/meson/s4-pll.c         |  33 +--
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 include/linux/clk-provider.h       |   1 +
 30 files changed, 172 insertions(+), 2093 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome

