Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAE208CA
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978510; cv=none; b=io/JggzASOHyNTCrrx6rbhwuBc/1yojiJ4BO2EsOzCs9qJU9NS3oJ7MaKYMhq+/Og54BlY4f3RKmwoa2NDw1xneOt3H+oSDloEE8I4VMVgokayNcXTa5mUwsJNRTcGddUaPWo/ETenYZaLt7mY8isGsTtIkU5Gupfvhn9bbO6Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978510; c=relaxed/simple;
	bh=VQk7sZTiA8wCKqvgDmKRoTUmlQX31qFVVMeZqdFX4f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9n2LKUl7iemvS8v1fZyp0jyBnKoTwxINUzIxuniNT0TGwQ+b4VvbMD8KUfR8sNvEO/0joxkAlmus8brg6logJ0T6ft4sTcxo4Pjd4qqLQefX7vVzOI0qYsKqiGO3zd/vpXC01wSNR16BV0D3Bmbr2r7TfNAAkGzrGYrfCEuC4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvOEjRUh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvOEjRUh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-363826fbcdeso1559596f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978507; x=1719583307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIq5NFporX9JL7hH7seYl7KxrZat3hGcNxPAVyQ42iM=;
        b=CvOEjRUhPUPxLzTFFFGJ2v/KCC7of/q/myCWM75lIIxYw1rVbM05em13him2b9dKEh
         SASSYv4oqzCS4LfNIqP7KfM7kHtqzSORvMheS9j+CS1x20Bmo2yqoWYJbubSANlog9ht
         +XzQc5ZLno6T6MMQyqDbEqsq8z1qUTsW+umEE+YYlOWfD5VE8EWtBUJk+oqNHJM57Nw9
         MQY522cNotfAqlQaTgQyKyN2sDbmHG81ojjtLWEbJV6noY8TIae2m97obPjdSwrXsTwC
         Vb8EHatZktQi+usdqnsBi7QKYcm68zzljo2p+SWgH193Qv6/WGjCnsZB4ngnOKI/CKSs
         m9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978507; x=1719583307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIq5NFporX9JL7hH7seYl7KxrZat3hGcNxPAVyQ42iM=;
        b=XYums4r/SG89OBQadLJfkPE5NK05Kz1H7A8/+9Jt3hqvSWsIOiqRzoNYD3ObdL+qZ/
         Gz27mpPu33y9AtOLuyGfDzi2xsgGObWVNztL5gkRWeMeyC9nlr4Uedf1ZYCM/a+dOljw
         KMZxL6e4SmwJd+xsy96s1c51FZpacmyHhG9rWBASj2dN9oPAm45AoVEut7JDcouz9GCC
         5mekHEIfRsxF0yYAK9Y0l7bAzoJ/xuA4t08LJry+j5fRftmlqvnnFZWMFK6rmf/kcPGt
         d08Bmvu5fUV2L/XSQaCEeUWAtOfcrWuY0+AxHteA6cfzR9PSlM/TF5XeRNhFn8/hO4vz
         mJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWksznLojfCT0tjcfxviWQBUzBAZe4B3KkifIAL2T/GqWsViTjPDUJ/z2JaGa1PYVW8JuHiY2xI5t+UiQfnrMw1TGBdCoK0VRir
X-Gm-Message-State: AOJu0YzsRaykJt4ZPfIF9EyUMBWPAB+12vlvB9BcIWoR6g0fAKrDQw6g
	JCkMQglSNR3RRr0HtL0bNuVZS5du9y6YinWyH0kKCxf85Dq1hVDcb9kVh+4Mn+k=
X-Google-Smtp-Source: AGHT+IFSqdMZ2rBm5DpH9rcAlEZXXwPTN8ojNO4QOtSfIWSE6aXjyDv1ozNml8jDWBt1IAxYyU5FAw==
X-Received: by 2002:a5d:4902:0:b0:360:7f79:b4cc with SMTP id ffacd0b85a97d-3631998ebe5mr5943433f8f.68.1718978506614;
        Fri, 21 Jun 2024 07:01:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 21 Jun 2024 16:01:17 +0200
Subject: [PATCH 4/5] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-4-7b297dd9fcc1@linaro.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VQk7sZTiA8wCKqvgDmKRoTUmlQX31qFVVMeZqdFX4f8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfEFHDRWYkjp39n+HmQdqAoGn//ocgCqERcabOO
 jWuGhOGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHxAAKCRB33NvayMhJ0cRQD/
 4hljnI17ls7MCb7+we/IEpqnLHxfOUqBt8jxMRUJKGNVKC88x3eD1HCiRGMjimQ6f1GwyDR4qFeRnz
 aoCfHwrpn78tWxcTEZmuwtXeHO0VaGn+YIM6Dsn9Z0xtquawGXH8nNqHAJaKFjHXzGvn55H1OrYyqZ
 i732H+XKUHqroi/IKBrfRMsB3NmGcdInpWrD5b+9mtmUNwRerxdUBbKpIFDys/RA61lV/fjE2O7T6W
 H96SuPcm3tRbbrLiUu8EvjVTjKauBq1YxwkMZ6t0lLhlkiVhqeEnXePZL6/iMByWH/SDV21LrxGYuk
 a1TLLuIUeByAEktGVzqCmwg/ZgA4ye2K3wsWKxtXs/TA9z7WnUhZND50LxUNn0dtsC2LTPYfbJeyBd
 282/RkTvE98V75Hw9gaXU91zoojSbeSwpQ2S0XpUNi5uD9zzlPncXIYUdnkxSNV3qJ2TBZwChz5Dn5
 YFOSYKJMcPodBhk7BA27A9XCwXoUQAxZpVmSFI8jt8R86Y/s38IvjBr5qpVX+jYRBZJWofuNIYYRK1
 kC/w/WXBWA6pG8JGI4/RlMOvWy5fnfiXeiFUwpDCA0so7Y4G2kDd6iKsQBH0TUrCXGENGdOCniEg1s
 r/QbOiLgNEgQmCh6KVSdLLrE0tfLl99ADkEvsGFvp+QmEypqlPtFZ39mOUMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
and byte1_div_clk_src, the clock rate should propagate to
the corresponding _clk_src.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index d22f61772667..d88eebb32575 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -694,6 +694,7 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -708,6 +709,7 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };

-- 
2.34.1

