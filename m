Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7EF37206D;
	Tue, 12 May 2026 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778621096; cv=none; b=sWsVMXc7nVtRKsQKlGuX4fjWploqggeTZpBtjxc/xO3O9EF6Vy2nWrwVXXmPZH7+3DMYwZ3/9l0RUQs8zc6pkKoLIoSzeBpbH49K+wnyrBfuSMJEOrz9JWmjOhytjGSwg4To8hUqIMQG1ZdFlXa0HJC5CfCXHQxcE3zRm6C18ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778621096; c=relaxed/simple;
	bh=qzizaAcfbNOP3yCFEYp1IkJ6jOSU7Cn0Op7kHsgE+Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnmZROkzKAMmv0eQHbCcX1p0/SAwotHbJe/CCFX18LHpOv5Wz4dpL2EoJLG0fX1F0+zwgtvVxRykSVMiLe4C/jetvy6SThrqW04m4HRlHGi6+UD5DSo5BzmGXgv67Q759dt8m19dRhyZFYPQBZjV2GQN0TBKNUguYNETrzRh8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DtcJLjaT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DtcJLjaT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bBfAHTs96SwyDxcCCW1P4gHGixSWyQ2kPnArLxGuJ3A=; b=DtcJLjaTRfk7+qGS6mrBNKpHmL
	bgoWATWOAIL0XA6UVdK81yMnguDc8GcJcXr5xI37GKuLg2QE0w4mn9n3ES42G24FCSfno2XStZLOs
	OHj4kVn9oUvEebpiVllJgx7AUCGQm65XVi0SDzWfXXKI4of/DZ7x4mshHxFNfcjuMQRBEIHH/d6cz
	H3luckVibZ5klVVoLJv3V7v4VGLVRZuy+EKBy4ztGWW6c52SmRpjhFApvF7cqVNTVhlMmRP9bb6o+
	dP9upyrwoDjuNfk51HFPnIW+NENl3PLfeJiI3OPWWZuLiRIUf9H2UiLZKiRY5LJs4kImgg4po8IX4
	0a4VzjMQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMub0-00000000Tnq-28Q5;
	Tue, 12 May 2026 21:24:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: add missing function short descriptions for kernel-doc
Date: Tue, 12 May 2026 14:24:53 -0700
Message-ID: <20260512212453.1306667-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add short descriptions for 3 functions which are missing it.
Modify the parameter name in comments to be @core instead of clk.
Use corrected function names (with leading "__") in a few places.

Warning: drivers/clk/clk.c:1899 missing initial short description on line:
 * __clk_recalc_accuracies
Warning: drivers/clk/clk.c:1972 missing initial short description on line:
 * __clk_recalc_rates
Warning: drivers/clk/clk.c:2244 missing initial short description on line:
 * __clk_speculate_rates

This eliminates warnings in this file except for missing return value
warnings, of which there are around 70.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org

 drivers/clk/clk.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20260508.orig/drivers/clk/clk.c
+++ linux-next-20260508/drivers/clk/clk.c
@@ -1846,10 +1846,10 @@ static int __clk_notify(struct clk_core
 }
 
 /**
- * __clk_recalc_accuracies
+ * __clk_recalc_accuracies - recalculate all accuracies in the clk subtree
  * @core: first clk in the subtree
  *
- * Walks the subtree of clks starting with clk and recalculates accuracies as
+ * Walks the subtree of clks starting with @core and recalculates accuracies as
  * it goes.  Note that if a clk does not implement the .recalc_accuracy
  * callback then it is assumed that the clock will take on the accuracy of its
  * parent.
@@ -1919,16 +1919,16 @@ static unsigned long clk_recalc(struct c
 }
 
 /**
- * __clk_recalc_rates
+ * __clk_recalc_rates - recalculate all rates in the clk subtree
  * @core: first clk in the subtree
  * @update_req: Whether req_rate should be updated with the new rate
  * @msg: notification type (see include/linux/clk.h)
  *
- * Walks the subtree of clks starting with clk and recalculates rates as it
+ * Walks the subtree of clks starting with @core and recalculates rates as it
  * goes.  Note that if a clk does not implement the .recalc_rate callback then
  * it is assumed that the clock will take on the rate of its parent.
  *
- * clk_recalc_rates also propagates the POST_RATE_CHANGE notification,
+ * __clk_recalc_rates also propagates the POST_RATE_CHANGE notification,
  * if necessary.
  */
 static void __clk_recalc_rates(struct clk_core *core, bool update_req,
@@ -2191,14 +2191,14 @@ static int __clk_set_parent(struct clk_c
 }
 
 /**
- * __clk_speculate_rates
+ * __clk_speculate_rates - speculate all rates in the clk subtree
  * @core: first clk in the subtree
  * @parent_rate: the "future" rate of clk's parent
  *
- * Walks the subtree of clks starting with clk, speculating rates as it
+ * Walks the subtree of clks starting with @core, speculating rates as it
  * goes and firing off PRE_RATE_CHANGE notifications as necessary.
  *
- * Unlike clk_recalc_rates, clk_speculate_rates exists only for sending
+ * Unlike __clk_recalc_rates, __clk_speculate_rates exists only for sending
  * pre-rate change notifications and returns early if no clks in the
  * subtree have subscribed to the notifications.  Note that if a clk does not
  * implement the .recalc_rate callback then it is assumed that the clock will
