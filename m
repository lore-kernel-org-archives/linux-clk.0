Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8F6137776
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655487; cv=none; b=GtAFBEYW+i8+96MgnLNMXwwt3pUfL2yHvLsYTcfslIQA0LGyPMd62idTEc+UfddcYqSBY3vEmsADVNSoW77AR7TS41Rd0D/p0p0btdSBurbz6dy/zKmpRrS4a8JX99IiOfo6lL1ZVIei/Oj41JJigXDMD7VEQCh8oJ4hFlTA2Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655487; c=relaxed/simple;
	bh=A7bmaOp8eNBMv4uH0Zm5ptUQ9zszU0WrOJ/3GUsMV2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8Qx8NNXvaYLL6I7y0C96spf44BTMjSmEXHaCLJs1z4Qg62sPf85G8P95lzY/1Uwg6TzcQ6LQT/8XfruMb9qKK8Unbls8qtMW1tb3Mx81xYIKRcGp/vOWbe09HRKUHhnnnsxTWIjSGZF+g74d5v5HrkFoX5wvplJDVURm6ttP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dgi0iHWv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dgi0iHWv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280772333eso6112585e9.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Aug 2024 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724655484; x=1725260284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OXqDaFYDX6eij+aloMnDmAMQebwmuADwVGxp987uiM=;
        b=Dgi0iHWvH0UTKz46ai2FezP0i79LOQXFKapckQZQ/ZannyXOyvRFp5feDtDPnqMyIs
         jeJbXq1Q3D0O8nsp3E/WJwN0VdzPZEvjbUMHdtIjF4xn7cNivSl11S1oi5eDA1ejy0kp
         tkJqfOQeWgZ72Irn5ZGHwvyzc8J+u8+cdrmXdlatTX4gheoMuR81kxq7uZPGODYwyRN9
         n10KDzp+nT2eifkqIUYaITjue1mS6PJ0NyOmPQDEf2RMhYW0/PBZIpctDZdWUDZXKfmQ
         S8TESAHg7VctCrr3YK7D2wHME96YXLqTn5N0N+MWGRSHP8Eurg5SWV8cAgYyA1B5RtbU
         Dd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724655484; x=1725260284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OXqDaFYDX6eij+aloMnDmAMQebwmuADwVGxp987uiM=;
        b=A03yfDvjQ2ZPXJdWpoNn4TuLzJLTm02r6Pt06HxGVKhXPaDVz1z60MIjR6LC3uUHiF
         yW/ZzmZvWnSPsopvKbVs9a25rPRbuGrY1l8c/OfY9WDOGXsLtLPPiSAqv/DBzqulPxVc
         7guW8Lj3ZFDjL5wyJt5hQ+cj7upr3F1SqUnxXDSf5js7euYHImi2lAD7Teq5otPBMArZ
         4PsNDkxLDEcNSR4jPlq9dsNkv+Uer1sKRjEy71TWbLAZs6N+bXAP4aM77MxHhcQMulW+
         2X+OX2LkVxdMW7orubh6P4P9GEZ5rYBMvXZx9DbRi2a+E1QitHrvukIOxji43PDuCLH3
         WFDg==
X-Forwarded-Encrypted: i=1; AJvYcCVwageZ192gdvv7jElH025hJBMxoZmXoBry5jKme4qyyyr7HuGuZUkg59SzWapkaPXTsJ14Ot5+ZX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynZHsUqlFBkN40N12p77k16dTFM6BhS6/+L1p3ufmyn+eBYJCd
	oz3M+cHb9Jr9G89Y85KvCsUzGwzMibN89a1RiOrmD8Cz4TJTee3nQpLBj9tqNjY=
X-Google-Smtp-Source: AGHT+IFuULnHBEvkm2VCfjR+BDd62hko+Z8tOCO/X7WhUVbPXPSXioD35Fd79n2jACqzxLmzIVeImA==
X-Received: by 2002:a05:600c:4445:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42acc8a55f3mr40559515e9.0.1724655484056;
        Sun, 25 Aug 2024 23:58:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abed8b91dsm181368305e9.10.2024.08.25.23.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 23:58:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: bcm: bcm53573: fix OF node leak in init
Date: Mon, 26 Aug 2024 08:58:01 +0200
Message-ID: <20240826065801.17081-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver code is leaking OF node reference from of_get_parent() in
bcm53573_ilp_init().  Usage of of_get_parent() is not needed in the
first place, because the parent node will not be freed while we are
processing given node (triggered by CLK_OF_DECLARE()).  Thus fix the
leak by accessing parent directly, instead of of_get_parent().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/bcm/clk-bcm53573-ilp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm53573-ilp.c b/drivers/clk/bcm/clk-bcm53573-ilp.c
index 84f2af736ee8..83ef41d618be 100644
--- a/drivers/clk/bcm/clk-bcm53573-ilp.c
+++ b/drivers/clk/bcm/clk-bcm53573-ilp.c
@@ -112,7 +112,7 @@ static void bcm53573_ilp_init(struct device_node *np)
 		goto err_free_ilp;
 	}
 
-	ilp->regmap = syscon_node_to_regmap(of_get_parent(np));
+	ilp->regmap = syscon_node_to_regmap(np->parent);
 	if (IS_ERR(ilp->regmap)) {
 		err = PTR_ERR(ilp->regmap);
 		goto err_free_ilp;
-- 
2.43.0

