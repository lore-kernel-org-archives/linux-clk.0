Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FAA3BADB4;
	Fri, 16 Oct 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168854; cv=none; b=QT8dX0TUss7Psnjo5hiPn6O2aBIx59PAK7IKQF2uRnve7dRvt//lapuL7nScdwwOJeths2ir23iaRZIGlkTHTmDYl54mgI0ci29DcR8Rgc3SyQrV3npkALyrRmZsofQYGQIjclRKLj6rza40yBLPwwQ/kPb2JG8w3jws0HaOlSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168854; c=relaxed/simple;
	bh=22aKOV4kC3Q43W/39hlrHl0PEB05/vsaNyU1K9dGtF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1A2zJplDOHksxmp0feoPDibG/fjTVe7zZ3jGlWcVX+XL9e4JTZoerz+OoXQEO/3JpMJ9xi28a2ZOIQWx5A0FTg4VxTN5wZ6henNEMkZwUQ7nH9GVMHx1BVR505HIMC13TV/2qTLpYsLDLpCxbU9m+iH5lIEQ6XmZrNuvd12oN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHkzC-00Fc4w-9K;
	Fri, 16 Oct 2026 12:40:50 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] clk: Free the parent map only in __clk_release()
Date: Fri, 16 Oct 2026 12:40:49 -0400
Message-ID: <20261016164050.790594-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk_core_populate_parent_map() can fail in two ways, and since
__clk_register() answers every failure with kref_put(&core->ref,
__clk_release), both end in clk_core_free_parent_map() walking a parent
map that is not there to walk:

 - If the allocation of the map fails, core->parents is NULL while
   core->num_parents was already set from init->num_parents.
   clk_core_free_parent_map() only tests num_parents, so it reads
   core->parents[i].name through a NULL pointer: an oops.

 - If a later kstrdup_const() of a parent name fails, the function
   frees the names it copied so far and the map itself, but leaves
   core->parents pointing at the freed memory. __clk_release() then
   frees the same names and the same map a second time: a double free
   on top of a use-after-free read.

Both arms are the -ENOMEM path of clk_register(), clk_hw_register() and
of_clk_hw_register(), so of every clock provider in the tree with
num_parents > 0. A user sees it when a clock provider's probe hits a
memory allocation failure (in practice under fault injection, as these
allocations are small): instead of the probe failing with -ENOMEM and
"failed to register clk", the kernel oopses in __clk_release() called
from __clk_register(), or, for the second arm, corrupts the slab
allocator and reports a double free.

clk_core_populate_parent_map() has cleaned up after itself since commit
fc0c209c147f ("clk: Allow parents to be specified without string names"),
when __clk_register()'s fail_parents label skipped
clk_core_free_parent_map() and only the later fail_create_clk label
freed the map. Commit 9d05ae531c2c ("clk: Initialize struct clk_core
kref earlier") moved the freeing of everything into __clk_release() and
pointed all failure labels at kref_put(), so the map is now freed by
__clk_release() on this path too.

Make clk_core_populate_parent_map() leave the map to __clk_release():
return the error without freeing anything (the map is zero-allocated and
kfree_const(NULL) is a no-op, so the partially filled map is freed
correctly by clk_core_free_parent_map()), and have
clk_core_free_parent_map() return when there is no map rather than when
num_parents is zero, which is what clk_core_get_parent_by_index()
already does for the same state.

Found by formal verification of __clk_register() against the kernel
binary. Reproduced on riscv64 under QEMU by re-running a fixed-factor
clock provider's probe through its sysfs bind file with failslab aimed
at the parent map allocation: the unpatched kernel oopses with a NULL
pointer dereference in __clk_release() (clk_core_free_parent_map() is
inlined there), the patched kernel fails the bind write with -ENOMEM
and logs "failed to register clk". A userspace transcription of the
four functions reproduces both arms under AddressSanitizer before the
change and is clean after it. The clk KUnit suites pass before and
after on x86_64 and riscv64.

Fixes: 9d05ae531c2c ("clk: Initialize struct clk_core kref earlier")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The riscv64 trigger is a fixed-factor-clock DT node whose registration
    fails at boot (a second node with the same clock-output-names, -EEXIST),
    which leaves an unbound platform device; writing its name to the
    driver's sysfs bind file re-runs of_clk_hw_register() in the writing
    task, where failslab with the task filter and the kmalloc-64 cache
    filter can be aimed at the parent map allocation (the second kmalloc-64
    of that probe, after struct clk_fixed_factor). On the unpatched kernel
    the oops kills the writing task with the device lock held, so the VM
    does not power off afterwards; on the patched kernel the write returns
    -ENOMEM and the next bind attempt fails with -EEXIST as before. The
    second arm (a parent name copy failing) was reproduced in the userspace
    transcription only; the fixed-factor clock has a single parent, and the
    kstrdup_const() of its name lands in a different slab cache.
    
    The pending clk-next change to __clk_register(), "clk: fix
    self-consuming provider module pinning", touches the owner assignment
    further down and does not overlap with this hunk.

 drivers/clk/clk.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..c32c3e9d62bd 100644
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

base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
-- 
2.53.0

