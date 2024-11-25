Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C938462
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 01:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496419; cv=none; b=pyHEqwt4Z2QyynCcx9YeuYz52hTh1aLnJRJTP+wR2/qYeVR2ntyBjjQXJjyFiPe+YNTxfSMr74DP7l1NB6N4n/8RLVPo6nJGs2u12pFPFY4mVED4Nau8hOFBEIH689C6fcT1FdpHDFJMDSCDSIJY4JR9+qHDX3a+Bl/gq+rdPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496419; c=relaxed/simple;
	bh=CdkYU+QJ7VGTHMAgD+J6/KS8Mhb64oBSKmpBnvb/LZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIMvEXl/C/iPrYlgdK2+xj57/RKKAIJIt3t51gwPCCYm4yZrq5w+szit7/mQaT17GRPbivbAr3MlviCSPpvU7oUL3MZ6ViTxmiy6X7alwaTPGiDFeqzjKMtp3or+d+mI3PylAkkRkCNWhnJ6+GDbRxqTG6/R1mzZLY498lRBOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOtyzUt/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOtyzUt/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4349f160d62so3952985e9.2
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 17:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496415; x=1733101215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=TOtyzUt/rXyh125kPo6iV5EkKKLnH+vdwcuwgZOGTYl3sFk8kq3Nyxq6W3WbhZ0jp1
         IniqdNyAbZjX3lmefFs61zWNmonVzGjus11MxR2lWC0DuBtErcvibYk2LQk4Y7NljEoR
         OGSHsLDi7ojrR3LIeysbTfuybrxBiWJLo0e4HRd1WRyNl+F/m0lBQiEtSvSJLzzu5L9A
         lK7L3OnhorHrdcLNwWel47fufCoxqe0KPqzIKIIw0gQYaNbBC334fGGOwkKwRju141o9
         GuXl34H2M0MNG+JerHZMSBQQ3PqWwMvBg2coPz8r84pFHGIAXgwZ3E8pIVEHShOEQuDJ
         pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496415; x=1733101215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O0H/HlytTMZjW4JWV/layUzk6y2v65D7CAbQ2KVEWY=;
        b=sGdC9VPM1xOSgAQYb88uTZsYg45dUUSdCAFW2OV7AEIUjIFMSnsJXanddHiv69thZs
         /ERXbF8pSCeA8PZMzEuch/kKBp3Axa89Azi3ObGxr6OCIBqylKhWYuaIvcNnHDstmw9z
         JqZ0Vz2GQQc0s0WbnRUfNV9jKf5++uFY3XHzRnWC/6IGNrz618Doz5dg7sVOSp34yGMa
         ANQ/SVYTdxBOTzWGaiKF2Ms6XEpzq3HVwjcByMq7o/yFIN0ZlqS4ncec6pzeLRoVA+3V
         zVVLZt0LvJMxRMvEmksPAnTWCNHFC4fo5B/TGnU16OazE32vLWyIcwPWZtNcUVZ5H7bz
         GiNg==
X-Forwarded-Encrypted: i=1; AJvYcCWUW7SuSP1via43tZO6gaTEz+2QSYC+Fqt4j9rgx2SZBMk6iq5a9xFc+H5XU72/sZzaIAl1Dd74++c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/qgU8Rm2pAP9a2Qz6VOzo7MsANhs7sfIUXrtRXKzWKP5/ARE
	zviuBnEUnc/Zn9+bZdPsu3BxxGlanWAeva4fQY/AneGaFB0cEn4588S9nq6d1Po=
X-Gm-Gg: ASbGncvYSFEF/8JOM0nQIxcwyYQ4fdf9zRi52tWqO+S9BceTmrpmAvb826BQfEzNrUi
	N4BPZE6cg/euW7lfK+wb6GiB48DKHY5lN/rKLZmABQJeDx0Cyz2z79axGKL5VeCpnjp99/l1jbM
	HbWl+U5gq5/IGpZrILh/wJ3mIGZgYiYZRddNyIv4VMFV9bZFI/xs+mfwbOV37zchC6Gh2O5mBYZ
	/blkjV/L8lW9em3hqRg2eBUoMtBwrQLkzkYJbPJ9sOZcUBf52cmRrxhpB4=
X-Google-Smtp-Source: AGHT+IHMErZ6fryz2Oc3MCpFRq83v9PpLk8yzbEoM1+JFIaFwdXjct61irdWGrNB++dDxJOSlfOu8w==
X-Received: by 2002:a05:600c:3ca2:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-433ce4b2f20mr107512995e9.31.1732496415157;
        Sun, 24 Nov 2024 17:00:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349f0ba652sm24125125e9.40.2024.11.24.17.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 17:00:14 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 25 Nov 2024 01:00:12 +0000
Subject: [PATCH v2 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-1-a5e7554d7e45@linaro.org>
References: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
In-Reply-To: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
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

