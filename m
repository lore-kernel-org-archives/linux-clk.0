Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79777C32789
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 07:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241066AbiHWHbx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241009AbiHWHbp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 03:31:45 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902AA63F2E
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:31:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v10so12691212ljh.9
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LMfa0g4iXajYSsq7G/GJjCw48iziR27HSljCF4whntw=;
        b=sWZVI0duRZy6+VSu2/gbHRkb8m9W+UfstMbvXlE8WFEOVWsPIE3QJobZv7VXJXvnmp
         dE2H4KN1fIGFMeAA43u/OgQw1t/0FAYn5QEnOY9JcWG4FHwMF8I9UY/DCUSldfhTMXAK
         9NYwEO+UtDcBtWCJHXSgmC58I0IXPSJjNkW5ff0pY+UXeR+b/o95lTPwxSmmScUgKAkK
         PPxiyu47AL1Gf9VB+pRwHurkUoAywLdinc5tGY+SP8Nw4YZ8FH2lUVdCy1B0RxWFOu0H
         nG392sW3vRd8ejbCVmhuaKaxRzldrEkjYN32tfeYE0giX+EdHPdfl2KNOiHDyJInN80W
         Z8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LMfa0g4iXajYSsq7G/GJjCw48iziR27HSljCF4whntw=;
        b=cjLosBXPVGsUET91USt33yH4FpEXeBsnzog8bV588nOoeLBIgs0LtHJgcc7EKA6iQD
         MzpSO/dSBuiB7Pyp3Q4BRs/ynj/kKpOwuKs8C7YNDcAW4NBipqMcHAOo3RK0jxJbLmVu
         08TRuqaEvpDjMpa6sCyax4LXJYcnijZqKDpPHjcdUApeP7cYNWAoTOUBh2108URwAFLP
         zyXGCBsv4Ip5/Cs3F4kUgrHY2nxyMUjiqV+7x5QcTqlFb/sDDfyqsspab+8ChfE+4qMu
         W+O9Wgduxa3ib9F8ivdw+uRmGreg9G+TS7yFOvt/UyIK9IBZfZpyMJdX9DTeEaYTC/yz
         JFQQ==
X-Gm-Message-State: ACgBeo3V/sDS2paOPT8JCuZ0dwvCOEBp+RNQIaSKM6SUXmEkhnUIZYrK
        i4Ov/NHhqxHLcYNZ677uzYUovw==
X-Google-Smtp-Source: AA6agR5ZiE2iR7OITJAmUSXeFVJVKHlOku91yjT7bxk6l+HmPGlr36uB3C/mcMlUH8N/ps0Zs/nEaw==
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id k4-20020a05651c0a0400b0025e753bdb42mr6594777ljq.529.1661239898975;
        Tue, 23 Aug 2022 00:31:38 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id w8-20020a056512098800b0048b1ab313b2sm2363642lft.60.2022.08.23.00.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 00:31:38 -0700 (PDT)
Message-ID: <d5beeb47-3b50-c41d-2176-d4b46811c5cb@linaro.org>
Date:   Tue, 23 Aug 2022 10:31:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: exynos: Add SysMMU nodes for Exynos850
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
References: <20220823073006.358764-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823073006.358764-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/08/2022 10:30, Krzysztof Kozlowski wrote:
> From: Sam Protsenko <semen.protsenko@linaro.org>
> 
> Add all SysMMU nodes to Exynos850 SoC device tree.

Apologies, that was a mistake to send.

Best regards,
Krzysztof
