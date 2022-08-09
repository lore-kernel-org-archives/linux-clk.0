Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2D4C19F2D
	for <linux-clk@archiver.kernel.org>; Tue,  9 Aug 2022 05:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbiHIFWB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Aug 2022 01:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiHIFWA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Aug 2022 01:22:00 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF641EAC9
        for <linux-clk@vger.kernel.org>; Mon,  8 Aug 2022 22:21:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y23so11872684ljh.12
        for <linux-clk@vger.kernel.org>; Mon, 08 Aug 2022 22:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w/IFf/K/9OkURHHOs9WHITZ5E+GducqFMehZENmcMms=;
        b=Q45jxuuCA3JYTRwNdbj8vKCeun3j9XXgjpX+PbR9MLO9z73W9A+o+9UIympLc/+Yrw
         awg9LkC1NBelWb+6zWghPSRUAM1OGNMqVnaHivQie203kYO6tgIw6ermK1m+ZNMp+dbK
         CKvXXs0uDwNsMsufqOZo59ZZG5l7uXkk1QIjSRJmu3EkdB9kaA16qyy2HjtIVW7GRAE1
         0g3XAjMaPKBOakKHQSfOGuD15dVATMVncTwRIj2Iuh831tepvdNcVjlpXkShKsy4D8kI
         igb6EVvXurEZcPdc2kdPuo7M1yjdAYMZsvbnzNAgMHgFyXQU97gmFVpIMvmT/YDPM6ml
         gLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w/IFf/K/9OkURHHOs9WHITZ5E+GducqFMehZENmcMms=;
        b=HUr99lKpDTuIKL+a7Fu47Ee6wBRGwAWx82S7Pcd0Vol7RXcPpEH3zns3CpEU0bGWTs
         Q0x7d5CjTYk52nI4NUoi/vRD/Nvv77fssBTVjAJiiBYVXDgH8/TvQ/CovfgdTRSg10pi
         QIiS7H+othRWCn2+19cs+CkurLZhf/5gi2wwnJb+4QFF0P75MwYIPtsgJ9aWnpqn1g/o
         vIbvae/spBDJjlsNTHRR9Pa7H5kKaUOpZh0mZH7JXGr3Hb4SgkWexlBDKLiKfnyKLkx/
         PJYC+sov4RAA/KNi5KsjUyArOmMmVBD0p8BsowlyVXQa13Z6CL88obh2m+D87iUNAxCE
         AHYA==
X-Gm-Message-State: ACgBeo1X+xHH31Buq9ZQVDJJB38HEFwquxTY6OBSFgM5d7apiyGEJyEj
        XkIOC2s39kYw4xkAHjxb7ONDSw==
X-Google-Smtp-Source: AA6agR4nyxXV6UENxnka0n+jYHLHQ8Snp/LpQLG2xkyn/vQhrsmbZO2MAsK8dD6JtMDOLbg2HkoREg==
X-Received: by 2002:a2e:918d:0:b0:25e:c884:6a96 with SMTP id f13-20020a2e918d000000b0025ec8846a96mr4178935ljg.157.1660022516960;
        Mon, 08 Aug 2022 22:21:56 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id cf40-20020a056512282800b0048a8f119e7esm1624381lfb.233.2022.08.08.22.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 22:21:56 -0700 (PDT)
Message-ID: <a387164a-d42c-fc1e-529c-6000aa2db33e@linaro.org>
Date:   Tue, 9 Aug 2022 08:21:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
 <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
 <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
 <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04b08e1c-4af2-581e-7be5-96c5b7b00ae5@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2022 18:16, Sean Anderson wrote:
> 
>> This entry here is not
>> parsed for any tools and only sometimes people look at it. The questions
>> are directed via entry in maintainers file or via git history, so you
>> can put company email just there.
> 
> As I understand it, the email is simply informative. There are literally
> hundreds of examples of mixing a "personal" copyright with a company email.
> It is easy to find if you grep. If you are so opposed to it, then I will
> remove the email and simply use my name.

No, no problem for me.

> 
>>>
>>>>> + */
>>>>> +
>>>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>>>> +
>>>>> +#define LYNX10G_CLKS_PER_PLL 2
>>>>> +
>>>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>>>
>>>> These do not look like proper IDs for clocks for bindings. Numbering
>>>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>>>> you bind here?
>>>
>>> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
>>> This matches the notation used in the reference manual.
>>
>> This is a file for bindings, not for storing register values. There is
>> no single need to store register values (offsets, indexes) as bindings
>> as it is not appropriate. Therefore if you do not use it as an ID, just
>> remove the bindings header.
> 
> This *is* just for IDs, as stated in the commit message. The above example
> was only to illustrate that the clock controlled via the PLL1RSTCTL register
> (among others) would have an ID of LYNX10G_PLLa(0).
> 
> If you doubt it, review the driver.

Indeed, thanks. Except the driver, where is the DTS user of these
bindings? It's neither in bindings example, nor in the DTS patches.

Best regards,
Krzysztof
