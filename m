Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002B3DAC08
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058136; cv=none; b=uvoILNlx5JRAQHcj9MYsGBvZlZK/mLJnH7gQvPWVOnN0CPXxw2gUNToiqF0mFRn80iAoQodum84hL+Ny0+1sYGYJO3O9IVyrozHyHwu39McPc59vtbVYI9GrgEQb/ysyB5xNCNEGOYa0fvaGzc0tmN4TvH+ku69WrQ0IhFOrnXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058136; c=relaxed/simple;
	bh=2jqS2JCggZmT/Bgw5cZ1HuqlhOXJkBLK/dNVeJwD90I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv/IXwt4G0lmBWaz4PKQh+ZV4nxcz3+gkRsrCQcewrkDiI46ct5ySvsxJUh5LzpV5goLeIGlb2Cx8cmk9LZHBwl30H7luozBmvJm29aoKx6tlfXqlW83xNsFW2VAyIo7iw4KcPsLVNuoYFsdy0tkz9qkzUCzyOLR+XIU2/pTU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mb7kFP4k; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mb7kFP4k"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f48bd643a0so4457365ad.3
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058134; x=1717662934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
        b=mb7kFP4k07RT+0hqjti94eOC+fepMqNXnLQDy6aPVIElQIzcv6GHqSAijgaBmZp1ak
         pxepHxhfiA7gG3LQAZfh/Dc/VDsTSQzrsqYtP036OYsswtaO/JQbdLLsE8uqt4miEeXc
         Gl0AEhXWLLMOdQwroO55iN2TI68cL5VELo8Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058134; x=1717662934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
        b=vFAYoF49k8k2HkWtcpei0wQuCRDNDnhfOOaRflxuGyT895us32KD5w4Z30RFVtUJKh
         27Y4uf+BjactotKGUK8JUxeU3VQx3bDcu4Luijdc/HK1Oqa4GZS5jpoYNEaMRfeAkwyc
         xUqg7wb6VVt+5GOYTYO7+2vNO0mkgYh3rzMrBoHN8VC9Lic4h3NqUwp6AiH4byl+yEF1
         3dSTB/foDJuNWZbD8VBFfdzN63stMHN3JpkQJIGGrtsh8N+/p5wz9wd9Zdr0TH9nzq7B
         W9sh3ygF2hyqwFTOEWFqJgmpTfgNKPCTHaXvGa13foqcKp8xAvEGfEMZthIA36DsgaoH
         M+xg==
X-Forwarded-Encrypted: i=1; AJvYcCXbw2K0DgZ30NpM9aAUhixiGFKSVZeNxdl6n3PPOzx9v8bCAizuKiq1GAMJfixs8JAIzTu7jF1YX279so4NprduV4CkQ72X5SJI
X-Gm-Message-State: AOJu0Yxkt/vGOcNmgPbPVGJGAzgd4isx/P74x+k4jT01JgrRK9QwsmcI
	7EDF7ZkVPsG3UK20JNBdBICw6wmNNKEZ/G0ZG6JngY+7RhZ+lid1OJGGOOzF/A==
X-Google-Smtp-Source: AGHT+IGaMXKlAuHj3tKDXFrEymwDvO07A1BRFroXZlN02EvX5mN7HsOfQHvylgHcYJoSPTNjRI9s+A==
X-Received: by 2002:a17:903:2095:b0:1f4:768b:445e with SMTP id d9443c01a7336-1f619605ee4mr11933665ad.24.1717058134222;
        Thu, 30 May 2024 01:35:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:33 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/imagination: Add compatible string entry for Series6XT
Date: Thu, 30 May 2024 16:35:03 +0800
Message-ID: <20240530083513.4135052-5-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c3b2d58d766..3d1a933c8303 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,powervr-6xt", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.45.1.288.g0e0cd299f1-goog

