Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4C42E01B
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746848; cv=none; b=SYg/3AXw6YT/eYNcwuNqJdGoY4efo0sxJfNzPlRX2HjCv/iUJZsQgr4uCo5QG79jBH6jWj3jFlge8L/EiarWtDDojtrnwFofp+POat8fNn6QG2jzqhQQKk8WDXgrtfd6db3zX3omLhH2D9jxoSzwCz/uL5ZTiHaygoYaItCfAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746848; c=relaxed/simple;
	bh=olktBAQvKxaecZIsp/fU/dPVOlKjbtQGwgmmgY/1Gkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EubZ2a7Gc2655X/P3DVkmTMc/P7H6CPm8v2phwj/Gi0Uo1jTMql7e7CGNw9Ra9dpEUVh3OwMxNF59Kywm/F0z10+fHMl+d16zPf0pPM/6XS6srOSzdG/5USN2S4eVQRzdi3GVdezMYz+CJoq+qQjHAT8yGXQpjBomMzd6qjmlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZTmN/tm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r+pS0z5r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZTmN/tm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r+pS0z5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782746845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
	b=hZTmN/tmRzbR1sJoYz9ntrUQf0kuVkjZGi83JxCaVT1ka6jgnHcNpURp5vWm9+KXRxSgWV
	F5xn5e/mF9g2UMxZNbe4/eGySI6vX88nOZrpiYSJ8ZuO6T+Pms+FbaRreoBiAQYiOt9Ekr
	w3Rc6fQxD/lqnQ6fN4bHM0SNNf0YSUw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-u7bybUuoOyqGfg3vWmxuTg-1; Mon, 29 Jun 2026 11:27:23 -0400
X-MC-Unique: u7bybUuoOyqGfg3vWmxuTg-1
X-Mimecast-MFC-AGG-ID: u7bybUuoOyqGfg3vWmxuTg_1782746843
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso137449785a.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782746843; x=1783351643; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
        b=r+pS0z5rBms2E6F/XFfUt8T7vrxiJEA95Fqz4loBlLamLiq2Ueou7ORrowJqmyD/HX
         JXWhjVBg1+S3E6P655OyP4MXMuMHJJiTnZOV/4KrgVWLHV4UXf7iRFX4IvzZ3C+w5tx3
         NkyGpftMUZDa5SKU3wGM9y35V6L1bGE/cjYElzKBS2LoAdGgw3mPNkTUH954If/TYkG4
         xLz1h37j9jLqQeg3BGHON3wg5LFHdpm0Mu9xYLDKgtkSUDu1CcUYwkYnGXX1XbKYDRe/
         fy7AetUcDiCd4hC3UhEB747tUdkmYxGn6xeS3HWfSHafumFqCegEnVraro8ZXxxXQBOS
         2sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746843; x=1783351643;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrIKgHHkGKl8C2lG9pNbUWYtGyLd9dJ3sMY6MdK0KTI=;
        b=iCsqckQkvHGYKTYw1mmcJYbYncGLQ0j3n0geM1qkfUs+rj57fPq30t3EO0dZ95ApZ1
         kgwATYHVN44BGgUbBaeil9T+1Ph5oan4l98SIWVXqKdG6G5Riks3MAYkIDjnBN52cvKZ
         jMHr7dM4XR090OECkUksFg2rAq3SVp5lR0GiAMqxVJybyYRr5hlRpOFyD7y8O0SI2LxI
         vEAnGu7AHeBGTQX7iG29BTY8r3xoEqmDnLx6eeYH/ruGLsJauuggE79yBbqI3bj80ul9
         4WnG+2zXf0g7p1Vqwdg1L7tJOT9kgOd/0YnonTYwTDUj/U+3FcWUhkcA4wJmeeOyN+5G
         iMhw==
X-Forwarded-Encrypted: i=1; AFNElJ/HwcRm/E29WRo5YDjMg78auzuAoJnSZL0q/OftzWaNO2WnK9uWANU1XzN6udMl9E6krRdQ44ZXOEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbsQIwqNg/rwH04b0WIjpEpF9oPx9buFEgEEhHCUoxy5vq0GN
	Y1ty10UA2WDnhyBbwN0f0OdNs6EEvsYkMtoWUDLg8wCcnIZquowfguXXQyxgG9CxheQlQC5zGtW
	gDIGFuS8HJEgXoj9faQB4j3PQOcZkWmIvVHNgZbUeJeCJD9a3+mu7114uCFWnHw==
