Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454FD372057
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887237; cv=none; b=RMS2pgJFNS7x6Imj2W+gsPxv/kFh4w3qtoEZAKQK/FXyUf/wOVsGZ1gcGjhQuUSe3CHBmjuK1AukoqF/F47/HajkolnxKhaclKIh1dL/EaRz9Ifau72YI4dcSiudYAWzu2R+9c3QItZzL3Blvv61fVTj76DkatVbZxc8E8uVe+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887237; c=relaxed/simple;
	bh=fRiGDz/PnXRxujzQJocylPslpViJhpqWl66DtLpk2kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePRA3D4nags4SFHq9Y+w4JU979J7GZ50XLP6Ol4dgODlD9P5pRBVWzOQPYla4ZZoB9k75DDV4C26AQVvvBPEK6LcgERD/azx+V78zt//QOIDbBV+U4Y14czjpt0O6RDMaV5NBghaMIRllvzTzESi7TyTbsCQq7XKlMRw6Kqj9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ozNIG3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ozNIG3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1158657f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887234; x=1782492034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IwVlN3yJGrfyQnit4rech+V0QDajwRA0nwH1Dul5Uo=;
        b=h4ozNIG30Gi6nK5o+bKnE7J44N7BnmP6akMCh9pBJIJt+HGwJDeF/YaZhnxmdU4e/q
         Pmr/j84p9p18ZzDPLoc4UqR0zVV3rcCM1TTcSImAvyvXBAqm6K9tg0HCoqaqLKkd3jpP
         jISYpXqSpL1UXCMV5SLOmHhE4Rpnw03e2hMuOjk/TMMGKsKo3KuvlK6MpxIw/F2vm0B0
         EngpT4RAsS32cfm4Q42iFGr5IKKb7qzRUr8wa5XrPGqinkTTZMbjezDeHw71BgyF6OS+
         UVdEmj4mhWUB6OHr1dOO1808N1RDiPZgIum7V68AUAVVUKpYcvROxbznu4E4eoSQiVmY
         K7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887234; x=1782492034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IwVlN3yJGrfyQnit4rech+V0QDajwRA0nwH1Dul5Uo=;
        b=lNU0G91i8KWMNltIwQN4RNwb9JqQ1eYiGUGY/qxcJDr8ayFBTeJfuRrJPIEWwi1Wvf
         3HNKWzZp36FWekV5Z44lYVaE98tTY3ifOt6jRzsQtq63wyfineAY8JHPyiQOEbwrKFTH
         5homq2YrxPXeUkAAOtBLYXJ5HuwGwKHe6fQkGAvucf637hZLKGqn8oIGkSR6QZ1Nd2Dd
         2F7z8+z4JHjJS3b0j2J5p+XF6ngKo75s+WmquWC+xdZxWqoGBXQQUzSLzKO0DmgjhGph
         57/ZE6U5iCHw5uaL3es4cEM1kIhEUGtJibicPIf2quyf7HgvitLf3l70kI7IVjGmImLG
         5JOA==
X-Forwarded-Encrypted: i=1; AFNElJ9kOCqFIOCEEKm2XwpJBsWhd+7Q13PyJekD29dRm/cF6dHGxVrE6E6ymKJ4zoYPXYwJ56HoSy0rnCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4UjzRcYAmpM7cIKpKB6rVWMpQLw5JgyrQns0pXJHiyM2eWLB
	d93IeEXdO90ag+IiOx0JaJgnF9YbEbmJmHMJ3QpdCKQSmXDUSKwOSdBW
