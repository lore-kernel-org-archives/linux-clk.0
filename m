Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584021CC44;
	Sat, 25 Jul 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982415; cv=none; b=pFZbgAQ/dOSkj6TxvX0DTwolY+XCm2ZMwSOACVP1uhPxgabxydlCgjHiuHF+JTF1eOt7I5atKCm0S/7RMdd9VcyWM+3Q9GxM8HLbCotuQtN6m1EA0pPCHV4IlIjI1OQgUA0L0DU0xtcV4PbpkWSr42JCr722BmuMRozcBcz25RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982415; c=relaxed/simple;
	bh=lq0/9gAd9eRbQQjoIj0OoViKUp6XNp12/ZfKPhVpr/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zc7145rc0kWyztq2/9JYkcCYICO4ThNH0Ny7xXNjbrYJGNVAF3XczxWEErfxkfRdk6Ba6CcT++5iysUXET0w01uIqiA9FHryY/7fgV3xhJ+gmQ7LKmqFRxuG3i8iL1GPd+tTuzuW2lBzZwCZygsY0C9XdySmV1JUx5/J3BXq5E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=BFeGzKbF; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="BFeGzKbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784982411; bh=lq0/9gAd9eRbQQjoIj0OoViKUp6XNp12/ZfKPhVpr/g=;
	h=From:To:Cc:Subject:Date:From;
	b=BFeGzKbF1UbplnnnTo699cQJH3h2dyG2ENWDX4brn+HW5uZVLsbrwp0bLGwtCg14Q
	 OwqeXG7AakE9T+DxzSqCci8nWqulZSiakEmwd87wWXyvtziu3Ola3JWqMvDnQCBFax
	 27R2RmTr0qyczV5a0eG/uQWCThEdMoCjXXtLa+00=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] clk: sunxi-ng: Change NKMP algorithm for finding factors
Date: Sat, 25 Jul 2026 14:26:40 +0200
Message-ID: <20260725122645.2270876-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

Current algorithm is very slow. It searches inefficiently in a brute
force manner through all possibilities all the time.

Eg. it does >1500 iterations on every rate change twice, because
ccu_nkmp_find_best() function is called multiple times per rate
change.

New algorithm determines correct NKMP factors typically in 1 to 3
iterations if precise factors can be determined for M = 1, P = 1,
which is a typical case. If CPU clock frequency can't be derived
precisely this drops to average 8 iterations needed to determine
the factors.

The results are identical to the original algorithm, except in cases
where the original algorithm does not try to satisfy SoC PLL clock
constraints, like N*K range 10..88 or P factor being limited to output
frequency < 240 MHz.

These restrictions are based on A64 SoC datasheet. Although they
are sometimes not documented for other Allwinner SoC variants or are
slightly different, this is still a significant improvement over
not respecting any physical restrictions at all, as the previous
algorithm did not. Hardcoding the values if fine, until someone
finds some reason for not to.

Motivation for this patch is that cpufreq schedutil scheduler thread
manages to load one core to 70% all the time just doing these calculations
while the core is running at just 24MHz during frequency changes.
This helps improve the performance significantly.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
Sorry, I don't know how to avoid overlong lines here, other than
maybe not indenting 3 toplevel for blocks and keeping all of them
at the same level.

 drivers/clk/sunxi-ng/ccu_nkmp.c | 80 ++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 25efb5b37607..c39b19891431 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -32,40 +32,70 @@ static unsigned long ccu_nkmp_calc_rate(unsigned long parent,
 static unsigned long ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
 					struct _ccu_nkmp *nkmp)
 {
+	unsigned long _k, _m, _p;
+	unsigned long max_p = rate >= 240000000 ? 1 : nkmp->max_p;
+	unsigned approx;
 	unsigned long best_rate = 0;
-	unsigned long best_n = 0, best_k = 0, best_m = 0, best_p = 0;
-	unsigned long _n, _k, _m, _p;
 
-	for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
-		for (_n = nkmp->min_n; _n <= nkmp->max_n; _n++) {
+	for (approx = 0; approx <= 1; approx++) {
+		for (_p = nkmp->min_p; _p <= max_p; _p <<= 1) {
 			for (_m = nkmp->min_m; _m <= nkmp->max_m; _m++) {
-				for (_p = nkmp->min_p; _p <= nkmp->max_p; _p <<= 1) {
-					unsigned long tmp_rate;
-
-					tmp_rate = ccu_nkmp_calc_rate(parent,
-								      _n, _k,
-								      _m, _p);
-
-					if (tmp_rate > rate)
-						continue;
-
-					if ((rate - tmp_rate) < (rate - best_rate)) {
-						best_rate = tmp_rate;
-						best_n = _n;
-						best_k = _k;
-						best_m = _m;
-						best_p = _p;
+				u64 nk = (u64)rate * _m * _p;
+				unsigned long nk_rem = do_div(nk, parent);
+
+				if (nk_rem != 0 && !approx)
+					continue;
+
+				if (nk < 10 || nk > 88)
+					continue;
+
+				for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
+					if (approx) {
+						u64 _n = (u64)rate * _m * _p;
+						unsigned long tmp_rate;
+
+						do_div(_n, parent * _k);
+
+						if (_n < nkmp->min_n || _n > nkmp->max_n)
+							continue;
+
+						tmp_rate = ccu_nkmp_calc_rate(parent,
+									      _n, _k,
+									      _m, _p);
+						if (tmp_rate > rate)
+							continue;
+
+						if ((rate - tmp_rate) < (rate - best_rate)) {
+							best_rate = tmp_rate;
+							nkmp->n = _n;
+							nkmp->k = _k;
+							nkmp->m = _m;
+							nkmp->p = _p;
+						}
+					} else {
+						u64 _n = nk;
+						unsigned long _n_rem = do_div(_n, _k);
+
+						if (_n < nkmp->min_n || _n > nkmp->max_n)
+							continue;
+
+						if (_n_rem == 0) {
+							nkmp->n = _n;
+							nkmp->k = _k;
+							nkmp->m = _m;
+							nkmp->p = _p;
+							return ccu_nkmp_calc_rate(parent,
+										  nkmp->n,
+										  nkmp->k,
+										  nkmp->m,
+										  nkmp->p);
+						}
 					}
 				}
 			}
 		}
 	}
 
-	nkmp->n = best_n;
-	nkmp->k = best_k;
-	nkmp->m = best_m;
-	nkmp->p = best_p;
-
 	return best_rate;
 }
 
-- 
2.54.0

