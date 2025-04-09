Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D920218EBE
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=jPVWAIJQWpHYRT8S7+Y6by6qZ0fd2joJX6LHiP3iz3hqQRi2fT86vTGCnOHyC0/on6MoCkvxIetnfkrtk2DpEi2QF0WLNtg7Agtk49jhuyr+mpeqBOqkYXm8HuO3TsWzpAzzZy+UDyGEu5v7u0K5E72MIvAsBdOaLU1HKm4KtvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=3Me2u0NhSmvUHUm87c5Lew65uoJBRoaotojNz31DdRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNi0IbRoA8AEYLmV2hxw6dsBYdnD8wD1BfPN5ygJu67trxEUIRn3w2/W+O8id0nG8NOzr3yyd12bITlibACmJ+lqKhTFrtv0aVC8y4UWdTr/bHJ1Gvs0CJ/xLWucLNIQKVrXZxSvcG8NxkK6KivUx1YvAeDjDL4kBlMYNGBg5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfrGGi1L; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfrGGi1L"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so16509066b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=HfrGGi1Lp8vA1fc1S9V6LqqFdvvCXMBnAOE3R5cPH6fYJFe9V+5Q8AUA5kpr2kyAri
         2h6zgKTC+Ka50zQWTkQkU2SrAXjgwLHCzzviTX6AH+AZ4TmlCV4P7IWZiJXUILep/D42
         XqVvrtkEm3M7CDJm0bt+s2ETpetoz53BauLqhveCGTeLCx7dRaiGtR9eSQH8+OLqxv1J
         CL3xZb/mHz1K60wXG1sZ4eUgRYJTcfoslP5cIaE1+srpnhYMXsuNtFumIZBhZPhimjlm
         nfNCX+NkQ2qeJVrgW3yVaikbWdoA4cbniArOFzS/hOepywdoMrszHzLIhR31EC1cZRW/
         TWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=abGtxPnDMWYwNrt+lr4BXNlgA16CayZwngSdT5U5U7SRMDrSRB0z3+5gD5DiKheAKR
         +IwYNjw5q4y24j3Y1QfYYCX6oFE8O8gjvOjRcurfOgI1+JUuBS2rq6OfHTU70lZpwrKU
         DeZ87hQzyLrwY6Joh0Ft5FJFJx4btYvJjdYvTTufMFNCa3cy70zigGQWgFlgeXkWFwv9
         0RpGLZciaZoVR3/sgY3iSrU2AVx7O+lHnlEKyhQYWTaSMecNTB+Iv1J6wFcWCRbRXE3/
         E4mohqMtWiKWXIfIlYdKHIEGiNA7V1aNxJN4NuyLdyfo34MsDXxF9JndiEKzP80TvPAn
         /j6A==
X-Forwarded-Encrypted: i=1; AJvYcCWcZk5lpogYO7UScM6cN7IQihdyUp8uUA1OJt1y3bnNkGwSmBnsl0d/arkvRkzS6ozZuaT7KrZsA5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz799se5MRoCBKF9gT7Lkwij+SXkn9gaoaNYfJde1LQzSb7OhEE
	JR+2KxsIDNgBclY2oRI6b5H1lJDc3Pfy0PQSHhVrv0pR92EEF74WIYU1VAY8Rrw=
X-Gm-Gg: ASbGncsyatG5uJeQFdCBAgPTRKfcVDzylpi8TO7IqkZZipVN3Zx97qQZBjSy3n5KdCF
	IZssZI/cn8opbnpHYpZ4wSXpt6BfCf/ST/FvgxzTAZP5ZB+hqf7qccc4EXGp1NnjzwseIXaj5w2
	ghpyxBLr//wvapWzLNtSovFqUQsumsA0JJ48Kxo6OjEBwtFDrYdr/o+34CID83X72LJMnHMGk9L
	UcSp6lGqNYMnogZWiyv95vCjzjDaIALWAz1OLu9mbnuzARO+he/qmGShqHpRkmGbkglX/I749pD
	foL549EQUZNDn2xXitEBjIj3I5UO0y8gp1y7JrP1tonxQwiKQMehFsqvdmO9pP55M1qci31RQl0
	fLkMf3pNGICz5V3oo4qy70v3/NHTTmbMFArgkYw==
X-Google-Smtp-Source: AGHT+IFGuRopXUZBocg06rjmD3ZHp+XWR7FsT1M8CRyC7YTvs4QmmNCB4EgixbVEA8gphf+u1JLXHA==
X-Received: by 2002:a17:907:3f89:b0:aca:a539:be04 with SMTP id a640c23a62f3a-acabd1231fdmr10950466b.4.1744231059836;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:41 +0100
Subject: [PATCH v4 20/32] mfd: sec-common: Use sizeof(*var), not
 sizeof(struct type_of_var)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-20-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog

