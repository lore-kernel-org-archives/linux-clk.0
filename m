Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFF19C558
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732885664; cv=none; b=lfQ8i9EsYk4/mCskQoyFQkLUgsXR2cEVb3q7OjEGuMapEU8sqhHthJQfRgx/Fi0yr48FwJbQHpk4oXfXJSi4MYFYeOqJw43OSQsudrv2N1v65xRCShdaC+Ih6sL+CSDxHX0lYZTEKN+DtKFbxpV9ow8YFRqS1+b6+bbSia0mWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732885664; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHxkljaKOcJEJWD8CBHvCEffwJ1ylN/1j6Ubd0qa5fmIpphJIrRI2M+cZohce5bgIm/hOHa598W2z1413bibN4Wxspu4YmRQ1/35c7U8MWLRLjkjs8/cHYyAFvHerr0NWspXtSiT8O7jfsltPwq2emh84uRl0YDm7p4ikHDLQxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R5IDfDI9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R5IDfDI9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a742481aso16801685e9.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 05:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732885661; x=1733490461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=R5IDfDI9TKVnyj6lHw+l5l7gbB1ICpTZkx/K+V6gG4UQVmrLCb/iNc1ra4GaZE9txO
         csKf2OX0dDpsciUKr84zqwTicYwS/pbfjEoDaQXfYRqTzteX65+KG7IdYwpRAjaOe6Fr
         /nyEivv971MqrUE2DJcTPDSL+A7nUF8ihYRr+yEi5yWg7P3U/M1fI7ae4WvHYm6LR6Kq
         L3T1f8fCxlWJw7ktevq7r43ujVuo+gppeTqsml0rsY2k1wnmF9Ltae9ChjAJjKziqkjK
         1UD4MdXwlun1ujaOvCOdvJaXREGXpJs2vaylwQayUAPgQPQ3BkDIw7vb/KVMdQT49lem
         1agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732885661; x=1733490461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=eZXal9aRJPjwerqsM1WVhoS9zdQPADDnN5qpXvY3Rl2p5JKlgc4ezI6lxUg90/3b23
         jTxGiC9kxp/bVg5cGH1aby9cjjv/nsdL+2hmEefoES56/CHc0vWhmMP/ZyDg8ObzFoSm
         a0y94nbJSflxPkIp0V8AMM5I0DihKdjTHuUw5Eg+iT978/b2fyo/9L625N+rH1CCWLhN
         /zV0eRXpqHacmelZRsyPamFN2YsZzNjCdEmRKRlzf3rIvplChG7y6dM3OtlMO4xc7MNP
         VjbrT0OFU5b4uM4lepBfpdhyJVMaCmWLu10ECq2OtnvhUZ7rPPj1O0wfb4PaIK8kIQRL
         ja8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiNMIRELibteK/BX9ZAWWHV0UMqga67/Sfk1N1CYmcu6oRJchGwjVu1zQ4Qe7yLSA1kuDeTFC0Grg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3iSdWVV6e4fJz04BspbkC+3LPIe2rcu4pk/ka2funfr/xrOp
	HIljFRJLU/hcVO9w22RMbBcNchHVnRnGgldohFxeJf7T3834DYnvLl1mWy7AZsIkq0TAOfYUkfL
	JuHk=
X-Gm-Gg: ASbGnctkZJ9ZGE9X40h3OEMIMuk/k5jsqRhSmi4X1dor3VQakP1R5S9jMGVaP9Rpu+n
	uClYoCveX2l6jQxLcibkvZyz3+AoiBVL4LIstcKMvGr111ddicRFmoM+P9zAbE+k6F9VozQnn+P
	crNfor7OaSVUGpKnsapusnST+T6QhhKaZoc27UPCmS/eY7BuaBY1tT92c1yRatPrRhW593OKyr3
	6M9anEpOUhhcQ3ChTwkv8Fq1FbhCYXwO+25qleos2r7IZOVqEEUxB/4WpU=
X-Google-Smtp-Source: AGHT+IHhtPopN59nF0wT9aM0MO2ZUTkad4G2GioIMf1qnkxOPmpIkivwxwFk/94QpZ1tIVuayw0v5g==
X-Received: by 2002:a05:600c:1d18:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-434a9dbbcc7mr111429935e9.4.1732885642767;
        Fri, 29 Nov 2024 05:07:22 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm86228395e9.22.2024.11.29.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 05:07:21 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 29 Nov 2024 13:06:47 +0000
Subject: [PATCH v6 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-1-24486a608b86@linaro.org>
References: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
In-Reply-To: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

Adding a new clause to this if/else I noticed the existing usage of
pm_genpd_add_subdomain() wasn't capturing and returning the result code.

pm_genpd_add_subdomain() returns an int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
 		if (!scs[i])
 			continue;
 		if (scs[i]->parent)
-			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
-			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		if (ret)
+			return ret;
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);

-- 
2.45.2

