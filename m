Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8292FE310
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181880; cv=none; b=eCFejUeidI9jtkO4omrD9zs5LVhvsdB3mtmUMJ7Imcycj9KUhk6QqKCmWxmapSLUZOtfCGWOhgmQm57UCfd2OXaxjRgMqA3b2ID/MU8GU7o4iXRyDvYDfVscJnOUTHILyVdwSuEULY63IRiilOo5EoQEQ2seN7UBO/yakA82rDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181880; c=relaxed/simple;
	bh=sfg1D1VawT3AeNVMpNc6Mus+O16Hxr+I3BmqtW+ekY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUSZC/CEcWB7xv3EBtWy4jiuxRtITgUMn0ZqemhaCrm+I5d7GsH+/4q8zP3gKY6NZy8U/nvy2xAtDNCbvLYMKJqRyN9lq34PinHMpuHiT/qNuWIDVGoc/VwRiy37iuuNenI/GBtphjwpLwNJ18hPrmjBWa5pcddGZko3EaQOzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U1cZ1/Ka; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1cZ1/Ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
	b=U1cZ1/Ka/5DtHGHJdDQgO929F9S/0qcyzKR0ROcM/hrJZlBpXvaibEa8hp6ujy4zGmkaqV
	14nO4T31dF8v8qkPrAUu0omJVzEAPuPKCeeEmS+oXKhUsmgkCoT44HejEuDBApFUHcxfTc
	ddw03XhZZ6Ox7f8an1cIM21cvLrE0OU=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-JqF4Atl9MqGqgD7YQVoaSA-1; Thu, 10 Jul 2025 17:11:16 -0400
X-MC-Unique: JqF4Atl9MqGqgD7YQVoaSA-1
X-Mimecast-MFC-AGG-ID: JqF4Atl9MqGqgD7YQVoaSA_1752181875
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3bc9d9590cso513813a12.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181875; x=1752786675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
        b=VpIlOpPtgG5k4oiv8IYVuDaNYagWTVve2CpXY9SYLy+SEpiOa3WVkmo2NIV1rspssB
         xvCUEXTnnp5YLOgxTtTf5zI/HDbXcOC7oJLlQBdlq3U+ZqPkhaGqhR8fZTWisIvd8mD7
         YdtrAiGJPkMuuY0L0itw7HBuhIU1MgY7YyUUi0RA3G0B2KoGwA+eGFCHQdiiT5E0HmOE
         XZKAzmL1SmVVkE4VGSKmPsUqcCZY0DnBG136ldBB3S/SIIqLd9NXzgXCMN4fMqufPJXv
         CVVDqmrNLwDgc4MNeEuISgACJRQ1KX/Jhstqs0RPAxeCeU8nWiE0mD3JNXxW40HE8mye
         OGCQ==
X-Gm-Message-State: AOJu0YyPdenU3HT8M3QmVKISVHFWnXqh/etsKdcfsexkZbcxRVcybh+M
	ZFbfD66S40fhwHC4UblTg833NIpq9MKP8Qby4S6gEvuf6a8sW1zm3qTqh0KBx2apbE+i9HpBERL
	gaZKxvxZermsESK2uYGyvKU7Vjmi6TPSvEFgISCU+tNKt+0Otdt0j9c+WoSAupg==
X-Gm-Gg: ASbGnctNYbKrGOUOihjHr0lHtW5+/aTa31iAwfAjFBQ9qpo9b1dq29HKXOo31xLDmr5
	Jc0cbIlui+Zshee+VWxISh7y0jGZlP96Qw1Yuy4IiSFxrWFSZpW1ptxx9VPlDcC089o9Ur9Jatb
	WGDBiFNLL4MbVIQeVxjUzN49lNCDFoPFKfxP3CorCrHLF4u6VaIpbWh5tRR+rhHMvS6Kk6WE6iP
	/sT8KGZK7NYo+usGkNbfe8IDwnwiD9XGJ7ZBZC0HvebYBngiqVXDzPWS7bx5fwBSfTndZ0RUjiZ
	AFhUUzkglTegU6HwlDOzIG8aF3P8ODh7fKiDhG8Gq6PeFg==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041875ad.39.1752181875434;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtPLby5dImEh4am3XdyrII2Yntq//gK06C7azIRRxqBEH0aY25p3N3xI1B7mTgwV0/nXxQcw==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041625ad.39.1752181875042;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:33 -0400
Subject: [PATCH 01/13] clk: imx: composite-8m: remove round_rate() in favor
 of determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1717;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sfg1D1VawT3AeNVMpNc6Mus+O16Hxr+I3BmqtW+ekY0=;
 b=Blg+J8i6MkcMkoaGUje1wzbwYgk1ZyPQvX73Fwg8TLuepmHSDlLAj0LMghIN3/KasFrhpihnH
 tnb3i6CqC7/DhjkxxkVAc+yA7mEN3HuU1bi2XXgEYAMrcDuURfTP3dC
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-composite-8m.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index f187582ba49196e3cee2b5dbaba9bdd9b091bb40..1467d0a1b9341bc4b0a40591bca00392eabf7cfb 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -73,21 +73,6 @@ static int imx8m_clk_composite_compute_dividers(unsigned long rate,
 	return ret;
 }
 
-static long imx8m_clk_composite_divider_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *prate)
-{
-	int prediv_value;
-	int div_value;
-
-	imx8m_clk_composite_compute_dividers(rate, *prate,
-						&prediv_value, &div_value);
-	rate = DIV_ROUND_UP(*prate, prediv_value);
-
-	return DIV_ROUND_UP(rate, div_value);
-
-}
-
 static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
 					unsigned long rate,
 					unsigned long parent_rate)
@@ -153,7 +138,6 @@ static int imx8m_divider_determine_rate(struct clk_hw *hw,
 
 static const struct clk_ops imx8m_clk_composite_divider_ops = {
 	.recalc_rate = imx8m_clk_composite_divider_recalc_rate,
-	.round_rate = imx8m_clk_composite_divider_round_rate,
 	.set_rate = imx8m_clk_composite_divider_set_rate,
 	.determine_rate = imx8m_divider_determine_rate,
 };

-- 
2.50.0

