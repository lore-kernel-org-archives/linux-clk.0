Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE253DEFE4
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091017; cv=none; b=SzW2WhPYdE1/MAiBvcnND3kOP1RmQZACVH+oh6kTbl/B5Zp7qqcJxhnqLJKTgBvIyYjwOBlSAnROnvpbQrfyeXgX8T7xclLDLs9ge04ENKSZcZjU6UDDR3OqAygqdOH1icxqqnmN3/Zi/8UUWEiu1i6JpEaCgTyI2UqMB6VALac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091017; c=relaxed/simple;
	bh=CQiPZwiXn4m65gWkVZkLBq+sWyMmqdp49enY7UbBcTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3gB6eIiiHtistWRbV7L1PNQTnEzTY920Hpy+lSZLG4qtnZyQ5TSO08tcJfBuMmjV9TK8cGKdBFCN+q4oCP/3mJqMk+ks64Juwrv2+makY6ZEp/ofRNFp9UDEE3xn7jjcRX7KmRzvHBVqhlNz1KpXubnn33RN7Lpu8FjLo4j1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkA26Dz2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkA26Dz2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso3293417a91.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776091015; x=1776695815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZuCdLfTzqLBe0povKqAJGPUREmpR9XWI6MvS95wZIM=;
        b=pkA26Dz2LkVUJUFhNcw6QvzUml0nmMYLe93yOINZbfo4ah8f8fJzZqLONoPmONP3Ql
         oC5mXPTUm6idBGU4Xp+moUK0RJRn39zc7Ww0ANa6Bx4DocuNejXWawV1lAJXbvlRzABN
         TQ8WAR5ygL6J72L1K7y+dzI11/EyOJ8VPkT1p6D/yQ4/HmSIrGEmD63O+C8KqXUrbKpu
         NWTK/jcjXes9alHK4c1w6j3BbW9egysCYgMjR8cRsb2EfbqxbLhjGq5y7uWkJ/+v5Evf
         ToUUKfEHIz1bzDw8NZELT2EZszN39p8Sp+9oOyhayeyHR9vmqOTa6Xxtsfmxy67duvzL
         hHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776091015; x=1776695815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZuCdLfTzqLBe0povKqAJGPUREmpR9XWI6MvS95wZIM=;
        b=flkHngOZsgqwt5PieSxVlBXVRkh0Ck54uY1W9V3oJeJ4VReEUI/dvUuIs0jemy2ntu
         WY+DDBZoM1fY+Dv1dTppSamOt1apby2yORfeFYt08zmuP+Z7RBoWnA+6onwF1HmvMMTk
         CFIb3CrgWb0P8BDvrTmNPMNwGv2SVdFVUhntLLHMoTj6MqdaeHty4m7/C9KNlN+PayRe
         bKNOrgmnxwAUSEEUb+YceXERDf8YxbMfYELU0aqkKMcMJpULyLNZlb8XAIUhSaBuVvAa
         0j7/EH/nhYIx+m1WwHWcJ/AjAqJhUzOT+OmubCQNJH+RrlqcOmEjQgYN1CMk9jT7dJY+
         B2Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/QDS6Rup/ZPQ2a0FHYGkJOsURYX5lscOIeTwSNkkO2YFQTyfjOOVgjYUQ54vlZpjzMz02hWk2tF4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YymtxysrpnMXj09ABiIZ+vmElFx9JBzUfwiTx1boYV7gl3/0qL3
	qJID7X4qp5drgUI9T3Z8Hg39e5wsuREPFTCercBekCMXSZNh2p3oWUO0oZ6UH/5ozsY=
X-Gm-Gg: AeBDietUQHQpAQk9HqgwurGS8/XEnKc3PfOy0TWGP9uHssDffvCaC4LIDU6cJO/DXjO
	MbhbrAPy15Xjv8rTALcU6IsDbWe/1QTjLRTjcGNP9IM9d1VHcB2uURcCpUKetDF7j6H66EWGVLz
	ZJv5HYOXvmNe2UMYhjGae8Hx4Yyy8jMdGxC9S5W+5Cf9R4gdQal0tDO6zMvynAc+uIwqInIbpZf
	GZZnyniRPHzmxICU5ifUaevntU3+tlesqVzc1cjmf0q4avdebIwJjM8s4rjHG6WE8ro1ykN9sQe
	MbbXgvaW/O0TvZoQVbC3qvVHva8KFEVNhEDTrI4LWfedvnE7UI3OlOR/bM8sK210wvKFLh2uGCH
	XNdLaq80VC9rBDr2hMqWZ70fXu68a5k9JlWMTUow7HD+aCOVeFsRBBdbfs6aEtxewBtNcMhmH6T
	ked5A//e+WNA9P2V6HeTp7G/WiVOuUyPA=
X-Received: by 2002:a17:90b:3c85:b0:35d:a4c0:a0ac with SMTP id 98e67ed59e1d1-35e4278b922mr13246756a91.3.1776091015423;
        Mon, 13 Apr 2026 07:36:55 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6c67:74e8:5200:1f39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3512f41bsm15826120a91.9.2026.04.13.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:36:54 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] clk: starfive: jh7110: fix memory leak in jh7110_reset_controller_register() error path
Date: Mon, 13 Apr 2026 22:36:43 +0800
Message-ID: <20260413143643.3002454-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jh7110_reset_controller_register() allocates a jh71x0_reset_adev with
kzalloc() and sets jh7110_reset_adev_release() as the release callback
for its embedded auxiliary_device before calling auxiliary_device_init().

If auxiliary_device_init() fails, the function returns immediately
without freeing the allocated rdev. The release callback is not
available for this path, because it is only reached after a successful
auxiliary_device_init(), for example when auxiliary_device_add() fails
and auxiliary_device_uninit() is called.

The issue was identified by a static analysis tool I developed and
confirmed by manual review. Free rdev explicitly when
auxiliary_device_init() returns an error.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - clarify the changelog to describe the exact failure path
  - note that the issue was identified by a static analysis tool
    developed by me and confirmed by manual review
  - apologize for sending the initial public posting as v2 by mistake

v2:
  - initial public posting; v1 was mistakenly skipped

 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 52833d4241c5..55cd0ccbdb84 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.43.0

