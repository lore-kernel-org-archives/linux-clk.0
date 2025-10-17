Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D82627FC
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688173; cv=none; b=sKfAUBtejCU+eQy5xhqWs89OGMuQCDl8GVv31m88LcZrWh1KS0bUOgY3XCXwyf1OmyzSCV7yqWTfFgieJK93Qc0IT49ivFIsmx+OjQWwzqA/Lq/ImLyuS74DB8lB0y0SFSk54LjRDfsT/IV1mfep5ntkmh7dlcBzOLT3qYwWgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688173; c=relaxed/simple;
	bh=ahY8cqJej6WQifsWXROQdHcvhwcArd92M4vlAfVPn9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEoyuGYwMV6E1U9tpqOtC/2SCX4z6GCrUcN/ngYOHm3p87vzUNt/wswIADF523fHN51BIu6uEcJ0+sqMpO0w905os0Pp8jb1YMPAmyU54w7D/KlTHDveqKXJh5U2D7gFMm+SlQRjbLV6FWjU/YG6pHqsr+CaSjY7H12T3/dcEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bQ/CSqVm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bQ/CSqVm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so8590795e9.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760688169; x=1761292969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vpqXmEuFVERfrJK4S9HS5UBFe3EstmRsCR0kjyhhN4=;
        b=bQ/CSqVmk6cN1pQIse+GIuKyI9kt9zOtevYx5YpVrzmJKx+hTI3bSSczH1pkIQyxG3
         g2J9+cpIN7cYt9VMROciB7QJ9MLqkC3qJuJIeowPVuHmE5xNUqHlqY8JwYV8d8pZY52R
         EDA9pahgx7e920c3cwcygBO+e2s7WLkkP6ibLJWERxC4MTIDGsljqnPy51tJ/XExk4Qz
         K8KVUpTgEx99F0VcFZF1d/r0cjgrKXU66CAMNb9JGo2ejGBEcvAgnSWsklTzCj18VQPM
         nPnFN1flWFygyb56RO8VJsWT/KqyK0TaLa5eGxcY0Sqq86muTzMzjFvDCwkcHwSsClVH
         YMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688169; x=1761292969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vpqXmEuFVERfrJK4S9HS5UBFe3EstmRsCR0kjyhhN4=;
        b=s8XsGWGqFcIDLxPL+WEumFj4PnW9giypPvpIZY8yEEHd3EfnGqmowscEkLwpIt/ApG
         VFq3iJtsT4Vi9DMYdEXIM9efWeLuNiAh+KoB2vgdOuzRO2dOy6I7+p1X3gMC6DemhIVF
         m5hkgl9Wgbi6pNX4pBZrDOm22pqJ/2wzoCCpDXkvZruAQkfYO+FRWLUi8jsItNLavxMw
         71ItPqBgpf0n1Ku4nosV4oAp+fXjPsgey7sTgdDBpUHQLexaEuE8NSUYyHQlHUDfQVJV
         FEkrW0xcxUHyhZDI83LSnHuZDLSvyAqZtKxksCEHwxsAAH2gwRC7uEhVV3j8z9DrIiOJ
         EyHg==
X-Gm-Message-State: AOJu0YxkLb1UKvWQ1rdKBj02CudgSc1KFp67ERW9S2qRRJ2ORz6VWDtu
	nJTvne2Q2QGWnJZANAcewt05Mm19Exig1bG40RA5DsN3GpDjuMu5K2XDZtVTiuNSXrM=
X-Gm-Gg: ASbGncst4XZVrFr37guWnlvRpp2z1XRwJjEQVRDbHdliHo47yRY0Ztz+mJ6ZbIHN0Ab
	zu3jxG7X0Gt7A0lqe97YytY+V7Okd7X7ceoGpsxN+QDAsTse5VG1BrH4MZqnCdLPl0FvjaPcGGZ
	G8PuUbT9UaU8gdjQa0pOPzpJtoeSSvpuWEdQlOgHh5/KoJ8OiMZNxkv3Jqd4UDc04Eje80zdcK5
	ta1k34zgJyo3V3n+b46IlfL6F3EvKM5MAMgNALKT2MSMpqHac5dhNmennauxbWPg/oj1nJjKVdH
	HvVTZUlchKZ0YXwrg2SCUmPQg22jUf+TpGwJVrQ0CSw8FTZPLj4ESgkJfmgMazDSHuP4sO7ABIK
	S0qggAXrEnLWkxbvQsM+e4C4T4OZQBSk+5pNdjWGpYMc7J1E9CKS8x/8mnl+pWAEaGBE7aV1DJR
	NqpCKHDw==
