Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40391EE7CD
	for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737457677; cv=none; b=hGt4wQ2TQIRnOBW+v3OlqfHe9LGoEQXidxRdqhOimszwJJRCSOyno0B2ZRQLn1Ge6TIcbXuULgUB/4B7nX400IXqM9cwmhUPY7MhqplEM4oKQDI4o7f1OwqVimZmSeO4TO/kkVCDAoUs/y9Swqputh4SRN4tIMUvQQ0aXDJ7jyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737457677; c=relaxed/simple;
	bh=bVAloRxO0qForNKrOwCdOGe69VlKmVFEDTMH+0w7E9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5dLXXYVftJFIkfLz6mi4pgYPjXCE6AHMNvxJirwrckqvT2/hN6bEdoDj+/XOaBp3c/8gajnhyyWxpxyOaPumS2i3FlMvQX38knrxoqBlq2I3NIlrYF5Og7ATFuJAh3Ax05Td3N3AiBZsVyG5jWCda6/k2yHc4AC7FE5m2lE458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WS6JG75F; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WS6JG75F"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43622267b2eso54346955e9.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 03:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737457674; x=1738062474; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8fRHIrh2xpHGD7EayKut4LgTeZge1YncTW6fc5+fqg=;
        b=WS6JG75FGeryXeVmKcwzXFuHYjm2k8DpBGt2vXulLFMJrjIuhYQT2z4IXSd7e11FgV
         KegYqIohu+cYffOUZFWT4pCNbig2rHyNEpjph3Ul7IU/ajo7Y9pGHmSueGSAlt3ezh/S
         m0g0gd7+kpS1qVeqE9Sc2nNvWqHAioL9CU+IzUFCPWY3WlfojVn33mtQHhYrzIh4Oeas
         /Ay9pXcOQlD4uPo4IlhRO1UvXYsVFT0t7r6m8Rx7YY/yxgq1gqpO0Mhb9qBHX1FjuY8A
         Qs4GqfMQNdRMTEMNPILde2QKdasujElRvMLoWYShutqK2NOidNajd2uJihUzDOp2NsU7
         pcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737457674; x=1738062474;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8fRHIrh2xpHGD7EayKut4LgTeZge1YncTW6fc5+fqg=;
        b=sMLP3v7kQtjhHejNAC1KZlJ5WLTJEyYtloELiS+5K7BeWaMEEG/KIh4m7r7tV6VRBT
         W27DkXY8uvzve9eoNtJxqV2DVZfmVWgSEZAi3hQ+uHuLp/rEkjL1+D2Kfki1gc9QkJms
         YHWRrou5KMzaG3wWLqKdrnhvClc/SXG3MtwAjwIrHEaqIOCK/oOEs6OTsm7AVztFRXKB
         7J2VPhTvgkn8+pfQlsVwODizgcH3GH6+ql65LmvCoIsE/TdO4XU8MNfhE7Vqo3ghOAkm
         EsguQgaC5IO99Cl3V4H2mGLdxOmfDHboK8uOK74ky3SC4L+b1xypXuLo/osUG+PlvCLF
         0TMA==
X-Gm-Message-State: AOJu0YwS6IGZI4jcl7s3/caq81jGjrfRpJ2Ev96tSmG0JJzHiwU4If5H
	yvoVwj/1Z3ymyOApDtKA6y5pCBzsQiU9IjTfWo3U3V6BdLb8VZAB5RLVvssAG2c=
X-Gm-Gg: ASbGnctZZqt/A+pkpUyGAtdnce9CCh5Z2BUCGk1LgSmVEXw72dcTkwtPluJt+q2PQ33
	0HeYZ1eVHpGzjA4bI9WvXp+wCEM+JeVQ+aYFd+is/wslnBdoryyDOUqTuQFj/BMvQKmE8uruDVr
	hngPhFgIinDCAERVFisqX1toq3ccwZReze0aaxa0XAi55nFIMPwmREX/oelqqaG3VYl9YDrchoL
	nYIvMJdQAYTDvkFA4ofDRcn8qCZNi3w4WeeMoq08kWpfYSIjyQLdLWczW3t2bwthmUW69dX/gQ=
X-Google-Smtp-Source: AGHT+IEpmUaU9yXOr+F4IbitftjPKymPQPUSc3rJ7r49fnlxGQ04Gx20Y10shwlJevx5EHSdpphxeg==
X-Received: by 2002:a05:600c:34c1:b0:438:a432:7c44 with SMTP id 5b1f17b1804b1-438a4327dadmr84054275e9.21.1737457674294;
        Tue, 21 Jan 2025 03:07:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753cc1fsm239012775e9.39.2025.01.21.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:07:53 -0800 (PST)
Date: Tue, 21 Jan 2025 14:07:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: stm32f4: support spread spectrum clock generation
Message-ID: <77355eb9-19b3-46e5-a003-c21c0fae5bcd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Dario Binacchi,

Commit 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock
generation") from Jan 14, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/clk/clk-stm32f4.c:918 stm32f4_pll_ssc_parse_dt()
	error: uninitialized symbol 's'.

drivers/clk/clk-stm32f4.c
    887 static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
    888                                            struct stm32f4_pll_ssc *conf)
    889 {
    890         int ret;
    891         const char *s;
    892 
    893         if (!conf)
    894                 return -EINVAL;
    895 
    896         ret = of_property_read_u32(np, "st,ssc-modfreq-hz", &conf->mod_freq);
    897         if (ret)
    898                 return ret;
    899 
    900         ret = of_property_read_u32(np, "st,ssc-moddepth-permyriad",
    901                                    &conf->mod_depth);
    902         if (ret) {
    903                 pr_err("%pOF: missing st,ssc-moddepth-permyriad\n", np);
    904                 return ret;
    905         }
    906 
    907         ret = fwnode_property_match_property_string(of_fwnode_handle(np),
    908                                                     "st,ssc-modmethod",
    909                                                     stm32f4_ssc_mod_methods,
    910                                                     ARRAY_SIZE(stm32f4_ssc_mod_methods));
    911         if (ret < 0) {
    912                 pr_err("%pOF: failed to get st,ssc-modmethod\n", np);
    913                 return ret;
    914         }
    915 
    916         conf->mod_type = ret;
    917 
--> 918         pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
    919                  np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
                                                              ^
s isn't ininitialized

    920 
    921         return 0;
    922 }

regards,
dan carpenter
