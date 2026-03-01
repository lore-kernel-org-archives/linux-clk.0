Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625A91F4C8E;
	Sun,  1 Mar 2026 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360411; cv=none; b=CMcpSWFqNUa0RNA3xuURS7VKsD3PDtTBPaUQb1955idAw5f3IbZQOIvxrWacY6yJRLiB2LiTm3n5zWc3M4l5M2Js9dbXW0zV49us5k5+3wP/jOt8NKNfPJMxf6nju9zipjNhyoFRFd6Poh16uM5Jy8bnczhLWNrfp/gQYmpLvRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360411; c=relaxed/simple;
	bh=QWxhVnUzrMb5Y/nH3h4lmW7LpHxKTL/PS0fGxPJUmFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0yw5IuVEmZb56t4/kZ0H6lOBU4NGgGN2MBMI1DA5mQq5ZzCzvBdU+uHbh7fO/wjBlsFeGK/URRrOONZElZq1drfiWy+NF/zsX2l1n21RB+6sdFqHoozDnbnoY4PsPgr26llIGPYbrGvRr/AIKE/ILDiY0KsALJw+JfBkUFM1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.uestc.edu.cn; spf=pass smtp.mailfrom=std.uestc.edu.cn; dkim=fail (0-bit key) header.d=std.uestc.edu.cn header.i=@std.uestc.edu.cn header.b=tTVkj7ws reason="key not found in DNS"; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=std.uestc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=std.uestc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=std.uestc.edu.cn header.i=@std.uestc.edu.cn header.b="tTVkj7ws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=std.uestc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=43Y/I9oWNK
	BG9DdMbprB6AV3bhzC03Dp3vwKvjGvVpI=; b=tTVkj7wsnO5mRijln8umc3JzIL
	P8JDf0IDvgNoLT9hfhionFSTzaEVDevHovwVUf2tsg0vIezNRVH6nG1LIddNxzzW
	y6dC8U0V0JMR89pMIyaUio5YAr/cXIMfzK81wTvwfAR7IXicKGjRhKhOhlDVqxhu
	mCBj5qz3/w6/refHU=
Received: from server28 (unknown [218.194.32.214])
	by hzbj-edu-front-3.icoremail.net (Coremail) with SMTP id BbQMCkCGqzW2EqRpzgx5AA--.32208S2;
	Sun, 01 Mar 2026 18:19:39 +0800 (CST)
From: YuXuan Liu <2021020915018@std.uestc.edu.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	YuXuan Liu <2021020915018@std.uestc.edu.cn>
Subject: [RFC PATCH] clk: composite: Fix incorrect rate constraint clamping in determine_rate
Date: Sun,  1 Mar 2026 18:19:31 +0800
Message-ID: <20260301101932.3014089-1-2021020915018@std.uestc.edu.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BbQMCkCGqzW2EqRpzgx5AA--.32208S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWDCw4UJw1fCr1rur1xZrb_yoW5WrW3pr
	W8GFW0yr48XF15Zr9rtF17Zrn5uFZ2va47GF95K3WIywn8J3W0vw1xKF90vF4xurW8XrWr
	Zw4qk3W8A3W8XFDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAaw2AFwI0_Jrv_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAC
	jI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUboUDtUUUUU==
X-CM-SenderInfo: isqsiiysqzikqqryq21wgo3vxvwfhvlgxou0/

In clk_composite_determine_rate(), the rate request is currently
modified using clk_hw_forward_rate_request() before being passed to the
rate_hw (divider). This behavior was inadvertently introduced by commit
20220816112530.1837489-22-maxime@cerno.tech ("clk: Stop forwarding
clk_rate_requests to the parent").

While clk_hw_forward_rate_request() effectively prevents context
pollution for pure multiplexers, using it for the internal components
of a composite clock introduces an unintended side effect. It fetches
the parent's rate boundaries and overwrites tmp_req.min_rate and
tmp_req.max_rate.

Consequently, the divider evaluates its own output constraints based on
the parent's operating constraints. For example, if a target rate is
50MHz, but the parent PLL hardware boundaries are [100MHz, 200MHz], the
divider erroneously assumes its output cannot be lower than 100MHz. It
then refuses to divide the frequency down, clamping the output to 100MHz.

Fix this by reverting to a local copy of the request (*req) without
applying parent boundaries before passing it to the rate_hw. This allows
the divider to evaluate boundaries correctly based on its own requirements.

I am submitting this as an RFC because I want to make sure I am not missing
a specific reason why the parent's boundaries must be forwarded to the
divider's output request in this context. Any insights would be
appreciated.

Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the parent")
Signed-off-by: YuXuan Liu <2021020915018@std.uestc.edu.cn>
---
 drivers/clk/clk-composite.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 66759fe28fad..952df88518c2 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -85,11 +85,10 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = NULL;
 
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
-			struct clk_rate_request tmp_req;
+			struct clk_rate_request tmp_req = *req;
 
 			parent = clk_hw_get_parent(mux_hw);
 
-			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
 			ret = clk_composite_determine_rate_for_parent(rate_hw,
 								      &tmp_req,
 								      parent,
@@ -105,13 +104,12 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		}
 
 		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
-			struct clk_rate_request tmp_req;
+			struct clk_rate_request tmp_req = *req;
 
 			parent = clk_hw_get_parent_by_index(mux_hw, i);
 			if (!parent)
 				continue;
 
-			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
 			ret = clk_composite_determine_rate_for_parent(rate_hw,
 								      &tmp_req,
 								      parent,
-- 
2.53.0

