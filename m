Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3002E6CAB
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757677024; cv=none; b=c8Yz4+JQA12hDrWfpLR0lEPfUrQ8948pXuEDn3CmeLuTA3vEVhX03pDnIrVU9SzmSQaObQJ8tPRv9TbNB4mKpP+wmlt8lQRXzUJI020lYncuYpSschHQbMswLhBpH4XIGyIDhTpBXozbczo0vfO2sC9lA63G3UYSw48nTxnl1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757677024; c=relaxed/simple;
	bh=W/d05Ah4gZEm/6xcEdlciMhi/OilrDK1p9IjJYcMRLo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RRalK7Phyvyg6RrTDdQNJvuBVwfMgO2kwvoXDIKGOHVIiDyuyaBNt5l/s6kNJ+haevKRnYtYbt0F39soqRa/G9bgGiOVmb1QwLBRU9EUcB02VZS0zaLb4orD6XyiZr1JVzdY3cNjzk+Ssjvd75GDo5pr9EcErT53H2N0dOygJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyUbVphU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyUbVphU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so10729595e9.1
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757677021; x=1758281821; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tbnb5qYeKlx3hN1o2p4vVBHs68NjGI4FeyMjq9mKLyM=;
        b=fyUbVphUwVUmze5Vc/3hWFiAOvxhvLkhzXwzmf01l1nWYeTawF3/PyTagKYa8dbNom
         XAZyrKhsJtSDj77tZ+heZaBH3IQZni7TVr2vnmmX3rlouWyGNtLqXNLqBoYEIRLCM1da
         akObx0gAM+zJpd4mZPN3P/6EWpSjFABBgYxvAiqK7diD028/isOYgbqTSWcl27VbEmgt
         dNc6HSls3XRuUh5TnXflGGI10Fnb9cPHZUlBacClXs7RTCQwUVd5aymtyi6No0kEeFDJ
         B0y/zTzKWRAWncM4yT8CR7y6X04mY2g7pnLfKGmmwhhucrtp0GEL7ygq0+YDZ5wFPBlW
         8uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757677021; x=1758281821;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbnb5qYeKlx3hN1o2p4vVBHs68NjGI4FeyMjq9mKLyM=;
        b=A4W0lw2Ed1uXULPMevERmnAHB+i4jYwu3mnP5heQl3sAEF6PcPDeUqwTLRhGW/7s16
         eLltX6y7JI1PiIEqSSpVxvpEEpMlWrttMOvTcT/sac3pL39HPkVskxeq0fIulcJTDhY4
         zYAkg1sGpOTmf83SaL5urgcyTiacsGkwKcJg0rbEOWVVIaZnulbI/Tgtc/Rl+QleW7VO
         BH66Vpfygw4WcMg9+fOnK0f6Hmj8ZiewksPlwkmmSuQKbC+MX+3U3fRMy5Txk6uCDAiI
         aE0qSziCAVh21rOAAhgNn/SUBDOGY3/5IId5EHlOxRX2U2PRDFJ7gkhrBmbNl19oSXn9
         h9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWxkNd/lCGjK+3we1v1aaBhEY7wvCBIG8nzedQ5yUuQ4XE3OeEFinZMPHpjQQnO+9yF7VFr5MpHazI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzsqKi1kWzrN2+/GG3ulcIqfyMIUO7oDSM6L5rOw0+ii0aRchS
	WspwYKmLrWy8ll7rVg13ThtlQKORpV4x5q6R54ZJmADPMTAGCZP9YJTW
X-Gm-Gg: ASbGncsoyxUKImYO41ZdYImuAlulFDeE00xDfyk/JiqRya+I2TOVTx2Q8sN/2Qixjm9
	4k+bh+hdTFHX8Jq19zhHYtOgt3TzruwHKjC7l+JLIAz5G848u5INCguZaz4b6P6ftqPjoS07I6B
	HHdRqhP1ztPPlhYKJk/mt1bqqvLL+IhwHkvoeCXJMI5lCz1X3ppXhSbCKGYqi2PRZv0VXUSpnc7
	XNAngrzRxSijplzDS/jk7zkyuwbnNWQhI+bkzF5IeXp04W9IxATTQkIU4FCHQ5NFc2riIw3oxSV
	7AAWLCfx+Uwc8KJUZJmYhbGCIv1RZAPiEKaTNJZkP6mIxlwKvnJbvBQzUUlwCanweZLHj6ueIgx
	lAHKfcFfcGaHUBgrDMN12YQktO3aLy2TsjQ==
X-Google-Smtp-Source: AGHT+IHD1EhTqy1kILkNX4aqLwbC3vOYUogeq+zQjgxWO9vkCOKW7N3eFQcOHrtSmgitSOXwjOi+4w==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr32051345e9.24.1757677020864;
        Fri, 12 Sep 2025 04:37:00 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015621a3sm34806145e9.0.2025.09.12.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:37:00 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [PATCH v2 0/5] STi drivers cleanup
