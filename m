Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E887C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 06:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiEKGL2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 02:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242138AbiEKGLQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 02:11:16 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAAA36E0F
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 23:11:14 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mae7u-1oLGHm19Ug-00cBHb; Wed, 11 May 2022 08:10:52 +0200
Message-ID: <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
Date:   Wed, 11 May 2022 08:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220510133019.h2urxj3feponfuku@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:KK6qQjZxEf2yu4WbWOviK9H+jsfQl4NoJN7IKrLTkAWiHf+xPrH
 tM4D9Jnr5AO54RKXDN7n+XhXDuaxBPXd5sR6dNyZya7L7zZZ59Lf9yW2lSOdLpC6ZvnnXwN
 pJD7jEPPc+9n6J3DLsKvzbyk6sBLIueSNoi9TrLIzvG6Td9mhT06E5Alt0r6GUywYv4nYaL
 znRyIjf1dhMvq+HW10LjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TeGFQnCG5EQ=:x4kEUdz6ANWuoGhTPaIVqO
 9yfXB4sp7JI/ACf69z8vF3LetPXtyeN7XxLh+0uZFl1C6SX7ra3I83l7HXTX3czd5nXS8hDTg
 lz6/r3WG8X4pRIlrY1cPXpSmNZCNv2/4ytFyH9zTfhNSKD/5sESEagu5Fh4gf4XzjoOsfXmnb
 2AcgEnR5vMXGrmsNLjd4zE9+zQLDIOAdM7nmBEbY1Aq/HYVhZmksuR8AZny7s8R5sqF9WETU+
 rrr00aRZnMvvneMRArgKMfqhWw9YFTkxKS7AzYjioDoTv5VdBj2LO6W4khB/8D4gTRy16DwIR
 WDxVHBAtewy+myCJ2GLFplXFycq65+jQWrJ8p5xFYfKgFlo+qkeOss7a6mdcg6gFWRTvndHKf
 wwM5f6UtDEn5pdTfsOb805yeKSXjt7AYnFFqkDhpoNTi7UIgZIfQzf3F4AKCNlnH4yDicOCQ1
 dQ1jJQ0SD0+TUHmRjNlD8P40G0lIq/wXU7rOPU0LE6vsDz+Pf9I+h1uR9ENr26pPDDZ45p+vK
 qMf1wiJOL3kL4A2zKsRx7sRLuXP1W64tG8HZ1n9ML9JEGF7Y2EOqlCd85bmtQ22sMW+kTYq9w
 dj7JRBSKEUuNCHrrohRUhBqM1kk17hMr3/noNcQ97naETrZ29suesPwqk/FET25HM73dCyYh9
 o6oKx958yiBQxBC4xGNnJFyOSuidEjq5gG95dd100tqIqU3Xopv/oPHkg4PLjrdYbW+1yFobY
 z23UrPTtpjzy0w5J
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am 10.05.22 um 15:30 schrieb Maxime Ripard:
> Hi,
>
> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
>> May I ask what's the status/plan of  this patch series?
> As far as I know it hasn't been merged yet.
>
>> It seems it has not been merged yet, and I know we are a bit late in
>> the 5.18 schedule, but I think this is a good fix for 5.18.
> Fix for what? I don't think this series fix any bug?
This seems to be a "fix" for the Frankenstone scenario: mainline kernel 
+ vendor DT
>> And, this looks like to be a good candidate for a backport to stable
>> kernels.
> This is not going to be trivial to backmerge, it depends on 12c90f3f27bb
> that isn't marked for stable

I don't think this is a good idea to backmerge these changes.

Best regards

>
> maxime
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
