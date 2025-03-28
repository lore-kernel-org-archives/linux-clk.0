Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493EB213221
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168684; cv=none; b=c2gPcT8cyxojyVwK5hk6lHqUSdZeKElvldJsII61IC+EdeXhcXIrnw/o5Wr6yfdcx0JYyniYTDEkry7SQ38Ck73DihHmCXnTQtnOMWkKiAhEthRnpdgQzN41vc1edEWBIaBZ1Zoo26xXQnGG1DscM1w5OxY9tONCyqBf1OjwnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168684; c=relaxed/simple;
	bh=X823p7d8VeG19dJIhYLsSWA3HtswWk7j0eIGd+yYPcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKyHwB6D+kJiC/pzgfOmLX91fl0b85zDnq7+R4VxPeUlG1I5Ifbz+rZJdp/oH2F2AfXEngli+hPMS9lHYqWjaXx6IBG4Zt/u4FbHau5pTUMaBDMi2uA7PvOxlaHD6LlL2yGm8aeZI1evcZxLBJcKC5qhsK6HmCTo2n+dP2bKjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lU8nw+eG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lU8nw+eG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3160502a12.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=lU8nw+eGPn8sYUYY8pW8wrAmszaAHu9XAx8uMAYBv39XNsOUH++MflwfrtZxjxPdGl
         W8ZiBJtB61yW1SaHlo3br8niEBunD35aSOTcXYFAoD4x1m8zdzyiYQa7NnZwoOVxp8Zg
         0/62ToUJ9cxBM9EWRCGgfCVefe5tuJ4WmRaHq30aMwpeKjfcTP9UbKMnKRwypr+HDWOR
         6sDVPFPgc8P5pqvjiztX5EykPZN6AqDwT/Z4n6xhbuzPTnNqpML7mIrsze4pZgX1+6UQ
         PkMrUdpSwyYIhaiT5/utbbcL7EqFDn6K/nAg6hVkBXWCCxeF1sv96r1anMWYTd8Vy8JE
         6AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TCn0wifCdb3UC3ucEx7Zkhg1UJ6ww+TPiSGCbm38yQ=;
        b=beBja2G5gvlqDb4giPYfa6nmMBfouN++yJ0L4Yg543LdVIfDtoVydOdkmZ6311ip4k
         UuNhzsTgo4WwVEFRrwVtqZbsrhIf6TfzlMUMd5sPUqlw8cy3Zwyz+PUEIRTObtLjGspt
         HRG9NSS/4yUYq/nwPMlcv+bgPQZvkuLUof7xp1Ff26qESAs78qOGXVaP+SHmDLzWZGK2
         TlSmlx6bb2JjZ8tEd2gEys6e8z9L/zq30HVKN2r4EBhPfJmTQ/h1U+ZkGqF+LT9cLcqd
         xaPF/Vf04+vkLXABJzKhkb+NgZtSktwgHH68IXKYjFa2JTtvaDKr81sVpYc6wVQZduYL
         izhg==
X-Forwarded-Encrypted: i=1; AJvYcCUx9HunsR7BUzAmNkJcMdF/5Yga0huFeYFlxuYMBu8EBxmKblxoEJoPLZsOrh6woYfPNTO+e3C2NBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIKm0pETETBEjvstMRygsK9Efx322GkGiaqAdibia4SJxoDyzz
	hH+FBfsnSCcJpwePpelZDJ6hgBCiEY7P5hbnmJh1PrAKIMFnVQCk6CX4A/d+2eU=
X-Gm-Gg: ASbGncvJ1KCdrEmK158hFfWF5YkY34o5g3qSZ+D3AQ0dXhNl2NBTbFu9alf99riHXwy
	poxlBCsXm2XqMxvc8YQU5LYux4xyL7ZZfl4GjiCFNhBnf+3tfOb9ToYWdx7/gHBPrVyhSHMPArV
	fhW+LLB12lU3K8emMMR24fVpPl2p1c3wjuHtVbB9hV2tgY7OhOpBjHpG7ky9pM5FOTtXzwQgton
	V7Ow0trkqtRF7GKZs22DgOUk3FoDlHftNcQeYILDXxdgu/zGS5G5Ewarr2n2KeyNu+h/hWlyUH9
	PZEibPcVfdFZkSPc42Mzx0mCAZNsgqWf0BCboJqE0i/shp30qA7NXR0UIdCnAtBlKIuEeEKXEo+
	5k2S/PYc8cGTq7SqfYN7pj7xux9+f
X-Google-Smtp-Source: AGHT+IH4AkvKS9gIeAEdf4WO0mRjBtbxCllwxmJHe2U/y4p8yWBXxd7byUvVNmfoRgEJ54AQL4uegA==
X-Received: by 2002:a05:6402:1d4a:b0:5e5:dea5:3eb2 with SMTP id 4fb4d7f45d1cf-5ed8e388e5emr8163708a12.11.1743168669663;
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:15 +0000
Subject: [PATCH v2 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-29-b54dee33fb6b@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.472.ge94155a9ec-goog

