Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963E36EABE
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876731; cv=none; b=NVzw4UQaApYm86D6iFwWFvubR1Tr3pwVAf2S94xlKtnCb7hy3Jdsy9G20XnPyqh/0grfiX+Sj5/IrlT5W7Zdy+MjyaqVb3LtRnp7u3dw/IV+gPa0D5N+miuN0pwTdabEql3JBd9tNbDmMbTWyLGPPqCVjPLJ6yXhdAAdqGq6GWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876731; c=relaxed/simple;
	bh=xISGRv3dimY3W4EqblC5Ad0F6uD0gWdstFksQ7mjZyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0l5xiyhezomL2KdKEmsTNLE/nBYPY0No7AyLjmjiROGJKHBqHM1rH/UdGd0iCb0mBP3L6NDySucd+0X25EuHCrSTaChQIhqr1wXcHXAmtQlltrLVIFL1jxaTocLokpeOGJHrIHVdTWtCABvyU5/M+obISBt2S4qJzbDPl/i+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYq+qUtB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYq+qUtB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84861fc51f5so41725b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784876712; x=1785481512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkBi6KR5OuLV4+JBH7X6psygpjc+win6hNgck0zWwhw=;
        b=cYq+qUtBwzhwBr0Cm7HgEFaFTIiWKnCmwge7y4T2QVST5jbGFBE0yscaIilftXL6k7
         xyYErRRuQ9iZdfajxkZ9mWrh9Uyxl1NQ0jVD9c+aAzM+lccUj9rkY5fn83VB6d4z0/s6
         EcO6TeMrQyu3Uta5Ni6mXl2v6dhi/czCRryKBF3l3aNYTdoieTbcKseIdBd/2a/Ba3T2
         9IMgkluWMpq2Zpse8LiNBcnWSph+BqcrOJCw+qU4SXvx3ETA4UsE4tsKWCNxo2f8wSIw
         LQd+AOz/mC8RNXer0Ttiutx4ZYIEUcz/rglScXgRms19retMOq7dyP45ttVkqj9w60Yy
         CooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784876712; x=1785481512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkBi6KR5OuLV4+JBH7X6psygpjc+win6hNgck0zWwhw=;
        b=GcbBCDmUmQsMOLqxNkc3hMGNKGpE0LViqEAcd+rBO7qh584fLkNgypEDUOfITGowAw
         xO7Jz1PU6daEREUbGJOgAooMm4P5lP6cs1f+pIave7VOZe503RfzRtmT5sXkrlHdw90G
         LgExVOk5Pibi0UyI3VngfCXTcIPc3BbhzrebgUcq8+nkuc7ufYkpZfVvA75jjzxellNy
         VvkZjq8l7kgSCADqNoorX7vxKs+4O+TG1FwYqp/sq4A8iiui9dPo1hQiSEU4JlBr7orA
         W+Ja6rkIuu64aePodR35/HnvgZfCyhp1l9FtAC0DU+oE+Xo7LukIpdntpGKbQ5L2bNAH
         yUzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxJ+POy+cFZnj7Qphg5HHyQXLsDY/VnZ4ppHZq372Oq9lZye1wjiOUnUMyAEorTwoFMop3mdDB9VY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnaUrwFa34I+cv519dH0asnbC3JLL3YprNglGbad1aWnAv/w/j
	xfdsoqTSjXStpeWUx0eWc1D0XkAq7lXV6PWklValSratQvY1nhlRruPP
X-Gm-Gg: AR+sD11WZDqT4IaG5e5GPHi1Deld9xL6hLdbu8Wd+MJOQ+X7QhV4SeJFmSpTeOwKFBc
	Oy/0tOCr+/gxygflNNFZTuWrFiW3NA/j7qATpKja55vOfLi36hOJP8LxPj6EjohYAANjG7DNTY4
	2uWL7I+KvPwMloiCASeT+REsgshOiGZjLRWeyARAh/GRhvYTbQbkqB6QcEZMRWZBmTKjseeke/+
	fWEsRD2/o3znayoVHSggcI4zEJKHEi0SjbhoD9hiAGxJXMn5arSZzTehgFVgEL/JwQYdnyrYmsO
	4F0P51FAoHMvK9BkrM6HR6mD1TnRr9Y0Gc0WrNckqfFdbS+FEuTmD8Ac7a5Cj/S0YIHFYZ4jIli
	DkQ5B1WYHyZuqrYUQ9YLw5TP8Y+V1WFAqYx/LETLHdtRoK4BGOgue6i9LNno1HHVNHV4enUWn9A
	5abs5i4hJ1UJWONv/1sDOJVzb3rPotEqMeg3j/Zg9oC0gWEEcRb0cizp+duHtNpCOLZb/pBu8ZH
	T0qhcL7edaBIDYjMUCsKwyr2FvXNeQt
X-Received: by 2002:a05:6a00:3e29:b0:845:f107:38c8 with SMTP id d2e1a72fcca58-84e2bb22d8amr6967148b3a.47.1784876712241;
        Fri, 24 Jul 2026 00:05:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175d6c30sm4266033b3a.51.2026.07.24.00.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:05:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: si521xx: restore cache_only on regcache_sync() failure in resume
Date: Fri, 24 Jul 2026 14:04:57 +0700
Message-ID: <20260724070457.24007-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If regcache_sync() fails in si521xx_resume(), the function only logs the
error, leaving regmap with cache_only disabled even though the register
cache has not been synchronized with the hardware.
Re-enable cache_only on failure to restore the state established by
si521xx_suspend().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/clk-si521xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ceadc07bcb6d..e96d5d082624 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -358,8 +358,10 @@ static int __maybe_unused si521xx_resume(struct device *dev)
 
 	regcache_cache_only(si->regmap, false);
 	ret = regcache_sync(si->regmap);
-	if (ret)
+	if (ret) {
+		regcache_cache_only(si->regmap, true);
 		dev_err(dev, "Failed to restore register map: %d\n", ret);
+	}
 	return ret;
 }
 
-- 
2.43.0

