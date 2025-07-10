Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16CA2EFDB5
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163700; cv=none; b=ZmFunkQtWKWWC2Z41ufTf9tIvjQyT8sC8+RTQGfWpp6DBH7MdEmqnV25AjYNFJo5DzCTsJj6oLfPpipZOiCe0uzuKli0cdeOBAal5fdv0pgZEIa3MIytaj3q6fJ08Yz4lKWi2WBNYmt1X6m6g9wT3Ltq81iWs8pdkFd/fUXVMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163700; c=relaxed/simple;
	bh=iJAJsOBdjX5yU2h75u6+b08f3YAfQGGv0k5DSS+fdqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p86TqNOahJvs6JVr8CsKbqhnurAgeP5mXJa+x0p/FtfoBy62UbJ2uYDuXIV0eWwKswjaV7giQ9rWznYLFs+T6DmWCAhYYQSjkMBtCodOb4nqbime373qym8DLWhsYmpn+OzfLYRCe3rd4Y1iQuMrJUMvhO8SwMpc0Fd23Nfkluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SOtdK6Jo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SOtdK6Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
	b=SOtdK6Jodrc0izsDSfbemrFQ72XmT6Ba0N6mf3UUx271MndUu24d3YIvQIXpVaArokZvRq
	QvN52Sg4o5BmG0i/b355DG0UjxWFB+pxbMwO75r/W6KXU4Xw45iAxbfQ0jkVWD97Kp1VH/
	8WoQsseG5cnyUSHJJ6InJLED9d4mGj8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-25wo9M_yN1ynsk-08gKdaw-1; Thu, 10 Jul 2025 12:08:15 -0400
X-MC-Unique: 25wo9M_yN1ynsk-08gKdaw-1
X-Mimecast-MFC-AGG-ID: 25wo9M_yN1ynsk-08gKdaw_1752163695
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso185389985a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163695; x=1752768495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJQSlBKA2g43dFqB6TuRxKz7xFAHDfxLS8SwGXWJVrM=;
        b=Y1QXz7cX5Uz1ApQyvIyC6qmPvCLcWEhb8ATIPIkCTlCxmc3JIgNzyvtAka3Xr2EwAV
         ySA4N5f9dDtUfXu8A841bt8xHKuRVRb47U5makczcBnpwlVxVdt1pCiwtWiw2fyJO/5L
         1L2asYGNAJbifKT2Xaod0jcU827oymXgsaOpMpnfVrB2QKiVOzkz1BDXhTJOKbW2/g5E
         v4m7BWUAgKcBwMR6X7o2sX3fOqDoX7LrY4lNFOtu7TsimTgloTKBTHhcbKHPCSReyE3E
         PZquvXm0IEti923c6zXx2Kxw7QqV2wM1lgzc2yTV3vE4ss3Zg3SxtvCPr1T5YGHAxp6y
         /zew==
X-Gm-Message-State: AOJu0YyVfhDOFblDMJu6hjF3GIoRXGPGxtGNbLT4FUqGdmCBpqH+g1dO
	Phk8wYdJGAtxP7YZidBmLQpH4kECPbU+jncmlooSo1d60YmTvJ262hWxLDc7DZPNbAPHEyWquCC
	GMaxMNukgxC1lx765BP47ehMxc8qBbDh4Es8DPVMX4rB4h9ZzDpbKOGKa9WuYiQ==
X-Gm-Gg: ASbGnct7j7ho94JXA/LPp4qYEGeKF7QzqBv4aWdYCAjwEky1lk2dCAF//eiLs3a1eiU
	pgUSgN0lm0QlscTV1eaGqIDqGfl2fGkpiMSvoTUiL3l9XfK5J0wGGs6Lpugs8vzIKd2znKXVhch
	STAMknLJWpJ4YQyvvOVFeXQkvo3w7T7o8V13mGzTINpNApYKCNLXNaBS+6rGEJe/aLKBbANOx16
	01KTGPyJxEKnGRB89chAZBgnJM9oPBR68g/+CgYJLDkc++QBOVpCLMkGuGntDlK5rQqkZwVptye
	bQ9+j3V54aPS5Z0Owu7zJwhN8yH3TVCEPfAlw1vYITO/zc0vDGu9jjFPbxEV
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93046856d6.0.1752163694383;
        Thu, 10 Jul 2025 09:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEInLStwo1lDSg7F85FMOE58AhksEafUcDFpNGGZphskAtBc03MrN1OcVT08c+bAzB2AxSVXQ==
X-Received: by 2002:a05:6214:d0f:b0:704:7dbd:2075 with SMTP id 6a1803df08f44-7048b79dbe8mr93045996d6.0.1752163693579;
        Thu, 10 Jul 2025 09:08:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:12 -0400
Subject: [PATCH 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-phy-clk-round-rate-v1-2-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1429;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=iJAJsOBdjX5yU2h75u6+b08f3YAfQGGv0k5DSS+fdqc=;
 b=gM9Vog/PjfK+PD7kK6yqe+FHMUUn8OmRYlp0k9f9lt5ka6hie/ovQ2orPiYAUbVKPreNvVHLO
 BW8lUYOkRwPB/LUPMWdxoK3stAq+kbRSdWnBg6NGEyKUO9GNQDXxSDY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0

