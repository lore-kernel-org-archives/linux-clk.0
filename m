Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398662571B0;
	Sat, 20 Dec 2025 01:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193111; cv=none; b=nVZOG9G6doKrZnIoA6qlK0/BkfdbJXegoCOKdmQGKRRJ8F4fViLnKazZis5GvekfQD2OtCZGpxg+aPHXidZdthjay96y+bj/PzUEAvXwJdzLf8DRcVB0ONBVmyG0iyrlVR17d+2kejDdfWR5P58FE8bAnkOSYsAq74HV7M/t8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193111; c=relaxed/simple;
	bh=pZvlBGt2pzETwcYnjHwAYqZuge1mnwnMowldtQqPkxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UrneWY5CNJUyolXvAjdLCx/zwv5pcPdP0nHp8HZpEapXYj60nkTrKlW1k5EVjsmBVrmShIS1kdRzNxKdumbiK7vrKr5A4aAalu6WIBoaiwup9aTcSlJFAWJHfQ43gTwm989rbYyns32DulYuRuDq9E6fnZhqvjURAiM4CyGrdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 96AB23419A3;
	Sat, 20 Dec 2025 01:11:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 09:11:20 +0800
Subject: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
In-Reply-To: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=pZvlBGt2pzETwcYnjHwAYqZuge1mnwnMowldtQqPkxM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRffGaVMaBy6OarV3nXnOEPmHtzZ2cThSGeAbp
 UvTzM+so8uJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX3xhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1hIQ/6AsfDedYnwBCpUgxJ5z3nN5XFQCRKptDFDZzETpb9nRy99TCqBdm6j
 tJUK9p/1rqtRkAvk1SVmT1DP6fouk+GCsYOj/js54J5gMzrogFn2oINQKGz+ZQAdVZOM+BCXdKz
 N2S+4NgO3aKyIReIsN58bQeUpNmm3hR3EUJSORbMF1iYt+dgJq2tevEQ1zRSdYsObBwKBbr+fvA
 o4jxHc4z/85FV4nxRbjm8qGPLEUgTGCIDrsbawRKqNJ339Tag9guevBZPu9wGBGbAFaUbaxWMV3
 tlwzHXTpCJIX27QSnHy8IyZl3WAejBTg3ot5GvEGZ9ohjnOEE09rmLrWohoH3LTi+b2/H3dPaQU
 QXrApoLxPiIEB54ye1Nj9ND4YIp0aUWsP3Jf3B0zhN9rmVQ1Cl9qAL9JEeaUR3H3Eaj1x7wmOcM
 GMyJu6X3EHJ3yFNrOKPpwb2uRO/x02sfxSz2z/lkDAqgQNnin9oL+Pdqzc9A0u9d63RRX+grPzc
 yM2kef+ZWpH5c2UTWvGO6xbvE2x5pEIPRjVIR73eaoecQCZ/HS2XkKJVw8J+y7ZTLVoa84xNmVg
 8610yrpkd8TYWTnyOWnD47abFK1PyF7zeFy/w1IG2CfrSVGvF4Ksg+ABcGF+eUXqqok6YztnH7s
 vCUivuTWyk+zXasKyeUO7Wcwq399XY=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Due to the auxiliary register procedure moved to ccu common module,
the auxiliary device id need to be adjusted, otherwise reset driver
will fail to probe.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/reset/reset-spacemit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index e1272aff28f7..0bfd90567011 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu." #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0

