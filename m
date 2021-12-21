Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B6AC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Dec 2021 08:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbhLUIVE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Dec 2021 03:21:04 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55930
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235543AbhLUIVD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Dec 2021 03:21:03 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1D395406EC
        for <linux-clk@vger.kernel.org>; Tue, 21 Dec 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640074862;
        bh=v0pYSSp/PcIv+PEuO43VB0PAVYtz/J9iayLFB3j6wVE=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=rDCvEK6W4+NlPszo+x5i9Fy0tiRvVV8vYo4voLv0mmnbgfN3Jir77czW/tEdnmGvQ
         4OymUXXH/Ef2xVEw2C/drshuMQC2xzKQtZFuSC35eOkcLMxL5LQat43eGLFXhzLON0
         7jGS0tvVjbExmId/blDRdS1+VDLOo4fEWzzB3aFcUf6XSL9+oEjt/RpcVvZ2fCH1St
         HIr51HVCgAToiS9lpxcJ2aEnfa7yTS8BNc8JJ1/6Zq9xZ8ilQb4YUHu4dhBlpwTOAH
         XV3PVYYaBnkxOeonpgUxiH3WfZxfjsWq7wIJrapatJgxhS7Ge0r1OdfXoxT7RlvMFE
         OXddt64zuDlhA==
Received: by mail-lf1-f72.google.com with SMTP id k30-20020a0565123d9e00b0042633ae1b8eso616205lfv.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Dec 2021 00:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=v0pYSSp/PcIv+PEuO43VB0PAVYtz/J9iayLFB3j6wVE=;
        b=C7MCdNCpqFB/O7UmoQdGWkrfxD9qPqvjtOtJ6BmPKYo92IoTAm0WwynIeaupC+foq6
         LBvZ+dXTNWcGsWVACp4iEHomwDZzqXHUJY+OJQPXyqzWiUSl1+7yEF9jiAdKLXuH9XU+
         zRoW/A7i7SekZzZ9mEMwk5dcIeMnYycb0T1NNn5GyFOBenVSKqg4q3FzxzJGO+B7HrqQ
         EbtzKr9OGodNi9XL5NAclyL6WYCti/CszyEkE7ZPqudwf828ft37KFoWcl90xByBEBnN
         wxvMp+2IH3sFoNgJH0rTFZPz5FqBht41uSI8j0miiGIBGxZX6erHuYoGkUmbD1tza2l2
         890Q==
X-Gm-Message-State: AOAM533+n4qztpNSYZhyoVO4KcoHOCFHIfH7S2wIbtak64m8QaWbKUcd
        3hGM8gTM7lPW+hyS8MWdqxADrxOocuZn8Wbuv1bocWeDjg6eObKiSfkkAkuU59CDI/4b0D7/AG/
        K4kl5YvK3N8sn0RDkK5Sow2tGyri1tSYK25Nj0g==
X-Received: by 2002:a2e:9003:: with SMTP id h3mr1760370ljg.68.1640074858379;
        Tue, 21 Dec 2021 00:20:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0OZUFkiXcgS9OL3e05QKQSZ+sUUPAqqBNMDEDrcXVHl2uJzLoQrvQudPyTdiPoAXlwrDzKA==
X-Received: by 2002:a2e:9003:: with SMTP id h3mr1760338ljg.68.1640074858075;
        Tue, 21 Dec 2021 00:20:58 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w12sm881619lfe.256.2021.12.21.00.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 00:20:57 -0800 (PST)
Message-ID: <d10584ac-9ce6-9f8d-aeb9-8497e32f1661@canonical.com>
Date:   Tue, 21 Dec 2021 09:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-2-semen.protsenko@linaro.org>
 <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
 <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
 <CAPLW+4msw_yeG4uDbS9mMULOuc43MK9O6Paya_Z2jBj2t6ZTiA@mail.gmail.com>
 <edd828b4-66ad-1c1e-4332-e1b05931e92a@canonical.com>
In-Reply-To: <edd828b4-66ad-1c1e-4332-e1b05931e92a@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/12/2021 09:19, Krzysztof Kozlowski wrote:
> On 20/12/2021 15:55, Sam Protsenko wrote:
>> On Mon, 20 Dec 2021 at 11:31, Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>> On 19/12/2021 23:29, Sylwester Nawrocki wrote:
>>>> On 17.12.2021 17:15, Sam Protsenko wrote:
>>>>> System Register is used to configure system behavior, like USI protocol,
>>>>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>>>>> make it possible to modify SYSREG registers.
>>>>>
>>>>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>>>>> and might be needed for corresponding Exynos850 features soon.
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>>>>> Acked-by: Rob Herring<robh@kernel.org>
>>>>> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
>>>>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
>>>>
>>>> Apologies for late reply, this patch is applied now.
>>>>
>>>
>>> Sam,
>>>
>>> The clock is used in the DTSI, so since this was applied, there are only
>>> two choices now:
>>> 1. wait for next cycle with DTSI and DTS,
>>> 2. Resubmit with replacing the newly added clocks in DTSI/DTS with
>>> numbers and a TODO note.
>>>
>>
>> But why? I thought because Sylwester applied my clock patches, those
>> will get into v5.17, and so DTSI/DTS might rely on those clocks? If I
>> get it wrong, please let me know why, and I'll go with item (2) you
>> suggested.
> 
> If I apply the DTSI+DTS, all my builds will start failing. The
> linux-next (since Sylwester's tree is included) should build fine, but
> my tree won't be buildable anymore. Then arm-soc pulls my tree and gets
> said because it does not build. Later, Linus will be unhappy if he pulls

s/said/sad/ obviously :)

> arm-soc (thus mine) before clock tree.
> 
> Other solution, instead of using raw numbers, is to copy-paste the clock
> macros you use directly in DTSI and do not include the clock header.
> This actually might be cleaner choice - changes will be limited to one
> place in DTSI.
> 
> Best regards,
> Krzysztof
> 


Best regards,
Krzysztof