X-Gm-Gg: AfdE7clIcuEpOWsVzJzcn7c9m1bRIWZ7kJzJXi/ZoE2jf+WUMOuiNvLders9nyuCc/c
	WpdxxLc7iopkZQWslvtRUC4eXh6ZiGuuytBZfdr0uo1awxaoyWXxWreNr8TK9NJ7ja9fW3S+6XG
	p2ZbdpseFserLpwBhcdDfihqznfymr2hGAimQmikGxcZL91DCEdOfbqX7me8CFol+NmZN8ZuITq
	5vSFrN1asD9PXleLCSVZL+WLFnl/Irv8J++dOacahvfaUFjn0TTfGUZ6Z3Ffeg/uddb47W20K+9
	J6c0Zo1h55daMvxndDZRuHl2kNfGQCMG/HfXVE19TRtzyI4xYPhnZJnusV70IfKxQKe4fRSTDHk
	FwDu9azL4WXLNc+0yDDBtlmgA8/aoEo5aPdz5NvkqhgnbRg==
X-Received: by 2002:a05:620a:25d1:b0:920:bc4a:6d9f with SMTP id af79cd13be357-92e6267aa05mr1799285a.25.1782746842668;
        Mon, 29 Jun 2026 08:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:920:bc4a:6d9f with SMTP id af79cd13be357-92e6267aa05mr1792785a.25.1782746842154;
        Mon, 29 Jun 2026 08:27:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e623386a3sm4363585a.34.2026.06.29.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:27:21 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:27:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akKO16q4rTbS2vx7@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
 <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pnxlf4Bzm5/y2KKA"
Content-Disposition: inline
In-Reply-To: <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)


--pnxlf4Bzm5/y2KKA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

On Mon, Jun 29, 2026 at 04:00:46PM +0300, Vladimir Zapolskiy wrote:
> commenting the series I was also directed by Konrad's review comment on it.
> In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
> misses the necessary .use_rpm flag, can you please do me a favour and test
> my series plus the add-on change below?
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e..a15e9754bfb2 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>  	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>  	.gdscs = camcc_sc8280xp_gdscs,
>  	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
> +	.use_rpm = true,
> +	.cc_gdsc = &titan_top_gdsc,
>  };
>  static const struct of_device_id camcc_sc8280xp_match_table[] = {

I tried with this initially, however it fails with:

[    8.193803] camcc-sc8280xp ad00000.clock-controller: Unbalanced pm_runtime_enable!

I see that pm_runtime_enable() is called from common.c when use_rpm is
enabled. So I removed all of that from camcc-sc8280xp.c with the
attached patch.

It still fails with:

[    8.204595] camcc-sc8280xp ad00000.clock-controller: probe with driver camcc-sc8280xp failed with error -22

I suspect the use_rpm flag requires a more thorough migration.

Brian

--pnxlf4Bzm5/y2KKA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=camcc-sc8280xp.patch

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..a7d2a86ddaa36 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -8,7 +8,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
@@ -2995,6 +2994,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
 	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
 	.gdscs = camcc_sc8280xp_gdscs,
 	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+	.use_rpm = true,
+	.cc_gdsc = &titan_top_gdsc,
 };
 
 static const struct of_device_id camcc_sc8280xp_match_table[] = {
@@ -3008,19 +3009,9 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
 	regmap = qcom_cc_map(pdev, &camcc_sc8280xp_desc);
-	if (IS_ERR(regmap)) {
-		ret = PTR_ERR(regmap);
-		goto err_put_rpm;
-	}
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	clk_lucid_pll_configure(&camcc_pll0, regmap, &camcc_pll0_config);
 	clk_lucid_pll_configure(&camcc_pll1, regmap, &camcc_pll1_config);
@@ -3038,14 +3029,10 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable;
 
-	pm_runtime_put(&pdev->dev);
-
 	return 0;
 
 err_disable:
 	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
-err_put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }

--pnxlf4Bzm5/y2KKA--

