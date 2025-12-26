Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791E2797B5;
	Fri, 26 Dec 2025 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766732181; cv=none; b=eEAeysVQMzDAi2RKt3eKV2UR1X2RX0Rpvj3L8VxKuiDzQvTUHKkFW/OOqyI1XHp3DQJM+UdhbvDw6cmQEoLWlYYoLuY+PYXKeBM0tNd721JokF/IMZOUnemwBS/BglQd0goyK1dYlPP/ZV7mAvzlEqfgqLVW/yk35F5L9kXu8sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766732181; c=relaxed/simple;
	bh=nZt8LczdeEYtuXJI/rXMtv2yMXU27iWRkv3bAqS2KIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBPFzyXcmDRxDbc6GslwCls8cfw0wVDnIrvwo78qAYdpU6k8HpUKNcsHCllHr8E+hs0kwmhgPBSrMo0oTj9PHrRkdOMkwgxov/sUq77ymim9KXRb6X5DLcucYTbX1Tpfkx+4RgSH1ECpefJH9T1SxNt2/4EnSlnyGsAhjfJSZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 92449340FF7;
	Fri, 26 Dec 2025 06:56:13 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 14:55:27 +0800
Subject: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
In-Reply-To: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=nZt8LczdeEYtuXJI/rXMtv2yMXU27iWRkv3bAqS2KIg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTjF5VDd6l/FLTRfQrAj3nlV36Lr8SOL8oeon8
 fkW0K12Y0CJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU4xeRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1iLxAAjNip2N4yTDRtJTqrhY8r8mz8gTkNfoCQEMKFNdEINtSAILbGasR8C
 1pWHgkxG+N4hU9EbxDYSJDngPpw/pExvST7FtKhNabyZps9xIgoPcXyeCaV/dQj9twprwdeswkn
 QFREIkGEpDAFiNPVnIfxWTNRzQFXjVHcIBbpebmqX31FoP1IGEky+SqsP5xpL4pnLmparPvsMcK
 iC+sP0kMuh23dGuz33HGXA1OPycxz0Y713L5YHj+JOjKOiz3km6dDv6cAc798h5WDR4YUCIEk76
 8gaxk70zU6IJ4Y9+9/3JU/Un5YtfUGTgfr0yDkiaxJJgPvbhp+d+e6aedOoN++lcy+nxNTtwxos
 2nf0kK/Lhv2B44e9LCt8AghD848V70sq4JU+4Wd+MloCWcm/ObojqBy+pBkoWlweHqQfQMw2o/7
 FtiDrLj1gS0KjnI88ccjfZZu9bAsEUVaPQfWnoLMuoFCPZxhxE2Ce7jHkraDo2ghL+TqLj8cN8U
 ml2wOD5TimEt7/jbOwEKSxxe6AqIAHbtm5zy6PeQNCLtQVvzUS2aO4nb+uubHpgeDMM9wEIFJrj
 hA7HzjHu6Yb0pU/R9HxGJXnQcA03VyAFKuYPsp/QHiC4fNibcYNCU+JotYQNlFTyu4WVCkKo+s/
 SIhP09p0t8mJdB8oQ/QX0oQBRJY0oE=
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
index e1272aff28f7..8922e14fa836 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu." _K_RST(_unit), \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0

