Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB5AC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 10 Jul 2022 11:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGJLMd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Jul 2022 07:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGJLMc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Jul 2022 07:12:32 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BD4BCB0
        for <linux-clk@vger.kernel.org>; Sun, 10 Jul 2022 04:12:31 -0700 (PDT)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQMm9-1nxcqC0jAn-00MIWJ; Sun, 10 Jul 2022 13:12:05 +0200
Message-ID: <ce3e2e21-dc54-1f77-fdbb-6d3627917830@i2se.com>
Date:   Sun, 10 Jul 2022 13:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
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
X-Provags-ID: V03:K1:ve7+uNEsWdx8eAPmtn/EJaR05I02baYO5xii/5w0r9BM+lPPf2Z
 sXvmqzcHujcxaVHUgTyE+WQzf169qrHT8SHbfOq5pxAIP4tX7ft1eMcTIExZESIQsRoUTIE
 drZjbi4lSV1JTpGGnHKDuZ30QU2ctHL4kh6R3Kj35RVSK6Cv9d1TXDwcgY4yByRbVeh+mdN
 uEHJdilY5I8pMh7w0SIhA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kiBFckYWZgw=:cH+MKWdkS/HxjsTMOdfNrb
 kPwYDVczJAUFpn58BqWwRv3D27LcK+G2P2742z3SXq7Q/d1sP46kUs0sJ7k9UwM06J4u/MTux
 slfOuLXwavD2sdRrMev54ipBZvJSP1dLJSHrbTRid97sMgwny/2qS2YknXaDxcPb8arK+OPWr
 njRzc5p0m2/xBPM0fcddRKMkZUwmJ7xRvlnLma0tKFKbRwnj60kVdaIgdBgtrEmDdGr35x/y/
 h3sCqsHY+kBOv1VCoRxN5FH9UjtS16mxmhsaiHLGKTdmqfcBoTtZC70yN2KrkCRmUjfe8TCOY
 L1V0MavoROHEDwOJo3y+dMNSIHssioOCoUE6OKTI7XCLnQKlrJDia5K/iD/dGyqpWWBUieHFS
 GOOsBFqtM6HIe9bHmUVAjwGDWVlTatDo6cBbcwRCbK2a/wU5N32XKPGU8jrclMHZdHt7IXkZJ
 3DPRkYxCo8Geo41d1L5gni5hc5i49eSaRk/St6Y5yRPI/fNROAAKzUPSfk5e1KxkYr40ELwvF
 GEusoEm7ZPXs7JsxuKd7HzmyFC1uGC7ibcZpFXm3eqd6O35eFizB4kxq5/2S73xo3jVUVuGzB
 J+0QQ6WnZR/o9m2U2wRI826JjGFRNWB6cBayj8e/lesAo4lCig7q8R1j9s4bDu42mojo6eUaS
 wmif+by/9anVp/arcu1HEzVsiIzAmT48wL18RX41jV7L7q2xIq9ei2I9pxufJdBAt7P43VURU
 9NmlUvzhdDGmXeEHNEQYsdVhMjl/1pYk6V5R3nZOrQLcv2ERvQIw8pNBjtU=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

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

i think this series (or at least parts of it) is a workaround for this 
issue [1].

We better fix the root cause of the potential out of bounds access in 
clk-raspberrypi properly. I will send a patch soon.

[1] - https://github.com/raspberrypi/firmware/issues/1688

>
>> And, this looks like to be a good candidate for a backport to stable
>> kernels.
> This is not going to be trivial to backmerge, it depends on 12c90f3f27bb
> that isn't marked for stable
>
> maxime
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
