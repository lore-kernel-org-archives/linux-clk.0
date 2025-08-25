Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E772FC896
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132031; cv=none; b=BFfVs4+tJ2+Ud1Oy0QD0bqZQAwMVxJmiGKX52NqcGk/MlA7Is03AHUDB+qVs3v/bBS2lInrfKdoJl5nHaWJKqc98Fm41FqoUh72bC+/lsRMFEOVnUKThJxdCiqVXg/ODYhM001sApHTZddjmQijSvMfrKAWP8qWGjvfnO9On/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132031; c=relaxed/simple;
	bh=vxjTLfTS0NUMwpDSn+HN798wL4RTF+UPuBLyZzIgJGQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UACTrDjUcDFKDDedB6DsQzBKj+/K1Y41dUh0S/ZKdQFrkDOeW3fpCYlmrGDwMV+HhA7uwJY9Esq3+kc4dliTWyrylgH0Jh7tmZgkn5LMnsgjgpf8ft9/pDODWLtNoS8qEzyMjpa3nFNIc34a2hUD2RERH+ErbkDWAHmJh+ZpGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CGc2p8Qq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CGc2p8Qq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c6743a10e3so1665413f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132026; x=1756736826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Lg1z3zn/UH4r0LtOjxUmVsZgN3Hor8KuWD/ZELRBh0=;
        b=CGc2p8Qqf0YQbJU7cyRMzo/2KydF4gXUB3aYGwmkqoOI5m0hvTric2XqjtDbECP/wQ
         N/aCpOVm3hQoWyCcYA7fm7BYF2QsIb6zQVV7HR7+fPSs+Xs+5zQ7SG7b0RyDx5TM0WyK
         H6xtT74EFFKpnMv+DbIRSrubnJoP9obf5bNbFNieuPAl/90vhdG1s5K1hiyjjT6hkfwD
         l9ATtVrURUpBun5kpaJBHcNBdzlrfRUwz+ynpVXM1t0g4YNMDkZ2rJM4yKfN2/Y00fNu
         tQeH1qKnY+nQaiqOmesP7AGktBhZezTh9wqEEzn821wQLnJMlmIFljhW8Py4yI8NTnLl
         tVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132026; x=1756736826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Lg1z3zn/UH4r0LtOjxUmVsZgN3Hor8KuWD/ZELRBh0=;
        b=JX6YZ9YE0PQXmwxGbnP7bgwcwzVbLjPT1ZW6d8XYg8SaknocZA8qrsDwyV2sRUOuSI
         thdSD8B+A4r1yiJJsZ2NWxKVgjA/tz2kKOwLH4l9o6/XSyWF5gFv78MxZLA5Rdq/C+SQ
         QJEMlspod+Up1fvGRHyC04aj3qQdMIkw6f/8go2QIQtfPwWkuur9Q8HQ7mI9NX0cDLlF
         koJs6bw+Jam9VbIwRoBbShP97kpuMTgKHRJgtrAWnw0TGpUJw+QdpiHzck6NG0Pc2JzE
         TlHxzwrZFpkpVx8S5g99Gw/UJ0Sta/a54rTDrS9o64P38LwYRexTaJ/NI68TSe9va6ku
         DwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQcx2rOWgslcQ4gvMWkzcwgVUfcZKrTrp5HyupwrS2JbWNZyEpwviEziwehKWW+nEBTK08pkIefJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziTPv4Ah3W+G9mB1L9gKVLi+CRWXFyFSipfpPsxdHBYs6LS20J
	Pmx4uqZWyXhZB4K2fQ0G1GgILgC1pZ4II6Of4W5OCnjYkggnHC0GI/eoNp+9sd0YLOg=
