Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F65BC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 18:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiBYS4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 13:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiBYS4H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 13:56:07 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AA41DA01F;
        Fri, 25 Feb 2022 10:55:32 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D8B55837F6;
        Fri, 25 Feb 2022 19:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1645815330;
        bh=8KPXkNDxqyZ3eBWxu5d/ZoPP8rsdRQhtEv74YlBXzdw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Yo+w4q/jLgtWzZ4isxb+s7i97qlSPkYd+da5fM5vfp8lSxOESEI11eZqxxsNQ+SfE
         gIVD/5ryZ4JGkG+4x+b+VKqus9UWAXSkNfukg+r0jJCldcHeUj2PoB+HbtrlmJMZgU
         vx6Pwwu2SI9YlQD5MEezESoWIik3+ZCHDkiy8VzUleYzOWlknPAuBUJj/1HyFcio+A
         AUtOGf9509qkqmm0FUEsrjUtgb7qXAH7tfdEsQXewKuSLnqh4krE0as6VEkxE+R56B
         WtLkeRik+rNI+hGZqTZ65e5o+QuawjSDYGtcok1kDJL/46azni8SlBYaR8Tb2YIm/D
         SE/SgorGyne4g==
Message-ID: <a405dea6-800d-471b-1992-aa271175e795@denx.de>
Date:   Fri, 25 Feb 2022 19:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: clk: rs9: Add Renesas 9-series I2C
 PCIe clock generator
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
References: <20220219015003.507601-1-marex@denx.de>
 <YhkkLTqc8igZ9kzh@robh.at.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <YhkkLTqc8igZ9kzh@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2/25/22 19:47, Rob Herring wrote:

[...]

>> +  renesas,out-spread-spectrum:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [ 100000, 99750, 99500 ]
>> +    description: Output clock down spread in pcm
> 
> pcm?

per cent mille , 1/1000th of percent.

https://en.wikipedia.org/wiki/Per_cent_mille

[...]
