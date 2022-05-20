Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821BBC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 10:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348154AbiETKrq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 06:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbiETKro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 06:47:44 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CE13D1CA
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 03:47:42 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v8so11701730lfd.8
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+V2iz2tpQK2VKoncM7tkrBv1RkUo/3iqip/6pL9NBT0=;
        b=SKmRAZSXq6NcW5nvMbo+k7TZRg6TyPM5f2AjErTZEBcrBgOgabUGKwc8xAokfk2tuh
         L+joztkQ3ieF24XRT8dlfHbSLX7tiImMFgLoCdnTJ/naAyPzS+iBPtQeAJIdLnF0+hPr
         Gi9zavVwcM/VY8p9WEDyu4TnOI4EtWafOePyADGDB8axC+ARvyyYUrwB8m/LOWc0hiJx
         9z3C3wcYiF4gXBjNcEvQGAUimLhtTmFMQ2PlRFzqc3Gazi2nNEDYu5mi70tlt0KkaT5V
         6kUPoI4lPgqQB5gmOMVpPHO7KWnPfgBqHNwymV/9sOkal23GRlHzZMN3YY7ZnlwCcotK
         6GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+V2iz2tpQK2VKoncM7tkrBv1RkUo/3iqip/6pL9NBT0=;
        b=RGc7xmEGmbC3rPocihcRX+4ehELf71l6peX1LmE0q6+F0PLY7VInkmUsdFN8f4K4XZ
         qi1ZfUUFf79S/BrUEBKNUATMOn/S5Pmo++/PiezMA84gJO2NxTy848/pkUsMmnwpGkzb
         ZiXm4USopbK2lcbNm92xMt6CXQctN+O8aYhEkW9hMhx2SH598uO7mXp6z0CF23jvom3R
         ScWv0CVTJuhFeIhDL2Q9k9p4LGLN4Agpl3+0/nBFxxDLxZ1D9laqmlaa0hssb4yDgj+q
         /7eR8H4TbxcwCAKZIqPUOTPvHTJ0ZoEI6fMnax9ZB92N4Pwt0Mpwb/BhSQ2DfbEKadDj
         Aolg==
X-Gm-Message-State: AOAM531WgX2oIK9x6wYUWSL3mJrCBUbYo4iB7obqbUv7s5VD5jgMIr7f
        gGiLdEeKiCa1U/9Gdq0bAIZm+Q==
X-Google-Smtp-Source: ABdhPJzntRsz8vlnhJmvVEsolPIB/+0IL2XNDAx06SGJOFAXhwrA5h6ElrgsomuzRBpoBB9guHpRNg==
X-Received: by 2002:a05:6512:3f94:b0:474:68e:46c3 with SMTP id x20-20020a0565123f9400b00474068e46c3mr6786689lfa.431.1653043660624;
        Fri, 20 May 2022 03:47:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y20-20020a2eb014000000b00253ceefb668sm259262ljk.60.2022.05.20.03.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 03:47:40 -0700 (PDT)
Message-ID: <a2b67f62-b000-5ba3-6989-32221c26f7f0@linaro.org>
Date:   Fri, 20 May 2022 12:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: correct count of NR_CLK
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <CGME20220520030551epcas2p1a67b9f026ce2ec56b0a167026ef96baf@epcas2p1.samsung.com>
 <20220520030625.145324-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520030625.145324-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2022 05:06, Chanho Park wrote:
> _NR_CLKS which can be used to register clocks via nr_clk_ids. The clock
> IDs are started from 1. So, _NR_CLKS should be defined to "the last
> clock id + 1"
> 
> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
