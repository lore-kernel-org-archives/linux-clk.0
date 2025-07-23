Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CFC27A929
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274552; cv=none; b=o+/hw11wV1OF1ctgjqva5uWfoV6p+/fZfqZoCG5CY6YirMxwTpLTZ+f3JzV/4FRxT5mJAgmR0l+eo70bDvy+RBUbMPdyT+Dd5p7Th7Yf0KIuK6SFj47djaL+91hb6TwM7SRnPEQeZPb60T7bOwwrb1ch6FEesBqWQ3XMthXXqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274552; c=relaxed/simple;
	bh=Dd6wnE/Sf3IOuD9VVTmszqaQpg6KTb350GWEM4m2a0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCuzsBQHFt96jPZfyYbaZFnVWigAoMC2Vt6FxAYVLO8FHVB1iUZGebuibzC72yHJC38O5c5UWnk+AVw4XuTBxOLSKVCQvYq8HndgxzIzcNpSikXIPoiMMF/qgujb1grXIcRx3zSgx2QqcPBcIGdrZd1cllciAUOCEvvFicTR8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=adq+sBzs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="adq+sBzs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4561607166aso51654995e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753274547; x=1753879347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=adq+sBzsX2QMywd2bDEaVXm1r0u4x+qCXUMjvE7wU9fO0SmwY9nXrdJKQHAgbvp2Vm
         spgcdjfy54+DCr/BVX4+CEkqimnviRyW18bvHRvLi/b2fxxkOcJiED1Kb3VuaIyeGqxF
         B6xT2IN8NeZRQkkT5iXSzHMQz0PVrF83v6xuohNOrAad8LGzxJqCAEqwWsyv3ysKYPEw
         xCf4jnGJ7Y6izwbH2jxGgN8PFArT6OqGyIZPNdd0vdvBjYPUJySr9VFLP1lW3V70rOCV
         GJcNzRf/gKGVK7Py6mVVDsbQcYaBNxT0gLdKR9LqU16lfpcL9pwCUsC+qBGAGuO2stuN
         ZmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274547; x=1753879347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4veeSt022yF8JfTtf9KGz2ZcsYPnUB3umlBs+pcOABk=;
        b=C+sdD+5BGjyc7llT+23bH74v+ovFskEMCFF6eM66pxkstFRnUbF7j+JAEVCNbJNFiG
         3prAlTNe1dYLyPNim6H93bQpER9m5RbaqXgOQFl153sJO2jg0OGUfbrjWFN9tGkhmus0
         lW26PtipMrZdGRG3jmf8OBHQLrjm95Sh/8+Fwyb5UNx7+ZKNX1zXbtBhfbdA8615WBw7
         TgYjQ0HEeRUWjyxhkPXxqQwPanQZT/m2JwqcAgn951vM7Aemz+QJg3/A1UUJnQ6xLBp3
         yyBgsb5AZc79jyYDjeY5dnQN5eMXKZ8sqSAyaFp3N2hoCTgtV1v8tLqwUGrwoM/kTjIc
         U6fg==
X-Forwarded-Encrypted: i=1; AJvYcCXZpPst/NnCZFYSqiyfSND08Sm/bzidiU9kCr1cMge6jTmX0beo/CRDPC1Sjud8085+uNmlTxSSWiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1StB//vA4bPtF1hjuSUxH7xNdqxVNy1C4mLkXyRfWsjSd2t7
	4m0t3/fFt6vzLt3WJx1ccNVDdXkG8c7usIQbO6nd5wy9wd/5y8gWRFwJlJqRJL9duuM=
X-Gm-Gg: ASbGncsoSdifYDM/C2CFKzcJAaQVaEy8UganYlYovF8Oo+VW28fyBuOuOYEMZkcwPLQ
	Fjc6M/7dWOeqhLTdoXKZGC4Omy5XgmGWJLeX8cNtRDC4W18yOD5spGI5CS6HmNOpGbF3q3oleMe
	hV+1w0pr+claW54ejZbD+hnCY5Gkfy9HgkNiOGNvjOATA2X9YcRwB+9zFuEVDinB4xK44xRWbej
	rLhWxJ9mO9spHsiAIkLt1LJlzyvGNaLSlDqNCj1wr7G4JIxV8EClqKcexO1QTnEkFQMQnVyyEeL
	o+8npXta0d3C5HQusYuP/D/KBforDKSymxKI8xBiSbSLo4O5GK+hHsfH7B4TIncpk1bIwwHSQwd
	tW3RpFV953eVq9eXwn/iE6WZGxBGLvuSvIbRLB3udCli38E/rBw==
X-Google-Smtp-Source: AGHT+IGbJ4sHUsE4vetWaUrzV0GCHvxK9m7lFsG6KCeg9nkDSwfu/KGJ+XeTwbxg+UQe31rImyB2lg==
X-Received: by 2002:a05:600c:4e47:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-45868c9d3c0mr26871425e9.14.1753274547109;
        Wed, 23 Jul 2025 05:42:27 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458693ab0besm22035165e9.36.2025.07.23.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 05:42:26 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 14:40:20 +0200
Message-ID: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0

