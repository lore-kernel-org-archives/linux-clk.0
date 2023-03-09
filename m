Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D43C61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 16:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjCIQbT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Mar 2023 11:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjCIQa7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 11:30:59 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C88CF31EB
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 08:22:51 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id i34so9207141eda.7
        for <linux-clk@vger.kernel.org>; Thu, 09 Mar 2023 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678378928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NqvKKF1/5Sr9cSeBp3LG9BN8Pwq+v68J8bWTsI4jJg=;
        b=QTvJ98E20c+whXIK1A25KzntecbLcw8Z9rV2LIhSszs8b0RfdGsBdxshW/k5wQtZIU
         rQGN4vxWmuFXShF5LVnJkttq9A29VWYv4UuajrAWm6Ywv9OXIG11QVu7lbl/sAUYZDk5
         DRn5YqSKtbCtuHwlws7AorKfQmyH0UGROIDnrftXqMtPXiU6hCXDvUcM63b1P9A1VidX
         KO0Z9yzdL/P4zdK0uSeE92LH2bkHppnqlXflxT2tS7mFPc1ocrRYA8xDZOWRilz6baZ7
         9P22Mm3Xe+X8UCfZd9J7vCGR3i9VTZS8w/C/IvWpWlMWV0zMzJrQjzZwIArTxZUEoa/3
         yw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678378928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NqvKKF1/5Sr9cSeBp3LG9BN8Pwq+v68J8bWTsI4jJg=;
        b=tb6EZCpvdyv5Rcj+bZMWR/S9WqiC0Jcjw1wNsopTZyVcul2OtHWQqaCykMfnjA/6gO
         3E+66lDGdM9MBK1NxN7l495QRMMf58t0fvgfAKJGyH71lZ8pb2g6ACcx2LeaQKNKtcHj
         FmmnJ0VsNhnLEMuU5IzSJToJ5Ly0zxBQPkjHLVecun0Gx9JLr+Z1W5lMwFi/Fgh63W6N
         93Bwj9qnZA6NBGbH0iMQiW0SU4qFQYMxr85qN/uubQQvGfUpTAQLLRQVurEYKS4DKYv6
         3uWmvCV3C9MNq3XkzahwZ7D8AIBRKsP7foUaPd/FEsVapyCzFqCYfIGz4Q0vNUHlfdC4
         d4Gg==
X-Gm-Message-State: AO0yUKU8qqLXg5mPgrX/AHqiKTr86MKiiuJJn0WyxkXD61Rkx8TA7tcM
        5xocNIM4w6KE3amdbpVO5zBHcvb1+LT5IOwtN8o=
X-Google-Smtp-Source: AK7set+0+hVReHs+IHysu2AKb0lI2te4fkmcbvW9115rN+E3BwDClfzs0ltkvKRGX09g2B1KQkl3DA==
X-Received: by 2002:a17:906:4e15:b0:883:3299:91c8 with SMTP id z21-20020a1709064e1500b00883329991c8mr22107497eju.55.1678378357376;
        Thu, 09 Mar 2023 08:12:37 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id g10-20020a50d0ca000000b004bc9d44478fsm9827584edf.51.2023.03.09.08.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 08:12:36 -0800 (PST)
Message-ID: <38b0c1f2-fb0e-722b-19f5-c94796ce0185@linaro.org>
Date:   Thu, 9 Mar 2023 17:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 1/2] dt-bindings: clock: add loongson-2 boot clock
 index
Content-Language: en-US
To:     zhuyinbo <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
References: <20230307115022.12846-1-zhuyinbo@loongson.cn>
 <692a62da-a9a1-fa23-6e24-723d73c3a423@linaro.org>
 <5e9b3bd5-d885-6237-5e14-2becb3c956cc@loongson.cn>
 <31e2a67a-c046-9501-80de-e754ed450195@linaro.org>
 <ace5159b-ebbd-7805-518c-ed3d39e4793e@loongson.cn>
 <b2f9cd15-b303-882a-d4e0-36d1f6d155a8@linaro.org>
 <eca81d44-2513-8002-980d-755af32f36c4@loongson.cn>
 <882bd054-9c3e-1b26-72a5-89ad92e21a79@linaro.org>
 <817a65e9-b605-4bc0-2ff5-fc7f5db8585c@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <817a65e9-b605-4bc0-2ff5-fc7f5db8585c@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/03/2023 13:44, zhuyinbo wrote:
