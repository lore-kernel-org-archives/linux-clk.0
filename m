Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1922CBDE
	for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737044659; cv=none; b=sc6vF2X87OuKVSOWdFaYyciEPfnr8LO5BlOI7fBrkYy0q6hDKHqMNMpDvVI0nBxjvwZihzx0bH1vcu7ik0IaSa5XP20h47QM86mIsPJ3cMZHupa7Rzg8Xa7i9m/17yaCcvirz/rWDwICumLZgZka1jLv3wrnll/gsHBDgIMtzCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737044659; c=relaxed/simple;
	bh=eygaNGscIeryqDrq3TZmyBc293J66iYG+/3+ndZSkvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3jIft0XJWJlLUrkRFy54WZAEOLQwnBuz96Mvuh5x+onKN89grU+0EwXhIobSsozlNtIwHS2fg3RAGVWY31iAszuW9AJQSOCuMfkmIP+NgJVO6uyRbXlUtPyTCdPSXZB7hH47lW6MlORZRZSWZbCoDs0gkSrryX3tSJcD4AwAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=AXT3Lib9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="AXT3Lib9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43675b1155bso11907495e9.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jan 2025 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737044656; x=1737649456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqi4zrR14V9nobpcwSveNX0mOCCq13/co3EtArUhSLU=;
        b=AXT3Lib9DIRjStR10WduLa/1E53O+XRCB9Cv/YrYmxgmes1XWTkGLXI03rJx/kWPCF
         yb7m1I53FaEd0qncLnJv2xyIyBM6GoTG99/l4xcMVKN7VlzL4lBVwGaRJjwNG7H7yDxu
         q+rjMdXZXbQQ/8QQIok4F6ZKqTbQXPDrmtd2dGz7IPFCkj+tZHhspAFzH0uG0Z78CMFv
         LgUQyt7/5nb4i6GA10t11tMUcc/jyOQDby51UeB/k3UN7afg2JaCAWRU42yM0pH281vQ
         7JTXlmpUp3HnyEXMUxR6Es0MSlTFi6h0CXNuV7koLWNh5DdXWmphLTaDeV5DRLvXMIsR
         sDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737044656; x=1737649456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqi4zrR14V9nobpcwSveNX0mOCCq13/co3EtArUhSLU=;
        b=H+ybiBo7DloHye51IWxyuirpiQKctO+PHiS7CF9oSNpbW8o5gCfz8XpZ9y8nZWs7oB
         03sixuhQBsfpTtEZyhSdN7zV//w19Hs55ySDI/4jLBf25xlFzaez1LTWUvTR2yKer6Ha
         qow8joaW8KjdKexzv6uzJTFO0mTghn3jMaIs1ZZARXxjzXRNUoHq9EjUsWrGMzIWyGWt
         eYbzrKNFCAhw4yJ4cUqhFso2w0Z3+q7cqvUjV1br++Alzo7jOk/3oc6YrRqk5LE/skvF
         Qo43aO5uAwAZUMmhMNwmTh6mT0Pka+ZDiEOvZ3Cnkm2pIttL2bTrapeDpsXzY6P1PuKz
         c5Cw==
X-Gm-Message-State: AOJu0Yw6Pmv+yq+zGtZC9MVIH2gLTS/A3QYNUwauH8LcpJEGIUwFrP0F
	/0tybZ0RqJuw6DE0dakrdzv/5rJIMTONaHxw//kLQvlvptTfQQQ90JKDc7TBgHE=
X-Gm-Gg: ASbGncsxbIypl+w4tzstAwE1DaO5MMlAuW1IVGfFgDZhNK+dZ+m3exK+mjKpNIgDaUZ
	4CCrePYi2nbMg3oTFCfBm0D17wz+HHpcj/IfjcsQ4CkQtdIUkbyoTp3EIHo4ND9sefnFQYHAUcy
	u/kMdH7H7KgoaoaSM56Q5foZmhrD7ST+9CzIpVz3QfWE66RBFwq0VZZnNokyRzfSs3IDZMrlFuz
	Em9/kuCX+z2YBBJIHp793PyzikqT7DXuVbYvUXjiMNjr7R9
X-Google-Smtp-Source: AGHT+IGYVMhTyECS8mk7dbNPcu0xv+jBr3muLUHN1CCOwv0ti8nhpLb9Y/RxEUO53LqAtFGOLogLig==
X-Received: by 2002:a05:600c:138a:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-436e271bcb3mr341342715e9.30.1737044655871;
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890469ba8sm3715955e9.37.2025.01.16.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:24:15 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 16:24:10 +0000
Subject: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index d374538e7108..9f716b2223ae 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1

