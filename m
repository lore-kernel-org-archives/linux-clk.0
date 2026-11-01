Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565220;
	b=TCdosDNrV1YFavWKcY8Lo5G6/mEm86vOBjSbuhnTVKEroxZgeyhF8N4VJWqsIfJeH9sJ
	 pyD1L8J0/P3HfWhCTSSt5jHgu3bMyPjH29/6FDwrLOaNtNtF/iITeZeZxYVTydWE+bY5V
	 wyhsgoW8Mzbsw00b9Uk6nPFJ5CT2BHIl/0lh7wZf1ocmxAK9/HZKmOjCMBRrsg3z/AeiZ
	 ISpaLMFq8bMXzydMBCVpuIY1lLtBHVouSpKsHCJJl262CdAZOE5remjICOVM3REcBwGSZ
	 tuQWpynrqM8pFok/32W/rdE7XR2ZvTOSHMJESFcPELV+La6hHqXNF9DdwhyQ7b/6+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
	b=JsPeVuOO7G1UmIcfHYRP/q4aqRA8MN14pFu6XDcZgtvAjUX+RA/laNF9dhcZ7QthfqxY
	 8pZ+Q76JSYKYHTpJx4sJeDoTG2Eis7P7mGHJ99lRgVQPMwKEIvROOAbXZZizzwImhu5Z+
	 dLmp7v7sgbgp11pDT8fmYeoelHNWSiDpBaZXJC35x6ZPCfG1uSmPsy6CbuPOb3YTX+7iy
	 vAK0MlULMwfwCKn+0koAgrkrCFR8jIT8m30rO3L5w0QztMVFGcSPdMNxJlNujQQvByd6h
	 A5ZZHYkewnpiYFZSyyjjstY31erqrVzKC5LYTrMyckNIJPcWnbWXt33bUTaZk/jIorA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPWCNuCF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1867606A325
	for <linux-clk@vger.kernel.org>; Sun,  1 Nov 2026 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1867606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPWCNuCF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20edd106so1805073f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565218; x=1794170018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=BPWCNuCFsOKfmbiWphfDEmJBsGgsmj8oOp0zJgEUOgt1o3myDzdq1jTN5v7czTpYya
         MpckUJTxSvS3oaKVtvjAmf6Igi349Pih8FA3IHUfsf9339dcl5tsxMq86hYlwiYNJG3D
         X0qoD2mVLnZ+wZaJx/1x2suNMi4cVAdWfNLjMFYAl/NvehFBmVvWQAuNrtVRctLuUe0+
         igHqlRVj6Jpl1dQekMAk7iq+46m1uuTqawIgAvxEqUwfwxX/yE25E4xQs9QzUnvD+52u
         Hd9Lndrw8S70cCJ24+sMsv4P+681j3WIpydJUVPAT+T2MeQfQkylOftjhUlb50xG4L9V
         tcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565218; x=1794170018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=BwHbrSDx52y6ldkGpaATACVUh6nR6fg5nI/iJ8jJbty9zKkOOpck/TzrdKHn8uX8w+
         /Nk8ponakciKUOxhVZLp6zE1pFNQ+LhY0YQXvxkuV41Yz/+V6JzuhOQ6y9vwauV6vfz4
         7DBq+HglgL/B8RZYRezo6n1RvFkiSb2ru4jMQc/R1rPBJAMG0Ew+gpE57iYj4H9i3GDu
         JthuRvfGX+j4CRq1tvtSlz/S8UtKqtiGH4ZNnR0D2KbpcTj4Uv1jGdh8QJJmJr3oGpul
         9sYVGE7Oxx0i8Gxafh/wpWHCmB8EN30r4maaDqQK0T/lPXvtMzUVRMHhgkl18pqyvKHa
         /qZA==
X-Forwarded-Encrypted: i=1; AKwUvBy/kPG92NslHYX9R7nT/qa+7zOKOhXtDEWY0YIolLGKywcHeptH+W2kfskssjCX74n8wcuatunt5k8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LpMxwSjmGX9hkEMMSZeXJX1/NY012btym2NkuW13plX2mx6PB
	l0sAbCgIz4YI82xGk64W7FkKmkkLbL7P0icNMdGoqOD2X25hKkg3qjyD
