Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC52727E2
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775997783; cv=none; b=u1bk9ViM8qdgVM0NYAOINd9WXUarcuKJIXs1qLKPf7z55T1BKaZO7EgcwLmwqtWmhKQXWvY0NucWO0NnvMwArfxMOAOGQ/n9fT2fd09N1EykAmjBIt9NSntT+lg+sCR2M+lQmAIgllxyfH9LX+oCUy0Z9o7OMCea1FBxjVzanIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775997783; c=relaxed/simple;
	bh=j/V6kvnhuhlsoN7ZuzaHKSXaC7u5794AySSBjPax8WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPtLAG2acCrk9AyVHhFn3q/v0GqXEB16inguvraOZqaT0vg5sM4ZhGlucP9+HQz8m4KoLF0jI/yu0azqIEOorMyFkdh48HOhdmli6+2980C+8F1hgA29DZRdoHnpSRPqe0NUZfQ6+ScvPt9/ourZco9lASHNTt6itzqF2/c6tCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKUdFXdD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKUdFXdD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so26825495ad.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775997782; x=1776602582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7QWVaN0FaywpyGDYy623KiFtyqheURnD6LA050XwQY=;
        b=pKUdFXdDd9q4VYszMsiDUGcF60PQh6qKswjLPkSMlAdwpTumb7hBDM9nM1xAOWlpNg
         JHdZbEYtoP3RXLuqOa//BpETu6XROLM4eq7gRgx6bqTidkCfj2cG2m8SSFAevw4/OsJm
         A9nmPFkleI+inT0oeVFyGPMFmKiSleyaD0BKwHkEZd8SXJ27jdFabHBztzrDVArRE7Dj
         KDQd1aHfERhHU5Sic5cdQC/pGmhOrZvDIOu99PEwj5iJ9jIEjhilG7Q6mCOQbp164rT4
         N5xzCdUGiwMDly+W+ZmUKujm57pdVcq28M9htwxnIqKf6xNCf/9EMbZVjyr2RMSC2Vbi
         GweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775997782; x=1776602582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7QWVaN0FaywpyGDYy623KiFtyqheURnD6LA050XwQY=;
        b=KDkS7ihqgCrMUXNhPXVEOiBjwV/p+C0D14u1qytrbfdvdzmLx3XwkHuroPIM4DuyMj
         X3CPw1qYiWIWtnkjzqLBN8TpXKX3qqNGO6Xx5KTvO6YlIw3gRLQQpR9vrV8GI8jk2EXD
         P1qI0tyGvlH+clT6F3oJostoJ6glKh5s3Z8DgJ8ASS5VcCJg68F3sW8UNmv76OWbZZaT
         ra4Cb45sBUXcjB0Rqkbmh/WuWkszdCRnqo09UD7wGi07+a8QZn9wfT02ocoYCXOzkF16
         wc8L+EIdgApB4Tvwu5eL/phvhKfUZe8rfsA+zMsPix6XtBtkl4rN7bsYMKEPNwJ1pZzm
         V4hA==
X-Forwarded-Encrypted: i=1; AFNElJ9ObGHxd/mRaGLJg1H66sANNdqCW9FIrZ6Hjk8Zr/nuPFLgCrQVWa7YwjR8MBIXeJPMpeV7Kq8fPYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGgX1EsR+/7xRkxvFRGd1LFDNTVd+H9IiUtYSAe6Tk07iqBmL
	90dmfIZXF66fI5PO9HQNp1BdffKhZFY0/DuTaVeJsmgYHk8ckmzdnpx3
X-Gm-Gg: AeBDiesPdIudquUY8jh67qN2qKEnfqsKZ4pt70D7QcaTc+K6EZxDxcv6S1a4E3ZjK2i
	BeBAPqTvZc1rxNxXm3Pqw86q9aLirMbMmV/corLV8n/RihaEtQnDtKnA1w1nqiCCY5ER4a2WXGe
	MUmhuR8HMVTukEge2LQ6oXXN+tK1FWYY/lgOiH8EZydUzTxQneaXIvaThu/cxTZwpqp+a6kQ5KD
	pewzN0qzioZf6nt5rT/3RhYNdBuskuyLBGIJVcS9N9oKiZy/jwQN6QDT1IEoJ6HhF9/ZcNkxA6w
	BKTYAxUW/QK+ErOPDaq7RA8Kf3A4pI6/mTlD/8SKeNaXhzeevvuXgo8lXaPmbGfdTGzgD4qT5yP
	/koWT7ubAtFWRPiskgtJmFYK2+0FnUfytAQQhVbB9cSBXzKlI8uXZGTc+Qhf4n1s5iVG9MZ/16e
	R+7vnMLOJ9fR1dDg==
X-Received: by 2002:a17:903:40c6:b0:2b4:5ddf:24f with SMTP id d9443c01a7336-2b45ddf0454mr4606985ad.10.1775997781786;
        Sun, 12 Apr 2026 05:43:01 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45cbf0f87sm7731895ad.6.2026.04.12.05.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:43:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create() error path
Date: Sun, 12 Apr 2026 20:42:46 +0800
Message-ID: <20260412124247.2494971-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

eqc_auxdev_create() allocates an auxiliary_device with kzalloc() before
calling auxiliary_device_init().

When auxiliary_device_init() returns an error, the function exits
without freeing adev. Since the release callback is only expected to
handle cleanup after successful initialization, adev should be freed
explicitly in this path.

Add the missing kfree(adev) before returning from the
auxiliary_device_init() error path.

Fixes: 25d904946a0b ("clk: eyeq: add driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/clk-eyeq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ea1c3d78e7cd..a48ecec4c9a5 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -346,8 +346,10 @@ static int eqc_auxdev_create(struct device *dev, void __iomem *base,
 	adev->id = id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret)
-- 
2.43.0

