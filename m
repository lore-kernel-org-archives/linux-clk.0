Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE982EDD76
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388707; cv=none; b=Ngzg1mp2uPmNcg4PUhqFT0IW6REWc72exNPNZqe0Rzq49w7bUtnN/Cvp8GeFEWOS4Q5hy4zVjOl6a1yzMv3+uDITUhl4Kg7uQ93VRobTy/TjYYy5s4uXXNKn2Rgl27dimQlonj+RbMzQ0d42/X6MkNOAIuBEupfChB2WwCypZLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388707; c=relaxed/simple;
	bh=+oCGKuWrWlzzBKoMEL3/FfWoYnYmDhmOoA3Dn2HMS1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TT89sMliYEUW2AbTtPxUU5AS0l38uZMdi/0CUd6m9dF23CpT2xguc2ICWbT/XJyKOmaVJW3jidQ4th9xauHSMRxphgPqb+MBbC45BYNU2rd84lgo1kDcANPC0lrZWeBtDkH0MPCy4XelJqmG7BAGPVIP9VgIUNY31f91VCjx47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whd88L0g; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whd88L0g"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e52279279so33100525e9.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388704; x=1760993504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=whd88L0gxlkCJEHNSMRw0rggeUWlkVWWFyk/RaqoqV8Z/DNANWLGEXXAqeJVl8Cw/a
         CwRMEUR9k3ma9WJK7Ro04HuNuzWtaLW8Wa+Ac/qQKfTYbp6xpuNdMrLmSwp/6qMysT0G
         a6fpVqDumpvratMKokWtmdoTI6pevaZ6XhkBHHV9JlX9vCfgOcD6PfpVVPXL4Ck3AXSy
         TsKfHP7tcSlVAEW/e6qVloXRMBUhwKkM71Wl9VhoO9fkSlK5Gw8HZwcePwHUAe99Hp81
         ARG9Ue5IGQm1MANE7ia/69uYiCfINgd+eJC6CpAmwU+lqWpGhnL4pEE7nCaoVDorpNrL
         BV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388704; x=1760993504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyAHXZfiSiZUnBesnTj/zEW972y8t9X4DG0As5mUToM=;
        b=pSSc7fjLbpquLg6CFaoJirmadxZViPOajbkfm4Y04xL1NZkaqK9mzcUIhnvvyVopup
         Lzz5/bwbLVD1KORqG11kjU/cmFXTdTXknEI5TF8Sq9h7O6vzvL5I4y7JnJWJqDLIDxEg
         /aDi/k5Fz9dj0eE+Yvsui3s8dOxXzkCFKHFeZCeZyIPi6XwNNReZXXEHc80s6KYo8VEK
         Q8TaYdnog++gGe/GsuehNJiPjYmHOEEdDl9YiMHBNsRM8dl4c61gegytSYwexp3urp9a
         xdYvUE39dfL+Alc1z+JCQ5yeVEBC1gagN9c81wHCJ1U1RokpDUAMbyRgHtPxDGxQPFJZ
         lAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwFB2CZ303JxrZ3Eeg7VoRPq3IZU7kRb+nc0w9Twrys2/JjafzSGzQ4Ov5qBAYwKh6Ul1GMJtdx1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxF99LUu1sy0vVj8UQ9QNQilqe97gmktGQkrR1nhrRBGfyua6
	Su2YJyeOJdj3njFDXFx1hXuBJbLI2NxnQAkDTTfzFNPgA7soxMF4nebYKbj6QeVu7BfKCar1ODG
	pMjlg
X-Gm-Gg: ASbGncvKzIoGH1kaMqggwAtyL1m6Z8Km+OoC+Sziz0BYCLDuFXr+zgC528a5AfEnCKI
	5P1QiDv4Ppt4QZP+ibhzTtZ3glxOuJn4Q7/4BKIVhYOOh0J4oOCzJT52YazmrWnBXSAtfH49IEZ
	UJi6/9fZQracgBopHEY8u7ZYixrPmZdy7BrajkzSAj+rqtpQCHyZH/sWEO0yg3LJr8w3ysDSW5q
	vwertOvimhRYgQqJfQed9eJ+r9SiWxBXxbRybohnD+KL19YowOeugg1O4xy9IGItm1+WabyDfpJ
	jbWknQo/I/3nSq8vuLHAYu3M1HgcLEo0zyIyqYnXUDDHrbDDWYaIohJX5gfc316JK1K0l7biVqI
	itA/Y1eWXXXPn4BWqK2DVeuETg2fhkMdzTtvZyixDUCz3DH2CAHC5Ob49hiDpCt7stcLOZKm029
	8uXHFNZoGju7b9sualiy++
X-Google-Smtp-Source: AGHT+IGM/ohxNTkB5I5MkU/rwu4FNgrucoZDaWYhj1yomWR4i7pKzGV277cj7BDpJ/M4YUeEMDupkg==
X-Received: by 2002:a05:600c:4752:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-46fa9a9f05emr144983335e9.11.1760388703969;
        Mon, 13 Oct 2025 13:51:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:30 +0100
Subject: [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101
 hsi0 and misc compatibles
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+oCGKuWrWlzzBKoMEL3/FfWoYnYmDhmOoA3Dn2HMS1M=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZX52tjaL/uhAfhCWfI8+Pih5EXQZpOFieP4
 jF2DKC4+SmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mVwAKCRDO6LjWAjRy
 uksXD/9TEH4aYwfIIwWKepmKdYexuyHJ3CBlsgHDqQplGtpixAO+QJV8YjxA1Yz2onhlSyDIReF
 LJ8S+5U97RrsWGDfLSRYIhgqfg+QM5ZJuC0GigZTPmh16qtd/jgr1tMsVCp71ymyVAXkKfJS6iT
 FhpOs2hM1ji3uqQNRTrm0w7k8Alh3lzTnoLkCdfy5a8YE0famciNH6ejpx+oyp+sC0QEuTDJtlS
 KsnfpNGv6obmQKx3DnR4Q4WIZhN4dlEraL4VwKfgmXUqRvujLeDPEvNVQumFNusyQD7pAw8leKX
 OiNpSkvLKtnq0X97+BX8NOUo1LSxieGNLpspBQuqZ+Zxeh+xZXiieXLU/A5I5zuGK0R0ZEUR+/O
 PSvAq6gPM2ZZf0mLZDxbj86nxtgspkfB7ViGWTzZzuMu0Wjbg3lD6YHDi0wJfO/ZQqD01UmARkG
 tFp/+8W9gykbIzOkxBqp06LeHQ8YLfP0EoKGNy/DVUDFx5O12In7qt86z7He7iYx1ExOvOglm0g
 u6XNjHSbxlttVpjOzgx7RgjmYdUhexg/KWG3CzZERx3mNqddVFJCF10z2se9vovsK7oeF+iE3ET
 b7xtbfB2zSJCEFqoqbUgeGmr+0X4PoyQC5bZ1+WAQ1efzxidhCoyDxgvHaiCigKIwiPz8BOqHJQ
 2oG8XmMM35so5rQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..289406fb586e1a8a9eccb8eb781f159fd5b9d6eb 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,7 +15,9 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos2200-cmgp-sysreg
@@ -83,7 +85,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi0-sysreg
               - google,gs101-hsi2-sysreg
+              - google,gs101-misc-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg

-- 
2.51.0.760.g7b8bcc2412-goog

