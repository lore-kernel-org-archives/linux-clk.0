Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE703750C5
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400249; cv=none; b=gYnNIafPr0h4tnIZSiFZnLqfvdyaSyvG+qOzpYLWBemKjXkmLV2kIJsokj/ee3BTynIQ0vR19pR9XN/RVGedPSb5azyhuKw4kifF2JBzKPJ7E1Je35CDz+4xW8jNWbGcZbOevUQowSUJSLjZpME1+BFSFpt+in7G5gWushP8mtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400249; c=relaxed/simple;
	bh=YjeHZnDTNmLswpD9K7Cl/DFnt19DQg/OcvCx1Vxb31A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxuB1vYXVHPb/G04p8lk3+lPnZ7t6Ia6F2tqT5Jx1uVOoinBEID+aPFPpAzOqC88kequla3wDCruH83BhRzG5ScM0D5ay7WZW5g/kAHn/K2/OCxTou537X0gV+CWEMrVXO2QCVmejwyDrvtaLE/dc90/VlOSI7TLqw7numsBMgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4FiJ+px; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4FiJ+px"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824c9da9928so1336596b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773400247; x=1774005047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYGIVcFVqzuNdja3UfykwghgGz0iLAtObHJVPJHt+4Q=;
        b=a4FiJ+pxQsxWAs/ARIp076D029S9w1D52IZzxslsOlvV2youDp9nITPoM76huAigEg
         gzw32T+8vsxcWe7kuXxVIIrLdHih4TJYzh1UnDrQoY/AtwaC15z0WukUIzXuVt+ZJg3r
         pdwM2bj367AosQ5b8pIev8nc3StWUL0jqJCXbYQ1szPRMtS1Y4TgxPu4u8dQa7doftoq
         qXv/It+c7d70jGpRSxvPjMTa7cQKcn2moVCH09MEhUN66a3GK7mLdyAXDnbDZPu7bl3a
         HtFcaBurMGNq9Qcnw8YkYD4yV3oo43gD39qO6+441qhi8SJqx58mxllUe8Jxt8PQCj2/
         zXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400247; x=1774005047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYGIVcFVqzuNdja3UfykwghgGz0iLAtObHJVPJHt+4Q=;
        b=p0Y+j1POi6NXcxUSi+9hSzct4B/T96aCs7SYSsm9aviYRmC0buUNO2i7TCl2yT+uLk
         wKi9a2XMhHuNlbmamRh4BxERLiwLuWbr9m27yjupL27O+kHb2ibga0sStgTFWxyygnOX
         UoN1MHOPtIdz2Wo1yDAcaFEeJ+dWwk7uz7HQCr3SOvX4pDGN/Cxw+puEqajq7NUjX7BW
         0bU0z2RnBnhhkegd1205VJyvRr8dxE1xo+oAtDehBYaJnYaIUpJnExyQewnxo/DGYaK+
         FZiL8ktnzw8ZIAtlm4JE+sp4KhJ2ELAh5hbjwdRXXNV/bAXzAMWedle5+Z1ov0gn9ehm
         jIxg==
X-Forwarded-Encrypted: i=1; AJvYcCUut1F5U4ddCu6LfbRzH1/qawfJ++u1pVArU0FH6ccfRRQ6SY6+Sgiikj5W5KrBabsxKKpEeLmYSIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE3CDJn9VsYCSNHTTIsN5YrqGcsZdqjvmu1R3U5WHqdWU2RqoZ
	8dZVlY2TfYxvNjhUQO1sUezWhCWNI2p2c8gLKQbVYdhqooMk/63Y9vBy
X-Gm-Gg: ATEYQzyh+V0wn/DEH9ITdyVthl/G2qwQybf6ip/JbwU35x+l2k1X+OKPGU3RBp/giQV
	sgLOGLR9lWCG9R7z7rLa2ir5p7FCkw7Jov9zRBOlvdL/UDQU5nrFcY1nekAClJAiPviuUXyOxEO
	VtP3ihyK/h13VoYb/LTl6CYpT+W4FZChFRpBzERUDPFkND2bHZBRbVhgFjpbqor3vIGIo+u5N82
	D0A7iKAP1JvD0AL5RiFbg6+wA11pifMHjr0X2I2rBUwngjzKznmnXjmBPClUo0pzkFB2YoyMOEJ
	xMRT1PMWseOh0yTIu9MYPuIlkZd/V5jnhqGlIHPRh+fQ+empsC0pOZTQvdWuPcCPon0AJWNI+sZ
	T7s8BtKJlMXo+jN3ZXB2MK2jkcMDg2E8go3j8H2Az9TxJn2uVIZwCs2xDOiF+8kfzQhf1s0suc1
	JBVNxkO4XF5sH+3jC4jwgLLR+HbVEi
X-Received: by 2002:a05:6a00:b908:b0:829:8e51:505a with SMTP id d2e1a72fcca58-82a198fcbf7mr2256789b3a.45.1773400247400;
        Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340422sm5680044b3a.30.2026.03.13.04.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of select
Date: Fri, 13 Mar 2026 19:10:18 +0800
Message-ID: <20260313111018.130068-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both sm8350 and sc8280xp use this, on sc8280xp, this would select
gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ced60771ec..59c1909451 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1614,10 +1614,10 @@ config SM_VIDEOCC_8250
 config SM_VIDEOCC_8350
 	tristate "SM8350 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select SM_GCC_8350
+	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
 	help
-	  Support for the video clock controller on SM8350 devices.
+	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
-- 
2.53.0

