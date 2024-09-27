Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315873501
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428964; cv=none; b=uv1mMYS/zifMhEX8yUMaplhVAVpRcMsut8/RPWI7flNBVMdFhlvBbOox2/dHwG3iKn3px+VghyBpIobjcDzJheJkzUP7Im2bt1jW3dUqAKM7sXypA4gzeEhRut2bWXAr6dD7zoQi3xwmKz+85eb5cZxJmkTVoVkX6DBTHme22Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428964; c=relaxed/simple;
	bh=nUpUWNBamg84qW5iTRwtodgh/0RU7dlLqiD9L8w4Y9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Csei12WkrdnDAfXAn620RoGbqVRSLqw/O56cPv6tbaCh0BG3o1havbLoupI7K6dISuwr6UerIEYgSADb+P0yimrKyVXIK++tLRDoPxfuu3gziSWAgzaQ0qMa+OUrQkEhqOYRMGcEnWT+U08LGPvFUtYQ3ZcyDsc+H9EPLm0U8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WUlQQfua; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WUlQQfua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727428959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
	b=WUlQQfua8huLWyDzJVXMjZnffzf8kydwLWj3RkusJCSqa9yNWYrojJ84c+jQZC5C/cvva5
	/qo7ge45ATnHIm35gg6CX4Drg7MlEPLQE2q4lxKcCHoE5RcugEwT1UJu30NjvH8346Tb+a
	vxn39B8w0ZugrJmRyckr3CnQ3ABPH3k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-ZFGd92BiMNGKuS-k1FIccg-1; Fri, 27 Sep 2024 05:22:38 -0400
X-MC-Unique: ZFGd92BiMNGKuS-k1FIccg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb33e6299so14102045e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428957; x=1728033757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqW1Z6ilDYncO6WIxfWW4lU0O53b+hjUNpAszcdmBJA=;
        b=P8ea0wQ1Ud4EeLR2jGG+VqvwiNBvCQksM+UqoSnMndKW/B1DW4/wSgmUBH8Hngkd2y
         EcpeRfeSCmxCy2PZG0RjIQnppkilTnKxprF4wfVLqbVCQHTUhiJudkYL5RttYJSvDPb/
         V2gdDbGjts9iuf0Ni1R0+xxq4hQ3rs1HwKiCZ7BmedsX9bMoYWNLCP4D5y3pX40vttHj
         9xdiGOcLAB5KIwJolSJpnHkuM3ACRlihwyacInbuYgt6h2aw2s0mZf9nWuRdlstcGkhR
         bClilqz1Tq2WSLS4ZW+80mBm1pGlfEz/9IDStFT2UMu3cC9IarzmCKYyOoWpFWRnRgjW
         9mQA==
X-Forwarded-Encrypted: i=1; AJvYcCUO564VfWIShEsMWV1M1X09bB8Svc0sWw3Tq7bOhmR9GdTZr3K5nxorls/8TnuIdbm4XhgwJ+AJ0jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsPx8SKooeSGYkInYEQmdYmCjyF0z9Gf+Rm4JoMbVAb8Bo1sU
	+6Yr1vttoPlY4hTHzgsTfzBDaiW0iJtwp/7S5f9hDdq/w8jMmopFXAoFvAUruUMkZLhD1LyeFfP
	NDcPCDRYyq1J/L9Y8Qbd6zY1uemSjZ1mBWFuLzjjRWaAF/yrbydRuuBtP9A==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16809175e9.26.1727428957289;
        Fri, 27 Sep 2024 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWCF/p5auGwFMcVVPbMUAZcGcxwmZH59KUVxG01mmgdWdNTVcOZrU3cbtQVowAR5ZCeffkg==
X-Received: by 2002:a05:600c:3b93:b0:42c:b995:20d3 with SMTP id 5b1f17b1804b1-42f58484b34mr16808955e9.26.1727428956917;
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddadcsm68540605e9.7.2024.09.27.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:22:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: mediatek: drop two dead config options
Date: Fri, 27 Sep 2024 11:22:32 +0200
Message-ID: <20240927092232.386511-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow
module build") adds a number of new COMMON_CLK_MT8195_* config options.
Among those, the config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC have no reference in the source tree and are not
used in the Makefile to include a specific file.

Drop the dead config options COMMON_CLK_MT8195_AUDSYS and
COMMON_CLK_MT8195_MSDC.

Fixes: 0f471d31e5e8 ("clk: mediatek: Split MT8195 clock drivers and allow module build")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/mediatek/Kconfig | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 70a005e7e1b1..486401e1f2f1 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -887,13 +887,6 @@ config COMMON_CLK_MT8195_APUSYS
 	help
 	  This driver supports MediaTek MT8195 AI Processor Unit System clocks.
 
-config COMMON_CLK_MT8195_AUDSYS
-	tristate "Clock driver for MediaTek MT8195 audsys"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 audsys clocks.
-
 config COMMON_CLK_MT8195_IMP_IIC_WRAP
 	tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
 	depends on COMMON_CLK_MT8195
@@ -908,14 +901,6 @@ config COMMON_CLK_MT8195_MFGCFG
 	help
 	  This driver supports MediaTek MT8195 mfgcfg clocks.
 
-config COMMON_CLK_MT8195_MSDC
-	tristate "Clock driver for MediaTek MT8195 msdc"
-	depends on COMMON_CLK_MT8195
-	default COMMON_CLK_MT8195
-	help
-	  This driver supports MediaTek MT8195 MMC and SD Controller's
-	  msdc and msdc_top clocks.
-
 config COMMON_CLK_MT8195_SCP_ADSP
 	tristate "Clock driver for MediaTek MT8195 scp_adsp"
 	depends on COMMON_CLK_MT8195
-- 
2.46.1

