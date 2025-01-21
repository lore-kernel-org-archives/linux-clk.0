Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E92556E;
	Tue, 21 Jan 2025 06:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442255; cv=none; b=JSrbLik4mHF/a5AOBldCVwTAuzhRYIKPbtufe0akOoVhac0JJqXlSK5s/atFlg9CfyVk/g6YRx6pJVR8WSvvLE/0Els/NHfjEDK4g1RsUKISEn9vSIQrYXJf+Woids6vMZFU1Ylsn+0Axj05x0w9190qFWmoguqme5ROljEtXz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442255; c=relaxed/simple;
	bh=5noxATsUsXQdIZ2Kds1b6ZeWyPg3MuYmcxs/gyqvnj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRC80eLb94GcnRYupQBcQ57BVCxvkD7grolVI9G9TM8UVVIXQr/+g/QzMVEuGWlrEj2JCL7KhsrFTsMgGlxRUbrGBFX7B/eS64DcfxOl57AegLqwuc9z0CUYNuycYqAuxyG0zI4NhwZUfXtdWNxak5WaAnIUhZAvANX1xtgQQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Sdd7gGOs; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Sdd7gGOs"
X-UUID: 0b4d12eed7c411efbd192953cf12861f-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G4jUXsEbJlbZvKNo47vVFAbnJBqKkTE/5kZxLs1/jak=;
	b=Sdd7gGOsXf+uD3XzKJxnaO7LEaTLPr+0bR4Cgd2GNPa/OAzaSGgE1L0RgjrkvatKQhC06bFW3ORLu8uD3gntCw+DwZsABxQkMvM4LVA53ZqK5+5PHKjggztm1YpWan7pBSed1/fSND6ijFCBUMqtu2Rah7D3PHtiysZPq/+Csew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c416e7f2-33b9-410c-a4a5-13fba8b5096d,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:63c63638-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0b4d12eed7c411efbd192953cf12861f-20250121
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 761274048; Tue, 21 Jan 2025 14:50:47 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:45 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/2] Add SMI LARBs reset for MediaTek MT8188 SoC
Date: Tue, 21 Jan 2025 14:50:39 +0800
Message-ID: <20250121065045.13514-1-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Based on tag: next-20250120, linux-next/master

When we enable/disable power domain, the SMI LARBs linked to this power
domain could be affected by the bus glitch. To avoid this issue, SMI
need to apply clamp and reset opereations.

This patch mainly add these functions:
1) Add reset platform data for SMI LARBs to implement reset opereations
   in current clock control driver.
2) Add bindings to support the reset controller driver.

Changes v3:
- Drop the v2 smi reset binding
- Add '#reset-cells' for the clock controller in the image, camera
  and IPE subsystems.
- Drop the v2 smi reset driver and use the existed clock control driver
- Add reset platform data for SMI LARBs in the image, camera and IPE
  subsystems.

v2:
https://lore.kernel.org/lkml/20241120063305.8135-2-friday.yang@mediatek.com/
https://lore.kernel.org/lkml/20241120063305.8135-3-friday.yang@mediatek.com/

Friday Yang (2):
  dt-bindings: clock: mediatek: Add support for SMI LARBs reset
  clk: mediatek: Add support for SMI LARBs reset

 .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-cam.c         | 17 +++++++++++++++
 drivers/clk/mediatek/clk-mt8188-img.c         | 18 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-ipe.c         | 14 +++++++++++++
 4 files changed, 70 insertions(+)

--
2.46.0

