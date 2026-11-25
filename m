Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586453;
	b=aRlUIYugh6kdGexEXx/v8l2Dj1b6ogciLKCAZpyXkrMV4QVp2m53lZI3SAwrHQ+UEdAD
	 /rozjXE3lzD6NDvXsO9ExxuqUpTWcjzQr/Zd59xVImjrgwxjrAo28bgCUuF+eQV2072DQ
	 jl2s4sJbd+L39EPz2aghvbFyPgpq9jpU9/yYoFk5Bzm7ewTTSQrbv30khJVTEkX9f2D/p
	 NG2oN0w+R/oDHG89pk4Fz/QJatwXYZDmgfuuvD0BZbn6YtBp1lXhqgY2Qw6sTDoGZMdJe
	 3GQBaDtaXDMYNSJnLX8wLdtYrLufngtMBmyQyryIw9MIFTLUcaEVHY3XkGMdv6YIFWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586453;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=OQ8eDMcUmdXK5He2mvO2Ew0LR++K/A/qA850U/+NkVc=;
	b=idjdgOJX6xK6r1wUBHqJEvPW740u8rcJxLHcSN0LU2lHVKKWQ0BmNx4Z8+48sootkTnf
	 UMg3jXNRWtox3xaCO0JqRqnkRCN8Ch4r3TjGotjex+TRNJ/kdL2e5OU+HtskcEBKuE6D6
	 55loXCEIfXGJBWrpTIN73fC2//d8KhWUTy2wZHMbC0G34g5Rwd9wjXPIQ9RG/Hbr+e1tt
	 AAwmK1u3Gd3HJpjnMJ1EB0AE2LrMNCYvgoJbpxoHZji443fQM5l3cUBhNZuFzyzqKxQBs
	 RlITuwOtlMv4O0yTTZJ5AOKq4LWaE1EAOUNf1OEf7FKDhGAw/dOBbeoym24ynG15mVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LhgaupVj;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF47606A31E;
	Wed, 25 Nov 2026 06:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=LhgaupVj
X-UUID: 8dbd8388e89511f18dc8c9802ae25ab1-20261125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From; bh=OQ8eDMcUmdXK5He2mvO2Ew0LR++K/A/qA850U/+NkVc=;
	b=LhgaupVjGQwjbqLhYKwr6pJeANpRf/BeFwXLwtzhvMi5JB7Eal0zzyVfFH0ITNNl3rHZj4GHAfPPrQZYGHieuE/IjyvpuR+5IbYykgHHmIAHM5UO0lCOGOjrQQ+Eb6P0tl8k5HuWjGoXpuZLJU1wyTrdl7WJHNMGI2Oydv3WU6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4e2de29e-fdee-4669-a441-f87b9d658868,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:23d4f2bd-9e04-43bc-9c07-a2d8d8315d7e,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:2|-100,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8dbd8388e89511f18dc8c9802ae25ab1-20261125
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1657262601; Wed, 25 Nov 2026 14:00:45 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:42 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 0/7] soc: mediatek: add MMDVFS support for MT8196
Date: Wed, 25 Nov 2026 14:00:05 +0800
Message-ID: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the MediaTek Multimedia Dynamic Voltage and
Frequency Scaling (MMDVFS) controller on MT8196. The controller provides
virtual clocks for multimedia hardware blocks and coordinates their
performance requests with platform voltage resources. The driver
aggregates consumer rate requests and programs the MT8196 hardware clock
control fabric (HWCCF) voter. Its VCP/MMUP backend coordinates shared
memory and IPI communication with firmware.

The series introduces the clock IDs and device tree bindings, followed by
the common clock provider, VCP backend and MT8196 topology and voting
data. It also adds a read-only debugfs status view and a MAINTAINERS entry.

This series depends on Xiangzhi Tang's MediaTek VCP remoteproc series,
which provides the public VCP API used by MMDVFS:
https://lore.kernel.org/r/20260427111446.22955-1-xiangzhi.tang@mediatek.com

Patch layout:
  1/7: Define the MT8196 MMDVFS clock IDs used by DT consumers.
  2/7: Document the common MMDVFS and MT8196 DT bindings.
  3/7: Add the common driver, virtual clock provider and vote handling.
  4/7: Add the VCP/MMUP shared-memory and IPI backend.
  5/7: Add MT8196 topology data and HWCCF voting operations.
  6/7: Add a read-only debugfs status view.
  7/7: Add the MMDVFS files and contacts to MAINTAINERS.

Validation: the two MMDVFS bindings passed dt_binding_check. Each driver
commit built cumulatively with arm64 Clang on top of the VCP dependency.
The production changes were also ported to the MT8196 sapphire validation
tree, retaining its older VCP API compatibility and separate internal test
hooks. Its full package build and board boot passed. The status interface
reported initialization with three resource controllers, seven muxes. The
user, vote_step and force_step test completed with zero functional failures;

Echo Zhang (7):
  dt-bindings: clock: mediatek: add MT8196 MMDVFS clock IDs
  dt-bindings: soc: mediatek: add MMDVFS binding
  soc: mediatek: add MMDVFS core driver
  soc: mediatek: mmdvfs: add VCP backend
  soc: mediatek: mmdvfs: add MT8196 support
  soc: mediatek: mmdvfs: add read-only status debug
  MAINTAINERS: add MediaTek MMDVFS entry

 .../soc/mediatek/mediatek,mmdvfs.yaml         |   60 +
 .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  |   87 ++
 MAINTAINERS                                   |   11 +
 drivers/soc/mediatek/Kconfig                  |   19 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mmdvfs/Makefile          |   10 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      |  447 +++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     |  651 ++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c    |  200 +++
 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h |  361 ++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c   |  637 ++++++++++
 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h  |   57 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c       |  275 +++++
 .../soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h   |  104 ++
 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c      | 1075 +++++++++++++++++
 .../clock/mediatek,mt8196-mmdvfs.h            |   74 ++
 include/soc/mediatek/mmdvfs.h                 |   90 ++
 17 files changed, 4159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
 create mode 100644 drivers/soc/mediatek/mmdvfs/Makefile
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-core.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-debug.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
 create mode 100644 include/soc/mediatek/mmdvfs.h

-- 
2.45.2

