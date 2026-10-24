Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792813148;
	b=BjG2ql/QACf4//TqGtzMHTQPoCgiNRWVRjMZTTWG8aszcOgxjd1QD9X5pRRW8FYYm4vi
	 QoxD2Li/WTT/MEEY086cp5OcfSjxYngHrX2Dr1q5get9MikCDnsXfWZAlSiQymaZoCRTr
	 71WqmUa9pStsXAe2FiCXqmPRRYXXNfCY/gJSXw77FCwu2SJnvrfafugZJg8R0c5X+Tttn
	 DePKqPDw6Ha6i0GTqQOcxDRWnVxsRTPzhbAlI/DCyW3a4WegpUQgP6eVUs60/cmXSg8hz
	 dK9vuchXmTb7bUXbS2ESUFgf7VH/8o/2ZT9iDTUOC14YNpJbB1ClucMyNsV5OvoOs5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792813148;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WYmeP11c3p0dd86mSeXtaGZvX/MagLMgwhEaQuAh27U=;
	b=bNjVSYKZPs6vh4gA0BFPU9X/ukHwd0GxiWyD1GVzwWNgTj7osxHnY6GwXeMn4lyMCXjT
	 08ANlc7x8DGbacIKn12hzjqC1ytfMm0qC71FqeTfIvFn0FKRzvnl6AM9jLbhJRm/nwRE8
	 AYMVvEzVP7xxspmjCA+5MsKFMY/CjkajoqgSndCD6LGyNqRcEv9Ap34dO6zQAyPvRF+iY
	 z63rDwTQv9oQfAV2MyOcXm/cV8Ew2AZOXPvQAKUtAXi/Qo4AdTiwr0F74W+p9NoDW8eDm
	 G58EwT7YDyYhvK5eHtD268/NI/TVXDk/wk3CxVq08Sqmz7opPIkSW1OcE0vayYF6mTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F4606A31A;
	Sat, 24 Oct 2026 03:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 225F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xKSb2-00EIrc-E7;
	Fri, 23 Oct 2026 23:39:04 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2] clk: Free the parent map only in __clk_release()
Date: Fri, 23 Oct 2026 23:39:04 -0400
Message-ID: <20261024033904.830766-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016164050.790594-1-nickolai@csail.mit.edu>
References: <20261016164050.790594-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 9d05ae531c2c ("clk: Initialize struct clk_core kref
earlier"), every failure in __clk_register() frees the parent map
through __clk_release().  clk_core_populate_parent_map() still cleans up
after itself on failure, so an allocation failure while registering a
clock with parents either dereferences a NULL map (core->parents is NULL
while core->num_parents is set) or frees the parent names and the map a
second time.

Leave the cleanup to __clk_release(): return the error without freeing
anything, and have clk_core_free_parent_map() check for a missing map
instead of num_parents == 0.  The map is zero-allocated and
kfree_const(NULL) is a no-op, so a partially filled map is freed
correctly.

Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
Cc: stable@vger.kernel.org
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Changes in v2:
    - Shortened the commit message (Jerome, Brian).
    - Added Cc: stable (Brian) and Jerome's Reviewed-by.
    - No code change; rebased onto current master.
    
    v1: https://lore.kernel.org/r/20261016164050.790594-1-nickolai@csail.mit.edu
    
    Developed with the assistance of an LLM.
    
    Reproduced on riscv64 under QEMU by rebinding a fixed-factor clock
    provider through its sysfs bind file with failslab aimed at the parent
    map allocation: without the patch the kernel oopses with a NULL pointer
    dereference in __clk_release(); with it the bind fails with -ENOMEM and
    "failed to register clk" is logged.  The second failure path (a parent
    name copy failing) was reproduced only in a userspace transcription of
    the four functions under AddressSanitizer.  The clk KUnit suites pass on
    x86_64 and riscv64.

 drivers/clk/clk.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b5..c32c3e9d62bdb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4353,15 +4353,8 @@ static int clk_core_populate_parent_map(struct clk_core *core,
 			WARN(1, "Must specify parents if num_parents > 0\n");
 		}
 
-		if (ret) {
-			do {
-				kfree_const(parents[i].name);
-				kfree_const(parents[i].fw_name);
-			} while (--i >= 0);
-			kfree(parents);
-
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -4371,7 +4364,7 @@ static void clk_core_free_parent_map(struct clk_core *core)
 {
 	int i = core->num_parents;
 
-	if (!core->num_parents)
+	if (!core->parents)
 		return;
 
 	while (--i >= 0) {

base-commit: 4da9dedf3fc59137fd86d664693776aa38cb97f5
-- 
2.53.0

