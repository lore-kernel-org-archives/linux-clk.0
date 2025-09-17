Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828022F362B
	for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119984; cv=none; b=bwnFunW1+DEBaDLnEzPUWlJ6oNYqauO5fjttm8NnP5MZKLA65cZOt1e2OLkidyndaCuDQ/Wk/mkKYgKfh0qy8xSzPWL++cWnh3BJa5W+q2jcBr8fC1ebxSCxuTf0d0ya+FsoNxwsfnNXlWsjaCvaeTFRvRgq1OQI3b9bycS6pWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119984; c=relaxed/simple;
	bh=DC3rkPlmT4PS3kYRl8k4hFThmj/MELiF/Zcpwvs0sjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qv0QcVhJ/h/wTzXEqF7xc/c7hXx9z+mtsjZm1yIV2wvlzcFqqiaK4YXlSb/7ZJj02QriVIqTk1R5rtW184sO6bN5JaKMRrY3sUt8J0egQRYZL1QfSvBzLPbin7FzGDfsr0W37rvsntWd2q1QHAVtWoeppfnM/Y1kH7rH6EWPSpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfyTGgYl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfyTGgYl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso8498719a12.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Sep 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119981; x=1758724781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=GfyTGgYl9mykyvs0ekcBz8gtwf442OqETMtCyXqL2zt5d2N7as164YX2f0yFXtwYAc
         U8O1MEpheD4Aqgr+hFhSa757VtgLb/QO5dWaDICDILCaqvCkcQWN38giaXam//hhKMt1
         A3+95Q0P/hj+nzIjIl7Mfn9dQVl0fOO1ibtRaC7VAHAHUClvxtmtFgzGbLuWh9Cy3Ak2
         h3qSjY+TVwFyiMrxbOQqwUxtW7td3/cFpti2ebZobmJM22XZtZN8SDYyh1FBNy8tgjtN
         iKVz+ZsTHv7qipwgT1Cr0a4Fq/hBrPMbWUh8xQJBCtFn8KR0kEP2PZ8ymZgF++L1tvTI
         /i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119981; x=1758724781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=FIBQsTbT25qXWy52msOrX31A6LjT0Ji2AJURYtB8n180mR+jtF/+of2KvOcj0Y6JWH
         t27HFxqFN53bFotsArEl71/jyCinZsflhowrp5byvQnM6FNEkbrpEZdkoAuwSEhmQaBU
         JlFZr87GXYJo1TuN86kSngF9Cu31BakRbvkZ10oQozj7UCk7d+1Rn23JDGAGR8f+rYSi
         hGbimq5HlQgaE+m0m2kzdJPJnbss+/jCF7MdhGj0LSuQkFzw3iBc7xd8KpoYYowWbtos
         cnWl5Rd1sjcrDXgnaJ4MoN/yV/vwQmN9KCDda1diw9eEKsB2sIjZ6L4g91OWW2r6kfwy
         LOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWasgFuTone2XLXXok+nJnq2MwyQfQ4UQV2yDj0pNEH77n+YEmEE80LY7PWVd4JRpMD7qxiIvAPLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjCAdG+TfFq0oQD4UzY8MIf0BRA5mBTlTrD+0A0nPa54J7uH6
	hJrPZFe9RfNScIjSRJamP15glD9tVWYVuZbSb8ko9AdEzlwTf3+9UZfO7l2kvJ0I6Ac=
X-Gm-Gg: ASbGncuKF6jfCKho/Z7i+YyJedjDPoJ1RPl6Tz8Zi55GqB0ZX32YVWwJAjgHOu5sLtm
	bkVSHP3R2ot9RPw0P+r7mFJmAhG7ptKXXmBZcMH53/+0TQnNXX4ek+R0oXfIkm9riIAAbbXyy7L
	mknHkWnQh6LFvH0Q8VTkAj+x/iSJFoc0zNz3kLsuvlF5dDYjpUsSvyvPTpQiI/AxszCXzVGclRq
	pcYg4dEqUTWFTSks0h+IYnmTrW3fSCHdTF/sO9Zv7SofC6lvOjzM65oA9psueKHW7bFtoX8Sv5E
	/shdc7uJ7H3imdSuLLJR0ZKTCCQSsNMHsALCQGK1V6TWjSExKyAxaqH8zhzzTA+Xv5jsftrrBqS
	MoufCCh8dts+YTIEcbWV/kEAAzXTX5O3GGLd2vPldF6yLUcLproYvb9siM+U7hmSbr6WDSisVBj
	JcZlEaodxCISYz
X-Google-Smtp-Source: AGHT+IFXXbiZNTejLfG2Ic/gjctCmfZhP6Kg2iU0trw8lOnTpDVinvHQd4P0uv0W+EXh929oDvH+pQ==
X-Received: by 2002:a05:6402:42ca:b0:62f:4dbd:9b6 with SMTP id 4fb4d7f45d1cf-62f83a3c5e6mr2581137a12.14.1758119980663;
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Sep 2025 15:39:32 +0100
Subject: [PATCH RESEND v5 1/2] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-s2mpg10-v5-1-9f9c9c4a44d9@linaro.org>
References: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
In-Reply-To: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.51.0.384.g4c02a37b29-goog

