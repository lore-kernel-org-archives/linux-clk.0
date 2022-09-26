Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF844C07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 12:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbiIZMUv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 08:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237013AbiIZMUe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 08:20:34 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D07923CC
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 04:03:00 -0700 (PDT)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M6ltQ-1ocF8p3ZF8-008IcR; Mon, 26 Sep 2022 12:55:45 +0200
Message-ID: <f36b3ca0-68c2-7c4a-d914-cf2179cb71e4@i2se.com>
Date:   Mon, 26 Sep 2022 12:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: bcm2835: Make peripheral PLLC critical
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220926084509.12233-1-maxime@cerno.tech>
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220926084509.12233-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jtof0q6uYfQMUVDWT/1YXPL6u1GZHu+k8Rf4m6DXbdp1CuVqXxZ
 g9T2brBIZpvRe4EJqS+BKmFvJPv+BvibVnmaX0ujpw1V19VStZyqipPTZJqdwLCUU4EQBkd
 15mDghkvOwjVMx7u2KAgQ9Ffv6Ab5P5rDfmBtvjhIQLNC9tf8aNM73d4p9aEu3gr0R0/lHV
 0Bs7Dur9vxZMfX4eqh2DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:onioXO3RR9g=:Gf2IFzazbwA7TjeHXTJHv2
 2CCJCgK4xsJKyGbw2Nj/hMnUQlcHbmG1ALDNK7Ox9eUXUdcjRTQrnMsbDxCZ/LpCbtQT+3hya
 SuDIMoKlmLcC4af2ZzfGKRwTLeKyLC7MFlKCoRAW3V0Q2FyDn2vCTRY4lEZiazZ6kaIGK8H4F
 2UkLDCHn5u8MOZxiJqz2Fgz5cib6tDZd8+pg/Xkt+okejzieB7Dkf4r/Fj0U5hYJ0ib2zUAtw
 rzVYcVuI25EnV255eiI+nXYSl8e0AU+AbVNuhmsLiMDF7drN2eZ8hkDiM4KSWlVRRekRCHAsf
 Bf0KReOQ8vC+lgevkAlbge2jC8YOZgdlrtoFpwiCLVwkvvQqBg6iXul4egfl/UwxCsP4nMqY+
 3d+qHd1Ob9HPOK7QVSPDDhWRV86JHomX+P3LmZrd4odD+UaTiEBRPOTQt0fye2un2ndDXGrYi
 pGnfnonmHYRy6jAZU5MyPQCWyZv3lhka7sS89wBkQenMOm0GZ4nAk4DSzPOiAquHnXAkS1tzm
 CRQpyB9XTZExj3ZLHbtrI27xkuQpyzthfXTY26sXAed1eh5148lQuKpXc9XGxY3WJfO14kZQy
 7twitK6vQwaxIIbLLM/FAz0G7kpTivIWM+IC6UWSRzrCTk00auTIUMDHHGdxmOG4joANeyohk
 U3Is/1M3OvkVtxzzshx0jfy8BmIEVuvagsimTIo5x8kNWb+d6nbw8ZNAP9t8KWUsFKZIHlL1C
 McnLqyfQXy4mwCnTfrAV52UcQQ9J9eOe8ROxcA40eetThfut3Ad+QbKl3vMEx4aXauKJxHi2w
 SJZAipX
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am 26.09.22 um 10:45 schrieb Maxime Ripard:
> When testing for a series affecting the VEC, it was discovered that
> turning off and on the VEC clock is crashing the system.
>
> It turns out that, when disabling the VEC clock, it's the only child of
> the PLLC-per clock which will also get disabled. The source of the crash
> is PLLC-per being disabled.
>
> It's likely that some other device might not take a clock reference that
> it actually needs, but it's unclear which at this point. Let's make
> PLLC-per critical so that we don't have that crash.
>
> Reported-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
