Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826B2EB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jun 2023 07:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjFWHiZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 03:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjFWHiW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 03:38:22 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C109195
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 00:38:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f875b267d9so338375e87.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687505900; x=1690097900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPeZrSjonFgRIP6YD2MdV9XL0mr217aLyfVUpIZCm64=;
        b=eEGm4MJYjMs+tbHqNi/MUOzIec3JkynFda76fni2Ix/4xPDt9XjEhsRJvix8GOnUvr
         9LNRcYBW2sHSVQLpjKhnxvlujDEdakN/qjAK8wXzv9d5ZLihQrmb9Q4KxzFFlwJ/d2sK
         4kU7OsbCmZtdoN4kPt+C+QPkLLyVnlNb0SSyxnELYzfbsYbDRFl4E1RXZv5WsnlMjiiz
         6xO4PFf8cl0BnjiZc+wIYPYOxSHWLSx5ya1iNDrdHSoiOkI4B5Kq3ZntLOM2FhoXeney
         vCvzFQ+TmDaslYaeJcfWYW1957Z43Qo5gsL4gd8wLELPRK+NF5Ywqe02etjyVErt7qCE
         Gvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687505900; x=1690097900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPeZrSjonFgRIP6YD2MdV9XL0mr217aLyfVUpIZCm64=;
        b=aALCl4v8BGijLb/EP4WSII5jbrvvL2dtOJayvodA3YE34WlsNWrWUASEqRV2NrXIv1
         hx3ICJYIadV2EgK4tsL1VZHAb5bM+KkJg4o2bsJ3E97/SzTVyeU29tstzDDbJdWjvmTC
         T7dolgF7HFy2KiI1XQRs/6U1v8EcQXvtd94gNc4QmL9k3un5C3CR26/VOLxaCgjbyHc2
         bUc+BkKgzpsf7P+LQlZ78qy2gb5EbwxpEdnmFV2l5GozF8t6vka8pthA+kkXNyZBGk5F
         BJrOMMbm9nvkH4HbScOaribHs/rIIzBkcP6dNHEnTxyic789Ot2uyDA5x4r/zKC1ATyI
         TErA==
X-Gm-Message-State: AC+VfDwoGChevWn/c3Bw2mI+s5qMIzOMB4mlAHDGH406PnAZF1lr6V5u
        SyudbXHKWY3xiphpx1+fLT2FIal603YlzUm7M5M=
X-Google-Smtp-Source: ACHHUZ5zVQ6gJ2w6T6rfLyjx5TSxPeDfI6eTbVVxTAoACOiVQm8TGUtp8heyVMZyht/wBnFYJF7R2g==
X-Received: by 2002:a19:6d0c:0:b0:4f8:4245:ed57 with SMTP id i12-20020a196d0c000000b004f84245ed57mr13540354lfc.35.1687505899678;
        Fri, 23 Jun 2023 00:38:19 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id o8-20020a5d4a88000000b003068f5cca8csm8805819wrq.94.2023.06.23.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:38:19 -0700 (PDT)
Message-ID: <6d8590f3-7bfa-36b1-481a-b38a5779eed5@linaro.org>
Date:   Fri, 23 Jun 2023 09:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: next: arm: drivers/clk/imx/clk-imx1.c:13:10: fatal error:
 'soc/imx/timer.h' file not found
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>
References: <CA+G9fYuvBN7Wb3hvmKemxMw1jTjG3-fgMwiQCWH6=fsTddU+xQ@mail.gmail.com>
 <adf2429f-8d60-4cab-873a-a08530e5ce69@app.fastmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <adf2429f-8d60-4cab-873a-a08530e5ce69@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2023 09:22, Arnd Bergmann wrote:
> On Fri, Jun 23, 2023, at 08:51, Naresh Kamboju wrote:
>> Following build regressions noticed on Linux next-20230623.
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>>
>> Regressions found on arm:
>>
>>   - build/clang-16-imx_v4_v5_defconfig
>>   - build/gcc-12-imx_v4_v5_defconfig
>>   - build/gcc-8-multi_v5_defconfig
>>   - build/gcc-8-imx_v4_v5_defconfig
>>   - build/clang-nightly-imx_v4_v5_defconfig
> 
> Thanks for the report. I found the missing patch at
> 
> https://lore.kernel.org/all/20230328100531.879485-2-u.kleine-koenig@pengutronix.de/
> 
> and resubmitted this. It's probably best if Daniel picks
> it up into the clocksource tree, which accidentally broke the
> build by picking patch 3 of the series before patch 2.

I applied the patch and pushed the linux-next branch. That should be 
fixed now.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

