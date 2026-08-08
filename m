Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF62C3A6EF0
	for <linux-clk@vger.kernel.org>; Sat,  8 Aug 2026 08:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176153; cv=none; b=BPAgQZtfdIyYxTLZzlVHTteOYGHYlHKSg3jfX05J7P0ydSR95d64Dq1Xmhef46ZRJPXa1biEBvhwATASAOGM50Tzr4aMtymiUsscl2N4MZYJz2owwcATNuOVO7cT4UfsBjuHZyQ3G4L9Kunk8yPlLNvPziyfb8NXCOzg5kRxf2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176153; c=relaxed/simple;
	bh=Qtiy299hgXH9miMRATmDtFVX36AP62Lyow4p85Fjtoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUcI6Gf88H8cN3Zi6wKruOORe89LlZgsMP8wEtuJc2o8wYaF3eGM+F9K3AoCziXx3DS8QudeWdowFsHF4QYMuEpboaZOt4HJLi7Slb95/KqGz3mB7BvYEC2NV/jK7QCwIxzmawKtj8JRHyz4haLNVxdlX6dK/am/UCyo1HNoxiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNPg3EaY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNPg3EaY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cedda2ce6fso2905715ad.1
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786176152; x=1786780952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=JNPg3EaYpemhj5aP4kfgqpmVEISAlaurH7WdqXRKhxVvFnqDGkKzu0yK1gGEpRU0Qj
         wh0UkCLyDpBgdYs0qhnSIes7fNAZg5yJ2XeEc3aNgg3GdhpHvnwsSokZB9w1YSXPFwdU
         o4+JYc97JZ0w10ekv8zjZ8q4EEO/Jpx4QvrHwE2UChjl8SMfzyiKlMNkQTAtlXZZU7DV
         naE2yQkAlLVDDFqUf0OIIqTzMrCZFOTV5zH7/hSR4fZh+8OYbJls4dUAUti/iwrRNiGD
         FPB1dxq3IoFzDvhKo35+Rh0FVHAJRqbRLi0pJlW5pm3AEwvBY/eLJp/VhZZENxprywOF
         jdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786176152; x=1786780952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLmbCLzuywYLsOVyyYkrBNI0Jw0ZVFv5psG5aDAHyEg=;
        b=lUjhBukoX2A0UpWNsr/9ctK3q0aG700k8MaFViZXTpZBXProz1zHXrdcJ9kZoZpWga
         iG/EswON6urQHlCL6419wcfnLhuqGMbOmgYPG0iExWBxPAjiH8D+i5nABxyBvU25XSDb
         jHP0b9pIRRY8FHOYwZ5wT4pKjbC+wVHL9eRIs3Yc4wxiO8fxnVmmg1rQkNZD440X2uL/
         1XOBr6AktsYJpwfOCforA2xRERBGIfTEyXCIALKRFA90DgGGs2OCj9GFrFPdAm4w+tRe
         MTNKImBETFkhSBRhq/ULdnrTPxbKk0O/0qYHdre7DqpgkFcVii1vwpjN1MbAUQa9tJgV
         39Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqxhFqWDieB+3UG6Es9bn7VYH/wY9rvLunLbYZCRcWZDoT/tf2vr3VVysRQH3vIgeaAdOb3FvtEitE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMiIddJAVNvZsVSVyGyW0c7M/2CAcqg135o2l0I6vRPmMJWrvi
	f/j1BVT3QpW73eHdWG5ZFQYQmb7qzTDZGFGMkrN/I3LTSRJdPlKBxGq0
X-Gm-Gg: AR+sD113HtU8MO5IsDDVShpQSU0vfsWmo/lXqS52Ig/4/2IObgfcLTMv7yFaBSrVRxa
	+Fn8BOZvdQ2USl4Fq7y625Ifd+M+p0m0FM3E7cayk+cwVIpBeYm0HLhIUx0gt/WJPLxFBZ2q22R
	WofqwWB144VYsXP3Cj2jO4goP/RL8MDfzeuxm2AL/9GjJ7CqqNlvtJDmjfYKZy5Qzjsi1TMbwUf
	urS9VxrYPQEVf6A4sj9fru11yj1hBYsp1Il9m69NKxpwcS5uMMviX6iMcz41HHGNupYg65RqFXF
	PjEB7yCkbUDDjYBePXqI4zp1zhEVLcULt34EZ3X6uZyXMPbRZ9JlBlEksxXtO3LflCaFju3J5V0
	RNPrwn/SuTIbA9Vo9kSjP5/acvuc/KusNTXhNsnsWmQ92P3Qe1g4xtgfki+r5qtvu/ZQZpMr1Dx
	CxTL8wZEluRSmH80Rr66DNV9b48nnWO6PtcbIeTLu1YBLXXXz5/Xw2V+9p6PHPDgruMWYlIDyRg
	RVGTXz7
X-Received: by 2002:a17:90b:1d02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3903c599356mr29221904a91.2.1786176151990;
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm7774143a91.6.2026.08.08.01.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 01:02:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error path
Date: Sat,  8 Aug 2026 16:02:15 +0800
Message-ID: <20260808080215.2669452-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
pm_runtime_get_noresume() and enables autosuspend with
pm_runtime_use_autosuspend(). The success path drops the usage
reference with pm_runtime_put_autosuspend(), but the error path only
disables runtime PM.

As a result, the reference taken by pm_runtime_get_noresume() remains
unbalanced on registration failure. The autosuspend setting is also
left enabled instead of being undone with
pm_runtime_dont_use_autosuspend().

Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
and pm_runtime_put_noidle() to drop the usage reference on the error
path.

This issue was found by manual code inspection.

Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 1dae3410ee99..262645bef62d 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		if (clk_hws[idx])
 			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
 	}
-
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0