X-Google-Smtp-Source: AGHT+IEeCOXghFcgH6Nmit42fyBYKsK4gGqalXJNeIk0O3d2EPTDkkric354Pe4+kxFIZZN6Gaikqw==
X-Received: by 2002:a05:600c:8284:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-47117920935mr22021975e9.37.1760688169583;
        Fri, 17 Oct 2025 01:02:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6c59:a281:27c9:93a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42708bcea1bsm1082308f8f.14.2025.10.17.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:02:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 17 Oct 2025 10:02:41 +0200
Subject: [PATCH 1/2] clk: davinci: psc: drop unused reset lookup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-da850-reset-lookup-v1-1-362a309a9f09@linaro.org>
References: <20251017-da850-reset-lookup-v1-0-362a309a9f09@linaro.org>
In-Reply-To: <20251017-da850-reset-lookup-v1-0-362a309a9f09@linaro.org>
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BEFSWjFwHX6uExLjBneDWL7iOS7pXsOG61qh122CNKk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo8fgmkGJM2FghgVKiGXSaiqPcCwHcUqJA5V/l0
 igZLJZ0BMGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPH4JgAKCRARpy6gFHHX
 cpeqEACLUFUP4oi7NBoysKpQkCTRb8/qtj51+4P/ZfwrTUNR8XewleRbaUEtPt0pf831GhWZghF
 IvY+7Gx7R0acWZr6OPEAdrHEYl1+lsBKoMdjjmxOX5aX28jIvPCWBMJl0Uio6ORPQo6VYwXGWzD
 JDkZn/tZrMsR365yJ73XSHH2pCj0/5HuDwWs2LzGKSQbHIP3EaVMXLEXy0IOQa33+/i6jUpRbwE
 Jfwm9QY8KfHEE7kMwl1dyQdoY53AH6AKLD6i0tcdpGzIK01Np5noyHFGl0usM2PGxK1SFxChA+r
 bu5jIgHVtsrSOdTMKH/ibN2ma4vnsDANro70yJZu+b5AfEH+brSyZgwDPebHT45NEDIBIzt+1Cm
 RQ5e+PQ6+bBithrcbzkILI/jh5w9Jj0Zb4oQXigoFZv/ix77vkQ/qaxB8l5aqoOJwLWU9FcnVai
 BNNuqdC/qPHjfR6B8r+b+ZyEoa/IiDy4Rd2VPP1yQZikotc2xyJSWnt2rLcQR/ktxWWRCie6fYv
 aiuOJGeGOZjQ82t6OzKbVVr9OZHP2gjCwfcQiNFHWwIbB8cr0Mhl/P+kUcA7CAcCdCafpP+s1/X
 5SqCiFoOdKNfBDs0Fa5Ah4eE2BedEYqhAkqms+e6JaljKnZSl51L5RYsdUBtrqOue2GvQTalPbI
 lvg5lHjmHtk8TEQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support any non-DT DaVinci boards so there are no more
users of legacy reset lookup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/clk/davinci/psc-da850.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/davinci/psc-da850.c b/drivers/clk/davinci/psc-da850.c
index 5a18bca464cdaf3a0f3573cf9d70b79ca591cf28..94081ab1e68872d978e4cb162d8f9101de656d3a 100644
--- a/drivers/clk/davinci/psc-da850.c
+++ b/drivers/clk/davinci/psc-da850.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/reset-controller.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/init.h>
@@ -66,14 +65,8 @@ LPSC_CLKDEV3(ecap_clkdev,	"fck",	"ecap.0",
 				"fck",	"ecap.1",
 				"fck",	"ecap.2");
 
-static struct reset_control_lookup da850_psc0_reset_lookup_table[] = {
-	RESET_LOOKUP("da850-psc0", 15, "davinci-rproc.0", NULL),
-};
-
 static int da850_psc0_init(struct device *dev, void __iomem *base)
 {
-	reset_controller_add_lookup(da850_psc0_reset_lookup_table,
-				    ARRAY_SIZE(da850_psc0_reset_lookup_table));
 	return davinci_psc_register_clocks(dev, da850_psc0_info, 16, base);
 }
 

-- 
2.48.1

