Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4488523EA9E
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631415; cv=none; b=bCy5ecGejC+dSBVFAUgAvo5IOHL/nIdZLxAM++quHJ1j6Zhw5g08tfGVGy8O7tprHQaA7Su/iw9al9YfclrPR4AHXxDgNw8t+cRVclH02Eu9adMU1IF1uxBKTBHHTQkMEJ8vX3PmbFjoWz/OYhAZ9Wne2rtizTu2LuZi09D48Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631415; c=relaxed/simple;
	bh=I1J3S6x5LiLW/zyWZ87aQm6praqo1qBzZH7S+vE3aU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqYDLpcc7k3gYSSXgdwvHqWSait3E2L/YaItBy7m01DYHcilZKovxxpI7HPLIJ/5UIDB9meWEEBddcDaHiwo9OkUyeId7e6H9yxTAay/SW5SUeit/+YjMszpudwVZQ6BB+OzOtRXf5sgiZ6rIVNqlTvQKb77mxbTLjBSWL6YO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuvOvNYd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuvOvNYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36wLOxtnUtAVE2o+a4sL0tiiKKSB5B5mwGz4ZRb7cv4=;
	b=RuvOvNYdTLnqYqmoyGKNVVavvbI7TktPkLgKK4s6viBjFXRFGANi58X/Cxd35agsvOX1Lk
	rLTYWO1mJyqym5V2Y1TJf16MXfyrvkrua18PXLoLIACK88wLWuWDsOaufXqBqEEJ+3qiEF
	4eFYy0CkG0WEqRDT1LFYGAXNJEVc4PA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-XbtG2hkINIebXDKb3PJMIg-1; Thu, 16 Oct 2025 12:16:52 -0400
X-MC-Unique: XbtG2hkINIebXDKb3PJMIg-1
X-Mimecast-MFC-AGG-ID: XbtG2hkINIebXDKb3PJMIg_1760631412
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1f18cbc6so17940616d6.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631411; x=1761236211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36wLOxtnUtAVE2o+a4sL0tiiKKSB5B5mwGz4ZRb7cv4=;
        b=LL+2KbBXEIpXbaBz3W0hvH8DGNbWWc2d+wVy8eP5QgIAU1qmMvxS/Frqme+4fFZXyM
         IC4m1jKusXv5CJHgdYPAZFqZOS4EYEabJcNM/sVXzduYMSk1I+ZnUp7W0QBPBwzOwrON
         zRXABIUcRjokhbtjOqBHig5uKI/Zkdhg0PvQgbPafkLHmuBtQkVuW6iZxWsVVqZrXuee
         pMqlCrnHnr9vSc2O0arz/S9I5MkCzbymhL+p0JLZeMWwVuzgAomMB3MIuwv0Sx+i2u9T
         8sTntJIkK/79as9QvUUmbqHY7kOTzeepk5PXPbl8E/8i8sshb31c3P28yJOWhVn4wArd
         E+Fg==
X-Gm-Message-State: AOJu0YxGxiXeKlIh+MXlmHgdCv5oQj+g55cTFM+CMbhC5/b1JNNdBdYO
	cqX5sbc2CsrbxgEqxXEs0V4kfvs1+s355Rl3LuHv6dYQijY9aTFPB6PkZu1sAtCRCtyygyfqZAR
	zRsUtIvjSo+T4eFSsHOYon+Xqsifq34Sygjc2peSA/XdZZtwgaAICoE6Ju614S+HBYweUA9w3cw
	ndGWfXsnlUbOVX6x2dKtZ1IhvaKYb6bxy4gvQ0/c7vEmp3
X-Gm-Gg: ASbGncti08VNm9Kguj0J8Uc8BaKidJlPcTTB8c1/lsZ1dw/2KvqGOwuhHhQFvG1bsEV
	rebVevhQd4/aAYjWO4LVk906kcs1+yn4c75/rv2EK6EjL4/xd9v3yPDbbHLPEcxs1eqr8reOOHZ
	ZKqWSfpifptQWTUWXvOwTU8o3aYoDR0IgfcL1pLsQuThLfe39is0l1Sf4TlNzbKJhF/LZ5zrOrq
	spPYv7I0VdZGps73UpfEdELiVEZDxTj02aOY0AzKFq06e5Fl3UzvPmOyCmdp5Y2HySpISPDeV9D
	KfysbOH3HZHFxKSFihrjhSdZUsfPgajKRtcEgXMVOfacgVF4oFTyPvP6pGGj8vSy8LyctBcQAil
	uOMC4e11tu0z3yNIBRhDLb/o7m07ktmRPO09SiLC9phfHWzHO0NtiRk78czLx0HeougU/CQ==
X-Received: by 2002:ad4:576e:0:b0:812:dc64:e8fb with SMTP id 6a1803df08f44-87c2055e0f1mr11220816d6.3.1760631411311;
        Thu, 16 Oct 2025 09:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2H4hqxbPAz78vUyuVxepWRoN/7lFlbe1nAViv5z5DCNPAXcja8zNCahwq2KBdmRw44i1b6w==
X-Received: by 2002:ad4:576e:0:b0:812:dc64:e8fb with SMTP id 6a1803df08f44-87c2055e0f1mr11220206d6.3.1760631410751;
        Thu, 16 Oct 2025 09:16:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:29 -0400
Subject: [PATCH RESEND 4/4] media: platform: ti: omap3isp: isp: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-4-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=I1J3S6x5LiLW/zyWZ87aQm6praqo1qBzZH7S+vE3aU8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqWZf/X6Vm73eU9DzfVsPYnraWE1XSySZzb8F5xoY
 rktkXlnRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMxs2Zk6I1g+qq60NS5suG8
 wfeKlfo1s4O9T//Tc5+zKK/wF/9+S0aGTQqnuNcodYtsesUwpWW2WUbR1Kc/bltnPZ093TDF/XU
 6FwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f51cf6119e978a3a33939bd83c2e676a43ca2c6d..8ac2bdcdf87b1fa0ad1b064cbeb7f1e7519973fd 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -240,11 +240,11 @@ static u32 isp_xclk_calc_divider(unsigned long *rate, unsigned long parent_rate)
 	return divider;
 }
 
-static long isp_xclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int isp_xclk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	isp_xclk_calc_divider(&rate, *parent_rate);
-	return rate;
+	isp_xclk_calc_divider(&req->rate, req->best_parent_rate);
+	return 0;
 }
 
 static int isp_xclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -275,7 +275,7 @@ static const struct clk_ops isp_xclk_ops = {
 	.enable = isp_xclk_enable,
 	.disable = isp_xclk_disable,
 	.recalc_rate = isp_xclk_recalc_rate,
-	.round_rate = isp_xclk_round_rate,
+	.determine_rate = isp_xclk_determine_rate,
 	.set_rate = isp_xclk_set_rate,
 };
 

-- 
2.51.0

