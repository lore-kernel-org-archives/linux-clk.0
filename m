Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999A1C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 12:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiI1Mxc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 08:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbiI1MxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 08:53:18 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8836599B7A
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:53:15 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E28F7849E9;
        Wed, 28 Sep 2022 14:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664369593;
        bh=tR9uBu4aNHXGMc9XXv82PVawxmHM282+iQPcFbVF8gA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=na8iG5CYsLat+qxuk1KglNedL/8MZA32yYPMj26rU/7j8I/EuNTHl/WBX7l5mlo+p
         C4+SMPrLs4o0VnbbY+gBlSeMk65Rbi254GJrvdagVXzq7KMju6UO8bUnLHfwfqUR1d
         dNVa78tI9V9tApAUG+wxiZ+C9O9VBWdL0wQezkV2mbSAi2QItKxOVfGC9dCagIJ6BR
         6BwqrkpI6XkfYUiQABkC68+aH2HkUV+QbigTyvbWEWW0+HCemJdf2a0nEwmVvs5ai7
         Lq5iO9V7dUrpJBX2MYEFygJAFtJbnisk01v7ZGPYVZh+jyMQ25THrGESVZl1G/SHn/
         KyQLat45sZrUw==
Message-ID: <7acfab7e-27d7-d2f6-22e8-00042193ef87@denx.de>
Date:   Wed, 28 Sep 2022 14:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] clk: rs9: Fix I2C accessors
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220924164933.393649-1-marex@denx.de>
 <4745081.GXAFRqVoOG@steina-w> <9a13e3ab-6541-7a24-e231-64faeac129c6@denx.de>
 <13108964.uLZWGnKmhe@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <13108964.uLZWGnKmhe@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/28/22 09:32, Alexander Stein wrote:
> Hi Marek,

Hi,

>>> Putting all together the regmap debug output is like this:
>>> $ cat /sys/kernel/debug/regmap/1-0068/registers
>>> 0: ff
>>> 1: 06
>>> 2: ff
>>> 3: 5f
>>> 4: 00
>>> 5: 01
>>> 6: 04
>>> 7: 01
>>
>> What about option 3 -- disable the cache altogether ?
> 
> Sure this works as well.

I sent a patch like that for now, let's revisit the cache topic in a 
separate patch.

>> I can imagine since the chip is configured with like 2-3 I2C writes on
>> boot and then never again written to, that might be the simplest approach.
> 
> I'm thinking about disabling unused clock outputs later on, so dynamic bit
> flipping at runtime would be required. For this case cache usage seems
> reasonable. For now disabling is ok, IMHO.
> 
>>> This is actually a 9FGV0441 using some queued patches on my side.
>>
>> Nice, do you plan to send a binding update for this one ?
> 
> Sure, but as the DIF bit definition is device specific, I want to settle on
> general access first.

ACK
