Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC12D3EF2;
	Mon,  8 Dec 2025 03:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765164419; cv=none; b=mp7gqzdvpUiYeW8ams8PhWai8oL2K5b6EdT2If4WkilzmAb69twnvRIgP8CB710ghheT4pN4nQVK9Hny9LVGSS+KItaPIP+qqzxIFTBuYLD35uKPcsojke/IhsZ8O1JInNVbB6bcplLqYtAhQNhHB1KcyolkprKqN2J1u3n9B4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765164419; c=relaxed/simple;
	bh=CvhpYwG7gDcOqzOspSy7aoSw/Q4WABdvom6aeLTVSLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oPMgoyKAWg/yb41wEypofwad4s9OjHg7DKdyIQVEurm9q9Ac/yxdaL0zSe6U/+S+DOj6vrDbh1m3eOyGBHYgtiZ/Bu5XQGzjEJRcdVp7d/Ugkraua2qt+DIePEN7g2fneeOzR3mJy4+j6QI7H7JeCxygzXXCZDa9kPJSV+o6wEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bae68bccd3e511f0a38c85956e01ac42-20251208
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:220655c2-64db-4e25-ba46-27df62e186f3,IP:0,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:a9d874c,CLOUDID:5d408a6936f5dc4e6b5e25aca7736830,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bae68bccd3e511f0a38c85956e01ac42-20251208
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 118387506; Mon, 08 Dec 2025 11:26:48 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	bhelgaas@google.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: microchip: core: fix pointer being initialized twice.
Date: Mon,  8 Dec 2025 11:26:44 +0800
Message-Id: <20251208032644.25620-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix sparse warnings: (new ones prefixed by >>)
>> drivers/clk/microchip/clk-core.c:915:10: sparse: sparse: Initializer entry defined twice
   drivers/clk/microchip/clk-core.c:919:10: sparse:   also defined here

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511222115.uvHrP95A-lkp@intel.com/
Fixes: e9f039c08cdc ("clk: microchip: core: convert from round_rate() to determine_rate()")
Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/clk/microchip/clk-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index b34348d491f3..20f25d2db05d 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -916,7 +916,6 @@ const struct clk_ops pic32_sclk_ops = {
 	.set_rate	= sclk_set_rate,
 	.recalc_rate	= sclk_get_rate,
 	.init		= sclk_init,
-	.determine_rate = __clk_mux_determine_rate,
 };
 
 /* sclk with no slew and no post-divider */

base-commit: cc3ee4ba57b76deefb52aee5f57a46dc07bda9f7
prerequisite-patch-id: 6cc5a0ec0db4756cb95c5d67a3d27a57288fdaa7
-- 
2.25.1

