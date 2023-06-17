Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE49EB64DA
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 17:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346321AbjFQRUx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 13:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346397AbjFQRUj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 13:20:39 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243DC2965
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 10:20:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51a2de3385fso2662473a12.0
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022431; x=1689614431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCt3kM+nBMBe594FBcfTM0tt8nk7YD6lBO7D+bNK+No=;
        b=Du9+514DgcGtUB/CaouAziyCXzCocuhrAmwZwLu6Z6o0f4YiuIHbJOceqpoKwVRKrb
         IMis+k9vJdE5dbGMD2oCg08ZrpdMEe5vS/XLdO+vYFSCKeJS7p4QgoYChiyLTQDqXq0Z
         2PYg/KZD7wTPTOCfHXVr7RUZyt1AxrTRvcCLXg2sKU/iZDSbWGas4gC9BsuQSMuhZjhT
         ey8zHuLGJtKL7v+T0V6TfRQuPizD1MfVzcLXv32b2wcNQzoosSzCTA034X90qaXaZMV9
         eVuvlLjZiUUoqePtRhUTmBi2jur4eeNEeWHCWhq/3tP/stLhB6WkNFh/A+SbQ81JaNx9
         i2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022431; x=1689614431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCt3kM+nBMBe594FBcfTM0tt8nk7YD6lBO7D+bNK+No=;
        b=CJMUSWHopu7zWK+5c+Y0wwkQd7lw0rDn9E1cR4pzQgLEU2AvxfpXrJ+lylWANZ5wW6
         WeU4Wfu/cjS6DajfMJFG6RxYUdwJ75VL0qfbGMFcwhsLkKK5xhVfrSJ9W6Wder2BrzHW
         48ED/h3GSz0JEok8dwuu+1VzQhXBXoFN3l90yBmui/GM++au2jHXqw53+yepEv8x9K5h
         V41kOAKX3/sW5KhbhjTeLsl9YWoSgyGeNoj37AjWbp32kPh2uhcwhrJeXeO5AoTcFJxS
         2iyi0Nvcl2+fxSSmKrA22hJlKsREH5VbQ/Jq8DLKo7eLWGe5u1mPucjJ9FoKtRt/Rjm4
         hzNg==
X-Gm-Message-State: AC+VfDxEDMC6f6MANQ8AVGBc8z0LNT6fEocpaHvc7XMcTKc+35t8KODp
        cTjJnlVwYTGVdHEFOPSOFr4F2w==
X-Google-Smtp-Source: ACHHUZ67Jnv01Z/zOyUpAp9dkjkqX8yvoTR8yCwjGiZup7X6z/Xq1Sk3420wgPlDdVWG0UkP1sqHVQ==
X-Received: by 2002:a05:6402:1252:b0:514:a0e9:3deb with SMTP id l18-20020a056402125200b00514a0e93debmr4012221edw.23.1687022431641;
        Sat, 17 Jun 2023 10:20:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7c90d000000b0051879590e06sm1375373edt.24.2023.06.17.10.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:20:31 -0700 (PDT)
Message-ID: <10f01535-ab4f-b0d4-306b-a90f4ad19008@linaro.org>
Date:   Sat, 17 Jun 2023 19:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/9] clk: ralink: add clock and reset driver for MTMIPS
 SoCs
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Shiji Yang <yangshiji66@outlook.com>, arinc.unal@arinc9.com,
        devicetree@vger.kernel.org, john@phrozen.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org,
        tsbogend@alpha.franken.de
References: <20230617052435.359177-3-sergio.paracuellos@gmail.com>
 <TYAP286MB0315AB8274CDD341D49809A2BC59A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
 <e0f74bdc-3a4b-596a-5ec7-83054377813e@linaro.org>
 <CAMhs-H9M_c8+AkqUTpYeS2q7_+wBA-jhhiXj-QVXNUDmuERcOA@mail.gmail.com>
 <05e3ff33-ad4e-d2fb-dfd5-7b5265881b74@linaro.org>
 <CAMhs-H-ncXC37SAMkLfrFmpRi0ORkkCV9rQmrtmw_ndOLo+J0Q@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H-ncXC37SAMkLfrFmpRi0ORkkCV9rQmrtmw_ndOLo+J0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/06/2023 17:37, Sergio Paracuellos wrote:
>>> The case of
>>> searching for compatible is a mess since as you can see in the
>>> bindings there are tons of compatibles to search for, then (this code
>>> is common to all ralink platforms).
>>
>> Compatible is one of the ways using ABI.
> 
> Ok so it is also a broken approach, then.

What is exactly broken approach? Fetching by compatibles? Somehow many
other platforms do not have problem with that, even for multiple
compatibles. Why yours is special?

Anyway, it is not a correct way to get clocks frequency. There is CCF
for this, although maybe Ralink does not support it?

Best regards,
Krzysztof

