Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A94220F47
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461501; cv=none; b=NzmUfdMYP6hRS9G5meIj5Q3X18zM3xQFjhYumGhPSUS2LYuWK18c5dBqf2C6OOEsNmNq/GAo/lwC0ujqmUSgKu+OdvY442LjMWJg9/ctqWMeb4jV887q92Z3pnomTJqBbxdH2+SLy+2KsTtxrXbWQwBzl5F2HhkyU7Uualvz1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461501; c=relaxed/simple;
	bh=JaLEcoIDX2MnUtAyvebRh+z+dgc4MZeERa7wRQutoC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvXSE/X5I3TwdXV05hqZOwKYY0DCqokoIEnJY9CO5bPcGVpjKgKuMgAHf26iLTzTeSTLkqZak7BDJXoesIkr91YBvjqKMZd/oDLi9YLvVz11pPXIpEfU13PBYFnSuJkcZr1ETek6nc41qLiepyK5/iVz9I1l+GEtopZ0+ko5h4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJkP2Tv8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJkP2Tv8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4ef05f631so13989f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461497; x=1749066297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB8gZ2Otjc20dEIAbS3e+F9BejDU6DIS+BphNh1eutE=;
        b=NJkP2Tv8xVt8km7zfdUIyd3uiY2kHVTBeYaTiRPRMWuVusgE7qpv+BrStWX1jpMOgY
         +kcS0SPEl0pWK++qkNpdZ5H7/OWD84Bzx5DHbT/j9/5JlFRb5tH5ibRNHhSr9llrhfvq
         Wi6TXIWkfkTirHwtg7Hi4AAbqXxa9SdLh5/fq0Y/zqXknrKVTqpggwklEWlf4Hebyc1x
         2AT2BP1nbdbD3Q0/EBF8uHxEoHJzm7MfslzukwOfOGlDF9eV3DtFHx/9hj7lBbgIkNtw
         qd/PMhI50bCLtkxMiqCT1FH0sy0bSrlwt+ub2lotKvrXCIrdzoFsDK1t0v9wLgikUu3E
         vRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461497; x=1749066297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB8gZ2Otjc20dEIAbS3e+F9BejDU6DIS+BphNh1eutE=;
        b=BBEQVgTlp3uOWeQ7eULR6Q1tfWJGN45rAeJZ8oIKIf9cHk2F6064XZa+9dOILv3jCg
         E/wPFanXYGg9F81irbi18CtMGqnD30eY+KLv7ZhvA/9YdkCVv+jJeWmjyKwzFgCqK/7M
         +dz83kXLZggqO2btFqSBPcs0nzGMsgZkQzL2zFslKFDBYmFVhmZMaWFTiWBjwcjdMC4o
         Q7lvlvD6MQmXN8PdetHu2vYZHcLFj2ZzRYHQPQibedtr2EMBtgx6xulrWQds+tytj4Zh
         ppdBj9FxHe09W/tEJLzXv2KL1/kfnB5cxBgWO9VoGyZd5nvZ7ClpiBSgzRS6A3QXTmIp
         dBjw==
X-Forwarded-Encrypted: i=1; AJvYcCWGhhmRELHEz5BG++w9a/mRcqW75i7ezKtzE7CSOQidvCAVzGXK5LQXj22RMiVrBmMqMSAcjSOt0lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+aN41vrMPYikv+0B8UPCekdlhfmyvDkjyNwumObnFqomKRFa
	He4mpqs3qXTqle2f/tTNU2Gbjsr1Y8/BuW+gkwZB5B9P1nGBHlqLSqsUJl7GY62h9nmUSihxqts
	vlzyU
X-Gm-Gg: ASbGncurVekfDCsvOz+zo+wOpR2Js1Uou9KX4pCBZ+dNWcUS9e0yZEABX0DmNSk+CTV
	D8rpjW7JCDUYZ3CTGBVIXXNKROrpMTZEiPI5TSuadcm0dhlh3lOUhvG2oYMTeIxPpLkugOxHpuI
	vv0P71RvfmGXiS2kwPGPhuyBFLrYOS2UBKEGDsCh1K1iYoHHJP3a477zS13y23ulthThzLTBovI
	9UC+qE/XbQrQpIGo7RgoW48cS317HSTQ8oDgk7K2u2raYU5OkI/rdp0Nz4mMI0Ku+uV+y0k3oXy
	QRGnnhQhgkz9Izz6ITEPx78pAA8rjL9X4LQ+vZYOIvwxQTfn5veBHo610JnKCMPvE94Dzx0Y
X-Google-Smtp-Source: AGHT+IGTjdGUI8wshiTR53oaMojLuIFxdDZg5ObeOYIG80t0XE2ComuiYEk5vxy6mSYM3jknwUl1Cw==
X-Received: by 2002:a05:600c:3144:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44ffbf6531fmr13824805e9.9.1748461496685;
        Wed, 28 May 2025 12:44:56 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc51579sm248585e9.25.2025.05.28.12.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: versaclock7: Constify regmap_range_cfg array
Date: Wed, 28 May 2025 21:44:54 +0200
Message-ID: <20250528194453.567324-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=742; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=JaLEcoIDX2MnUtAyvebRh+z+dgc4MZeERa7wRQutoC4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2e1OuA/hD1sexRDdgHQfOr8fvV4yISai3Omo
 5FuI/hgJuyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdntQAKCRDBN2bmhouD
 1+KgEACGWyYwtIs64wNSWDXfZtTqr29hchYQvDpa1nH847O6l3z+rSeoRJmqMC0THPLosjcl7DI
 YGjzTI+dOhcN3XrzJ0g6u5U46zOeoErkPJRIqm+DNUPRte5Oyiae5y8FkfV0hNRs4eSv8BWEeYc
 bqR0C+VMXdHcvzz8ZPsJV7apRpdjVnOBN+axVdUd0gE2X7u0q5DtHruPaTmbA1DjehAbOFUqKht
 RSZej9qg1Vgl3LqdrsGtsCnO7FbIkb1ntzMG/oxhsPj/C436c/kRsU9RXaEdy6gM5cKYJIMi6ZN
 PZe0NRiG/e8Z6hUHfjfdI46hDp57g7vk40UhhUa0u20QKT3aYIBx+pJs+3AmsrRNJT8OOgpqwm8
 ckoMOiQaM3e7kJFrvAaUSGTbn4sDXXn146N9gvcs/emjmrDFpkjpHHYP7rXGgiCOXc3+XBoILJF
 MzhCljsCCoteCqjJd85hEYpR1QUnT8xlnkMpC6Uz0YEH4xx0PSfkSGrdOQAT0eLKRZKIy+37Q6H
 YG7j9qpQ3cKnmtpQ35BA3HlbiB1nkiDA1NIbYJOsWQUARSHr50QqPCb1gQeZ6sbApBZUHoFh9kk
 odQASaDZsTznAkyVzPytiZ4IgYAOX4KNE65j+z1C0C17oR5wkttwB7ZmAteOZQK+fjz7xTGWiCm mXMswtzr890iFnQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static 'struct regmap_range_cfg' array is not modified so can be changed
to const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/clk-versaclock7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index f323263e32c3..483285b30c13 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1257,7 +1257,7 @@ static const struct vc7_chip_info vc7_rc21008a_info = {
 	.num_outputs = 8,
 };
 
-static struct regmap_range_cfg vc7_range_cfg[] = {
+static const struct regmap_range_cfg vc7_range_cfg[] = {
 {
 	.range_min = 0,
 	.range_max = VC7_MAX_REG,
-- 
2.45.2