X-Gm-Gg: AYBFou1+ysOBoX5M43hr1OwOxRm/IlrYuYn1ZAtDNbtodJ7/R3UZbZYYxLEqtVn7OwW
	gnEboB449Ib1IgaF8fEL7Ey76nOk11T/s5dMZ2WaEyCE6hwmGhvqR7OhD1cK2r286jWbaw/8fuM
	MQmeWKaJw7y3jx5v5xbAgV8CZAsmWKebP5xZbXPYMEFhJqqYPQnNQ/wJzzG0PzXGOKIDYhF46jn
	tCaOtnomN40i/Te3V6HGHrn23g6EuTWuHM9ywm/03M69X7qFsCQmimhGySukqIsCuJxMXJel9c6
	IflqPrWYkvdHvNtFDJFN1JIxKLQDw3B4f8QhOHdi553oCOIQuURWnSGAhHIElfEVlc+9OEkfaj0
	e9YwEKwVM+QQS/XZa82MRIXdID9qNxzFSW+19p3EuvXZxCNyIDtZMrJxBTvBVYh1OAS+1qN4iIa
	ExdbeK1bU/f5QzoNYz9s1QkvoRwjRtm1eybJQS6qZOcYOYjzkBKCfSGdezPCEfiVy0AUJ0m/Ljb
	OZYrk9nwJ3JkjczIavm/2Cz4yqyetcGhyj0gopUsmCU/s8mp9lXTWDwuN6rZOloBH+Dqa3CpGrL
	SFEaLM8VDNYu16toaBwauF0Rsn5gNZb0RZr0flE066WF3nX2WtRkcZbXRHa96nrdcD+LsMMZdRd
	REdjpjMVo1uq0qg8iWKuAg1QhkT+dV2+IgI4Y9ttm02Z74xFxD4UtYp3bIgKwZk+OEQ==
X-Received: by 2002:a05:6000:310c:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-48e6e2fbc14mr20001368f8f.42.1793565218073;
        Sun, 01 Nov 2026 12:33:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm18722895f8f.3.2026.11.01.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:33:37 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun,  1 Nov 2026 21:33:36 +0100
Message-ID: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The N-K-M rate code computes parent * n * k / m in an unsigned long,
which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.

On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
picks these factors for a 288 MHz request, and clk_get_rate() reports
287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
594 Mbit/s instead of 288 and the picture broke up.

Do the multiplications in 64 bits, saturating at ULONG_MAX, in
ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
rate request of the parent-adjusting search, where rate * m overflows
the same way.

Without the saturation, a candidate above 4.29 GHz in the search would
be truncated again on return and could look like a valid low rate.

64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
parent rate times N * K goes above 2^32.

Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rates when determining rate")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31, A23,
  A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=y and =m, no
  warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
  helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
  change, without the ULONG_MAX saturation (same results for rates that
  fit, which is the only case the hardware hits): before, pll-mipi was
  programmed with N = 14, K = 2, M = 14 (594 MHz measured as a 2x lane
  rate) while clk_get_rate() returned 287216621; after, N = 15, K = 1,
  M = 16, 278437500 Hz in both the register and clk_get_rate(), and the
  panel picture is right. This version, with the saturation, then on
  the same board on 7.3.1: pll-mipi again programmed with N = 15, K = 1,
  M = 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
  right. Not tested on the other SoCs.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the PocketGo S30 display. It found the mismatch
  between the pll-mipi register and the rate the clock framework
  reported, traced it to this overflow and drafted the fix and the
  message. I reviewed and understand the change and tested it as
  described above.

 drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 401fbb7524..e5a8f22d50 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 
 #include "ccu_gate.h"
 #include "ccu_nkm.h"
@@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long paren
 	return true;
 }
 
+static unsigned long ccu_nkm_calc_rate(unsigned long parent,
+				       unsigned long n, unsigned long k,
+				       unsigned long m)
+{
+	u64 rate = (u64)parent * n * k;
+
+	do_div(rate, m);
+	return min_t(u64, rate, ULONG_MAX);
+}
+
+static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
+					      unsigned long n, unsigned long k,
+					      unsigned long m)
+{
+	u64 parent = (u64)rate * m;
+
+	do_div(parent, n * k);
+	return min_t(u64, parent, ULONG_MAX);
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
 				unsigned long tmp_rate, tmp_parent;
 
-				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
+				tmp_parent = ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
+				tmp_parent = clk_hw_round_rate(parent_hw, tmp_parent);
 
 				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
 					continue;
 
-				tmp_rate = tmp_parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
 				    (tmp_parent == *parent && tmp_rate == best_rate)) {
@@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 
 				unsigned long tmp_rate;
 
-				tmp_rate = parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
 					best_rate = tmp_rate;
@@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	rate = parent_rate * n  * k / m;
+	rate = ccu_nkm_calc_rate(parent_rate, n, k, m);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nkm->fixed_post_div;

base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
-- 
2.43.0

