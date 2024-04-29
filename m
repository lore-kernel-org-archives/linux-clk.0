Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240C184107
	for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 21:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714427110; cv=none; b=oDl2ZwuOh9CvKvO2agMk+V90e19c0HWeCmKKZOKLHzwNTu7qkwAdHfWbHWed5Nc66DocBvuHr4DomIP7rZTUPdEF+ERdNwTLyNWXcwQUCRdOYf+TG3oJDJ09sxOWH1oSgyMa3OPoWc3xNA2MEtYlSzyXgROEp9o1Y3XfVDnr3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714427110; c=relaxed/simple;
	bh=HGaYPJRPOTFMcmk0QgXPGnhslgpidMloqJBRXcZG3so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lzZautec7ssuaysU6X13Qjzy62k4vdv3VyRpa5w09yIsgp5d18SbOocqEAUXVf9HwzEjirXpO0C4/Rzl4MECrwu5EwXMTAiwiAygVFQCq2tq9gXXQCSGxuRrpXBKVFiGbowqsiHs+Lj5zgDhJ+Uk3xHfDcuvGBspQcEFBfJ40/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5BoRPoe; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5BoRPoe"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ee5ee29423so53928a34.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714427108; x=1715031908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D42c3j0xOA3Mu80ZHSNRZeVSn94ADvU2Gg4eug24XSI=;
        b=k5BoRPoet1W2kR97EpbNaPsYbsNaGRtsWQ6KwxOFEJt5zlndRfjMLSRzkP/ZqJk4a6
         sQLOsyrYi+h+NcGuytNOurVpApOFAiN5PJg46tx1HLx998aW8mAOvaKsS69zMAeXtn6v
         w11hQNvMg6Q/CV3e2k3CksHXurRG3DXm7PKmNw1TaoDjW75cApRxWo8C7LIEqTkZIxML
         F7UdoadA+48iwWf0vfZubHjSl4xgiLVw8NAZ7saw3UXax9Ho2bXEd398+itfk8T1LK/d
         KiEuocys7JA2YB9ha2snBu25FdjZ3K/dFqvs3cZ/kQCgFnzikU19tMMGfhb+k7VsbcHW
         NQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714427108; x=1715031908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D42c3j0xOA3Mu80ZHSNRZeVSn94ADvU2Gg4eug24XSI=;
        b=IGT3+hFgynLZ1t8w+wPfZDLwmCRP9/ZlZZTrWXLRNDrGCZ0LDIYx+Gd66mmLXJY6n9
         TB4nOeANszT3D2VhdG0AlHjOIoN96iiRvN3rG4phlEs6WZkp8b42i1QGTwFmBqiV69Ro
         VgnLlLvfRCcIlCLIn8CXBHqzidYo9liKiJSlKJtgCh0G5jLI4dsA1eLy6fjuZ79zCKyR
         GJ4t/9UwKMOm71wmyZazFLNLUEo7ySdI33kSmgIb86pgp4LNpx5JZHzsHRbX/I9hoQIQ
         hfOFvKgoAAqBwXVfosdifd4OMTM7HvHN9QgUT6hspmejR/l4hnOS6UswkKnWWm5C2sFd
         HRsw==
X-Forwarded-Encrypted: i=1; AJvYcCWvYzY5xoyBVw8jQi+h0iznsyOdRuL6iH4LFUo9xZyvucgVOyvugIICWcPJAZ00YIfg4FOduyqxiEMNsbSxO0sCFmXWUmnDi2kw
X-Gm-Message-State: AOJu0YwPRPadqAHJinix0p7cU2goVviIv9B73WaAGZeQVasmMI6K2+df
	1UBT0pSPD9wH8oD/k+VevoudiRYh2X2JhUAB4OptFLPp3NoVWIqS
X-Google-Smtp-Source: AGHT+IF+mA/m3DWxzc3uIGD5tEYzyZD2DZAjgCKIIHpjdsS3oSRm5JWxeCV0F09evPJU9trgNGtm6A==
X-Received: by 2002:a05:6358:7252:b0:18d:e99a:2520 with SMTP id i18-20020a056358725200b0018de99a2520mr13328471rwa.2.1714427108162;
        Mon, 29 Apr 2024 14:45:08 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fa90:8aff:324b:5e2c])
        by smtp.gmail.com with ESMTPSA id 192-20020a6301c9000000b0060795a08227sm9170840pgb.37.2024.04.29.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 14:45:07 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: abelvesa@kernel.org
Cc: imx@lists.linux.dev,
	shengjiu.wang@nxp.com,
	linux-clk@vger.kernel.org,
	naresh.kamboju@linaro.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Date: Mon, 29 Apr 2024 18:45:02 -0300
Message-Id: <20240429214502.1363592-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the suspend/resume() functions are used at
buid time or are simply dead code.

This fixes the following s390 allmodconfig build errors:

drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
'clk_imx8mp_audiomix_runtime_resume' defined but not used
[-Werror=unused-function]
  363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
'clk_imx8mp_audiomix_runtime_suspend' defined but not used
[-Werror=unused-function]
  356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/linux-clk/CA+G9fYuP7S+a89Ep5g5_Ad69EMwRkJ8nM+MMTzbEcP+6H2oMXQ@mail.gmail.com/T/#u
Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 574a032309c1..6a9b48b20cd6 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -368,8 +368,8 @@ static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
-	SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
-			   clk_imx8mp_audiomix_runtime_resume, NULL)
+	RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
+		       clk_imx8mp_audiomix_runtime_resume, NULL)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				      pm_runtime_force_resume)
 };
@@ -386,7 +386,7 @@ static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
-		.pm = &clk_imx8mp_audiomix_pm_ops,
+		.pm = pm_ptr(&clk_imx8mp_audiomix_pm_ops),
 	},
 };
 
-- 
2.34.1

