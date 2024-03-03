Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A461B664
	for <linux-clk@vger.kernel.org>; Sun,  3 Mar 2024 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709468062; cv=none; b=LlvB50sMUvIkjQF0Xw2DhdPVe51vHnDwe+Z78bCYDVMhGrqyxLevG4Awdn3CccvTGVmVId03L3fThxNkoAsE2aWqyor2RGBU5Dtb1fPhPLdbLTi8HQem5U8qL8dVYWRX8g6coHo2XOaYHzzoNsIRahm7wVA+mbtLCBnnA0mTMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709468062; c=relaxed/simple;
	bh=ueeAezcywm5cI/6F2f6lA2+yuhtrVFvftQ3aZWTbDfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVcrwhINfq6ttj6ypLHLZsmHXS10SYTHftjxRra6/J+laKcpsQoir7Cia7rhzJZ1MEfbqMZhVE/XXpOyBSDvoifcZWdiR8gG9cbWn1N778c5wTL0Sf8B3C21EnbcqeJlPfGlRR1LfDlR8QWQAVS7pRZp6xsU0Wp7OlYP0tCzymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 8b2a64d2-d957-11ee-b972-005056bdfda7;
	Sun, 03 Mar 2024 14:14:11 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] clk: fractional-divider: Move mask calculations out of lock
Date: Sun,  3 Mar 2024 14:14:10 +0200
Message-ID: <20240303121410.240761-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to calculate masks under the lock taken.
Move them out of it.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/clk/clk-fractional-divider.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index a0178182fc72..da057172cc90 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -195,14 +195,14 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 		n--;
 	}
 
+	mmask = GENMASK(fd->mwidth - 1, 0) << fd->mshift;
+	nmask = GENMASK(fd->nwidth - 1, 0) << fd->nshift;
+
 	if (fd->lock)
 		spin_lock_irqsave(fd->lock, flags);
 	else
 		__acquire(fd->lock);
 
-	mmask = GENMASK(fd->mwidth - 1, 0) << fd->mshift;
-	nmask = GENMASK(fd->nwidth - 1, 0) << fd->nshift;
-
 	val = clk_fd_readl(fd);
 	val &= ~(mmask | nmask);
 	val |= (m << fd->mshift) | (n << fd->nshift);
-- 
2.44.0

