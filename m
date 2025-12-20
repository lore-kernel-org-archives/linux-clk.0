Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C0DDC5;
	Sat, 20 Dec 2025 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193103; cv=none; b=KMVPjDGhRx+X1z8CZEVi5qNGl2bBqZdCk0pSMbbg6Jume8FASTfla9W5tidOfipMYVoKbmYEpJiDcQCBkyYAfmZd6Mc/LXqU2SHfe/qNKdm+DpKK87FRjb2MRk9BD2ONMK5ePzTAYgxrTdbrAkeb8zxjAuQ84UxMFypEOklDcnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193103; c=relaxed/simple;
	bh=LE5+CKwGJWaNVtCNdjn0NY23TOyRwRWlfF4GEP2w9qo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JcoaQvPaHmDW6Es8mbWoj0/ndnxD0zXWnmmd9LKbNlm0MKnlk0+Ftc+iLq7JeOzPBgTNu4/RKxGvUcIIciIdcwGJkK+29bCayjrYHDrC0g3C4eElAUMtRfjOT+GOTW1MpF3CSkRhX8DzzSZ20EXaykKLrzoF4rZQvC27GS+ANxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 588CD340E69;
	Sat, 20 Dec 2025 01:11:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] clk: spacemit: refactor common ccu driver
Date: Sat, 20 Dec 2025 09:11:18 +0800
Message-Id: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALb3RWkC/y3NQQ6CMBCF4auQWTuk04ClrLyHYdGUChNoq60aE
 8PdbcDl/5L55gvZJXYZ+uoLyb05cwwl6FSBnU2YHPJYGqSQLUlSKM64ENp1QRu9jwG7kWyrtG5
 Fo6Cc3ZO78Wcnr8PRyT1eRX4eI3iXs9nlvvq7WpDsSNdNI7SSSMgh2pmNN5fJG17r8gyGbfsBx
 Lo8TrAAAAA=
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=LE5+CKwGJWaNVtCNdjn0NY23TOyRwRWlfF4GEP2w9qo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRffAcyYEULrDYZEm8BPhkKkxwSgkKVyx74t9q
 n5TlkdSKsaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX3wBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+182w//dkCcQzR+idlS9IC2GC9rh1ArJiMPYgJSrPAUuDDrhtALE0tTfudbw
 A/2ftD1sx48cPKGvrj+ni/Z2jJ5KmX5MNZ114yGbpGNPdrfPEE1gLr5bpW/gr1VH1yuq3dkOTXb
 FtyX8kJQD9hfQ+k8DiRvIlXva744zCgUmjtN/fv5bc5XoiLekzj20l8G9hRJWAc1l7nAlzT8EwV
 i3F/jPNk2J3w+IFqb0ASUnO2wjhFJvMgW/44yNYLGZ30oLblLXBsJgbmPjIHxjlLYIYmzr1HXxa
 cdZwc46gGBwkmfcUfBwsFSY5Vy6IXQZ4ZOsZGRYZfaB3zsiWySF9BD+ibZ9H0of4w9SQAgr6nuR
 spqJDs+dQAD3nKOvQj5otG6vHmbrAokbOkZTWlYmsPztUhxj0VFYCqLm3k4wtut8w8W/3Uv0Z2r
 yPKP4s7s/e23mwU23k5octQFBC57fdSZQe7G6VLLMX/lo/AHkeN+6xQQxZwKoKK9e36IU930+sb
 OGOz8b4xj8H0BP+yBQ9qsoOMxq29+7/xND0It9Pglek40GIdxs2MGnI8UpZQQbd+MDhblhpnOrz
 XLkB551pRVLxj0bsF3vJXaDNCaju8D01taFEhGYu3S344RIrF74vewTM+xyRONDHJvVDdvB/SVc
 wM3Q/QPQ5aDcOm1StHHBsu6m9A/7Bc=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The goal here is to refactor the clock driver to extract common part, and
reuse it, so in the future, we can maximize the source code usage once
adding new clock driver (specifically, for the SpacemiT K3 SoC here)

Since reset driver register via auxiliary bus which requires a adjustment
of the auxiliary device id accordingly.

This patch will depend on Kconfig fix for building modules [1], and the idea
come from K3 clock's review[2]

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      clk: spacemit: extract common ccu functions
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 176 +-------------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 +++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 6 files changed, 205 insertions(+), 187 deletions(-)
---
base-commit: fb964a99ad6848a9022c6909365aad23e177387c
change-id: 20251217-06-k1-clk-common-8d1c57995047
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan

