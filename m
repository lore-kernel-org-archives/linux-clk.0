Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E688361DBC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 05:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895781; cv=none; b=IwUBdciE6ZQnYy/Lbje6Z8jXEpNbfXLNeE0m7ZO01truEsdsF3TJboOIY/xAjtNTziy5Xd30jWshEvgyFPCtckBcsL5jWykHAEejJBKrTNowpUStOcK3TMWt7ZULZtGC7EFvrUCPbr4MFTk8IcNFRf/Z1tdOcjbdwENJZ+Lh0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895781; c=relaxed/simple;
	bh=iHMQG214PPQmbdBQdYAyiKSs4eIX1mzLRERBaN7T4L8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2wb+/mHuQ/QumehdsozM13Qpc/SlJ2P6X/g3h7PJ03x7sALZYNtMN+ktPxCCWyy7gf35ceO6yT8wMBe7+x0wyeh2eLWab7lFlei0B7aOjR4sEGLnEeniuLbQHax7WBIjF6O1hHmm3Tjy/l7W52rV2AxRzTG+C9bb/4fxmRVk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3UlDHgL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3UlDHgL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c86214eead7so363061a12.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895780; x=1781500580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ud+rVLLtmeaFikk63rpGcD+7hJ3NPyth5NFlQdc5XLg=;
        b=a3UlDHgLQhlsWlVHRAW8lPTrk6vDIcNlATmWTUO+GFYMMIIGVkqC/u2K2kacFPhnQf
         9JAVFKhl53qdpsRH0l5su6pbPSkhouILuTqH1vI5bFs2Fcjold77cXdqe+9l8BR4jE0T
         c/COxENUfKWsNIwquvnzlYnKgC6R+fCdsAKKkC6ZeFlUjyfYNVPNyHZ0knmQuR+Xh7zV
         B7mfLecfze9MysfUEUb0SyD2+/NWhDEd5HEDGI4LuFN9a85+7sGvWZx51Zzdz4BpEBcc
         dIb+hHbZJK5ab06TK/HDRP3mA38hX+lGsc3giiVRar7rvDDy16sqNqM4DArGxW60kXbg
         CPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895780; x=1781500580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud+rVLLtmeaFikk63rpGcD+7hJ3NPyth5NFlQdc5XLg=;
        b=qqoKcvLO8ABCWropnSlwHI+FxuBfIpMeYie6okSdItw9Eocxm5+GgabKZ6HgdYiPNQ
         C27Y+2Z5bT9u58OQ2hPgAqdR2mVl8ZIxcX6z9s3HrDuqsGqWlK5a/gjoRcILdNV0o95m
         HOeOt9pGzWVz7CUMHuviwoRSPKyaRcAljOslxSqkIM0Vk3QUI72URfWB3gtvSbtCDxI6
         EvcvRDQG0fNwE3k9kFAHMN0AJxyL2w9lN1grxJAVkOy53su/ord4jucqmRSNlWnJHX6U
         QLRHUXr05BgC3KfbEx/XzgTb/6538XIu0jP8P4kU4Xe6MyerDfm/Sh7OsIqlOqAKK2s7
         worA==
X-Gm-Message-State: AOJu0YyRwOhDoI7/VhKRCSkXY1vkFcBvhdoJTTgXtFpBzjfYV6WLojNP
	emGRVYvzZNvQjbYHH68ipg0+Cj48YJYWZSRWWXhIIhZ59yKCm/S0N072d9DE7JWP
X-Gm-Gg: Acq92OG2Aq4Mcr1KkDWtcRluXvzWBgHhEMYq4Y37t5c8YuM2L23MlayyPE+eVhQn6d3
	GwAyhMZVLuIIIGOiJvBagqfvnCG7AQLWwsuKL6MV1we/vkNCxNTLaRVvjPK92ardmGZa3H+Ty9K
	cPG29fOTqE7JcjmtCCiUOwP+GsVmj4sFuQmG/dFNRzmD8gauhQIQQ6Gtx/zO6PAvbfQjf2oUvWl
	vTH5DC6QiJrfnykrtG9HU7idEnbzq0epxZRKEPXNMEzWjesjPthfk2VWerUBqbPY623PM8986Rz
	FYP1cLSNdEQUQiBLGeKSlmcte/p3W3dwNGi849kqUqRO9iVWpUR5S+sY8XaO0WrQogzsNMs2pHA
	ULk7iWog3r6/ExHRJJPzri/QGbMZvOUTUOlLDTDpxuFPCOF55IuBGHX1Y8+Ynkpd5FTdy4FsRX8
	VmxbqQnonllh8egD7pMSY9XAr5yAc5a7/9H56YIkfsdfqqXS/kb1p9fah2r4clVsotiZadn95aD
	aMguuy9iFJzyE9xbb+U3bir8lov4rx6hALWUeOQFgE5Vg==
X-Received: by 2002:a05:6a21:1405:b0:3b3:2fc3:880d with SMTP id adf61e73a8af0-3b4d3ce5059mr10314307637.25.1780895779906;
        Sun, 07 Jun 2026 22:16:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm14459163a12.17.2026.06.07.22.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:16:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3] clk: kirkwood: use kzalloc_flex
Date: Sun,  7 Jun 2026 22:16:02 -0700
Message-ID: <20260608051602.7176-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member and kzalloc_flex to
combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to right after allocation. kzalloc_flex does this
automatically with GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 v3: change description slightly.
 v2: remove unused goto.
 drivers/clk/mvebu/kirkwood.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index ed061d82fb65..f4f62b241193 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {

 struct clk_muxing_ctrl {
 	spinlock_t *lock;
-	struct clk **muxes;
 	int num_muxes;
+	struct clk *muxes[] __counted_by(num_muxes);
 };

 static const char *powersave_parents[] = {
@@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	if (WARN_ON(!base))
 		return;

-	ctrl = kzalloc_obj(*ctrl);
-	if (WARN_ON(!ctrl))
-		goto ctrl_out;
-
-	/* lock must already be initialized */
-	ctrl->lock = &ctrl_gating_lock;
-
 	/* Count, allocate, and register clock muxes */
 	for (n = 0; desc[n].name;)
 		n++;

+	ctrl = kzalloc_flex(*ctrl, muxes, n);
+	if (WARN_ON(!ctrl))
+		goto ctrl_out;
+
 	ctrl->num_muxes = n;
-	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
-	if (WARN_ON(!ctrl->muxes))
-		goto muxes_out;
+
+	/* lock must already be initialized */
+	ctrl->lock = &ctrl_gating_lock;

 	for (n = 0; n < ctrl->num_muxes; n++) {
 		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
@@ -324,8 +321,6 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	of_clk_add_provider(np, clk_muxing_get_src, ctrl);

 	return;
-muxes_out:
-	kfree(ctrl);
 ctrl_out:
 	iounmap(base);
 }
--
2.54.0