X-Gm-Gg: ASbGncsK3pFv1MP/G1pm3eRgYMytPYjOZBoJMMaoBEsbErr6FCgKHL1yZCsGx/LTXDh
	HUc9koP+i/+VjAPCiNC/Q0oQf2Vdep0CFfDfGfi0MZeHZ4nTAkP1FcmewB8aLILsteUm0ezj5qP
	sZiY7S6zZdv1ELddHbAiGEpxqPFDA8qiHDnSOMNva4Yipx5VcpjJOH7fp4uKxs+UREFaoy4JfK3
	3VZKtjtkQbLPqcXn9uuvPiqAdJAor/hLhAhlMxDPwF1eQBqxwXKKHONhb4g20/tM6d+WzgxMz1j
	RKyshQ5oIZxPfOUKUcsiqkouLt4id7PVz/dh/XFKts4X43IQRwRqDDlQXeAWt94aSSoBDhaaNVJ
	CG8hzzQSUXFE/XGGs4u88c9J3gUFlpJuGKUex
X-Google-Smtp-Source: AGHT+IGIm5HhkMTlZpIc0I/Aq/oUEmfvFMlFEP9hvRASgNmV8E2415cUxZAc6AkOB9k80NT/htY1CA==
X-Received: by 2002:a05:6000:2891:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3c5da73f498mr8433827f8f.3.1756132026099;
        Mon, 25 Aug 2025 07:27:06 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 00/12] clk: amlogic: clock controllers clean-up and
 factorisation
Date: Mon, 25 Aug 2025 16:26:25 +0200
Message-Id: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFyrGgC/22NwQ6CMBBEf4Xs2ZruWjF48j8Mh1IX2QgtaZVIC
 P9u4exhDm+SebNA4iic4FosEHmSJMFnoEMBrrP+yUoemYE0GSRENXAKXrn+lcPWf0ZFRhl0DWN
 FpsQK8nSM3Mp3197rzJ2kd4jz/jLh1m7Cs75o+i+cUGnFWJ5cZbF1hLfGzr00kY8uDFCv6/oD+
 S/mI7sAAAA=
X-Change-ID: 20241211-meson-clk-cleanup-24-41cbe1924619
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vxjTLfTS0NUMwpDSn+HN798wL4RTF+UPuBLyZzIgJGQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKt5oWOLMmGYVXWzR3WIlcusXMT3KwLXhoY2
 cVnl8ZqDrmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyrQAKCRDm/A8cN/La
 hQRfD/92fDnjytwS3w66LZUOZp6IeRquIYzWA9QPc4ipZVKAOww1Wc5099xHqaEJiUCkRvD6d3r
 5jU/DFZWZxYcgfDCZt1efmzbxd6d+U9GWX7EJDE9vpEaZ2Zoc0QBDVyp/YyxWqEn8EZ4sVwNp+K
 5qZgAd2bOdvDfbtG/8IXAeLFwd0PSuj8WT1z4BVvOgW8bOKxx2YvCSzcXQPVJEY+LQQpso9tMI1
 xiOh4AEGmpoMWCWid1iwlAgc40Q9OvN3cIGBri5N336/113HJ+mlTqsOK3XKcPhjIG0Abjk7QI2
 2YGrpbbRjMp8QgR+P1MI9JzWgX6CJ3aL4TG4yyjMCfCqGNebGhyBlBte5DpqDLfIVYqN/5cQUSn
 flssKpdR8AahvURmLwSSkPcA6URbiJsi72JitUplD205OPVc8a5UZBVd35b+v6uZvnbrSCtQ5Gf
 P5SFTUNeUYPFodTF9fmqGt2vlN0XgqnZDl76f7aHtz8JrTmCy3ApHdHShDKVrFqOQ6X2U11JTNy
 57TzyJcIj1XwLev+vIpTBMgkTSMrmRILViGJ9zE7KhzrHalOc7jFtCBjtSBSwMIXVKMPe9tqEp9
 61PpYQJr2u2zFMV25I5e1OQhXIZuA1hSYPWVXLWbvkzTSBH7NCRl2BXlfCeMXnqvk7ZCsNYCLzq
 NCtHyu9uVGriZGw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The work on this patchset started with the submission of the Amlogic t7
