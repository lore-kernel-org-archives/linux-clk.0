Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H9QzLX0W"
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39ACF19F;
	Thu, 16 Nov 2023 00:01:45 -0800 (PST)
X-UUID: 5c2fc93a845611eea33bb35ae8d461a2-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZxZ3pd9QKUMQPsMbgxXDTSwYVgjtwCn7yO7jHi/LzbE=;
	b=H9QzLX0W28DUY6eL2Mp5Qh90yZj/wksb+Iu4YYhJNCUtlfnRtf3Ilv90VM8fxVQ0O30n7PXlMuB4r4dPn4F0IQ/kPmRdtw31iBcTc+jaMMXRQmiTJoRJ3SEw7+G/tFwTiof3nMBR3GsAthUdkcqsxJi07rUMTPpHr3YCgwzKri4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:5723ee85-2c34-4426-9e58-8dae76719b45,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:14dd7595-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5c2fc93a845611eea33bb35ae8d461a2-20231116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2029895919; Thu, 16 Nov 2023 16:01:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 16:01:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 16:01:32 +0800
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
Subject: [PATCH v2 0/3] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Thu, 16 Nov 2023 16:01:26 +0800
Message-ID: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.560300-8.000000
X-TMASE-MatchedRID: C+hvtS4FT8uvVT6bfkFW/gzi9ePw0R3QsEf8CpnIYtlkDFfw8NSG/Gb6
	PphVtfZg4wnhOb+JR+SAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07X1HhKzShSYnDel
	VDFbKGP8qA6iL/EaSBdVNHrvW36ZUesAV/+a7hKIzi4B1G5jJU3/5funDHxqRQFMdvtQNIUtW+v
	GRK1IMn9lrv6b+lasIdmtRsRmKkASJZPT2ZDPuzPD2QfzMDLjho65UufHcDvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.560300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	46FE3587E7C58FB6D44B59ECC25C0B042683D82F71CDB16E6E8B57DDC73891D52000:8
X-MTK: N

Changes in v2:
- Refine commit message
- Refine commit title

Hi,

This series is to reflect VPPSYS' dependency on mtk-mmsys driver for
mediatek MT8188 platform. The MT8188 VPPSYS 0/1 should be probed 
from the "mtk-mmsys" driver, which then starts its own clock driver
as the platform driver.

yu-chang.lee (3):
  soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml        |  2 ++
 .../bindings/clock/mediatek,mt8188-clock.yaml        |  2 --
 drivers/soc/mediatek/mtk-mmsys.c                     | 12 ++++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.18.0

