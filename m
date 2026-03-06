Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5563736AB59
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 03:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767560; cv=none; b=D+c/FW9olFH4yVwPic3HTJdyzZ8c776Pr66nB7jH1/qO8c7BRjIU8cCGzjSPPQsjFx7bT7UxipiK4g4bPtqJpBtaAJboAPzhd40bFaizZ/wtnJWbCrTYFcyPRTxLahXaLkLDiabQKQ7ypDQQuJNrGq26KIPBQJ3iVbTRfdyt9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767560; c=relaxed/simple;
	bh=QpBAD8aFcmAHNuzz618F5XcjlFcS2PJ0+mVIGBpyjtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNBq1EupVRFjhIimaZ4GrCO/T4tYZ3kMXhDDc5pwtQFxeLuCSnAQcymkLZIHr76hJC2MbygZ7sPojcj/FF4lsae4SSfvPOKmNzUPUTnqh52C1B/v92S/Yp9N73cLQaRn5cA7eVk60oE2i687IVa2GSNIDUtzAzqZHXA2arj388M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2/JVaI+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2/JVaI+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c7377119453so1180857a12.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 19:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772767558; x=1773372358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6bAE765oO9RMv6HiG4ahAua9/sTwWO++ewXCfT3Hxk=;
        b=Q2/JVaI+mupxmqIZqkFiYcLfEP1ejwGuOg5vL/AQNRTSo7f2AcCf2bEg12zlxm2UGG
         UeozslG0BgUAuoNoS9y56qGkgB7kP/yZG1UcVcyXJNO2u3tdTuGg6wWmFeEHnZfMqEnQ
         6EhJDzt5+tiXA4Vb7F1NcE51LWWw5Qx2utrtbaOcuHncYjyBGmgxDAuy1msQmG6P/FM2
         XDL5BghpgJsRQPe0kMMRtyeqptzZqGTdcAOewu/CJKvY6LIyzREnZMsUq3rfAkVkmS6J
         Vgfwbrel5hI2tB354hOXuz+CJD2zt8Z44A+TdaumQ0ofagU9gM7aMZ8o14C1YLm/yEKP
         s54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772767558; x=1773372358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6bAE765oO9RMv6HiG4ahAua9/sTwWO++ewXCfT3Hxk=;
        b=iItVfY7M+EKM/Ta5DSoEKpzLDcLhTw0knQbiRbBWFhRCrJF0gRpdEhRwkr+meH7qGo
         XW0krzogmBW+bKHtcem4RxYFsqZdxGrAKmlDUyToFS7YROizyRQja6hI5lkUJbMYgMVs
         t4mdau+Z1rp5xcz32bRf9S/BOq/0fqwbNAAj8dPPwRAZYF/n25xnazW4YmIotKZ/JgIC
         B57BiL+yQokYM3YA57FeoNVENTEPaoiGZZNUyFSNh5zfqvTEjsGuqo5WxOE59h9AvZNE
         Cxgk28ZarMfzSdHaaLzDWQgnsdLaOSAkd4f4gQIPZIh4aaUDcqKTazn0f8JuLW4dffpM
         QNJA==
X-Gm-Message-State: AOJu0YzkiDLooAgPTxlG8C8/p+diMVoojfFCo2JuFBVmcIyXvr4LvSNq
	h1L8DZVHrLMJyPgeM104ApJpssz7T7lgzNP9Ev3Kwt1IKqORlZXDkC8/HDQzjXAqGyA=
X-Gm-Gg: ATEYQzy41iEU3+OMrKfOPz4zRwyH4elPuVANcKPWyD8vz2J3jDHoVDhxRWmY/vKSVUB
	AFoviu7Bk+mK+x4ourGQN/52Ir83Ym2VAeK/K00DdOC5YuUcj5MfGGYL4/0yA2vPKunhXJWz/qY
	AMQFPy70pcMD7vap2MSKl8m8GLtq48zD2PpoNpjf7OCQqQ4J3vcfimQcl1Us85EhYd9FGz6o3Sp
	CNY9hRYZMbx6pRhgFitJdhmXOuypRuCjt19D9tX02t0UrlRr2oUC//qNJ0t4NtvABSnjH9slEg2
	GRyzt6kDroMXYszHZoMwkaHpEUxwzj/kPdeJiY5zlZ1uR76MSkLctSu+k4jjTpn9WAJzcJsVUvv
	8q29kooApe++dcsScHMdWTys/HgeionAoMf7AEbHw1EMGKRAj4c/1Vopmi4mlPH3WHsy+zR3zda
	mJ8u4slo9j2OMEkMW6GKerIuIizcBNRnV//SBlVZDU98EUomb+wa0kFL0ski5JgAIL2A==
X-Received: by 2002:a05:6a20:6a15:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-398590d61b6mr872614637.69.1772767558244;
        Thu, 05 Mar 2026 19:25:58 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a70f9sm148424a12.6.2026.03.05.19.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 19:25:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC18XX ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk-lpc18xx-ccu: kzalloc + kcalloc to kzalloc_flex
Date: Thu,  5 Mar 2026 19:25:40 -0800
Message-ID: <20260306032540.47815-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocation by using a flexible array member.

Also allows using __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
index dcb6d0c0b41a..3793e701835f 100644
--- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
@@ -27,8 +27,8 @@
 #define CCU_BRANCH_HAVE_DIV2	BIT(1)
 
 struct lpc18xx_branch_clk_data {
-	const char **name;
 	int num;
+	const char *name[] __counted_by(num);
 };
 
 struct lpc18xx_clk_branch {
@@ -266,6 +266,7 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
 {
 	struct lpc18xx_branch_clk_data *clk_data;
 	void __iomem *reg_base;
+	size_t size;
 	int i, ret;
 
 	reg_base = of_iomap(np, 0);
@@ -274,19 +275,14 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
 		return;
 	}
 
-	clk_data = kzalloc_obj(*clk_data);
+	size = of_property_count_strings(np, "clock-names");
+	clk_data = kzalloc_flex(*clk_data, name, size);
 	if (!clk_data) {
 		iounmap(reg_base);
 		return;
 	}
 
-	clk_data->num = of_property_count_strings(np, "clock-names");
-	clk_data->name = kcalloc(clk_data->num, sizeof(char *), GFP_KERNEL);
-	if (!clk_data->name) {
-		iounmap(reg_base);
-		kfree(clk_data);
-		return;
-	}
+	clk_data->num = size;
 
 	for (i = 0; i < clk_data->num; i++) {
 		ret = of_property_read_string_index(np, "clock-names", i,
-- 
2.53.0

