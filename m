Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE904DE21F;
	Thu,  8 Jan 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879610; cv=none; b=CXGAsqtSe+r97jNP+4HI3wVvVtsH6Z1Zhk9R+M2Wta5enQznrLdcU1zrC1AHDI//fY21vpb1HhCKYwNFCm2/I/ssLj/5q+rGbskpO+g2DVeFBsxjwRBXaFeqn42WFS3yZWAw2kAKav0PUxa60il4FAS1TQd3wtJFyYL0hpbA2N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879610; c=relaxed/simple;
	bh=MuM8y2Uhoh4FKJuIFjdGlqJrAk5DSEPIoFtnZoY3ULk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XowivHqor2kT3cT74lEKO3ytzvdpgq6gZDbKwSt8/OU/zdvDE8mLITLaVbMG3r6wvkY/MpliGGvCrDQzoBaFgbi8tXa8LeYk8BtoCUcPbzg38C2S19GnD1gwgu3bsflSm8vCvgiJeK8ZFzGSp28mfEjT6LigIQH9GqgtHE5vzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 60305341E78;
	Thu, 08 Jan 2026 13:40:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/4] clk: spacemit: refactor common ccu driver
Date: Thu, 08 Jan 2026 21:39:21 +0800
Message-Id: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAImzX2kC/23OQW6DMBAF0KsgrztoZmIMzir3qLpwwICVYLc2R
 a0i7l4XWqlVsvxfmjf/JpKNziZxLG4i2sUlF3wO8qkQ7Wj8YMF1OQtGroipBlRwIWivF2jDNAU
 PTUdtVWtdoaxFPnuNtncfG/n8sudo396zPO+lmGxKZpOPxY+rkbghXUqJumYgcD60ozOTOQ2Tc
 dcyPxPf2ujSHOLntnehjdsJxvtpCwFC13Nj0GhSTKfB+jmEMsRh0xb+K6gHAmeBm3OlJTVn2fV
 3wuFXUEh4eCDkDhQq6nSvtLX/hXVdvwDMMO/EgwEAAA==
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=MuM8y2Uhoh4FKJuIFjdGlqJrAk5DSEPIoFtnZoY3ULk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Oi7Ane3/Bmlr3fYDnKiV4OlduH7cJBiHlls
 FV8m2galrGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zohsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0KKw/+KMWHaB7O4bXGMBABaGHg8yx7uzzhCg1oaEIzE2Szl9psEi2UulqM8
 XuSL+ohsKh+ZE3eH8FbKrhAIdYmM21Jn+ielMp9DRyO8LGTQRbAXg0D4X1DPGDJaMnlVndIi9lK
 9HwyyaWDphVOP3WAw7rI2bAD/Nn+d4+6+JpiOIqMpwDkDusG+Zr4vDoRWNMm3CH4VsUB4daq7Ps
 czNtMqEmHPV6keftu1/jiC03Tro0dsj476kX7dVJQEEGtmMaFphm/mmrgU5MQ7eOACLFHTzMFzG
 dArTDc7gjVQpOgJNWwzsjwXYtyYAEdxn6JPOjg7yBVAqtPij3bc8fyIKAApAU20vQfCX1izGAtC
 CMrCaWex8hQWEKR+p+v31cFNBDiBydzp72rANvgsCmINA9WcOjCkakvVCQph0+M8H5hRTh7ItcE
 HKq4l8QECge4PiaMNb6yzJ00RVJQxYxy4ULxF7d0K9j8ssS0OEnMNJHIkIYKPKkhco7nzG66AW0
 MyL5K8iGu6bpWzpqDu7rmIZfE/wXrqFVlJLG6Mj0xcNA6FPQM9+CAuuu4RwbnEeTW2/46m7Nvp/
 yUDC4V/9v8I/hbhKmazKr0cCq+4jYaXyUaz97/90fAiwmIbsrlKrfH23tC0etQUmLdomAIG1fwb
 daXPDk7VKTgraiWRcwiom4N8kAZ47U=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The goal here is to refactor the clock driver to extract common part, and
reuse it, so in the future, we can maximize the source code usage once
adding new clock driver (specifically, for the SpacemiT K3 SoC here)

Since reset driver register via auxiliary bus which requires a adjustment
of the auxiliary device id accordingly.

This patch will depend on Kconfig fix for building modules [1], and the idea
come from K3 clock's review[2]

Please note, Patch 1 is needed for both clock and reset driver, so extract it
out as single independent patch. Then it can be pulled into both subsystem.

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- add runtime dependency message about the fix to reset break
- collect tags
- Link to v3: https://lore.kernel.org/r/20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org

Changes in v3:
- drop reset macro, and have separate patch for changing reset name
- extract common spacemit_ccu_probe(), leave SoC specific change out
- improve commit message
- Link to v2: https://lore.kernel.org/r/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org

Changes in v2:
- extract common header file which shared by clock and reset
- add SoC namespace to differentiate reset for auxiliary bus
- Link to v1: https://lore.kernel.org/r/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org

---
Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 191 +++-----------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 ++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 6 files changed, 215 insertions(+), 192 deletions(-)
---
base-commit: 99735a742f7e9a3e7f4cb6c58edf1b38101e7657
change-id: 20251217-06-k1-clk-common-8d1c57995047
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan

