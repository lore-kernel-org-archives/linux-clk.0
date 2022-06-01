Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90026C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  1 Jun 2022 11:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352515AbiFALJh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Jun 2022 07:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346186AbiFALJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 07:09:35 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145C45E14F
        for <linux-clk@vger.kernel.org>; Wed,  1 Jun 2022 04:09:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id rq11so3019501ejc.4
        for <linux-clk@vger.kernel.org>; Wed, 01 Jun 2022 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z68BPkHGmXG4mVETeBafciiA8RC/qdrJ/VFB7M66ZuE=;
        b=tqFGCJ4RTJkEK92PVGNoVh28xEJj+O7VYJlTwHo8Ex+LN1g3ttEtaR5yBGgp+NwdQA
         uEvtSphrWBkwxpsJauJj8Vs3u9uyps9R5QwNJVV/TzE/pKPUnm0MzUEg3jXms9hUoNt9
         93AIyMB/GQkj16HIlF+tY/USUtmVIoddsFUkG2eaKksAgyI7+Ugl3bm6YNpoANHHSIrj
         rJ0NCUi/wo0vk24/Nr+lSqphmvn3gGFLzsRph+HKDGaJ2FnLxngiYOpudXgVnNRk3ZqR
         n4dM63Kovfe7kSFz1y25kQe5OjdgjS1jsf2sAMJSRpTFIbTcE4yyHDGX4ZYXOVv4bYn1
         Qy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z68BPkHGmXG4mVETeBafciiA8RC/qdrJ/VFB7M66ZuE=;
        b=dThOVLzLl+selZ1z32gJxZrGVXuonZNyhk948ph50hrIOM05Y25MMfbsxJsRXSL6FG
         CtobkpVceFsMTqqNoH9YIbEdqYFp3t1ZzGMuO0Wkt6t/P+igzHSTXOfQKnnnhUUtL9n4
         Ys5fw8iQyhO8GauLhctKlqtZKh044DHslbbsAS08C3XHZd1Hco2EXWZHfFeEMID+x5zm
         qPXgQMrNpvkdyNl+DSjYAO5wvhZiBhe1MAYriP1lWKth5HmlDFqhWJdoYr6L96IIeV+u
         bOAWRD40hAPKBo3+dUvbVNDszmH5lyYz6wK7DdREsMG6ZqwNzolzdcm4xpBbswIxc/OD
         K9Zg==
X-Gm-Message-State: AOAM530ankMQgr+qGEJY8dgof+iWpemxVibTpOhNUyF2AuBYPjUOEQtS
        /QL+LD6OONpc4oFdmHpALsautQ==
X-Google-Smtp-Source: ABdhPJw2asZRW4TmqBmTFmIGcRc+9YuVnLYnMGhIYn+0EBLNBJi0x7ztJ0JcgXHC4UAKHMxJAiE5bQ==
X-Received: by 2002:a17:907:d86:b0:6ff:1557:a080 with SMTP id go6-20020a1709070d8600b006ff1557a080mr30424418ejc.678.1654081770533;
        Wed, 01 Jun 2022 04:09:30 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e26-20020a170906081a00b006f39ffe23fdsm627514ejd.0.2022.06.01.04.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 04:09:30 -0700 (PDT)
Message-ID: <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
Date:   Wed, 1 Jun 2022 13:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To:     "Marty E. Plummer" <hanetzer@startmail.com>
Cc:     arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
        devicetree@vger.kernel.org, gengdongjiu@huawei.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net,
        p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
        robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
        sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
        vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601110616.xmxih663kxgupszv@proprietary-killer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/06/2022 13:06, Marty E. Plummer wrote:
> On Wed, Jun 01, 2022 at 01:00:38PM +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 12:58, Marty E. Plummer wrote:
>>> On Tue, May 03, 2022 at 01:37:42PM +0200, Krzysztof Kozlowski wrote:
>>>> On 01/05/2022 19:34, Marty E. Plummer wrote:
>>>>> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
>>>>> generates clock and reset signals used by other module blocks on SoC.
>>>>>
>>>>> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
>>>>> ---
>>>>>  drivers/clk/hisilicon/Kconfig             |   8 ++
>>>>>  drivers/clk/hisilicon/Makefile            |   1 +
>>>>>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
>>>>>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++
>>>>
>>>> Bindings go to separate patch. Your patchset is unmerge'able.
>>>>
>>> So, assuming I have the following patches:
>>> 1: +include/dt-bindings/clock/hi3521a-clock.h
>>> 2: +drivers/clk/hisilicon/crg-hi3521a.c
>>> 3: +Documentation/devicetree/bindings/whatever
>>>
>>> In what order should they be applied?
>>
>> Applied or sent? The maintainer will apply them in proper order, this is
>> bisectable.
>>
>>
> Either or. Whatever makes the workload easier is what I'm looking for.

Sorry, you need to be more specific. Apply is not a job for you, for the
patch submitter.

Then you miss here important piece - which is the first patch. DTS goes
always via separate branch (or even tree) from driver changes. That's
why bindings are always separate first patches.

Best regards,
Krzysztof
