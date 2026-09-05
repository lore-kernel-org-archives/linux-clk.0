Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65249EC43
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613782; cv=none; b=n1Z6uPCO7yWMfklKW6IWO8NYWuEEbJ5ElcmIw5pKxRfwtgP0ZfReyFznIp/wNsEzfnrHlcp8KEAWCacEwvbrPG1uXmb581Rsk3tun32RLm/AIzmQGPgVe40SdI3jGzZl5rSVpp0EJ741msmLcG1Q7h1/VJxSXlndINBgcrb0KVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613782; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2g6Hk1P5ISqYY2VRlt5QMkVr5RUpDqF1QMbyOG9rlMk3+p7fl73kFkfN2WNp0C/FuLIjpW9AuINNl3AUN80paGlp0zJW2rM77DhKPITq3m1yQN+qIL8cgb7/hIiE7HJinrJ+QBRj1Mdu3Dn6hAmTflUENA6YJUelNqG8TPFiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhrLub8r; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhrLub8r"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso721446137.3
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613778; x=1789218578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=jhrLub8rGB/qkgko8StWC0UXVk/WLciRA/XMwFYKEm9ml7OzapL/CINgFYhVGbU8yi
         HySjr88fwH8SbE1onfmVm38Kh/Gsj0xVGrGoU4cLWY6EUMf8lSmYFb+4uFPwXn7krrje
         +2qns6l7Rq7/htJz4u3UaeTBNV9IHtCe4S1G6BRXQKXE4cjD+aJXxM5TELPTW0l71Vg4
         L3V1oJ0wGxJCfBJ9yo1MoqZdCHXd9uWys7tR58jnbvnIDQFVdl+vd93LoqS75tNRpU52
         ZWpL1btHyTeCnqvxSO1kMXOzk2bq8x6Q7RHBt5A10f1WlCdTGCaj7qin8OYPcSbhIf9Y
         0QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613778; x=1789218578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=S8KlgximkmnDQ6oxSFl+uk6Vc1cljBZhMfkBzEsZ4TLfxOXmyM1i4iTcnQ9Jy8UEby
         XwMK/iS6nWrdiLUVuFJ6WPMHswIy7Qk6OW7tSQU0IRXDySh6CXzTMrerFv07hREJLPlG
         lPKTJyEm6gaO5+o/HedLQAv8BwJOSSKXXs6NdaoFanLYdZjHlrxxNl46DQaLtS8rmmKV
         15Gy/aqdkgfaefhMl1Rq57c5O35lJyRyFqS+wEQ9NzL1bqHZrcF+//Fav6zoaqHZrQEI
         B5a8wH5hdGuD4Ox9io0wZCvcBax5lsxfmDL6IuGmpGvpDTLm7tRoDOk+cCRa/QDY2kfE
         zvQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZy4nmph73MCQZCetVPNFTks6bDAmvosXF8p2O7xsNnOPuS+c0IsA3MvsKRxHuLaNbegPDOYgotHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lN9lRIxzwp0NJBK1TjC8tnH7uP+tFKGax52wU0ovkj25bHRAV/
	ROjYlSbISKTqOVCoLBJUIHzMzdok61fEknxm6NvqPRKU0BddllxfATRk
X-Gm-Gg: AYBFou08umfTZ7ov1lxBH4jHtI5T2UkvClWVwfIOOMrXFzzTg+5GfqacaP8YODFqMQL
	rB12egg2RlA23q/Axxs9Xxl+BZ8IFJe4CcyRn512tEJLvgWY47nIjKWZ8EdcrKDu+dUgS3jov6R
	rVNiUJaIL6dCCn0X+xdeOofDpk350f7qrVhI/BgZes4bK9bqRKi5SOg8kGjt18RKyFV/wdB00pR
	fbq4G5KNJgpwpK4w57xfh686Hw71a3rwagbxZS8MzvZ/wdA8h+ToVl70EWBZD7xxb+23EL1IKLY
	FBBZTFwdzPp7pQl+N00FL2LwqDC0hnmDOXUthe6UievaIMMisqBNwKoN/Jlk9MwMC8JA5Goexx3
	VM4g8DtWdsQEkCAlP1kQsU3k/q8SU80Te3Y1S3/+5Kwh3sJ0liFMFrkcObN+9IKthGGYfI44B2t
	G0Mgt4THmdCIUQHw8xQ6i2b582z5u9nn6IQpasHS8jrUwBO9/YPFmrKwoCJRXSbWCCjZrWsBzBW
	FI+FHQ0m4m8xNLtj9BHCDJNodjrnSASkJKW1ieHa2E=
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr3774484137.0.1788613778353;
        Sat, 05 Sep 2026 06:09:38 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:37 -0700 (PDT)
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
Subject: [PATCH v9 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 10:09:24 -0300
Message-ID: <20260905130925.7115-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

