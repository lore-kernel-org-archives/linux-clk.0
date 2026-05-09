Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECEC1A6836
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778349507; cv=none; b=PNtjMJhWqeog829UVVg0CFiIAcGovfWlR51jjq330S0cabUnPLVDiTDpy8M9yWlxHWsi7o4fboyRfWLfcEMjfeYO2bPkKWueE6YVWlm2BJRWmCDTz4wDsQMqy2cN12Xb7bOQq3iWlUMz+LmF1G/dIVfJ+m4v6GzU/Sr09qEJqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778349507; c=relaxed/simple;
	bh=i8ZH/H0BHPRImxCZepw85JsZr7kU8N8MGko8hfIoCfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eECfsI+01LYqY0+G7E0RlASennwuvTc3G6abr2bhmAEn4oAkSYnc4wUmjDO0ryEleNwntxCyvWbmjRbm9HHwvZW4rEgsd6Ji7UVpNyDwAfs4v1nNZpqTy1u4E/C1eqZ2L0VSPKKlcrMicwXeMLFu2KFYYBJU3Y2yRxrGEo99xxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+b8/cTA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+b8/cTA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso3751865e9.0
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778349504; x=1778954304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGeg/u5Pz9hVNyAZhRZWhPuLVPXIN8vusR2dk7eDnv4=;
        b=C+b8/cTAMUsdRokcfgR7S1oADM1dKszqAM3SCkzryVHEF4z4lXXDZIDoRa7pj1G4RV
         k8bRyceOyYJ7LxIaDfbEKFnRsApr27ZfT/ep2NXo20ClwV19LI42ua8raeLo49qxGF6z
         PyM0lwmk29ndm+FO0xQMSQvD1NDatR5HYjRQPKIQGvehpKvaYF5zfF3J/F47+JptIjgE
         TmNlc+ushOUa0YMkWTCtxlQs4f2kTlqMYBEGkwF0LGVWLlp7SievxUI9LxjZwEVWOqHz
         dDeZOpy/PHlwlfS4ZEdBloyaiMuNbPFg1GQj8XtkksFzyfDZUAGbR9BJgOWMlCtXza1P
         9rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778349504; x=1778954304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGeg/u5Pz9hVNyAZhRZWhPuLVPXIN8vusR2dk7eDnv4=;
        b=TJ7kMJaT8wnivL8yL38I7OOYg4Lhijqx9rBwJNrXb/1kTPMdQSt8OsKtP2xsz4E9Y9
         yaoa8NFL++vc4ReB5p33HOYd1r8UDlAXFTK4mlRMPfLpaV3oYUInvQ4kOjN/Y3GvaQcO
         mdkDOcppvCK7GNaIldc58OiDV41GSVFUkTsX7TGfVWFdCMgIoClPMvQlW3vkdPGxDRhS
         q25scxidd0QQL3xIRWp4rpJX5QNRCkyat+IiAfrNjXlXvJ4MPLxsVK6CNcA7QKxcdYzR
         z7qbOj0ozuTIQH3hIIMgKuZZaiBeE1ay5byGGijn6qe3YVJd7/n6kmOQ/2D/oS371QIx
         mDsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+z60yAYl5FtKg2fQr4kjO6pm/iW4iRI65FnKX/MHrHWfkhBITJuX8s6HP3/JCBvQp/4+yp/6DCK2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CPkm0RYBg2Ndnk8+MqCh8Qg98w585KHWticcp8u7HYX6j4gU
	zZ11LPIr+FQzWeDs3foad6pCsC/osbHU2TcUXIlZIQL566+3JyQDczkM
X-Gm-Gg: Acq92OFmD8FXtm33OoEqBJGe8OkTj5RMiN4n7b0F3SVR5VLlFBYuBtCS2U86Z33pxyY
	AvLBdjXIuoMR8fLHhnmFEz0s0pujmOOp0YRJQwVXvVO9QUDUDmXFWvSfcamTSHf/NEITOKMRFOJ
	M11FdgxFqyx5ux9BvnC+i+hAwlakstRs3wZeThuTeaduX+6O2jlhEFLlQcQ3GeVfL7lUkietFOT
	rZ6V0j9fizQeyR9IAbZ9vkKycCh2tBk26onpS7zG9JEdAEELZoz9L7tdgLcON0Bt/SCYL7eECXO
	KZeQSuCgdt2z+A/OGD8yzLd5LW2kcfU+Qc8bJbRdFTGOTH3hg8iTkhofPO6C+X4DeZ5Eyaszg8Y
	Udr1a4BGutBfA6iS6P6GvGDVi+oFhHLvRXjPHnviClokIx0MkNy//0VeJRoJaVgwq4pL9OiNboz
	u3ZyNuOoxneXDuWrvJPvwhshqL0JpWVQeVyV1EejT5BCtgkz7Wirrpe6I=
X-Received: by 2002:a05:600c:198c:b0:48a:58e1:6cf7 with SMTP id 5b1f17b1804b1-48e530bf915mr123256165e9.4.1778349503871;
        Sat, 09 May 2026 10:58:23 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454919c13c9sm13383017f8f.27.2026.05.09.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:58:23 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: daniel@thingy.jp
Cc: romain.perier@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] clk: mstar: msc313-mpll: fix one-element shadow array overrun
Date: Sat,  9 May 2026 15:42:54 +0500
Message-Id: <20260509104255.15479-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msc313_mpll_probe() defines

	#define NUMOUTPUTS (ARRAY_SIZE(output_dividers) + 1)

and uses NUMOUTPUTS for the clock provider's clk_hw count
(clk_data->num = NUMOUTPUTS) and writes that many entries:

	mpll->clk_data->hws[0]    = &mpll->clk_hw;        /* parent */
	for (i = 0; i < ARRAY_SIZE(output_dividers); i++) /* dividers */
		mpll->clk_data->hws[i + 1] = divhw;

So the function legitimately needs NUMOUTPUTS slots in the
flexible 'hws' array.  However the array is allocated for only
ARRAY_SIZE(output_dividers) (== NUMOUTPUTS - 1) slots:

	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
			ARRAY_SIZE(output_dividers)), GFP_KERNEL);

The last loop iteration therefore writes one element past the
allocation, and clk_data->num advertises a slot that does not
exist to of_clk_hw_onecell_get().

smatch flags the underflow:

  drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
  error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

Use NUMOUTPUTS in struct_size() so the allocation matches the
declared count and the loop's last write.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 61beb4e87..71bedb7e9 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -105,7 +105,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 		return PTR_ERR(mpll->loop_div_second);
 
 	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
-			ARRAY_SIZE(output_dividers)), GFP_KERNEL);
+			NUMOUTPUTS), GFP_KERNEL);
 	if (!mpll->clk_data)
 		return -ENOMEM;
 
-- 
2.43.0

