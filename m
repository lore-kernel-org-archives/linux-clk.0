Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9C8343219
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700110; cv=none; b=XxONx1cCcKKCP1GkxoRGlZY8te6VcL8YtlFTIOfr3PrqY/OFBTKhOFo8HV+RpWHwgYOq2HBcLjZBARdlkwWzhDIfjQW0IKr/Kf5ybCa/cCQF4kyzCYJWyBVnb2NPqahIJeNl4//xgtjm9vIhZUSVPyoKYUMfIte4vjQpTGWKZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700110; c=relaxed/simple;
	bh=3PA3zZ+Ug3aOY46+y0Bpyk/iEy6BvKUkO02G5BbMuws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjJvx1sofO3zU/eGDkXjwjPRs2mf/QJr8biSr+Dcs3I3Joass26zLwK50VNRqnIhGkRtC+oGQu2euKSGDLIjOsTFk/t3+r9H6njMTJMh6plL8M9pSDwAtvK/1MpAL7d4QpxpyW3p2feSyIpk0P2AQfrMTR2dJkHccLWQ0Cz/bn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtNfbbO1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtNfbbO1"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b48d8deaef9so349398566b.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700106; x=1761304906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=FtNfbbO1kBmcoTInlAWLFrZc2Umjz4n9LVviYJbBbxMtSUTHKkN5wjcYlSfCuHKp4R
         z/2gcSHyrfrs2DoFyUxosP6DqzCxeVmqowTvKPeBB+UUfe7jJ0s3vZAXykR5hhpp6xbD
         XWlypoHIfPVIYZA55mk4EyPwfz8BSVXz6qhDtcQfqvqhoXlwvzz6yH4O9NAeW00K8GtI
         L0FyzpcCuOTl+wagtvxxmM1iYgEqkGIq9FLiWYz04ZsLJNJCv4umH5Wd7ssSbI6H7YxC
         u8rhMygAVbRXl4LkYy2W7rbcDLSTBbfcyKFB5/6+z5GNFj4wNB1byDbFbvj+AV1OlKrw
         byVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700106; x=1761304906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=U2jtDT12CR3hsbZ6Fl59Is5hvDMPCxnEVp+4ZlUhXppmln/Jl11UQmHSKl0axpMK/O
         Bxghi+Mbg/TOyFpSTKPr7Tmq6nRW+aSfQnOJMYLmZJ4sIYWXEqEmUge9O21zdrtuLYXi
         q8WuTW4DcIz4SYhjBoFsWRO39iGklhQA5M7rMLCd9PAgPmNyHaw1CzPzL7azEUxbZcET
         NNqmRs3duRF6Kp/JJESubG8BTlXH0Jek3NC8Qhv6LP72Zb+lAr5zmsidGRGXf4sJLjrh
         MiSMPj/oT7CKwZDlkn83zv+Sd+yqy9SdD/YBOsVw/VjJU38tGODfoGlcKFFyDrplFYnH
         8rmA==
X-Gm-Message-State: AOJu0YwQDsVgPsntrO3jgqEtkOXc9ZF1yrmlYXXWEvCmXILEAdIISlEU
	S/YVLN8XzdVzES4L88/ssCJ/RYbBhG4JqCovtIV4aAy0/k1UNsqtABXa
X-Gm-Gg: ASbGncto9Ipu7Go3BECVEM5Mss/4WQurkz/pYFylydJxE8PpxPoPAnP3QrJTtzfvNcP
	dU+pgAZZxq14PRiG9xbqyF4JzMXu3jnK4MI14KcJOzoBhkqc5Pa1uxr27C//3Hn2mZQ50RQSnDo
	SJnYmhvGJcbS1xacyKyyTFsV9yabsk/Wz0IUZwPAc5wp/f0Fj9thrJ09Q8yA9ncDCe6kXV82aBR
	PGeuktzMc3g1S0sD7JxxB4MlCF/YJWL2LEWOdWQ5GqKY94aiSBRHnW1IphYIMJVoby2AMzGm6+Y
	v1V7zgi5/vOPdJjLonNKsjZlpynQUHAjWZtbGo6wtQvaG6BVfB5ENhLSUJBFMyWRuCdqL7Ct8g2
	djtCnLm5au9Kzp6wYEL6V7uAU2gkdDm866hng05137BDrnHtZkS+7AzW/QvMUxXRWcQEpyCfMST
	3PJ2hVPzzIKPZ3vg9PO+YnZrwjLj8FSfvirp1f0w==
X-Google-Smtp-Source: AGHT+IHd6jblu2510v9bkHq/90oro00PKRRM0JXmjf8CbpRE4cA2knCufq3mdwx/AEKOqtQsu+8i5w==
X-Received: by 2002:a17:907:9691:b0:b64:6776:1ee2 with SMTP id a640c23a62f3a-b6473f42d78mr334179566b.52.1760700105898;
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Fri, 17 Oct 2025 04:20:18 -0700
Message-ID: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0

