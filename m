Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F434143871
	for <linux-clk@vger.kernel.org>; Thu,  4 Jul 2024 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720078573; cv=none; b=k8f8aj10hUCrU3zoWWD9SWbWvdl3zSZ8hwK3Rcr+JUMcF5EFB2TmT6JZSTtEKkPiRxfAQqgQEtDUv3Br9ayUCueCE2kkeAQMYOdZVcKTLEGAXiiuriy9N9yEnaFLxv+CsLH/JVgIdYF+kCA1/PBEkbGvfd5OYc95LIAlYiVV4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720078573; c=relaxed/simple;
	bh=+7hn+2Dm99j5MUkGlUfYPMdI3ki2Oyn9WYD+7GZ/kco=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZH3KB+yZXBwCzkwbm0tOHghTHckOujfhmvKHtorls9nH+XiNAqhJfVStl/HZ0bJaYpqQ8UZn5HDFwqGvufyuy2E52tlhdJ75EHznEqDzEGkOrnjdCxQ/4HCuq/FGzRLh+ZyEI5pSkvocqMkBhpDo4M1p4dC1xKgTKfLWncSBsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 107646b239d811ef93f4611109254879-20240704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:ae8d9d8a-e199-4d40-b78a-f089f8ac8e1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:512ae826d297ddbc64cd842ad80d9f8f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,URL:0,
	File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 107646b239d811ef93f4611109254879-20240704
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <liqiang01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1543448226; Thu, 04 Jul 2024 15:36:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 2F043E000EBB;
	Thu,  4 Jul 2024 15:36:02 +0800 (CST)
X-ns-mid: postfix-668650E1-989532223
Received: from localhost.localdomain (unknown [10.42.12.14])
	by mail.kylinos.cn (NSMail) with ESMTPA id 83D4BE000EBB;
	Thu,  4 Jul 2024 15:36:01 +0800 (CST)
From: Li Qiang <liqiang01@kylinos.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com
Cc: linux-clk@vger.kernel.org,
	Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] clk/sophgo: Using BUG() instead of unreachable() in mmux_get_parent_id()
Date: Thu,  4 Jul 2024 15:35:58 +0800
Message-Id: <20240704073558.117894-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In general it's a good idea to avoid using bare unreachable() because it
introduces undefined behavior in compiled code. but it caused a compilati=
on warning,
Using BUG() instead of unreachable() to resolve compilation warnings.

Fixes the following warnings:
    drivers/clk/sophgo/clk-cv18xx-ip.o: warning: objtool: mmux_round_rate=
() falls through to next function bypass_div_round_rate()

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 drivers/clk/sophgo/clk-cv18xx-ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-=
cv18xx-ip.c
index 805f561725ae..b186e64d4813 100644
--- a/drivers/clk/sophgo/clk-cv18xx-ip.c
+++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
@@ -613,7 +613,7 @@ static u8 mmux_get_parent_id(struct cv1800_clk_mmux *=
mmux)
 			return i;
 	}
=20
-	unreachable();
+	BUG();
 }
=20
 static int mmux_enable(struct clk_hw *hw)
--=20
2.25.1