X-Gm-Gg: AfdE7cldHsibvY2FXQLUVWe86xM4LqX88cowEn8x5Rg8rRFypbRGsXJn5n/orWhRprh
	ET9tidb5LbCaBc/dhH5lQZmJUYWstoJz/TbrNSapDTd7MOylvKajqHAk2rNbMou3kZFEHMj/3SU
	yvkel8PN8SluQpC106TCpRNCDcaHOwfHptdazZatg0eyFmt7KvQ+TFlIJlW9CKAG4Z2Ted8sBoG
	oNVzi5HCv3zoKHyDc1Aoh8kaO2EkY3rajtx2bH7GPC/mfMyYyQpFSwEaRzrxHyV6NRdH1QPEeFZ
	w/euA58Oq80LNJN8EEi0RUg3S37ZrmXwyYFk06Ft5wq4EiCVV0tHrYys3cSL3zRb/tjEdRgQ5OC
	GplFkcLn88s2IpzWNcU7O9gU3sUBeFHqFZdgEA3lqhWT1tWdLpuaeqs9wCO7faGsMpVxUZp67TJ
	voyJ/kyxIEG0DWom+KO550ltOiGe1H6bn85XBtPVlq9VXOSaeK
X-Received: by 2002:a05:6000:2884:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-46581cbbe76mr5269641f8f.9.1781887233482;
        Fri, 19 Jun 2026 09:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/6] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and LVDS clock support
Date: Fri, 19 Jun 2026 17:40:20 +0100
Message-ID: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
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
 
This series adds clock and reset support for the MIPI DSI, LCDC and LVDS
peripherals on the RZ/G3L (R9A08G046) SoC.
 
The DSI clock path on RZ/G3L is generated by a dedicated fractional PLL
(PLL7), followed by a two-stage divider and a mux that selects between
the LVDS path and the DSI/RGB path, each requiring a different output
duty cycle:
 
 EXTAL->PLL7->[ DIV_DSI_C | DIV_DSI_{A,B}] -> [mux: LVDS | DSI/RGB]-> vclk
 
None of the existing clock types in the driver could express this
hardware, so the series introduces three new clock types plus one small
piece of supporting infrastructure, then wires them up for RZ/G3L:
 
 - Patch 1 adds CLK_TYPE_G3L_DSI_DIV, a two-stage divider
   (power-of-two DIV_DSI_A cascaded with linear DIV_DSI_B) used to
   derive the DSI clock from PLL7.
 
 - Patch 2 adds CLK_TYPE_G3L_PLLDSI for PLL7 itself. PLL7 is a
   fractional PLL with its own parameter search (MR/PR/NIR/NFR) and
   programming sequence, distinct from the existing PLL types in the
   driver.
 
 - Patch 3 is a small preparatory change that splits the divider
   "flag" field used by CLK_TYPE_DIV into separate clock flags and
   divider flags, so that later patches can request divider-specific
   flags (e.g. CLK_DIVIDER_ROUND_CLOSEST) without affecting existing
   CLK_TYPE_DIV users.
 
 - Patch 4 adds CLK_TYPE_G3L_DSI_MUX, a mux that additionally tracks
   and sets the output duty cycle (4/7 for the LVDS path, 1/2 for the
   DSI/RGB path) depending on which parent is selected.
 
 - Patch 5 wires up the above for RZ/G3L: it adds PLL7 and the DSI
   divider/mux chain to the core clock table, and adds module clock
   and reset entries for the MIPI DSI and LCDC peripherals.
 
 - Patch 6 adds the remaining module clock and reset entries for LVDS,
   which shares the same PLL7/mux clock tree set up in patch 5.
 
This series was tested on the RZ/G3L SMARC EVK [add testing details,
e.g. board/display panel used and what was verified - resolution,
clock rates measured, etc.].
 
Patches 1, 2 and 4 depend on each other only loosely (they each add an
independent clock type); patch 3 is a real prerequisite for patch 5,
since patch 5 uses DEF_DIV_FLAGS() on the M2 divider. Patches 1-4 are
core framework changes with no functional effect until patch 5 wires
them into the RZ/G3L clock tables.
 
Looking forward to your review.
 
Best regards,
Biju

Biju Das (6):
  clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
  clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
  clk: renesas: rzg2l: Add support for divider flags
  clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
  clk: renesas: r9a08g046-cpg: Add MIPI DSI and LCDC clock/reset entries
  clk: renesas: r9a08g046: Add clock and reset entries for LVDS

 drivers/clk/renesas/r9a08g046-cpg.c |  67 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 501 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  31 +-
 3 files changed, 593 insertions(+), 6 deletions(-)

-- 
2.43.0