> 
> 在 2023/3/9 下午2:25, Krzysztof Kozlowski 写道:
>> On 09/03/2023 02:43, zhuyinbo wrote:
>>> 在 2023/3/8 下午6:38, Krzysztof Kozlowski 写道:
>>>> On 08/03/2023 10:24, zhuyinbo wrote:
>>>>>>>> That's an ABI break and commit msg does not explain it.
>>>>>>> you meaning is that need add a explanation in commit msg that why
>>>>>> You need good explanation to break the ABI. I don't understand the
>>>>>> commit msg, but anyway I could not find there justification for ABI
>>>>>> break. If you do not have good justification, don't break the ABI,
>>>>> The commit msg is the patch commit  log,  and I maybe not got it about
>>>>> break the ABI.  You said about "break the ABI"
>>>>>
>>>>> is whether is location issue about "LOONGSON2_BOOT_CLK"?   if yes,   the
>>>>> LOONGSON2_BOOT_CLK was placed
>>>>>
>>>>> after LOONGSON2_PIX1_PLL that is due to their clock parent is same.
>>>>> and I whether need add this explanation
>>>>>
>>>>> in patch commit log description?
>>>> Unfortunately I do not understand single thing from this.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> The patch commit log description is patch desription.  as follows:
>>>
>>>
>>> commit 592bc2b4106d787ea166ba16bfde6b3101ab1a8a
>>> Author: Yinbo Zhu <zhuyinbo@loongson.cn>
>>> Date:   Tue Mar 7 17:18:32 2023 +0800
>>>
>>>       dt-bindings: clock: add loongson-2 boot clock index
>>>
>>>       The Loongson-2 boot clock was used to spi and lio peripheral and
>>>       this patch was to add boot clock index number.
>> I cannot understand this either.
> I will rework commit msg .
>>
>>>
>>> and your advice is "That's an ABI break and commit msg does not explain it."
>>>
>>> I got it  from your advice that was to add a explanation about
>>> LOONGSON2_BOOT_CLK's
>>>
>>> location issue in patch description, right?
>> ABI break needs justification, why do you think it is fine or who
>> is/isn't affected etc. Your commit msg does not explain why ABI break is
>> okay. It doesn't even explain to me why you need it.
>   #define LOONGSON2_DC_PLL                               3
>   #define LOONGSON2_PIX0_PLL                             4
>   #define LOONGSON2_PIX1_PLL                             5
> -#define LOONGSON2_NODE_CLK                             6
> -#define LOONGSON2_HDA_CLK                              7
> -#define LOONGSON2_GPU_CLK                              8
> -#define LOONGSON2_DDR_CLK                              9
> -#define LOONGSON2_GMAC_CLK                             10
> -#define LOONGSON2_DC_CLK                               11
> -#define LOONGSON2_APB_CLK                              12
> -#define LOONGSON2_USB_CLK                              13
> -#define LOONGSON2_SATA_CLK                             14
> -#define LOONGSON2_PIX0_CLK                             15
> -#define LOONGSON2_PIX1_CLK                             16
> -#define LOONGSON2_CLK_END                              17
> +#define LOONGSON2_BOOT_CLK                             6
> +#define LOONGSON2_NODE_CLK                             7
> 
> after add my patch, if dts still use above macro and not cause any 
> issue. but
> 
> if dts not use macro rather than use original clk number index that will 
> cause a uncorrect clk,
> 
> eg.
> 
> -#define LOONGSON2_NODE_CLK                             6
> 
> +#define LOONGSON2_NODE_CLK                             7
> 
>   this issue is that what you said about  "ABI break",  isn't it ?
> 
> 
> About your advice and question and I will use following description as 
> patch  commit msg,  what do you think?
> 
> 
> dt-bindings: clock: add loongson-2 boot clock index
> 
> The spi need to use boot clock and this patch is to add a boot clock 
> index about  LOONGSON2_BOOT_CLK
> 
> and the LOONGSON2_BOOT_CLK was placed in after LOONGSON2_PIX1_PLL that 
> due to
> 
> LOONGSON2_PIX1_PLL,  LOONGSON2_PIX0_PLL , LOONGSON2_DC_PLL and 
> LOONGSON2_BOOT_CLK
> 
> has same parent clock.  In addition, the Loongson  code of the community 
> is still in the development stage,
> 
> so this patch modification will  not cause uncorrect clk quote issue at 
> present.

So the reason is same parent clock...? That's not much. These are IDs
and parent clock do not matter. Drop the ID change.

Best regards,
Krzysztof

