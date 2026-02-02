Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF572627
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061621; cv=none; b=mXsag19syJmS7V+iSuS8kWVlQV+tB3HmuvGjXc1pkotLhG2AXxdh41/Sq91zF5gz6PvTrHplfikD9ucROMOOdo+l0GZ1AWytmT/ozn4qHcEcyR+rHGDdhxfluaX7mMScYDLkmNko/QImCBpesE4U0dX9OtOuAEsvJCvE5GO5dag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061621; c=relaxed/simple;
	bh=eQU/XZ64Wclw2y2Fa9l2QuLfg/GOnWVXwSFwhzeu+OM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EQvfKOH5MVpe48ntDmgNgyoi8BR3Z631QSK6eLe9Dh8h3MUiCW318lCWg+lPQy026JC8OZTOwhbyJn/PUWmeVSs6pEsH4h0YVkw2ccSnp9H79dIxVYGJqu31uZtHp2MXRvBqmK2CUHJOCmi1J+LnZ6P43WpU7mth+KlOFvQOWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eURwga8R; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eURwga8R"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794ed669269so1857237b3.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770061618; x=1770666418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u82dPfWkZFveIydXJfE5pfWEOGw2ni/TqG+rcgpwY6Q=;
        b=eURwga8RgtSpUcILxTdtCGcelfaYo3fjnqQMq96dh1qdpGyKoThPR+rWlThgaH79B5
         qmJ3WgJLda4WJKTIjC6gOG1W1d0AVJTH3OxdRx35EEdP/2TCbOVhqBX//s6cefwV2kUw
         g263FyQd5QuOhHjWBJEb0F3ctPpl+IW5SFz0GsincPoZ11Un0LT4mg9VZHk3GBuXtMgR
         9RAap4lL8s9chuMcgVN5QtP4e6wPQIahNa2mJ5amVteFT14YPx0grQ+XJSPABVgxPrIq
         f++mHA2BwhYLfYskZ5c6EjF8Pd801g7uAMQoMxQLlFSiFu9hRJK5+7vFd9MJNhpylMP3
         YVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061618; x=1770666418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u82dPfWkZFveIydXJfE5pfWEOGw2ni/TqG+rcgpwY6Q=;
        b=jSCVEGhNRtIyTB5HwJO5m5DiLvVKIHsBJW/a7/YC2wm+CqojwUroKKWysLplG+ipmj
         4SZycW1Avqo897O1Swor8FGCKRAOrrBANETdPw19t013AeoY2eu3xRvMKoC2H0WKBMRE
         LoY37nDE+9fraJi136vDUwAlAe/Frz6WOjLg8N/3yc46wiPgIFMVFdUQ4pN3fgrxjhj1
         +WDcfA7lrDHUZFH05ezB//E3E9pd/fHNMd7psIT00VScFEch6T6JOU9vnp5pZXQR/TOs
         m9uKJAPHDPiVRaq3j0eqQ4xqQ2zSyUjCu+FDS6b16P23IYktqVtecNfwB3QTzpcTMlA+
         EHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZPPnnXlf5qNZyIYm34P0HlXPLjEFlD6EdoYZNaN1oa3Dr9/JbvBXznxTs2D9c3ZowEGcMQWTOmF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnp0lHfrTN++UI4Adb+uzKq1I9J9m2I+/I43BTN0DoepuuXOzt
	xF9Fl1Zs+7efYxcLqTfFSvC9S5OqYbVF/L9guoUNc4uvf0yM3i3364Y1x3tCrtDKkIM=
X-Gm-Gg: AZuq6aICUewm3dVHogVFpbtJl1sIrJOnbfAcrijfRtKXyrDV6pqpzSlzA8vYcfJc/TI
	bOKhnIm+SvJe71cNItbONMUsSHBgLSpTbsms3PNibM0grEq/oyUtiCbUdsFVaS+dMpY/jyAO2Y4
	p/H8R0dtRAFsInUNKW/THbgNorKgdyrOYFY7iEJfYHJy1U64CoVcVjhH29YaiP/Yt4Dj4iHr3ce
	YCd29ioZxIZhyPIM2sC9i2SQkaUuzQLRziKkEn+ZXiZ7B5JadjqLX6uI+clCDVN09o+GRd+kAtQ
	acovnUFyZGVNGtF5DFZ7TEHMF2tOA+P4tHi2JzhCs/yXcACFHqEcLnwb/gRXt7OCsp1UZvJQ+4O
	djZJ7Y0UZwROPKF8S4EHH0Z36yHv/edrCXIfTrqpv7WSGm2LqZnxLVSYA99hCglM6gvylex1Dg5
	+RqJ8WtiKYkhFGu10eM6BmVUfvNTrlwiqoHYKl+wx5A9vdUK67JmT3KscaKQBVbGMa+gC8HsCm
X-Received: by 2002:a81:b813:0:b0:794:bc47:df1 with SMTP id 00721157ae682-794ecdcb28fmr4723137b3.22.1770061617857;
        Mon, 02 Feb 2026 11:46:57 -0800 (PST)
Received: from [192.168.5.15] ([50.231.163.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794cd7241c0sm39493667b3.24.2026.02.02.11.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:46:57 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v5 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Mon, 02 Feb 2026 13:46:48 -0600
Message-Id: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACj/gGkC/3XOwWrDMAyA4VcpPtfFkmOl2WnvMXpIHGU1a+1hG
 9NR8u5zCoVA2uMv0CfdReLoOImP3V1ELi654GuY/U7Yc++/WbqxtkCFpABQ9vnS++yStJdgf5K
 cVKcsdGo40ijq1m/kyd0e4tep9tmlHOLf40CBZfq0zMYqIJVstSGmFiY8Dp8hpUNmvxCRfT7Yc
 BWLWnAl4farglWyRLoF0h0TvZf0WqKtpKs0KCDQxhgY2vdSs5K02kpNlRoa2eBosMPmtTTP8z8
 Q+nFelgEAAA==
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3

This series adds support for a multifunctional register block
called PRCM in the Tenstorrent Atlantis SoC, whose main functionality
is to serve clocks and resets. This block is instantiated multiple
times in the SoC, with each block covering clock/resets from a
different subsystem. This series also adds a driver that covers clocks
and resets from the RCPU subsystem, which covers most low speed IO
interfaces found in the chip. The reset controller is implemented as
an auxiliary device of the clock controller and shares the same regmap
as it.

The first commit adds bindings documenting the PRCM block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v5:
- Replaced to_atlantis_*/hw_to_atlantis_* macros with static inline functions in clk and reset driver
- Add Rb tags from Philipp Zabel
- Link to v4: https://lore.kernel.org/r/20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com

Changes in v4:
- Dropped !rcpu prcms and custom property used by them. Will be added
  later with rest of clock tree
- Link to v3: https://lore.kernel.org/r/20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com

Changes in v3:
- Fixed warnings reported by kernel test bot
- Addressed comments on reset driver bit set/unset value
- Changed auxdev macros to use inline functions
- Renamed bindings and clock driver to use block's name of "PRCM" rather
  than syscon
- Link to v2: https://lore.kernel.org/r/20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com

Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 945 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 163 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1359 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

