Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1313DDC7
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507018; cv=none; b=oIQVyiQqnyV7/9vzCIAxa4hQbH0JkMTb9MmVruTutwgPXaqdf4bGCK8GMcd4gmFxdd91/gXXKCf0sBYBL7ukAMtegH22YexyEQsZND1opKkH04lbGNKiWbH9jnMhx+8s3sS+WuOnnTvv32A5ucP8IKNxV7Kv4nB7n7g4vbaUgnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507018; c=relaxed/simple;
	bh=x5BIL8YPCH1PyHXr5Bh0Pv+r4BZWPL89xEyYnm/84Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nvWtITj+fgnO4FqU/RecdkAsiMrhGgWMdUXD4EhqK2THbj5xj6qxF+NPvntXjWBd1VT826KkUx12Whl3xdj94T4lSItu11iFO6kSGglmbX0YOUaAGhrHMccVAWqy3+L+2GABIkLmeqU15IBo4a3SmotzIxSGp/VScwWV6lasQwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9b734aba3dbd11ef93f4611109254879-20240709
X-CID-CACHE: Type:Local,Time:202407091400+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:b94e3024-705e-41a1-a59b-0717b37f6a4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:be8170e7c891ed3b4a4a150d428f5e93,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,URL:0,
	File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b734aba3dbd11ef93f4611109254879-20240709
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <liqiang01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1746295649; Tue, 09 Jul 2024 14:36:43 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 95F70E000EB9;
	Tue,  9 Jul 2024 14:36:43 +0800 (CST)
X-ns-mid: postfix-668CDA7B-3937851568
Received: from localhost.localdomain (unknown [10.42.12.14])
	by mail.kylinos.cn (NSMail) with ESMTPA id A7C24E000EB9;
	Tue,  9 Jul 2024 14:36:42 +0800 (CST)
From: Li Qiang <liqiang01@kylinos.cn>
To: unicorn_wang@outlook.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	inochiama@outlook.com
Cc: linux-clk@vger.kernel.org,
	Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH v2 1/1] clk/sophgo: Using BUG() instead of unreachable() in mmux_get_parent_id()
Date: Tue,  9 Jul 2024 14:36:38 +0800
Message-Id: <c8e66d51f880127549e2a3e623be6787f62b310d.1720506143.git.liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720506143.git.liqiang01@kylinos.cn>
References: <cover.1720506143.git.liqiang01@kylinos.cn>
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

Fixes: 80fd61ec46124 ("clk: sophgo: Add clock support for CV1800 SoC")
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

