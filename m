Received: from sender4-pp-g126.zoho.com (sender4-pp-g126.zoho.com [136.143.188.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92637221540;
	Thu,  5 Feb 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306163; cv=pass; b=fnI56dqwblaljGAAgsx2XCY9N21i0+D6xii6XOlvaMpJRO5C3xYvkq+CkZrP4RCLNvdP9Py6wynYZGyJvBu3JahLUScWPHw47wSaV6L1BLGv6/kbCAeoNouwun638et9yiPgI3JabGixgQ7ekpASfnxaXDe8zeOvX1YiwNunxrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306163; c=relaxed/simple;
	bh=pNs8vJoAt36b0QgChnLmn9kCMHNGfF99eRWx65vvQmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7HmknLQfeIDpUsXwY1f0hLJC5E6XQx52jbrE3pFmkOg1JPgf8rJg1b3pcjvJQgbGsGh+F4ZvQ0hy+4Y6ChxM0ffMNaXSBC6SXiWJ/zBYfeOb7Um3ODPyqtc+c/WI6qdBc2fqsy4Qtyhr9ivl0RO2qNltAOiwIbsslU08TQCt54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=QJKOFxZE; arc=pass smtp.client-ip=136.143.188.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="QJKOFxZE"
ARC-Seal: i=1; a=rsa-sha256; t=1770306146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hL6L78EBqfYOZdA9LWgPdFApwEIJ1lXBhic9PQoCP0bEFi9GsdGxVbrnTzS4lyFqqYXXrOrn9RIKUkBt/5DYlt0BoInar/jlmM6tx0wpZ3wXGJp6n+h8OvyXY1tQHfFBevsc1cK5JJOhs3zZmlB+CbMS7gdPmaFXQLwzCnQsE+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770306146; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FHdwkrW2TM3xQb2pU8C0Ab3XZaSuu2Nstt3DgnzYZws=; 
	b=YRXkmbEufmocwtllBjrJuCUwPm1bMKPI2zyA8QU0u6rkfjEqL04Ot97eHFnEfqFWH3Tl67MMc5QFm2fFrAV2dnwPpt7DgY86CMvBcvp66+vpEfZXOiu34dkmLI7RX93TXt9Y0cgIUSjPD60NlYEUpF8S13+fWnW7g+qZYvJsCtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770306146;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FHdwkrW2TM3xQb2pU8C0Ab3XZaSuu2Nstt3DgnzYZws=;
	b=QJKOFxZE4I0tRONLmptTnXoI+SxOtv/ol27K8znOx3r66y5AgU2bN8CyMhKTOZtt
	sUawy73C0frkM4Ab8FKnO89LJ6Ohnc26op91KhNX33Hxnxun2zfHD5q/9BnfCZgqYpG
	bn4vXoMLhhTdPVySjabtBk3UUWkP4zkA1fnx8K1s=
Received: by mx.zohomail.com with SMTPS id 1770306144397291.5575062557059;
	Thu, 5 Feb 2026 07:42:24 -0800 (PST)
From: Yao Zi <me@ziyao.cc>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>,
	Drew Fustini <fustini@kernel.org>
Subject: [PATCH v2] clk: Avoid DT fetch in possible_parent_show if clk_hw is provided
Date: Thu,  5 Feb 2026 15:42:02 +0000
Message-ID: <20260205154202.21819-1-me@ziyao.cc>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

When showing a parent for which clk_core_get_parent_by_index fails, we
may try using the parent's global name or the local name. If this fails
either, the parent clock's clock-output-names is fetched through
DT-index.

struct clk_hw pointer takes precedence with DT-index when registering
clocks, thus most drivers only zero the index member of struct
clk_parent_data when providing the parent through struct clk_hw pointer.
If the pointer cannot resovle to a clock, clk_core_get_parent_by_index
will fail as well, in which case possible_parent_show will fetch the
parent's clock-output-names property, treat the unintended, zeroed index
as valid, and yield a misleading name if the clock controller does come
with a clocks property.

Let's add an extra check against the struct clk_hw pointer, and only
perform the DT-index-based fetch if it isn't provided.

Fixes: 2d156b78ce8f ("clk: Fix debugfs clk_possible_parents for clks without parent string names")
Signed-off-by: Yao Zi <me@ziyao.cc>
Tested-by: Drew Fustini <fustini@kernel.org>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

This was found when fixing the wrong parent description of
clk-th1520-ap.c[1]. Without the patch,

	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
	osc_24m cpu-pll1

The first parent should be c910-i0, provided by an unresolvable struct
clk_hw pointer. osc_24m is the first (and only) parent specified in
devicetree for the clock controller. With the patch,

	# cat /sys/kernel/debug/clk/c910/clk_possible_parents
	(missing) cpu-pll1

[1]: https://lore.kernel.org/linux-riscv/20250705052028.24611-1-ziyao@disroot.org/

Changed from v1:
- Collect tags
- Switch to my new mail address
- Link to v1: https://lore.kernel.org/all/20250705095816.29480-2-ziyao@disroot.org/

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..a9d1aea59689 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3588,7 +3588,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
 	} else if (core->parents[i].fw_name) {
 		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
 	} else {
-		if (core->parents[i].index >= 0)
+		if (!core->parents[i].hw && core->parents[i].index >= 0)
 			name = of_clk_get_parent_name(core->of_node, core->parents[i].index);
 		if (!name)
 			name = "(missing)";
-- 
2.52.0

