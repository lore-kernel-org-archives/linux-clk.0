Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586522;
	b=O+3tC6dX0+MGKyYJ+nUZLYGkUwpegdsKh+5r0ddbGtJkWI9+uTeffcL/cCvr0SkQqzPF
	 Zf17DeIrp+ql7iVUTruRdrDgn7WdFkpDlyWAjh3WLq4Y2cVdkMXRW+vX6K+AgETLpgZEB
	 5xqHunZc1tYZm08SqbsRf7lRSja9TTXEQxmVYI6zgjmQyHS/JS2S9qFVqA/XjdzzKE9Uv
	 vIvNDSukWgOBbY9sERpE+aNsr07Bj3/t9ms4QTloOhXXWhMLnf1KXkkOn0/cKHRxBe2fO
	 xiHw/OaP+AnMIIJ8fn7BSqMcueePjXBsYZ9FL++mLublF47toFXtfYkkf6h5BBoGkRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586522;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=myEPWKchpl2U8YD2aj+uKl59Z3/zuK+8w6I65qbJTNQ=;
	b=qSXtjPCyoQ6n47ReVOw5Xt/TRVfDP/TpERJv+T3WW4CIBZAMu6yEOKidOkWUdCdzKJ8T
	 fy6ITaHPZCz1ZPkVGifkCRQ9b6RIOj8ek1962bVkvxl68EBGnQIo5G9CD1Y+boCVwS/S2
	 VUv/iWSl+/jE03jiYZLJDJOcsHL3g8t0m7bsr7mLLKeOtxcP+pU0JdxKrmrz8Wlg8kcit
	 KeEDXizuVzCYsi8nvv1jWeQXVWSU4GDhIG5gv786ecIkh02EwB1y3VD5/DvuHcX2bAspu
	 DLkAOd07SAgCqcJT0DQFYSzZX0qqjTiblXfCehSUjvRumeBQHxNQuQUC1zJ8q4agcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=a9kteins;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E2606A321;
	Wed, 25 Nov 2026 06:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0E2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=a9kteins
X-UUID: b6ee7adce89511f1b1788b6acf885367-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=myEPWKchpl2U8YD2aj+uKl59Z3/zuK+8w6I65qbJTNQ=;
	b=a9kteinsT/zDXcPNdVdoNKUuUWxo00CvyIfGqIQxiAWZ2yGLARGVvB1qg9vUYoc/6JdNJj50bgaPDs/BG5Qsq+2KhWlree023btnk97DbG4nCY+MSI9gmes5mnXHS6NfVSiZlNVf8z+uMYzydJb+htrMqIQA6ndfFmBWJwwPZJk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dd1f680a-c1db-41aa-bba7-ebeed9aa3217,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:b0318ac,CLOUDID:de3abadc-cd93-4271-b1c5-c14ee34c3ca6,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:3|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6ee7adce89511f1b1788b6acf885367-20261125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1725673665; Wed, 25 Nov 2026 14:01:54 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:01:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:01:52 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 7/7] MAINTAINERS: add MediaTek MMDVFS entry
Date: Wed, 25 Nov 2026 14:00:12 +0800
Message-ID: <20261125060037.649659-8-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125060037.649659-1-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a maintainer entry for the MediaTek MMDVFS driver, including the
device-tree bindings, driver sources, clock IDs, and public header.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27461b2161a7..eed0df58178b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17179,6 +17179,17 @@ F:	Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 F:	drivers/media/platform/mediatek/vcodec/
 F:	drivers/media/platform/mediatek/vpu/
 
+MEDIATEK MMDVFS DRIVER
+M:	Echo Zhang <echo.zhang@mediatek.com>
+L:	kyrie.wu@mediatek.com
+L:	ming-fan.chen@mediatek.com
+S:	Supported
+F:	Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
+F:	Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
+F:	drivers/soc/mediatek/mmdvfs/
+F:	include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
+F:	include/soc/mediatek/mmdvfs.h
+
 MEDIATEK MIPI-CSI CDPHY DRIVER
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
-- 
2.45.2

