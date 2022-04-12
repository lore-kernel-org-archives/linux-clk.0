Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158F1C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 12:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350348AbiDLMqY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353628AbiDLMqB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 08:46:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAE37CB23
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 05:10:22 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u15so18254795ejf.11
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 05:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ocK32DG0lOhYPfJ1YNBplhX2lk9puVGzCXiGTBbg2g0=;
        b=zUfO7dUDyEBOMKX/21JxI4KgtNEBSIGnuEa6nfW/JP01yAr4h8QOycO5YVvWUP5Zir
         2nxISBVeQSUyW+QLzP1vR8SGrd9GPcNkuUR++POk5+s7UXEpGYCF12p31LEIV37btsmV
         fQr2zCOQoJy+LumPIH+Amqy4CB4D5gL6NTJ4L2Vbq+pmcI9Ha02nPoEfiQYSvSTKsPPD
         NSiYcHUP+eilX1Q7Ouv0uuy7tHxu7fdOqeklHLJwvkQ8eG4TAWPvF6+NJLtK5utrffIg
         YWT5BQl0WpfzHDcQACXma3BRqUrvwiaVZnaW1Q4N1KU808JiPrNNrd8HzBOQPJ1tSuvK
         6dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ocK32DG0lOhYPfJ1YNBplhX2lk9puVGzCXiGTBbg2g0=;
        b=y+MKLCzb6hyXjJ8kGD1RPdzeoL1s0pt6C2uj1+lIKg3IUiLeNWVBHGXXflAEYygI6S
         scpEqPPv8kBm7E+BVAcTFSrRgFU2MafRrg4v6vfdO/kMEQCFqSphwuAeg6T1ZL4+zbR7
         +6hPh7Nps+d1IdbezxI9J6r0rfxcWEUCt7QI+g+IZ0sNcqZdsrQvtRGJYmKoq5uUUniu
         M3gJClDH1JAxMRcG2jpPagQxIiPMak+8lmg3Uc+52ksWs7vpmJxPyAqZGSZ0VyKm5N4/
         35S+jVZP1mn79IBxTNIe8CfZsI5lxJbRbGJ8Mrivr1yn/JMQA8JiMtA5BkcDDlrDTyja
         isWQ==
X-Gm-Message-State: AOAM530dxtpWfHhBUaiNK6JprO2FMUh47vnCgrfjVbsoXS397wxZHpfe
        ECxLbREDXlp604yFq1eDI0D7rg==
X-Google-Smtp-Source: ABdhPJxUTJZ7wUn3u5SGl6HSKEmB8eB1NKh1QPd6JHIZhHDlEq/LDm25RNe5j/qDCqcQ96Akok+PsQ==
X-Received: by 2002:a17:906:4fd5:b0:6e8:76d0:e0eb with SMTP id i21-20020a1709064fd500b006e876d0e0ebmr12688399ejw.412.1649765418537;
        Tue, 12 Apr 2022 05:10:18 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w14-20020a509d8e000000b0041cd217726dsm13327476ede.4.2022.04.12.05.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 05:10:18 -0700 (PDT)
Message-ID: <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
Date:   Tue, 12 Apr 2022 14:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Conor.Dooley@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     Daire.McNamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/04/2022 14:04, Conor.Dooley@microchip.com wrote:
> On 12/04/2022 11:47, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 11/04/2022 10:59, Conor Dooley wrote:
>>> The RTC reference and MSSPLL were previously not documented or defined,
>>> as they were unused. Add their defines to the PolarFire SoC header.
>>>
>>> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
>>> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> index 73f2a9324857..3cba46b9191f 100644
>>> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
>>> @@ -1,15 +1,18 @@
>>>   /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>   /*
>>>    * Daire McNamara,<daire.mcnamara@microchip.com>
>>> - * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
>>> + * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
>>>    */
>>>
>>>   #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>>   #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>>>
>>> +#define CLK_MSSPLL   34
>>
>> You have some weird order here. Shouldn't it be under CLK_RTCREF?
> 
> Yeah numerically weirdly ordered - I grouped the clocks by type:
> MSSPLL is a pll, CPU/AXI/AHB/RTC are all dividers & the rest are on/off
> toggles. I'd've prefered to have renumbered the whole list, but that
> didn't feel like a good idea.
> 
> Additionally MSSPLL is the source for CLK_{CPI,AXI,AHB} so I put it at
> the top. I have no particular preference, so if you want them reordered
> so that MSSPLL is under RTCREF just say the word :)

Hm, are these in the same clock controller (device, not driver)? If yes,
then please order them numerically. Pretty often one binding header have
IDs for several clock controllers, so then it's a different case.


Best regards,
Krzysztof
