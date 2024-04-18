Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7216415E216
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713437495; cv=none; b=Gceo/r8gxqhukmlr/YeTQ8CLpO3d+me3RWVx4xBiLAHxGoBhXWdXFpv8Y+4JtFcbWROzLBHaeeAjXITJX8jFu88LnSc2/AvvbS760faCNsPpw/KuUXYcJqMtDGPOU7SEMGDfjbtHurssFbgM5qAsZAnMPWqlaRodqBSGXRWpgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713437495; c=relaxed/simple;
	bh=0ciFJjYNBna6Z51Gvl7mG87GzaYImzsPtuVsZFJjh6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PsJBcNSZzVoYCq1tDbNohknYTHo16UIW2HFSxeEa0GHWdBCa3MR+1N0Dx+IngFQQ4C8AOoMKNoYfO5DRgup1W6neOPMnxcE01yh3F959xAmTce+cwFVj+91pWwrkLpIEF2ieomyvu4Pr76zxUzR4vT/9VsTeCepRT+Q1hhFItIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wdqq8KVg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdqq8KVg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41551639550so5099035e9.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713437492; x=1714042292; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffWz4ggcM0E0BoGGSniCNW1lk0qBr3Zu+n3EFocarJo=;
        b=wdqq8KVgeVNQwBZ7wYi4h9Snn+eByhE/4yH42kjjF8V872u2RzHECfsATGasSGefJw
         cHmPZXT84qncRwYmw2Wab9rKC5VNDUyY8Jh38CJbwTXOqnSad54iitvibLQUnejGbNf9
         KauQJq2bWP1I1zR3U8Q/yIa7U10APgKIqnMtulMw/QaIeXXXoN0kyQ8SgNr2Rr10o2/3
         Yy0USTQO9GFACGBNQZ8PLu3BZc9UoTypKi45S67BGDuAyA/w0m1UsaE4xXFYtzhbMzAj
         ZHW+i0FkUjcApMhKUU8dapAOWAtlBWXhGDjrHEDU9l/vAzSQxoKjUmZA4ZVGiNDCzQyz
         06Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713437492; x=1714042292;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffWz4ggcM0E0BoGGSniCNW1lk0qBr3Zu+n3EFocarJo=;
        b=ZvulSKK1icDVh1JVDmXONKy1I601Y5nWUZvbLaf1gvev1PR4/WcfScOy0dVH+S35oD
         LL6fLqdiDZlKCm0EOB4ZD2nhjZeFk8dae7I8jf4LrFnNNOAMrRObFgSpKPOR5l/P4c/j
         QUTy5IYoEFl4zO9+wVroJyClG8HKe5frl4xOw0OPIyTRGu94FwvAXrZ9SnSTfYiFJFGs
         3eOgEeKhe9fjl8R/Kc86hv0g3uOgbGlVh4Mxy4LBunH1pkSixmYaE2JhlEiOUNW1m28T
         jbebb4NUNzEHNEgJ5ho5qOFuEHdr5/L4BkikFs/KTHItaZ7Uckvj3RcXHiDvMedXBq78
         Ce6g==
X-Forwarded-Encrypted: i=1; AJvYcCXt5KMSiQYJTgvrdtPWZnMWrF8bDBXb1FMuQNz/QB3mYHaHFslcHg4oY1Xvyz+lrEdN2MQbAt4MvKujPjYeQaPb5Nl2xAGkMqc+
X-Gm-Message-State: AOJu0Ywnn1Sq6thJkLfiDK3h2yGwbjHL+E/PYHb7FA6CscMVIl2XrZ1r
	L4lfSPzA/56fX1NSuhEoAxZxKp+NnNhOjpPmvn5GVkcymIIxfrQejyAzc5Xc9bE=
X-Google-Smtp-Source: AGHT+IGayePpAYxdxkQ6lrjF9h/2Dh3xPxJfDGn5zbuN2vyze23VCBwFY299S/JBIvSepohp16hROA==
X-Received: by 2002:a5d:498f:0:b0:349:ca9b:545a with SMTP id r15-20020a5d498f000000b00349ca9b545amr2135137wrq.29.1713437491673;
        Thu, 18 Apr 2024 03:51:31 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id j10-20020adfff8a000000b0034335f13570sm1509773wrr.116.2024.04.18.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 03:51:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 18 Apr 2024 13:51:22 +0300
