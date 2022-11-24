Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8208C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 24 Nov 2022 13:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiKXNxn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Nov 2022 08:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiKXNxm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Nov 2022 08:53:42 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36DBE0DEF
        for <linux-clk@vger.kernel.org>; Thu, 24 Nov 2022 05:53:40 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so2673208lfv.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Nov 2022 05:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8lbUu6OFIl7NccN7UG8ZKYXFkiaHI1XkyswdMkXj8c=;
        b=K2uzXr8LtHcvWqkJF/JEwxLR4ecnpLaumkSgW+1rexxqTYcEX168nhUEN42HSfKa3X
         Sg+sPlGWdwIFNLZQz08CpI0HuwCJIm5FsNOEZWzPtJ1B5Fbv7FaruT4Ug4te5DawuUNN
         +SkMioMJ+Zw0mMDBxLXVd19ukHNS/IeSPcsJ3mmGxnPAO8off4DVFCuP67sbNpreF2hs
         qlYnXu7SBmzgNqSwWqDRDbzmdIFkFD5NpMC21VOcaOSnaKc7HIMUhbqhxCQs/rGNx5Yz
         mhyFbzywSkD45rLongGT0erhSbo+hrzwcIKNzdO3iegJwqA0GosTDwZV2c4DaGDwQiLi
         6KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8lbUu6OFIl7NccN7UG8ZKYXFkiaHI1XkyswdMkXj8c=;
        b=uTY7TY2vwwtiRvKSrODrjv1AUfx09DI4npvu3yblk44U0Q+NGDjINDmOUBnvxtuIYZ
         Sz2XfQ4D14bVOWspTf5bmsmCObNAdhaYHnWHtZ8Ps3z8ocCbckaAA2mvJ4ljuWhQ6CJM
         9g1bfhhKjyiJ8gWlgUqn1yxGdazV1R8h7Wg8c0Wy6oPZL68UQV8PKcp+UgyrCNaORjnL
         7D/ZiOJWhvl437/4CemhGh0E0O5JiZJ5BvxiCznmaig2jI8H1j/hUvDGN+Tv9FtAk/xf
         NEW3PZMFeM1xdCMpzFzfmC/g5VW9Wf4KJEPdRXiq+D1yq/n8mfN4OAIi/mX47crgFT9h
         BqXA==
X-Gm-Message-State: ANoB5pm/DBs9BkStvZUzneDLIFSjhF98fFo8W42Rr6zRP/DNQmP5mN8l
        /2eLCADYVkWeqFifP2ojcZTCYdS5BHSnSu7F
X-Google-Smtp-Source: AA0mqf6t/T0KZpzUbtEltL3VTN7eFSbYPD/4fl64zlMo7LAQqsCI5aeCjioKcCcT900So7/113ZPcw==
X-Received: by 2002:ac2:54a8:0:b0:494:7541:9dee with SMTP id w8-20020ac254a8000000b0049475419deemr10255586lfk.680.1669298019233;
        Thu, 24 Nov 2022 05:53:39 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z17-20020a056512371100b004b4bae1a05asm124794lfr.293.2022.11.24.05.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 05:53:38 -0800 (PST)
Message-ID: <23bd1410-bef7-65cb-be51-476efc832740@linaro.org>
Date:   Thu, 24 Nov 2022 14:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org, michal.simek@xilinx.com,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
References: <20221122121255.6823-1-shubhrajyoti.datta@amd.com>
 <20221122121255.6823-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122121255.6823-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/11/2022 13:12, Shubhrajyoti Datta wrote:
> The Clocking Wizard for Versal adaptive compute acceleration platforms
> generates multiple configurable number of clock outputs.
> Add device tree binding for Versal clocking wizard support.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> 
> ---
> 
> Changes in v3:
> rename the clocks to clk_in1 and s_axi_clk dt
> 
> Changes in v2:
> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
> 
>  .../clock/xlnx,versal-clk-wizard.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
> 

We pointed out last time that you already have the bindings for it
(xlnx,clocking-wizard.yaml). Don't duplicate it. I don't think this
deserves new bindings and new driver.

Best regards,
Krzysztof

