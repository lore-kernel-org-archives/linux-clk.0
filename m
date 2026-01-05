Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22E20DD72
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767646055; cv=none; b=uvWYpxwX/INjWaooZxPiFpILJNZ3wY2e8Wd8972Hxx7wG/P9SEIlpCAmB/ErZf6PUQsBVU4GlR15f4+VPP6t/cK0TqcwgFbmLpDpwbVcNEtEhEtUEG9WzsiCwKd2sWrVTR6fYbBDMIMwDW7hkCkyomDyIToB3I6Yk1oMhfDzdAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767646055; c=relaxed/simple;
	bh=dc0zisSHVFG6P2kqqXxYcNmJbRYo4C1POIDDOAhyJrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NwkdcekDLwQegbNSnJWckzETTfpXd6HDc66O2HA34s2DoUD6X6Ox9oaNiBVS7axWPgduxBeEgmVW3RV4MwC42X3i0f3eYOVknhA6CNj4r8lqgdDygyfcb3S87TgSNLjl0YlREmY24c3XittjQsCD4wDUT0CQjhH9670amWbTrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Sx0h0QR0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Sx0h0QR0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so3713523a12.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 12:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646052; x=1768250852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=Sx0h0QR01AAMS/VTsOmJiF70hyMJUQSaWKkU/vzhmjvhZDzW6f4cikS7mJCNKdy+rK
         GUzzbx0h6GOvHm3GPvxGp52YPKLgXqQmWcgJyU10ZVudpxFNL+01VmSE0HaGztYRolhG
         m5RyX/c1TcqANIMj/w2+EjTA7CderlH98Z4AtxrlpylQaee2Yfu6ODP0TKun+Gl/BZZb
         8ENQAtfSVa54CQ4bpVIP4ukB4MBmrJc7Lueke0t9Qnf9NnPAgwSzBBmKOIUjsHW8BEWO
         JrSXsPM7OyXqhek7ZuCWIhssrA/g/eCxZ+J9DY6aUGuFsLeYLMT3AoxoRbjgjLaS7ZSl
         ZZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646052; x=1768250852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBZeQW3rLDeCb+Oyy+72B5gGlMwUgX2Swy873t0yAQ8=;
        b=Of26d7ZXkTuvLGv0vdpmkSsBwo8imLtUW+PnXGmjoZB2a/LB8o1Da6b7j3ksSrZCRb
         UHcbAp8dk8zUUjgjgnHFT5iC9H4KRkmH/ZEceKygXBbWEKYIgq61kRWjhihKFThQ+4Zf
         si9HF3ZbtgYD1OQIowDPimv2YMfJYz2EWRS2UBtaVNB7OxNI8pCug3L8pkHM0MdASJkT
         PpsMdnBvbhUGpGX3bc9yRa0VrUsZoYV1qo1Ek0J9GrWKvTKlLH6Gd/EtgPUZcZe5ELtX
         nqMZZcXkhxIF4cugBPJDxXJ5qwxdwne9FwxTVl28qMdTI8wBa3CmWdWyGfV7TmxCdkdE
         y96A==
X-Gm-Message-State: AOJu0Yy/xNrGVX9HlOx2Sa64cG+nnSCGGu9qpLMrlnScALnYOVM2DQ4r
	uwKwr/iNWmJZlLoWYI+OhDnZKds2J9/WkgHpGr12s5jlCg8J/H3PrDl0eM0XeA==
X-Gm-Gg: AY/fxX6JnFbS3F8kHwzjKX+zzvyE+/HK6ETqY7NVkYZ0/1hkULFaX7a9SeudhCWLAkz
	/SPQNmfMnKARCTma0X0QCl6jqWWbbBlojwO0IWrzDI1us8WK44D6RWeDS1zLtnqrJmYhTZiw9gm
	1V0ib000QzJ1FsNgETIyFYM89PXxKkfUFDHo6KwXG5W0Q5tMhnb0JbkOM098rh15bN7YHUvZww/
	s6VHGbpVLP4G6ikBI+dBT/idimpdAshngxya2fMwv/NO8uDClkMv84nvcpUTBh8QYaYpzSSgv2Q
	tan1Tntnpc4UdAqvHGG6AJ8pDsjC5pnfzEo1l8sGG2jYuUTYY3z0PIYItTu8GrmI8fZpKaLCXcX
	vLSBxN8NTnvwckuz/q+776/siPYD4UwfHzpIlllSJJjMpU9iwxpGMhZw92g0eGLsPtoC7vlfy52
	u0cv3X99nKM2R5CsV2T5NnkWamOQZWdkiNUQSZoEkvJw71+4+0KYeAB0MTfx0WA3151ikkz16C/
	MbUQojeA4DVsobYufC9oMzgqyByJkiGY6lJLcg2Aw==
X-Google-Smtp-Source: AGHT+IG983985xcXDR9yciOy4mjbs0yhKZ2yFQoVEgq36/qbmuPPSyYeCXHNkblnpNi806zQM2DtvA==
X-Received: by 2002:a17:907:3f9c:b0:b80:3fc4:3762 with SMTP id a640c23a62f3a-b8429892021mr46330366b.1.1767646051708;
        Mon, 05 Jan 2026 12:47:31 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:30 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
Date: Mon,  5 Jan 2026 21:47:07 +0100
Message-ID: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jerome,

this series contains two fixes for preventing HDMI PLL OD /8 on
GXL/GXM and G12A/G12B/SM1, like the downstream driver does. See:
- downstream GXBB code: [0]
- downstream GXL/GXM code: [1]
- downstream G12A/G12B/SM1 code: [2]

I have verified this on GXL (Le Potato) by setting HDMI PLL OD1 to 0x3
(which should result in divide-by-8). The resulting frequency reported
by meson-clk-msr is double (meaning: only divide-by-4) compared to what
CCF sees.

These are not critical for now since the CCF code-path for the HDMI PLL
is read-only (as drm/meson directly programs the registers).

Additionally there's a cosmetic fix to use the HHI_HDMI_PLL_CNTL3 macro
instead of calculating HHI_HDMI_PLL_CNTL + 8.


[0] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_clk.c#L505-L627
[1] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_gxl.c#L501-L553
[2] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L671-L721


Martin Blumenstingl (3):
  clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
  clk: meson: g12a: Limit the HDMI PLL OD to /4
  clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

 drivers/clk/meson/g12a.c | 13 ++++++++++---
 drivers/clk/meson/gxbb.c | 19 +++++++++++++------
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.52.0

