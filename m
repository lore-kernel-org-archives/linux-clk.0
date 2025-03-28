Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF2B21ADDE
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168667; cv=none; b=dV4FTPjb6BGmcxZL6nJTJ1dHe/8vssMgYoppXvM/cbemFfuo74+uLdZ415SZDhL8Lt2ty4ATQxM0IC3GhKR76JEYH1zjj2hhCbquoRxeJtutgFtNEh8mrRtrKUaubYzVgZrg/7Ic3XwQhPDBSCQTUoXgjwccVjt/Q/DmrjF0vXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168667; c=relaxed/simple;
	bh=l1zcOTqbAXM+6Af1i6qiSSUmTQ2DiJduP75aVq1nYPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANKRxp6VolRkQ7OztFlVdeFBzUDZkAIUJvVuyjExp7Tzi99sOprFmLAnfkanYrSIMB9ACaamSgoq5alNawb3WFDkklFS6GtsBl2okX4P4Aq9dzIqoGna9V8bTCDWWyD4WT9vbv2PBnCh7CunfoZ/IF4igT2dY3nVL2+4mALUMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhmUU5BP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhmUU5BP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3460713a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=JhmUU5BPBvJeOyfDkeklAzkrzwVlKhvacXEhqq6HkJN6iZFC/69NkvY2fla2w4bGy0
         J5E1ItAYhwzZVEoX1BuKC2llkVduktlsJe2dWg0YGaSCZKjvDyq+DznybGtGcSafcPCm
         TLvCloNJ632tZq62eKfrOcozRt4tyavWo3rm3aMYupK0X66cRw5kwAzaqff/HUG/vvjn
         1vA+D6ywTG407kziUKNVcj4/tYYy6TANU234J2OJ+iFd5OzOPo559fOFi5CZNknLT0xk
         a8p5WoGdrOI+S9j+txpXDffYQZf2BkyvmA+D5JKoTfi9SB+msAoIRnL9VdkUr6lwy+aI
         koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UDpkJYTJ8+02Ga55OV2M/CiQAcpkegARGuSb5F8VZs=;
        b=gR/vGS1un2VW3MSzV+AysB+cAq5KYJnuH2nItSrktWwf5lSYyFY1+1mYZmyZKWV/6N
         O6WACR0z0yJ2FS2wh+fIVQbwxkhVIfGrzYGJXs9hFov6wpKz4m3EWF2HHvzDDYevFFzO
         NnDibXGKi3lESVl7AKWGFh4YazfEbZmjnap5IjwiGJZJ/fVPauTIs7BVqovDFA+Vv8Kg
         Tr+Iqyh5w/oskcBYHGEngmC69C2RlSQQ7aVTbRHoNUu6c1ldpXFxmIswZUZaFbVH031d
         GJf+sDaiRkH77bmHrkEGsuirw2EF3R5t48OPuIKNKnOWVHfP9h5YkULJP4sMnRwmMK6u
         bOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVhbZMnakRbQQfAqnCUsSuAEe5mPXEVwEv7JYM2JHKX+Ta8oIK13hOczRvcMvEGFdarlczalTA7Ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sO4BpmAGegFswmA0hoJ4Dpi1IlBGQrbaxv7xq9QmLY9C915t
	XyROUzZVUyTj8QBKp7tXp5antmdujL8G8AxlGTqWgcuxcR/KWnBRqNLxaInWNb4=
X-Gm-Gg: ASbGncs42GSKfvQUuoHQHzAo4rtBswj8AdolZl/E5dlsadt/ogDHEMG7lruaZ4GZ+/Z
	oeTxWQnJgqRVj28dHll2j11UenPoLF+F8OP16YPtU+nqGC7NpSAebY42FfOl1seKni/RBRO1wH+
	ucwxFgRAzcSaiS/6UpQSGgNHZZIlIC0wt5GGnKuuTcTxq32eG/cXmyN3oHGAkt3Gqp/hnF+Z1Pv
	FgzY1qyES+bP3DhXdBe65VCLwrshV+YxD3/l6OOAIgJvWfI6B+rQMLSoM406w3hQUzK0xMXso8W
	T5dm2svkf6Zak8y9LccDIeLcwTrd1ilEzMqn91wP9yge7PKBOpHM0N1jIPw+XmL64/6q5YIZ94W
	Ykxy0mC+MPTUosOOSi+1qtmlh3pCe
X-Google-Smtp-Source: AGHT+IHY77zJB2+ZvJcaGKZHiHxoVE2X4zdszR83ffWy9ORQ0cPQA29Aq9xL4S7dGRJozxmx6Qfd9w==
X-Received: by 2002:a05:6402:3554:b0:5ec:96a6:e1cd with SMTP id 4fb4d7f45d1cf-5ed8e061508mr6757044a12.2.1743168659356;
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:57 +0000
Subject: [PATCH v2 11/32] mfd: sec: fix open parenthesis alignment
 (multiple)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-11-b54dee33fb6b@linaro.org>
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

checkpatch complains about unexpected alignment issues in this file -
update the code accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* make new alignment more readable (Krzysztof)
---
 drivers/mfd/sec-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 782dec1956a5fd7bf0dbb2159f9d222ad3fea942..1a6f14dda825adeaeee1a677459c7399c144d553 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -149,9 +149,9 @@ sec_pmic_parse_dt_pdata(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
+						    "samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+						   "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 
@@ -264,8 +264,8 @@ void sec_pmic_shutdown(struct device *dev)
 		 * ignore the rest.
 		 */
 		dev_warn(sec_pmic->dev,
-			"Unsupported device %lu for manual power off\n",
-			sec_pmic->device_type);
+			 "Unsupported device %lu for manual power off\n",
+			 sec_pmic->device_type);
 		return;
 	}
 

-- 
2.49.0.472.ge94155a9ec-goog

