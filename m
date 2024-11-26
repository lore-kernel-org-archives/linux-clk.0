Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC331DFE15
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664676; cv=none; b=V6fyaDSOEjoPkvYwty4KfSxOJwnMbBgaSjGpzmTeU+9lzOqnUY6EzEk9MjFkbbrASMtb0c5hAyBK/H+unGXD6Lpy8tUePqkcXuPhTIic1YLfXif3H7KBqWQD+1soZfLbM0vMMCeu243UxjHErY/LqCLFdn5g8kprTJbNyu+hbGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664676; c=relaxed/simple;
	bh=CdkYU+QJ7VGTHMAgD+J6/KS8Mhb64oBSKmpBnvb/LZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrWL262qb8pDKShfvhtiPvwqF6BJa2pvDFUjTgjVb0inxSqCEFN+IUrGW3hTLU1/1vfbE2SSdJyTkBWpmyKOrxu4eexsv5JF0tpC+4GnZaED7dMElY9ATBdU1y1UFeFyvAICosi/NjDI2rPDWbew/KrV2VUuXletWVd8atVeqUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPkmxrDh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPkmxrDh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3824aef833bso4458282f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664673; x=1733269473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=HPkmxrDh0+CPbjb4L7WbvT5rXL8iMM9EZfu9l9WQMey5BAkbsfWWS4urUyEphohcbE
         m3t8rYNefwbCdh/ls0U8ldwX7WLYCtHRTsPoNFYNuxQkrMoDbAfntNsKd3+P7ZuaVjD/
         HwmvEoHAZL9IoAqcZyK9eADMJIv9/O2Aw+92MYxzL8aLIS6dFarUoo+X8QtQg/NSJtZ5
         Ogkc8cnZI6UU0BXMiygTxuI4bEssry3Ihn3eii4FAg5rQrqITrbzG1hD2BhvkZ76+dQ1
         Lg7NT7cIpmaD6NT5NQr7jxN2DDHD/BS/gIp7Eur93kdU0iK3kiEDlBXT/WO2n3/948En
         xjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664673; x=1733269473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=r35Jy7rrFan/mfHhknvmyu/5MKSNN371TXeyYLduWA7+m4v0BxhhQE4tECgeq6vBJU
         NdqM29UHZFp1X6EmOV7MRHM6oRmDtbv/yIVSKN4u1dDlOJAcbXfwlMV7/RqSZbmdHH3w
         pfpOQAyvBTN7oHlrFHZ2znkrdkiOyNphduuXKlctkWfCI2w8/l/fOJOZHvWVA6sGhOuW
         6c38AjytegqqMcMoo8lKAGoUjaF6SnZZkgHevwva5wDZXG7FO9myeknYKhsKGOcL4aUG
         ZupzmG1XdVYj33JNzBx2i7cdWZUk4IVwSlWtzrHHmPRBcbcOp47kOIFKJIbgRQHFpoMB
         NuNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV101vMe+NEmRShaPMdHTH7HSt1eeVGMNpB+rCW2dchuHD2DcHL6dB4l/xK+yFlksWISEVqg2NV64s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHNCO5AcMbWkMSfdOd9OWu36KJR8VPcdMiBs/ExW8a9Vf+gBv
	nhEdFNHjF1BZcC0qkfLBLqxujbS54bDFzMpoZFUt1KLBxP5zok3k+1LQC1T0UWI=
X-Gm-Gg: ASbGnctpW07bdKW8Unnv31TY8AEfZJCQcnMpIHjXiOBFG13dIgjcCyzxy6kBWXDcXle
	qQV+ZVMkehwYbfagD3H9KLqBki/iM+aHZoEfaAyYEDGcEmMYWWmxshlr5pa+Ii/qf7j32j+/aII
	/+XcehQn1S0dQ+eK/23CzD3R0Gib+9mSrTUwvjmGGCsPF+WvewnI6UPURdCLaNU96E9e0MDBu/2
	UnfA9cHfl11vfhc+DqKmedqvSwftNXngNsc2NzAQOJRNkCej6d95bkyfzk=
X-Google-Smtp-Source: AGHT+IF/jcs8cjb4B6GiHnOvpr78M0lvjd/SOOBsND3Uk6XPO25NFtr3q9aIzztmUerymlOVowuCsQ==
X-Received: by 2002:a05:6000:2a9:b0:382:5010:c8cd with SMTP id ffacd0b85a97d-385c6ed7749mr578127f8f.44.1732664672853;
        Tue, 26 Nov 2024 15:44:32 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:27 +0000
Subject: [PATCH v3 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-1-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
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

pm_genpd_add_subdomain() returns and int and can fail. Capture that result
code and throw it up the call stack if something goes wrong.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Cc: stable@vger.kernel.org
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

