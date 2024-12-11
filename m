Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0CA95C
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876871; cv=none; b=IOJerHI/nkhtbLiBnXE85HIuxcN+rlqHfHIEpkvazrqyLcd+2QAm0gR/b/WYoyDvFqI8C1/bD+qrdzU6ZTn5pWanYQ15Zy8P4I65tWLc2VkAS13vTvQpL67vi22YhOCwJpsyAncZaPkBDA6J74jd4k5q2C+Kitn3qTx2i7/NFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876871; c=relaxed/simple;
	bh=mQpHD0O/4DmVLloEpdEHgH89jVyxadWEyw/hKsvGyhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNWW5tWbTw9q4Eet2yN/Lbtp9GogwZN4engM+H2kYvTC+3qB1VUAtGhOtkJcuefNyxZ8LUUl+kfbvF6DaxV8ad6dziPteNqOd8j6rs8A/qFtx+WhA8UNNn1JKrwIRLHwEo7TwbE2EqW3HmuPkhKFiNZnz2Ziy+5zxhC7FP6/oJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFddXlxP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFddXlxP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so7950904a12.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 16:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733876867; x=1734481667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=CFddXlxPbylfH/CgBkKc+nwCdkWLz7rk2e93AwaP/uMhCYDp2ysLfunIjKvOWLnzyr
         Mni2CPQ4RegvZvzHVx0hTBjZqwGMCaINHHKrTLYe0XRbiAq7gzgfkXKdCyT+rl4OYBQs
         7N8M8wS+y7KJHs/sTj/GUs2wMJM54WPTR4NpPnrbtKc0b8TPzV4v/WwV2gx4gE5dFOmu
         xhwYXJf8dCcLVqNJSI2Tn3rcU8IpZlk2AuQ+13V3IBct90rTw6ZZt7XY8tebeoJJbH4S
         scjtanV04qGqLv9kUOOblmc1ETANt9yqQPW1sWQ/vbOdY0AZFDRzCBdIvr01H4McrM7i
         dAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876867; x=1734481667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aPv1A/6lNNGm3pKHhjnN5K2Ej+6bunOS3nenFEWG4Q=;
        b=IqIwlX36oToOfJgKumJAtHIGZSmEEmdj7Jd7oxJgWP5F+Zk0VTGu1kLj1B1/Hjtb0I
         YrNt6DCUS8Q97+bGrCtUGUNCTMM0FULsMHp+qiiA+BrlNdQQM6ck32vz3+Rj663TSC8P
         zCBa3B/J1CYavHv2GZnsXZtClHLLnujzKriZtuGTY1LLx6zpZkrGbd1D5InULD/Qk5nq
         Sm++sE8gSP0VKju7NKKwpfr4RKhgF055OrD2YAy8i1i3uFb904cIIBcmGbWZTPZPJODH
         pYBjM+oS3HnTSuxSCIyxsJouCuY7WWzJ0J4gZaH6UbD+WjCxWTEvw5U4WA/LE1CZUwNU
         3BOw==
X-Forwarded-Encrypted: i=1; AJvYcCVtiu/Efb9SxD7qktI5CcRkvYlnT3ewy/uvy1ENgDU0YdiCsDRxNHyuYgTzrzzwABkibmaUPhuYwgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YypEIk3RuHWVHXEkNF0scpB4korWOebQNhx4xosWLWuIJXGVz9A
	lWobVVDafSf8GnkljzH8Ux4aG3i4FvqHuNVcfGIIvZ6iS2izyo6DMJE/i76NX2M=
X-Gm-Gg: ASbGncsgXdcGXVu1DD+pq1rSFIqeHG1SbKY/kcu/BmLF9w9h6a/rbUltyO6o9d0e9Ni
	jIYf6FzXCyPfSDdA9+zykvTDRxWYtdGKMx9GapA2/F6HMpOFf8HFOcSyZmJ/4jTepto9FEINCn5
	vfvSo840cvMsv4wgi61MM2BNaBr3+0wIomAzqaaKzaA3iAT+LV4mbsYBwAzeRHdGNSZAMS8dBmK
	/QulKYhpcZvgZUFX7Vu8SKGbMxoco7Cdt7KjaUbRHqIQGr7CfLsurYt1Dm4DcY=
X-Google-Smtp-Source: AGHT+IGuQRWUUAEjEqZ4dDWJ2yJP50NE8IhkqArwEivr/Mss2dg6L0s2MPZphZdFxMVQwkR7ehoZPA==
X-Received: by 2002:a05:6402:234a:b0:5d1:22d2:8965 with SMTP id 4fb4d7f45d1cf-5d433177d66mr547146a12.30.1733876867522;
        Tue, 10 Dec 2024 16:27:47 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa97asm8155530a12.73.2024.12.10.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:27:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 00:27:41 +0000
Subject: [PATCH v7 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-1-7e302fd09488@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
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

