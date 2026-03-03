Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869CD39EF27
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550143; cv=none; b=AswjmkL+KKDSJjtwbpIbOf01ELeFXZQEKua0STzLaW3WUMXc6tACyuNVm10/FUN8acv+Kx5YV0XoYx/+EembdCulPDvRNR38s2cIZ18e0vwYL/l/Rt8Bo3zyWyldmqr+Ajb/AaEWJMwsMDWrDdTIM1N8IcFjWds4Z+EoBkFVd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550143; c=relaxed/simple;
	bh=gNqnLiUMRF06kVmMGIoKoKFFh7FWu50PSgdQBYVwVXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1PCb1WeObjBUp/l+rstULk63fpSAdZaUW4p4lCbZQdkMd6Jp2cP0pLtSGr+KeMri3I32h60IHs1KKXGxMTPjc3wWmtPuMXGvmsSPGtVofT1XUg5wRPws/8j2F3ZY5Jbck+/ilYOPplrEz6F2AEag455XxG9gjRLji1V7GvIXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=It7AjH2a; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It7AjH2a"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2236126a12.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772550142; x=1773154942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbEJcsuZwESDaLeDaKVaWHRTkzFmd5Ebe6jUtHes1/I=;
        b=It7AjH2au4TsGUZrE3drgl/k5w2M+16/U5SjiegC+cbrmHk3OXlyqS3DWuDS48BcR6
         Cem0j/Q5zLTD+fkizfQF9++Li9dOhbJxqD+9f3xVmDCjCdMj2ARN3oPLxqd8VT4wNBXt
         ybGzXeY8AKnjmfJW8KqIwlFRQ4+Hy4B8ytYtjexiA+gWk1IkrOQThgzj0Vrdb8ye33zX
         ARho99eWbHvsbyc7Kl+pUH5zHCLSu1deF6lwKnehTaYyuiAGGDtg6jYCpbeSO/CoTp52
         NBZGuKJvhnqyg+AyC4S8jURJ7Yg4MIAl911nMi7fNnLhyoxIq/7vloGTsiNTCDAAec7n
         xgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550142; x=1773154942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbEJcsuZwESDaLeDaKVaWHRTkzFmd5Ebe6jUtHes1/I=;
        b=XnusAidJxt/25bjfo7SRFKXYZQHYno916ELAxLqU1XzdjWD874FNuQBHKnfBvej4+m
         hWuNProJpJC7qFYJEnKt7R1LmSsopEsfoWL8Rs9YmOd+ax65hIijplHvxY9QLrl6rABD
         zwoL/LdJGbZTMi83YBpzgMlpqW3B/4MRJHSKEuMk7I+xZGskwoxeUHo2lDpv8sBicCLz
         uHiYu0zI3eENn5RxAtZ+7FKxE2s5X2A+36fawMzT3uQb8VHLnPuhu5qRpXq8Ek9JYjx6
         mpIbT+dH1BWIsCB4s+vwMbUBzN88jmS8pzxHUhVyuMSG7yC/wH7tf0Sod32PX2OWdsIv
         CT3w==
X-Forwarded-Encrypted: i=1; AJvYcCXlhqD4/4XfnC3rB5hJr3Efsoq6qYew6LrIv14uSgnFzDN12knjyjNtjFKPDYrcrePLiq8efNdZsV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8UzTmlJ/zxdDMLnMvcFaClOpmffO1gMDDvJinjqQqSN5ExY8c
	zYY2qzUezlKy+PxiRz6g6B2RwuwkvofDtoJBRaF3SLPdZFxvTg3szuv5
X-Gm-Gg: ATEYQzzP8PKf0xQjqCCKrCYNKN2AHgpgDIesRrlJfFc3M1yiPEHWsbzUkNR4oF28zVF
	CfEQ8H7fjFS3jlMybJDDYihdTdJkY2N3aikgrg1cD9V2Ai4YDGK5l8ywHHtnd/AIWa48ewkfuZI
	A1AJrfNa2LcOb5LiuaE1jfPAd/hiWKnkd5XiL5BisyQFpah9BpbngqBUPKpLYUTmUi9g9m2+Z2a
	ZlSew0QUf5IRrZWjNkrx8g691YjLfZjnToHX9fF4F4xdw2uEMKz10R55pBCdIIRgYi/YhVsmJ0M
	KQsrirWZTpQED2wDmN/42IFevM80+f8+mNtwC6t1ZUg3QVl4VtOBcpuA2mqgdHREiqgmZA5oS3s
	oP7l2xpYTR72A5BDAZzjGhMXY7Z0dXIFRI8+j9oHq7p3yO7VLs21RZxEegooS/zGaVpmlE0oZRa
	tCWySfhNaRF21B7iYUaQ==
X-Received: by 2002:a17:902:d4c1:b0:2ae:4d44:c647 with SMTP id d9443c01a7336-2ae4d44c8b5mr92904595ad.37.1772550140806;
        Tue, 03 Mar 2026 07:02:20 -0800 (PST)
Received: from nuvole ([89.185.27.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm76226775ad.23.2026.03.03.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:02:18 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Tue,  3 Mar 2026 23:01:51 +0800
Message-ID: <20260303150152.90685-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
Gaokun3, the image will stuck at grey for seconds until msm takes
over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index e91dfed0f..acc927c21 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -977,7 +977,7 @@ static struct clk_rcg2 disp0_cc_mdss_mdp_clk_src = {
 		.name = "disp0_cc_mdss_mdp_clk_src",
 		.parent_data = disp0_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp0_cc_parent_data_5),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
@@ -991,7 +991,7 @@ static struct clk_rcg2 disp1_cc_mdss_mdp_clk_src = {
 		.name = "disp1_cc_mdss_mdp_clk_src",
 		.parent_data = disp1_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp1_cc_parent_data_5),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.53.0