Subject: [PATCH] clk: qcom: dispcc-x1e80100: Drop the reconfiguring of PLL0
 on probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
X-B4-Tracking: v=1; b=H4sIACn7IGYC/x3NwQqDMAyA4VeRnBdIrIfgq8gOWxtdQNqSsiGI7
 27Z8bv8/wlN3bTBPJzg+rNmJXfwY4D4eeVN0VI3jDRONLHgwSrERJis1RgxealY953QNZa82vZ
 1RWLmdwgSJQj0VnVd7fh/lud13bwbv0Z3AAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=0ciFJjYNBna6Z51Gvl7mG87GzaYImzsPtuVsZFJjh6Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmIPstSihNwBB5uM+APSfl0MdpNjzf3YHx4nqaG
 pJoutt7etOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiD7LQAKCRAbX0TJAJUV
 Vk4PD/9dDOkeP3I3QqwI7R9LK6r5V2cL1yMl5oWEI0n2hltX6TkrpX1cA8O2f9u3c0uVLlSXjT6
 oDzDy8WzTgckmYbM75d2w6WPcxq9M8oSB0P33VC8SNKHsSc20fr0J1qyvTgxwfKp3IHq/hsz0HB
 MOxs0hP5a+30P/H4DlD+4noruu7tsd/gf97bEVqDlOteIZUF42RT6VhPjTl1+AeN9pFHRJz9tXJ
 7+Y0kqlibxAGoxNwaqhmerc/1PVL4XvO9C2B7w9LwA2fP0Q9AcQhFbL10K7iowjybSpFqr5GfA3
 24mbKmaBf2gOM4Veq1UgwVvrBZzzrvd9s6pQ3rBCIIclsVCMFmMBXikJWkpbaLftxyMYUM2tSSg
 ziANbI47Cz3W+w8RD5LYdx/j7dyPnO1k+wkF0zl3SchecP84bW5nYZLJ6KYqUUacmJOTVdSOJsK
 p2le2fZmiRydElDGs1a4KsXS8TCkMlNECKsBmDaNkTMbMjgPJ7MVB6VPIFugwZru9hFpP8a+Pgc
 Tv/QXwoP+EYFjO1JBDbLeN/154gBrUPcJ1qUPenh+ixFAEtxHtQ4Mmxa0MB9hMW2X5YZFgZHStd
 2WEVEwXTVKiF8BVt7Ch/dOkMXAlX9tWDzdoCtXQlsD8rWNJ/VnEMHXr6zpbCnlSHYUS4iKofcNz
 1SfuP7hAoITTmIg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, PLL0 is configured by the bootloader is the parent of the
mdp_clk_src. Reconfiguring it on probe leaves the PLL0 in "stand-by"
state (unlocked), which will trigger RCG child clocks to not update
their config, which then breaks eDP on all x1e80100 boards. So rely
on the bootloader for now. Drop the config values as well. Also add
a comment to explain why the PLL0 is not configured alongside PLL1.

Fixes: ee3f0739035f ("clk: qcom: Add dispcc clock driver for x1e80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 0b2ee6456762..525f645094a8 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -73,20 +73,6 @@ static const struct pll_vco lucid_ole_vco[] = {
 	{ 249600000, 2300000000, 0 },
 };
 
-static const struct alpha_pll_config disp_cc_pll0_config = {
-	.l = 0xd,
-	.alpha = 0x6492,
-	.config_ctl_val = 0x20485699,
-	.config_ctl_hi_val = 0x00182261,
-	.config_ctl_hi1_val = 0x82aa299c,
-	.test_ctl_val = 0x00000000,
-	.test_ctl_hi_val = 0x00000003,
-	.test_ctl_hi1_val = 0x00009000,
-	.test_ctl_hi2_val = 0x00000034,
-	.user_ctl_val = 0x00000000,
-	.user_ctl_hi_val = 0x00000005,
-};
-
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
 	.vco_table = lucid_ole_vco,
@@ -1670,7 +1656,7 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
+	/* Configure only PLL1. PLL0 is already configured by bootloader */
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 
 	/* Enable clock gating for MDP clocks */

---
base-commit: 4eab358930711bbeb85bf5ee267d0d42d3394c2c
change-id: 20240418-x1e80100-dispcc-drop-pll0-reconfigure-0111b338c838

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

