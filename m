Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC7212B18
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231056; cv=none; b=DslxOOIf+z0DfNaZfw4/D3tZSNjPUdRp1SEr8RCFsEIxRltoaTFRz8xvezHcar1ERck0wjYkrjFuIkKGgfOsLdx4/HC3keETvW21nQvuNrAoWu6gUIyGx/wTrOzRtzJwexhZZA9OHtpV37lmSXCPJEOs6BGUGJk6MUO+1P7IyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231056; c=relaxed/simple;
	bh=CvZ4fbl95FAJENkF4NbrlkZJArtMF1C5hRtEryeGvps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjfTK+yQ8ioNgAYlmkCF6NAM7Hd7lG85jEcaEVyLH9qWlxdDwOJbSwiAbIFt3+jRrCdWC5Uzvq+YnW/y1gT8Pz3DpkRlnd9138ViasePEAJHye5C6XHOE/kmyHn8lh/ucZLeagmJyrsbhWL5LedEAH9EAqyvv6A/b5uBr1sc9nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaJX60Vq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaJX60Vq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso26347766b.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=CaJX60VqANMuDt6gWj1Q28EwTjqjYiWqd01dW8wrO0ppMehSPbWK+u3tbozLFN6pld
         5uoL6vXhA05bcKKAz21fXk2tT1swrqGAuFrNDDwJ4qx2F2Er4Etbe35rk8oPKKZgivVb
         TFkHXV2SJVUTO3tkYS4yrmbaOU3teZWRLFvHfeNlskypyVwL7l3isRs5oyEP8U8ulbr8
         ouwfHBSNqs1yFJmYaF93myVfTMFZLHeBlOAjhb+oOfcyTZleWOa+xqvICYZK0/OqlRt1
         toqCj1L9q7aWagiNSBdqn+LDa0pwoMN/8Ut3Du9UnVsSlLbWJlRN/6TT95FrjwcNyrPd
         RvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReTGoMS2vXkEoQxUG9mhQKtXUX9UxWUCToSWrUrmlXA=;
        b=pIX39e1TBn45aDVVTwmyUXiP5Rq9aKpbMuzVb44IzbBmQPlkZ2Un6ioAncKVbxF4GX
         CbcMuU9KVIIZq8uYSfahJZcVq01djzH8DCbDy/KtSYGk68e4C9Ej41ZoBT86QhbfW5B8
         sr1DCDHDhdonugwoUHDU5BNHQOoTblmjvGpFRnR/4otXaYjrAyEQcCJCS2Q4ABLvikDH
         LdSpp6FFLuXrVwoV5OwOgV5NEjA5yJ90svQ5Fh/x4GNX//7djBVxqI7fn2cdpwQvllm1
         Ucr3q52L332+l0DQ1a5HBLmh3TwT1MjUaAkpKnUinDsJnvYFdKtj0ZDvXjybGhf9GH2b
         UcAw==
X-Forwarded-Encrypted: i=1; AJvYcCUAJ6Af7yisuvpt4DrGqjv6ZaQRtbG1U3NbjsLZ55o1QL2TMiRqM74K8pCbR1q0W3NQ3XcHihEiWuA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6U5tP2vskVI/+J8oBU97bvCghyx4l36b0YxXzJsm7EZK/STUr
	ZWPNF2MKwcJ6A20FYQBJkBmcxLEawrRZ0uuQbqk5O19xF8pnTkuZZMG5MqLW2uY=
X-Gm-Gg: ASbGncsqtllFqoqkN2UtxWobnipQBQKQ0X7LXOa8qSf2emyVO2VTPUax9mbaQIBSXx6
	kalNQXZO4saQ7lHAg81+gpQusOrGI1MSR7iL45+k7hF1FvixOMNKP1NFYOYiM0eEu4JM0NXgSxA
	kSqbhQngkrTua9Q7KnaW4tGRPzxpb/w9xg6Je4e3LYHhI/CvLld4OysK3Z8LcB1kohEMRulrndu
	gEDxVZi0X4aCr1OKtbgqLMfD6c7VtYiSezW60Xj2ktolw5JsMRn9DvEvC1T5DcDt8LTP4XS1L/H
	svz7coiI9ufsVFVr3+EVLeIXxyEPmRANqCJ70TBB9dp2j1xVrGuVs6QE5/upVZR8lTvawfFO1P4
	mMm5aM1Kq2eqHawiXxcYp4yUB+34=
X-Google-Smtp-Source: AGHT+IEBlNxVh7eTUcIx8bavLvlvqPUje0i7F4RzY9BEv4lu5kBKWoWYEurWTbTU+YYGqwf664Lh9g==
X-Received: by 2002:a17:906:4fd4:b0:aca:9a61:c5cc with SMTP id a640c23a62f3a-acabd3c3b96mr7238466b.43.1744231050538;
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:23 +0100
Subject: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog

