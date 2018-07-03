Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:20175 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932105AbeGCOFq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jul 2018 10:05:46 -0400
Subject: Re: [PATCH v2 2/2] clk: meson-axg: add clocks required by pcie driver
To: Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20180702213118.19222-1-yixun.lan@amlogic.com>
 <20180702213118.19222-3-yixun.lan@amlogic.com>
 <1530609862.2900.187.camel@baylibre.com>
 <7c8b47a9-67bc-b685-8c90-084299631fb0@amlogic.com>
 <1530615672.2900.205.camel@baylibre.com>
CC: <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Jianxin Qin <jianxin.qin@amlogic.com>,
        <linux-clk@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <f23be559-4a64-7fbd-a7f7-4bdc2b6aabac@amlogic.com>
Date: Tue, 3 Jul 2018 22:05:43 +0800
MIME-Version: 1.0
In-Reply-To: <1530615672.2900.205.camel@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jerome

On 07/03/2018 07:01 PM, Jerome Brunet wrote:
> On Tue, 2018-07-03 at 18:17 +0800, Yixun Lan wrote:
>> I'm seeing you already applied this patch, so would you like to
>> fix/amend the patch for me, or want me send another patch version?
>>
>> thanks
> 
> It means that I amended your patch before applying it.
> 
> .
> 

Sorry, I'm asking..

because as I checked the clk-meson[1] tree, branch  - next/drivers,
it's not updated which it's still my original version..

Yixun


[1]
https://github.com/BayLibre/clk-meson/commit/cd1c7b71d14f197c404533c085b83817c08bf516#diff-c9327329286e3a07f2ddbe69649ec963R714

