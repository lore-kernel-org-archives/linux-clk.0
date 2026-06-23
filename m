Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661242D4B68
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205667; cv=none; b=XZySWUEQaHcdTbb98j53Hk4QOa+KYrAcNDUwxioOlhU1xbNw1PezjwCYGZ9s58uvWR2GxPiydRbVZWGMrvCC3Yjy5i0Mnz3wN3DKsR4LhE+Nj4xNCC3p/3efmyJhJOJ+KlTVmX68iGHX9a1mWOGiSsH63aPemSdRImrsH7Pj8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205667; c=relaxed/simple;
	bh=ESyqtRpi7ytPwnbKcfiQj5Bd4NGUztPgO4gK37OJIZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7e0mMNy43d6wioQ59bE5wERI+PrXw505thK5s6pjo99ZUZNM7vphiqszNx8aFYTvt4zgpFXWMDAJh5LJkpzepUdeaKt7SSewQp/aM2zyAPyHpWTKGk+wlWTsdMxX7J4JA/KlFxZ1H9jy339G6dDnEA4YJ26e0unubyDAUK9BVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOWL6jI2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOWL6jI2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84531988438so417564b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782205665; x=1782810465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CmzqBA91+B9bpOJKSj3goWrwy8u7sUjR1sONP+FUzew=;
        b=SOWL6jI21aajEgm9Iu7etCW3TU8jmNFY7QGTzjFa7cTLzR1k3AeG7DRECcSldpPDb+
         IEncWaVj6pl/woWfQyazyXn/1TJpQLKOktZH1kV9acD0WLSVzBgpOALrdXX47wP973pr
         BGLu2Miv7IEPd4pTWUa2afd9io9CmbDuGIQgZg0ulzZFAjql39vQ4QcLDfhVjbADWw/O
         2SC/S+r55KLy+RwsWIZAcCwIFbIgNt0JM+WhhkfL/u4M3wUhzX060oyRvvsb61gIwI2m
         N8gC+YqnspjXgaE86RSU70CF7lVSnngf+FmB6VOLB8cM/O9qApiPvxRZn3XSq5Cb7GST
         56mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205665; x=1782810465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmzqBA91+B9bpOJKSj3goWrwy8u7sUjR1sONP+FUzew=;
        b=ra+3b7AknTzYf7sr4W09sNKvo5h3gUFEGNvv3V6aySRx11O9tVO0oWpEVog34i3RbI
         f6N5vMSXQuVD03Z/nodeex3pll5nmuTb69wKkMnmAFpKvq+x4aW9ga0+AXCPl3arGdTn
         V8qeWjDzOqkenIPs75bd+vHjFh/GTZVPLypPx5CCs2U5867S1bAJPHsLT/RnQzAY+f7q
         QAs6QvLcX496oCx8DnmDNo3kKG/bnlingRl4blUWFtkB9XU81+LDleIdiWHe/DOfqafi
         sam3bt2A8F/rX6ty0ubteVbJa9CZwwYHSJJTtbS0rHcN7aRjatD+zq0UQmKT338jjkrf
         lVMw==
X-Gm-Message-State: AOJu0YyXVa56+tVtEDJxc71Xtp+kSOJ+lJw/39d5otiFlGE8U4hiTCMu
	w+x/g1b499tPO6OasR9XVhaPIM4CsEWG3al1z1D4g1zqR3g80ewAbJo=
X-Gm-Gg: AfdE7ckIVhIXfGv+myhCAgzmXlVm3e3NkXFX7yYtQvh8JunLJ1Onu11tT/P8wsV7B8J
	CUJZlH4y1CLBahqCc0J2x8NCcSh0PYgd/fa2xJluFYM/tSJo1RIqDypp632ypnMvc5fcdU2NRmf
	GAh1NQf83fFD7Hj224wtu14HbawRdOTZImL3oQMsPHBXLvih10lX8rxARsdJj0oiVbv7B2m80jm
	FL4Lu/ICO2vaDD8Lr7Hb/4dsRS/9yJx6m6zCqp8qGKG0t6acICL4AVnSsYbKhPy6dZrYg7IajAE
	JeJoEoZI5eE6SRa5iRsQPXnVgtd2o1ywcI4O4MgsyUwMtpeNDwsyMOSRHX3OhOr5BgyLJ0W5PCj
	rciOTSb7bPi/0uExlR9kWc+tH8ypMzc/OEyyInQZmvs/webhDCAtI6qhOYe8X4TbC3RRmI+vTNI
	cHwZb92Ch5s87TPFjp9DcPOapkhEq+9zbskibkP25rIlIeA2gPEIRXIkTM9bAE+ix5
X-Received: by 2002:a05:6a00:e0e:b0:842:1be8:f9d3 with SMTP id d2e1a72fcca58-84591cb129bmr2489589b3a.23.1782205665463;
        Tue, 23 Jun 2026 02:07:45 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd784sm10449409b3a.54.2026.06.23.02.07.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:07:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: palmas: unprepare clock on provider registration failure
Date: Tue, 23 Jun 2026 18:07:34 +0900
Message-ID: <20260623090738.13773-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

palmas_clks_init_configure() prepares the clock when an external control
pin is configured.  If the subsequent of_clk_add_hw_provider() call fails,
palmas_clks_probe() returns the error without dropping that prepare
reference.

Unprepare the clock on that error path when external control is active, so
the probe failure path balances the successful clk_prepare().

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/clk/clk-palmas.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 39049f62db..ab9df2eedb 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -265,8 +265,11 @@ static int palmas_clks_probe(struct platform_device *pdev)
 	}
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo->hw);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
+		if (cinfo->ext_control_pin)
+			clk_unprepare(cinfo->hw.clk);
+	}
 	return ret;
 }
 
-- 
2.47.1
