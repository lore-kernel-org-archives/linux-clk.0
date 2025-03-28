Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA832192E1
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168674; cv=none; b=XjdZTZv8dmsAJIjLa176oPpQItkZ5vyGE1Op7MnhdpH7pFFExskq9J+Bi0UsZEEibmmIQZIhwHN4bhVeNknhG1ZGflWxziMUG7/QZ3k7nravwqW1vWTOefTArH7sJVLqWh6satt1qXnYcCJ5K7uGESQkqBYMmIbJ3ReUk7Bjprc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168674; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW/jXBQq6OX31GFGJT8uXuZRdHOqqkaAy36ZW0q9GVpOBzgZS7Ubp+b+MBM8eeo3yHvWEwR2o5kY1RJrrf1ioxn9n2YD6VF/7QYsn56aBvdCY3mPiEN7DUk/Nuk/QFK5eFoJDQ0rzhF3U+o+X1DrddxJrHxgLQcob6BK+P2ZwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=En+/83zz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="En+/83zz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso1349583a12.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168664; x=1743773464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=En+/83zz2JnMpQOWtuk2jCDJ+XxaXrWiMelE/N8tSqAWNlQjxSxlMoVEEmE6b33Sfk
         NTdaOnhFa94eLQmjNm0kQX9LkllxVIDbU0jX95dZG3s26gd0JJk0H2UYYfLo62vvjKjf
         fnVNqpK0uxH3NSfbnQYY0Cs0UQD3VnK0PRhGQtW99BP2c0ZYhui+pddKFsu6/BbjMEJ8
         zN5/RQBoIdNDbbIDDtUR2jvqr3ZdbOGfRIpuIAf0rNr3I2aDjSfPDJgoqXvQSULs3eDe
         SHS86+6HeMQPVvrg6x0rJ2IHK5sir5Tjuqxtqg6lIo4mVJXez7M2lduvv1DNech54jG0
         6NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168664; x=1743773464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=WCAEhAj5aoRZU4hs6L7aMlp8425I+MliGitYJfTkHjHdB0AqJkiip3WOiNcMEXZZG8
         RjWcgZcxIUE81vFwVYsPvrmRucsEWNc5zYHPT3MYpULJc949lsxA6X6oWcJbxIq4B/l0
         WrMQ3ZAJ+X7zeeDjhvrMrk1idH4+tUyS9V9rhPNMQh097ACxs316OiDdh/GeoO1OSbTD
         UYjOoX5qLDmlzQrNZjdYd3xSeYW5qOssF2wlN4XX1hl336sE72pkwHvUB4g5N+ayk2w9
         oWDLgcGtHqa+CMer8ydNdUzeQUw7CTWXCHu3v1HRm/r3OgTGQTfVNZmxu6GT9s7p2oiw
         /Ifw==
X-Forwarded-Encrypted: i=1; AJvYcCWWA2GwF8ycyvZ7yYjZkW5EtJpMmS54gy2vsiTgNJw65LR/ZffQD1I7dxOaox0a+Ct6tXzkbn/e3Xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQIfF5MvkafV+KFsKK4AsZjQP2gBbaqrYxZzy+6SAl0d6eImat
	jGscRWhqqHp83yQBVDlps9OImA8X+SNOFuahTLV9XADrzWvGuEiVKamr2TbBXik=
X-Gm-Gg: ASbGncsW2HTc9U+6/yTxz9NAfieNGjUVCpAf9xja2+Sg68k1+6aRT893fvNcs0/Xhya
	acWo6aiYX4uGv8c96GMxyFTt6fqPvGTiwL0Tu4PdHneAfcNGg7hX3ziuf4yns+VFTAQrmijF0+3
	wlfAQFaX2QlyGV1hkMFD+04vETwHJBRz1u0RDuIUzpRxPEvxkW2AuAhL93CF8Fn7JVBVtYpRy3V
	9mlq/zFRNgogxwYjWMFp5PP+kUkeImEWW38KSveCcY6XWFSZnj78gt3ktda8NmaFwhFXqVU2K5g
	YzTeV/Oot3vk/nQt9I5ut+50cvWaWnMhRF+okDL5bR18KfkZ3N+SU1gUBkekcE2IdRZjOPbmKnV
	RBtfbBkTYc1UhiVevITWjVLVfiqU/
X-Google-Smtp-Source: AGHT+IH82jsJ04KqxSx2urRuI126Wc6BqmkR0wyKM63ai8QchgotV1y1Ewu8V3BijV087u2FKOXDPg==
X-Received: by 2002:a05:6402:26d0:b0:5e5:c637:b69 with SMTP id 4fb4d7f45d1cf-5ed8df6b334mr7910381a12.6.1743168664240;
        Fri, 28 Mar 2025 06:31:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:06 +0000
Subject: [PATCH v2 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-20-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog

