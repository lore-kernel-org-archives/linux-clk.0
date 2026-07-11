Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FB2571DA
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783779497; cv=none; b=aTQ1XXgUNMeQ2JN5Xn5h/X2UVstdvWkffqugp5150ChBgm40Zrll1u5B+cW2QOKZUc5BFkSY9siFIHDHwbm7OYJmaB2DSuzGYAxlHGYYFgpTRUFMxn76kU+Y9O0nGwQD7OlaX25k/TPAmIvXxgOVCkkEOFr610KJD6Kbr1rW98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783779497; c=relaxed/simple;
	bh=39VXi6si/hpJ1w2jSFS+vDp1AJ18SKsnMBlTTjRdkLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WiC41ATLGpDdpZ6uWg9UUTJoDYWHgDflULGZ7rZ3tEYM+3azA9Ywy/8H3hVFeRNdEVcZQmN4f/7UoinzzA09xppbt04jRNY8uv5TGXrJYe4f2xr049XNlX9UPRgOtK4oBJFlsPpe3NAtXgkdK3lgpYnDXD2jSY9/1dMLCYXjsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9MqD30K; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9MqD30K"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2199894b3a.1
        for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783779495; x=1784384295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGBssn4Rs+FBUNzKWmK0qV5STG4RKsWVThUugweVoeU=;
        b=f9MqD30KkncmX2x3cRTngh0aYYEHlnY+Pn54KHo0B2RKCuFpYUjNhSt+6VnyzoAHWw
         3QMP6A/LJRip0WZS0qPNearWsfI5irjBD10iHBUGguZ5lno/cHQDxnkav3huFVtgbGbA
         w8GBE/Yeh6CRP+nikeWsazQRboxob5RsqH0/DoFjyuaTw1FsUiKMJxEIRtYij0HzxJEi
         6DhCCUSPcFQtjmEABzUQD42SyA7NWJ5oMojlz6XiXg/xkNcHaYd2o866fsKSp/GNCBEu
         NOkK1rUaMWAwCRaduo33vNX9f9n3OdL7IqMvVjXLBwYMMf/eTRKDPSa5kIwXqrW5xoAF
         BiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783779495; x=1784384295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGBssn4Rs+FBUNzKWmK0qV5STG4RKsWVThUugweVoeU=;
        b=e95ePGMLmlsxdkwaW9znjrEDpFeBJ8GKjr7LuR3bx+nDNfp7yUB3uC+PhnIeKXrOqx
         IffoJOH3Ea87XsnFZeb1SM8V8HsS6bHqrPm4ebl2WlfjHCCq66GcP4ojVHEDB8Qsj5Nq
         A3G5lOFy9J6zEdr9a034N6NslbquAGiAdMS0Ni8KwG+m5nzmqESGepvcmNop0TC2IUDU
         848rodPKfvm/eCQ0AE1CMgZbO2w/65ngXKMcJpW0q3GTDjInQCPvIBvcZFAz4XyqELBk
         uCr9uPPuXujT912IW02MlkOL4mqG8SJQ1IgJxESXH5Nxnv6sCboJ4a5+tyxGtu2yTCRW
         DGFw==
X-Forwarded-Encrypted: i=1; AHgh+RqZ1/4H2UrieLUaofBpgxwW0fxLkyw0yoANFMkSbC+xz2LXYeWSyeplJOcq57xeo5v6rs9sO7HsoSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO4S6oj90nICgOgR9Mby8aI+QRHkX3AHmiIf9Y7PtwsMV5UyTY
	l4MszCd4AKeFZ9rWiR0UfjqdkyFutotWYv4Ma3GmEKU7qmTMcq+obVc=
X-Gm-Gg: AfdE7clTBu7P4MEKbvrR343bx31gYay9KHDIwmJFHlo3JGPuz3dPlpOiG/AejXWaH8b
	bVbDkPmmtZE/XErAGI8ojPzK8ao9QE7WUVpSgdcnpRIA2wfGIAt+wrSFQ3aRfMxIKdZl3L0jghD
	rEl0l+hRWSVB9Id0Z364xiVsNf557OhyNQTzLkykInxKFL3X2RaWFEgPCpgZ7p2QsDzNjDSvWte
	4qwtbxE+C4ZXEiNiZfVhUURAo7LH3o5Si+mKKZ9LTAITgLLcxXP+8Dg22epiGLC43wH22Dg52to
	8btZRdjqjJHBGDAIsNgPwF1YCvlVVy3/FV4O2Pol4b7FsppYoRYISny6X1IkazoJ34/+xI7YpDO
	Tk67miW7SLkXP/Ra1RDQMVuByNBIG5kyetPV50O9HaUJNKWR+dHt9N+nnUBVlJIFwbwa5SxUop9
	fuvu54mKCjECCKsIiwWynBOFZRbhm8t0WWxFYyozNvOw9j8rVdPDRIf+TtY6rEIMftVCBtW2FEh
	ALJAqcAS1NsZZNIm6aSp+Y7WeMA71eyMcPi/XAo6p/Thu/TQ+AHGa3KwR+L
X-Received: by 2002:a05:6a20:9185:b0:3b4:6af4:bdce with SMTP id adf61e73a8af0-3c112d8a9admr2230723637.20.1783779495391;
        Sat, 11 Jul 2026 07:18:15 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e420sm6338597a12.29.2026.07.11.07.18.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 07:18:13 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3 2/2] clk: palmas: Use devm_of_clk_add_hw_provider()
Date: Sat, 11 Jul 2026 23:17:43 +0900
Message-ID: <20260711141755.96842-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260711141755.96842-1-mhun512@gmail.com>
References: <20260711141755.96842-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_of_clk_add_hw_provider() to register the clock provider so its
lifetime is tied to the device. This removes the need for a remove callback
that only unregisters the provider.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Split the device-managed provider conversion into a separate patch.

 drivers/clk/clk-palmas.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 86a51edac8..fdbf8445eb 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -242,7 +242,6 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 static int palmas_clks_probe(struct platform_device *pdev)
 {
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *node = pdev->dev.of_node;
 	const struct palmas_clks_of_match_data *match_data;
 	struct palmas_clock_info *cinfo;
 	int ret;
@@ -276,24 +275,19 @@ static int palmas_clks_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo->hw);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
+					  &cinfo->hw);
 	if (ret < 0)
 		dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret);
 	return ret;
 }
 
-static void palmas_clks_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-}
-
 static struct platform_driver palmas_clks_driver = {
 	.driver = {
 		.name = "palmas-clk",
 		.of_match_table = palmas_clks_of_match,
 	},
 	.probe = palmas_clks_probe,
-	.remove = palmas_clks_remove,
 };
 
 module_platform_driver(palmas_clks_driver);
-- 
2.47.1