Date: Fri, 12 Sep 2025 13:36:07 +0200
Message-Id: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcFxGgC/zXMQQrDIBCF4auEWdcyWoTYVe9RsrBmTAZqLBokJ
 Xj32tAyq394fDtkSkwZrt0OiQpnjksLderAzXaZSPDYGhQqjQZ7EWxeKQnttDM9Ov/AC7TxK5H
 n7YDuQ+uZ8xrT+3CL/H5/hJR/okiBQo/tyBrrlbpNwfLz7GKAodb6ARkGYeycAAAA
X-Change-ID: 20250908-master-5c5c980cfb03
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=W/d05Ah4gZEm/6xcEdlciMhi/OilrDK1p9IjJYcMRLo=;
 b=owEBbAKT/ZANAwAKAechimjUEsK1AcsmYgBoxAXLeqm8EM6Ln+ijCpBNbKP4K9a1DvPX3NsAN
 IYYCf+yf5aJAjIEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaMQFywAKCRDnIYpo1BLC
 tQGuD/dVI8gwr8NeJogDt/gJ257+fspO6NaaYkH/dEvRdGjup1CfAOfmAiu632NRwxuhcnBapPz
 /A4h/qVY5OFES7fLAtA6cBemnuD85Lgt/gKhMnkQaVNQeIrNDpCPEJnwzgs3QTQFc1FABo1PTvK
 mAfl4wTDBWmiHcuV/0/XzM9EGj8cxwOlRCugHE8ar4ff4/8On/eG8wdYbPkeqVxhZYoaXuYcsyV
 nkv2lqZTJrxK0/fKv3K+HVm6myXgv+EVUmhtxtjYPIlenUrVXP8OnfIRq/9rSXq/AeonG+A2f+V
 25LaXemjFtPFelIfrpAf9sdOZCA5z5t6JoYSLjhAaMc3UbF8Fgvi+ykgkuO6zhpeeWSAsDJ4OMg
 72FzCauHRkZ0NXwLebFweKXtbdw0UcnShdZLlAVgXUbzSEb4SlQVBD0SynMoi52zNoA8XWvR8Ow
 nEsp1c8FAjQnfQF+tJW5pwZuOl5J4OTHIhArBUHDNzbwaJUEtO4Zn3Pa5yRghrEdT8vIhXKSWPk
 u0j7RxMgLY9WJ9qBzOs//PPK9OUReku1RrHC76pQuZJ5xzMvtL23dSZgkn7Z6rXgbOQK6+/D145
 XyR/JO24SaQKWLBt7GLEoK1EPIo6QN/FaBukh6xMD1AYrwcW/3MNZaO/DpIpRjn3NqE/HQRD7VK
 OztxzeMRN/6m+
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

With B2120 board removal[1] several drivers are left unused.

Remove the following compatibles:
- st,flexgen-stih407-a0
- st,flexgen-stih407-c0
- st,flexgen-stih407-d0
- st,stih407-c8sectpfe

[1] commit dee546e1adef ("ARM: sti: drop B2120 board support")

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
- Fix Patrice's email
- Documentation:
  - Remove media admin-guide c8sectpfe description
  - Remove c8sectpfe dt-bindings header
- Driver:
  - Remove c8sectpfe media occurence in platform Makefile
- Link to v1: https://lore.kernel.org/r/20250911-master-v1-0-5d5d5ea9af22@gmail.com

---
Raphael Gallais-Pou (5):
      media: c8sectpfe: remove support of STi c8sectpfe driver
      media: include: remove c8sectpfe header
      dt-bindings: media: remove support of stih407-c8sectpfe
      clk: st: flexgen: remove unused compatible
      dt-bindings: clock: st: flexgen: remove deprecated compatibles

 .../admin-guide/media/platform-cardlist.rst        |    2 -
 .../devicetree/bindings/clock/st/st,flexgen.txt    |    3 -
 .../bindings/media/stih407-c8sectpfe.txt           |   88 --
 MAINTAINERS                                        |    1 -
 drivers/clk/st/clk-flexgen.c                       |   80 --
 drivers/media/platform/st/Makefile                 |    1 -
 drivers/media/platform/st/sti/Kconfig              |    1 -
 drivers/media/platform/st/sti/Makefile             |    1 -
 drivers/media/platform/st/sti/c8sectpfe/Kconfig    |   28 -
 drivers/media/platform/st/sti/c8sectpfe/Makefile   |   11 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.c   |  262 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-common.h   |   60 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     | 1158 --------------------
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |  287 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c  |  244 -----
 .../platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h  |   23 -
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.c      |  235 ----
 .../platform/st/sti/c8sectpfe/c8sectpfe-dvb.h      |   17 -
 include/dt-bindings/media/c8sectpfe.h              |   13 -
 19 files changed, 2515 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250908-master-5c5c980cfb03

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

