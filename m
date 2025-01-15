Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214D1DB130
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929162; cv=none; b=lqerlvTQvhRl495vcmI2pbkc8X0tJmlSQSdfDzzNTbCH28Azpzw4Gv6RgMkk/OZy63n/NZ1fBSvKrgC4EeabqWjFrX/sKbuJ+J3uDOh7NegruWB2nsVHhoGwYdTzbbn/m2DBECuVuRvTiR8TG/bVDgnWm83xE3VGWC9/VJ3Mrr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929162; c=relaxed/simple;
	bh=L3zZ4BNsqb26qdvASVk9aWkYCLIaBAydUIoTRfYLIDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rw/X52ij4CMNDeKCJL3ffbIWW/rdK9peDzKOWhZqBLsNksRtXBD9Hn9svFevg5MUZtxBrIBS9oT/5pHw/3UVH7oStlm5LInK6+3v+/JV+PR5uBgPjlI995sJBTxta2/oPrNhuSYiOYSb15jOmtmmwqubwwzjlXav+XZBuWSdA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJOlEMOE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJOlEMOE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso6619095e9.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 00:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736929159; x=1737533959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMktWQtgBLQ8cdlCbA+kTSiSpZHtnTanW9u8Zhs7GQc=;
        b=nJOlEMOESpUVftXuEfwjyHZJJwDXzEvtXJ3Xw46/hfRq7y+VQWRPjtEUTZyo3HhNuW
         CpLJXHlXzGxVi0ifGreLuOy7uUV8RIrgXPckM5XISsUukyjTYkmwnAmUp2C69zkPDX6l
         pbvMfg8xaRRGs5Z5jjhkJ136gK6f/Lyuu//8ZrmjkHwLCrQqu86WOIq189wvtS4rZNBl
         MSrm9qcSCaqpvF/+4DSVbTz9e0GpE6/z+ZJVQ0vGtslkbJSgndr5zth6YLmJWwzsz4RQ
         DWAPPhV/4nD33s4hShvzOPwu0OvM77HFBv/YDOhDHSVnQfMyD04Sjc2A9JCBTu+CRMvZ
         vI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929159; x=1737533959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMktWQtgBLQ8cdlCbA+kTSiSpZHtnTanW9u8Zhs7GQc=;
        b=fbED+CAPodXh89xglNf0IRague4qug3Ntsl82qJq7OM2mvM2Fh1hJMaV2K02RvjM8h
         DUycEeyYaBQQ8N/LMYIFVgxaoVOKykuZiUljo3NGsZnhGK7H+5JrTP1RraQzyZ1pJN3Z
         sfN9yTpu8SK2eHEC/s4FG7c7rhdbe5sxauEPWtcbO+FY4oNQGmU8UxOo+YYa5JniR56+
         hWEfH4Hw0vMGZZwlqWZJxFNDeUD7KhDneMOAnPp9WnK5588m+1IRTFvZcWdkMY+EWPxr
         SdEyARCy1Y1ULjqT/WmOoGPLk992o6zdTHuWUPQUTZ9Wrepx+Or/Hk3sfs363onOAmOr
         tf9w==
X-Forwarded-Encrypted: i=1; AJvYcCXII2KbDKUlsW/TL+HdXJTll1r9buFnb60zT+XcUUQbT9zw90UkGH4JS/F5PBc5kDILYdCDe4e67Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn+novlRdu35L6b1hZoDTfVx+RbhQsGWWI/csvmT82i8l3e0Jc
	olxr38twpaxQlCIQSXLQoNugDaZ18kMp4mUF8KqD1qSQSKez3B7a+oGq2pCR9vw=
X-Gm-Gg: ASbGncsYa7e82yKi6bt8SQW4g0XE73eOkSLAwULSoqr0YC/pfpHbpojwpcaKeUqhmFp
	VWl0hzxXU/9VZSk4EZhGNAgdIL2l87pAICzXgf+l+FUiSXxvxAU2FHq7DPim2q6HGloy3UvrMH8
	x4zTK7Wrxv0lXE1F8BNjWq90ne9KBcmjc0ndf+sQ3R/5YTWxdMQUKv7x9tf6WkXNvLiwj3+NrIo
	9pSfc4wTA2JLeDhwymgDQqrsRivNjCT2E66cZoq1g7rCgtt3lwTgGaalxFA4omloaNIEyY=
X-Google-Smtp-Source: AGHT+IH82dvQPl7AJYMIZ5/7ubtM6u7ezR7aRuptO7pWHIlRw76Tgzx6Wrm4+Ge6XRuEgEY/v3wdyA==
X-Received: by 2002:a05:600c:4fd6:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-436e25603fdmr88744395e9.0.1736929158705;
        Wed, 15 Jan 2025 00:19:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ab449sm14589755e9.10.2025.01.15.00.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:19:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
Date: Wed, 15 Jan 2025 09:19:14 +0100
Message-ID: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
use reversed check for SXTALO.

Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2HP/
Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/clk-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index f3a73ac5a1b9..fc0aeb4247f2 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -117,7 +117,7 @@ static void __init nomadik_src_init(void)
 
 	val = readl(src_base + SRC_XTALCR);
 	pr_info("SXTALO is %s\n",
-		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
+		str_disabled_enabled(val & SRC_XTALCR_SXTALDIS));
 	pr_info("MXTAL is %s\n",
 		str_enabled_disabled(val & SRC_XTALCR_MXTALSTAT));
 	if (of_property_read_bool(np, "disable-sxtalo")) {
-- 
2.43.0

