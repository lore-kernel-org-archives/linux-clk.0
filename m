Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sFf5faKY"
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917421A8;
	Thu, 16 Nov 2023 21:40:05 -0800 (PST)
X-UUID: be1f892c850b11ee8051498923ad61e6-20231117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SakHYGlnJTkESNc4jc3OYlJVVY65U2yDXuFC27guwwE=;
	b=sFf5faKY5f7AlBZoZs9ccrUWkzp4ak9bbZDOz7n6e1tIYBjIMxpGCwOkj3tyEm/Po1pvlRXKhGNWMrQZdafvmI64R7v/2BEUMvuQ+rFXRqasJJtpKauqKVhXKTKQbLRmAZOZ9j4OjYskdSRgcFOHB6u/4N8QLBFuAaormWi2CPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9145cec3-6317-4481-9e9a-16e1456d1978,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:8edda2fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: be1f892c850b11ee8051498923ad61e6-20231117
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1633126473; Fri, 17 Nov 2023 13:39:57 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 17 Nov 2023 13:39:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 17 Nov 2023 13:39:56 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Garmin Chang <garmin.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v3 0/2] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Fri, 17 Nov 2023 13:39:32 +0800
Message-ID: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Changes in v3:
- Separate binding patch from driver patch

Changes in v2:
- Refine commit message
- Refine commit title

Hi,

The purpose of series is to separate MT8188 VPPSYS-related binding patch
from the original mailing list mentioned below:
https://lore.kernel.org/all/20231116080129.20617-1-yu-chang.lee@mediatek.com/

These binding files reflect VPPSYS' dependency on mtk-mmsys for mediatek
MT8188 platform.


yu-chang.lee (2):
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.18.0

