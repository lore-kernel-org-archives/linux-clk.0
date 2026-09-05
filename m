Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4494A0919
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612283; cv=none; b=Dymj+8tWlDDS1okMlD8ge24pkJZdXxWfGMK8gVGHw+f3IYvhn+Z6DAUsa80CntQucAuKmgjNbCTwk6+Pg33VRhEfP/tiGLBq2DzYhBNUylZcqyJK3Hv7BUfVidLUtHAMphP9if86d/wp9+/6Uc+HXYmPaKjZ88sQbevbuiOEaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612283; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVHkC3BDCV9b1zlT8XCcJ+wMwMoV5Mh4Zcfoc7USwgdBB13IRNmwIKmBR2ynFOfUmCkc0Qr4sQELNKJsd6WzPizMNCuhcIbfMr95uLIy99NN9RUpcu5VBcg6ZD621Utdkmv90ZwjogEYyjz6bz4hqkzpkhVhy1YKtmxB98xj450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzBSFuhs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBSFuhs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d560775ca2so14371485ad.1
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612280; x=1789217080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=jzBSFuhsbkrPCo505JQz3G+xdlugkLc+IBPvSy0XsIfFSJd/c8mRnEylKYpvF/ZV+K
         iQUQvk2s2tPlR5qay3SW81SyUF3LUWrPBD3BL+8kQzuMGyi+PCzUPb2ziwy44odAhWxJ
         KTAOHC2ufuge6vYiRCOS/R/oyBcXjCrVSqvelyemGLd9ZIkupmKYvwNzB5GYnZNZPujQ
         Hjn7VrXRaVdL0DKmXwRFpiet0mtZDoEHvKcaCOFkF1M4dpc5T65ijaEJtaFuAXazWNgX
         EnDpoQPToYSNlZENI5dBX7MQGfVkGX5FExIrLz0LfI9EpCnPlAHcMuO4m31CgfjJ6jSx
         hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612280; x=1789217080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=Oofw868iPgw5LkCFdFRqByvILIQRykA/Nxf+NCPfRot+X9SGquJCiay2PWnUihmvkM
         GOQRBgcGaEs/qRDKStCr7kKcRxR0B6C4/+tNlcJjUVUbF7S9MdDPs68w8JZKvjlLmyrY
         CTiYoA9+eYm6tq/SwUslY285eDE2Mpo7c/1P1SoNKnFYy9MhhMCXWf7w3WtphK1HcWWp
         a89dazTdw5MwZSDivdHGSM/CvFXEVVifwSRb5yI4MFVzf1SfXbrtDtw+L87XUjjsheI/
         LTs5hovgznrSHSAlipQLKguRbz6t2lmV1tbIAIi6Vs3x8qR7MfdjyHTj/wDUlgXeMfrD
         KafQ==
X-Forwarded-Encrypted: i=1; AKwUvBw51c8FCruOMCg4hlFvwOAJWXRzU/kzrVA+ZvQ3OzslZTBkL2VXkubWGcpYZVMk1AyeSTWT4c0x8ZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mH/gMlCV2b+AdkZUe2N+8Oh1Q3SHn1DxgaO+k7mK3m4fXoWPHQ
	Ot1nZt0XOcBVpgFAEdJqcK7cCF01tGhAfoWVwkR5WlUH/10NMaukwE5Q
X-Gm-Gg: AYBFou0RPY6jXO1xzhi0ngdU0fzibrQzlQIoap0Cw2EzwfZHEl3aDOnqvJ7aypmej/6
	cOUZWptQs1U9lWePrsgOy5CYyXgQKPUo+v0JpG4mEQidvcyEAbyshnfAzFctU0DWFDrSSwTe/HF
	Y6hKaX/0AI1g0BpOMGtIJU0FonbdRfH+jpiezJYEuCnCw0+Q0Icl3GLTcncJW2RTc/2HeHrH0WG
	Qxe5UoI7HTheIT4JvDBl08crCP+kjDW8WMr0mDyr3RCMxtGI53UXyZs63XKN8SB98YnH+TYYCQB
	rHsHNQPd4e6x7c5H8BFCskP01Yl4fpOMuhcGDD+vYFavw5qzodB/gZdUDh5W83t4vusvBfS59kL
	5XSV11kctbmBGWpUjDVCg6BPdDukEaQ2t7D4QLgbsEtDGBB1JXzkZKHULUG+YnMyvMuPYjF9x7v
	Yh1dwPmgFFumacAZGcL9OsEWXZnUSVoPSJ2NaFjo+wcwIzuuXoiPperTPuDS434mKeDoaUKooFU
	6jUIbRtxjpmU8dIulIFNHcpkMvitwL4
X-Received: by 2002:a17:902:e805:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2db3b351c2emr5928535ad.5.1788612279984;
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:44:32 -0300
Message-ID: <20260905124434.6163-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

