Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8939C636C8
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 17:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA8FE611F1
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 17:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236652AbhGOSBl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jul 2021 14:01:41 -0400
Received: from foss.arm.com ([217.140.110.172]:56906 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236602AbhGOSBl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Jul 2021 14:01:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3DDB6D;
        Thu, 15 Jul 2021 10:58:47 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0314E3F7D8;
        Thu, 15 Jul 2021 10:58:45 -0700 (PDT)
Subject: Re: [PATCH v1 1/3] clk: fractional-divider: Export approximation algo
 to the CCF users
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel test robot <lkp@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kbuild-all@lists.01.org,
        Michael Turquette <mturquette@baylibre.com>
References: <20210715120752.29174-1-andriy.shevchenko@linux.intel.com>
 <202107152356.7gQSC0vc-lkp@intel.com>
 <CAHp75VcxP6QSoATProqjqJ_kmjXr4FfjijohCyumrw_gmj904w@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9e1c1fde-fbbc-69d4-9273-192844037cd8@arm.com>
Date:   Thu, 15 Jul 2021 18:58:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcxP6QSoATProqjqJ_kmjXr4FfjijohCyumrw_gmj904w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-07-15 17:51, Andy Shevchenko wrote:
> On Thu, Jul 15, 2021 at 7:49 PM kernel test robot <lkp@intel.com> wrote:
>> I love your patch! Yet something to improve:
> 
> Definitely!
> 
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/clk/rockchip/clk.c:27:10: fatal error: clk-fractional-divider.h: No such file or directory
>>        27 | #include "clk-fractional-divider.h"
>>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>     compilation terminated.
> 
> Indeed. No idea how to compile-test this on x86.
> Let me see what I can do to avoid other issues.

Ha, the individual SoC-specific parts have COMPILE_TEST support, but the 
top-level COMMON_CLK_ROCKCHIP doesn't. That could probably be fixed.

Otherwise, you can always grab a toolchain from [1] (if your distro 
doesn't offer one already) and cross-compile - defconfig for arm64 or 
multi_v7_defconfig for arm should cover it.

Robin.

[1] https://cdn.kernel.org/pub/tools/crosstool/
