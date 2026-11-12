Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450722;
	b=f5bqwiSYwdAyrEyujzjApAReYu5iwu0xgI+oOxnKn/5zxUBVP17swUZQ5EGYZt9RYaLK
	 44/Z0P0dK2b+PQbEa49UgJ8nFHr3bpKl6uuvAsmaS096pC0x7NM2mqPU0GdPggFhzFke/
	 jN0HAnsflJiQ+knDqAToyuO2KtWbD9ZINroClVZpB0Hin3LlvRg71aXAzZkRgkQ4NvcEJ
	 hgQIhOOgo3zAmVb7Ehl0h9IU06vUbVdtGeFoLwNGL+464kMO66k+vpu0VqYGhGVHKcDoZ
	 lZaB1sJlRnYaIHAq7lUqnk596NCLSuZiVvQRZR730ZLH6rlCcPIyoFqEVBIxWkNcC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450722;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IVjZ58U4WqJtvnbqVGQmwoIG35zU3s+Yzi58o6NmRfc=;
	b=IqhCJTCa7aayZNMQqP/jVzkofNmfamdVLXVtyDROeV4G/Uxxb1mFdyutI0tpwO7lRZ0a
	 lXOS42kko7T8DSeRMU1xeo0a6OUqxlcVkT3pUVs7+sVGGLLK0awdcQLIpnt1P/3ROCEwA
	 mpmn8X0uZhZk22p4m6hZMc3OJy3wn7RemDjDrwGIBVJg+LaS+aTUmwqn9G82tu3bO0zYZ
	 va9qSARKTMxt5mGkZNXRtmu2gqwr8AaQFUCp7YQ35JOPrK5mZyCbmCZYsrhekNEr/otN7
	 G4gmUZK0EsL51oxpT406caYfIJe/ISiOGBnysPGRhvJ7N03wTWktaySbsV2vUy3EFyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ezwQ56No;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2F1606A32E;
	Thu, 12 Nov 2026 02:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC2F1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ezwQ56No
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ezwQ56NoBPCJcl12Ibf2rMHbt4d+MYsAxqViYAS4VwKdcyNAu95ME9q7/ig81JPIhsAW5FF87Gcnz
	 d56dVTlulnIisLDAtwxVrp3Q/4n/4FUn5vDFUJK2yMoCK1Ldk5KWRaD3qOC7dc3050gH2q9XGgzV3d
	 bPB7mdiN4VRhHlm4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af5251e636-7c5fc;
	Thu, 12 Nov 2026 10:31:59 +0800 (CST)
X-RM-TRANSID:2ee46af5251e636-7c5fc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af5251e178-ef4df;
	Thu, 12 Nov 2026 10:31:59 +0800 (CST)
X-RM-TRANSID:2ee16af5251e178-ef4df
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] clk: stm32f4: Return ENOMEM when allocating clock components fails
Date: Thu, 12 Nov 2026 10:31:58 +0800
Message-ID: <20261112023158.118273-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_register_cclk() and stm32_register_aux_clk() return -EINVAL when
allocating a gate or mux fails. These paths indicate memory exhaustion,
not an invalid clock configuration.

Return -ENOMEM for those allocation failures. Keep -EINVAL for an
auxiliary clock with neither a gate nor a mux.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 4261a881cfee ("clk: stm32f4: Add RTC clock")
Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/clk/clk-stm32f4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 6603d4815514..bf78fd1744c3 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1204,14 +1204,14 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
 
 	gate = kzalloc_obj(*gate);
 	if (!gate) {
-		hw = ERR_PTR(-EINVAL);
+		hw = ERR_PTR(-ENOMEM);
 		goto fail;
 	}
 
 	mux = kzalloc_obj(*mux);
 	if (!mux) {
 		kfree(gate);
-		hw = ERR_PTR(-EINVAL);
+		hw = ERR_PTR(-ENOMEM);
 		goto fail;
 	}
 
@@ -1778,7 +1778,7 @@ static struct clk_hw *stm32_register_aux_clk(const char *name,
 	if (offset_gate != NO_GATE) {
 		gate = kzalloc_obj(*gate);
 		if (!gate) {
-			hw = ERR_PTR(-EINVAL);
+			hw = ERR_PTR(-ENOMEM);
 			goto fail;
 		}
 
@@ -1793,7 +1793,7 @@ static struct clk_hw *stm32_register_aux_clk(const char *name,
 	if (offset_mux != NO_MUX) {
 		mux = kzalloc_obj(*mux);
 		if (!mux) {
-			hw = ERR_PTR(-EINVAL);
+			hw = ERR_PTR(-ENOMEM);
 			goto fail;
 		}
 
-- 
2.51.0



