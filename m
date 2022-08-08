Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A140C25B0C
	for <linux-clk@archiver.kernel.org>; Mon,  8 Aug 2022 05:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbiHHFqp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Aug 2022 01:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbiHHFqo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Aug 2022 01:46:44 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4C2DFDF
        for <linux-clk@vger.kernel.org>; Sun,  7 Aug 2022 22:46:43 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id by6so305395ljb.11
        for <linux-clk@vger.kernel.org>; Sun, 07 Aug 2022 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xOqrRkUDHjSPuj9i4H6o8TBLA4yLo5iNF5pKCqfxIWk=;
        b=w2pEwR1FFLzI//sm8jmTeFJ4Px5SM4423RgpSEXsyRj/Z2hRJebM9KtVWuyfDGuAXe
         jcaG0Q5QCJYPvc5nmx+AW8tu4Lxa4DFmlhxoYTRGmDMS4tF5kDeZM2XICPX1m3BxzbhT
         2OljNkW/IMOcfyl1k/wx8oGs0EeiXcr9O/Y4ev7VPe2fVsnugj9zFXoWRyn9+jqOsmm2
         PcYhEjclXti52j4KCKnl+Kd3cluDe6QxlE3OZb9sy8giizcPKhRd2hMS944KIYQhxnfw
         gOXw3ww3YkOwBEv2vqXKZRoMCDRiUJVoCGp3WJaRUNwJGYYnxOlD7KVb6+w+LNi64AcA
         Ak+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xOqrRkUDHjSPuj9i4H6o8TBLA4yLo5iNF5pKCqfxIWk=;
        b=RraHtEEPQylQPQX17LZSMVeYF67whrR60iRHPRTyP1P/tDqcLxOJVPDWeNOTErE2p1
         v8yLzJ6LiH8LirGKhpykpQrD/kU6iX+xTQQornVNHvus++lO02D+A78xMpuWZUlLkdO/
         cOvilIMAT4oX4XFAYv/pRv319ckXW3/tn5jr3MGFWzdqU55xxTo8ECDHsTOI7L1S8LYy
         tgcjyFfhPtKdiT0EewDO2kEMbGC/p/9/pVgbRT7YVys0ElElkBGpUm4Q0zF3rEM7cuT9
         KHx3eeocxOOqNtYE+ET35A4DpFkMdhj+dH41kHhfKyVQEm5sdsqt8DYek25P2m5bCoFC
         Ityg==
X-Gm-Message-State: ACgBeo3Cs7NbESVOdy+L6kI1IyZF+FeRg0URn5HRD9mgMEnvpkDzYMvU
        KgXa96lS9IVLwLts61dtrOJ6eg==
X-Google-Smtp-Source: AA6agR5JYOLMzw/XuGStP7L2CF8XiWX/3bJ6dgIuD4q16mY6f7h3TcfBzWO5PAF/CuZhlkN1TZO6eA==
X-Received: by 2002:a2e:7e0a:0:b0:25e:63f2:bbb0 with SMTP id z10-20020a2e7e0a000000b0025e63f2bbb0mr5699446ljc.77.1659937601371;
        Sun, 07 Aug 2022 22:46:41 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id o14-20020a05651205ce00b0048ad0ad627asm1301868lfo.128.2022.08.07.22.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 22:46:40 -0700 (PDT)
Message-ID: <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
Date:   Mon, 8 Aug 2022 07:46:39 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 17:17, Sean Anderson wrote:
> 
> 
> On 8/5/22 2:53 AM, Krzysztof Kozlowski wrote:
>> On 05/08/2022 00:05, Sean Anderson wrote:
>>> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
>>> witn assigned-clock* to specify a particular frequency to use.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>>
>>> Changes in v4:
>>> - New
>>>
>>>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>>>
>>> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
>>> new file mode 100644
>>> index 000000000000..f5b955658106
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>
>> This should be dual license.
> 
> This is just matching what the majority (263 out of 326) clock dt-bindings headers do.

Then please license it just like bindings, so dual license with BSD.

> 
>>> +/*
>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>
>> It's confusing to see personal copyrights with company email. Either the
>> copyright is attributed to your employer or to you. If to you, use
>> private email.
> 
> I hold the copyright, and I would like inquiries to be directed to my work
> email (as I don't have this hardware at home).

OK, I guess I won't be the only one confused :). This entry here is not
parsed for any tools and only sometimes people look at it. The questions
are directed via entry in maintainers file or via git history, so you
can put company email just there.

> 
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>> +
>>> +#define LYNX10G_CLKS_PER_PLL 2
>>> +
>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>
>> These do not look like proper IDs for clocks for bindings. Numbering
>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>> you bind here?
> 
> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
> This matches the notation used in the reference manual.

This is a file for bindings, not for storing register values. There is
no single need to store register values (offsets, indexes) as bindings
as it is not appropriate. Therefore if you do not use it as an ID, just
remove the bindings header.

> Although for
> convenience, this driver considers the PLLs to start at 0 instead of 1.

Best regards,
Krzysztof