peripheral clock controller [1]. This controller is fairly similar to
existing controllers. Once again, it redefined the peripheral clock macro,
the probe function and composite clock helpers, even if it is almost the
same as in other controllers. This code duplication trend has been going on
for too long and now is the time to properly address the problem.

There is clearly 3 parts in this patchset. These had been sent together for v1
to show why what the ugly first part is useful. I was initially planning to
split that for v2 but, given the minor changes since v1, I did not bother.

While all controllers are doing more or less the same things, tiny and
often pointless differences have emerged between the controllers. This
makes it harder to exploit SoC commonalities. The changes to realign things
up have been applied and squashed. Now it is possible to focus on
the (slightly more) interesting stuff.

First is the factorisation of the probe functions so those stop being
copy/pasted in each clock controller drivers.

Then the clean-up and factorisation for the PCLK macros, again to stop
copy/paste but also remove the silent use CLK_IGNORE_UNUSED.

Finally the introduction of macros for composite clock definitions. The
same duplication pattern as the for the PCLKs started to appear on s4, c3
and t7 composite clocks. Done properly, this could also help reduce the
verbosity of the older controllers.

With this, the c3-peripherals controller may be used as an example of what
future similar controllers should look like.

After this, there is still some house keeping to be done in the amlogic
clock drivers:
- Moving remaining reset drivers to the reset subsystem
- Proper decoupling of clk-regmap from the clock controllers
- Reduce verbosity of older controllers with the composite macros, where it
  makes sense.

[1]: https://lore.kernel.org/linux-clk/20250108094025.2664201-6-jian.hu@amlogic.com/

Changes in v2:
- Dropped applied changes
- Put regmap config on stack in patch 2
- Link to v1: https://lore.kernel.org/r/20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (12):
      clk: amlogic: drop meson-clkcee
      clk: amlogic: add probe helper for mmio based controllers
      clk: amlogic: use probe helper in mmio based controllers
      clk: amlogic: aoclk: use clkc-utils syscon probe
      clk: amlogic: move PCLK definition to clkc-utils
      clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
      clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
      clk: amlogic: introduce a common pclk definition
      clk: amlogic: use the common pclk definition
      clk: amlogic: add composite clock helpers
      clk: amlogic: align s4 and c3 pwm clock descriptions
      clk: amlogic: c3-peripherals: use helper for basic composite clocks

 drivers/clk/meson/Kconfig            |   13 +-
 drivers/clk/meson/Makefile           |    1 -
 drivers/clk/meson/a1-peripherals.c   |  177 ++---
 drivers/clk/meson/a1-pll.c           |   52 +-
 drivers/clk/meson/axg-aoclk.c        |   45 +-
 drivers/clk/meson/axg.c              |  118 +--
 drivers/clk/meson/c3-peripherals.c   | 1338 ++++------------------------------
 drivers/clk/meson/c3-pll.c           |   49 +-
 drivers/clk/meson/clk-regmap.h       |   20 -
 drivers/clk/meson/g12a-aoclk.c       |   73 +-
 drivers/clk/meson/g12a.c             |  206 +++---
 drivers/clk/meson/gxbb-aoclk.c       |   43 +-
 drivers/clk/meson/gxbb.c             |  204 +++---
 drivers/clk/meson/meson-aoclk.c      |   32 +-
 drivers/clk/meson/meson-aoclk.h      |    2 +-
 drivers/clk/meson/meson-clkc-utils.c |   86 ++-
 drivers/clk/meson/meson-clkc-utils.h |   89 +++
 drivers/clk/meson/meson-eeclk.c      |   60 --
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   57 +-
 drivers/clk/meson/meson8b.c          |  190 ++---
 drivers/clk/meson/s4-peripherals.c   |  678 +++--------------
 drivers/clk/meson/s4-pll.c           |   60 +-
 23 files changed, 1034 insertions(+), 2583 deletions(-)
---
base-commit: 4c4e17f2701316e0cac16e19366056f464feded5
change-id: 20241211-meson-clk-cleanup-24-41cbe1924619

Best regards,
-- 
Jerome

