Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB4199A2;
	Thu,  9 Nov 2023 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UUssYuZ7"
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434A1272C;
	Thu,  9 Nov 2023 03:11:35 -0800 (PST)
X-UUID: bc7357e67ef011eea33bb35ae8d461a2-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aZVnc9AgDV6+iECXJWjMTt3cI2AykKcbaOkGhYYgovc=;
	b=UUssYuZ7OdW0wyoRa5KtaiJW7vCbuOUkzNvRnR06P5zOlmXQSNwBFLGZ3Bmrk2sI2XDLgxHdZ4V4UZlynl5INatRwopXekeeubpd6+J+eUsGA1Y+hdJt4A6UHoc8oXlQuLH1MxV4oTlYyB+cXiG+OY/R/E2FaExOWz7XxvRQg5s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7a730073-38d0-47c9-a21c-d29f6fba4c6a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:33343495-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bc7357e67ef011eea33bb35ae8d461a2-20231109
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 691086791; Thu, 09 Nov 2023 19:11:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 19:11:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 19:11:29 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, yu-chang.lee
	<yu-chang.lee@mediatek.com>
Subject: [RESEND 0/3] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Thu, 9 Nov 2023 19:11:19 +0800
Message-ID: <20231109111122.371-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.212400-8.000000
X-TMASE-MatchedRID: exF9zuYVkeR9PhHWTNJFHbU+IyHhkXf1KFFZAe4nyZ5ZLD9SNJ9sEowR
	9ju5YZeAtogp0YMuOCEMyw6hMrtYUCY0eULsNBXlngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDULlJ6umVKSHkcPSpLzSbqBGSXMELWf9jPNQ6M+1naT9PRAKn4+zi3ZtM3RsT5sQM0lhu
	QRO7Ihs5S8eRTa3jOvy1YU20+cmhxBLAb/FTpmUnQE0HbT5LEft/yYljnuhl10loENhqV3WW8X3
	5fYYQgc
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.212400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DFEAF532F7F6EAD651F3B0AE86316EBB29B32302E3EB4D4F7B2831A7D8F3AA302000:8
X-MTK: N

Hi,

This series is to reflect VPPSYS' dependency on mtk-mmsys driver for
mediatek MT8188 platform. The MT8188 VPPSYS 0/1 should be probed 
from the "mtk-mmsys" driver, which then starts its own clock driver
as the platform driver.

Refer to the suggestion in the following patch
https://patchwork.kernel.org/project/linux-mediatek/list/?series=796808
https://patchwork.kernel.org/project/linux-mediatek/list/?series=798392

yu-chang.lee (3):
  soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm:mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml        |  2 ++
 .../bindings/clock/mediatek,mt8188-clock.yaml        |  2 --
 drivers/soc/mediatek/mtk-mmsys.c                     | 12 ++++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.18.0

