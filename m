Return-Path: <SRS0=l8GQ=3E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBFCC32771
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 20:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2861124679
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 20:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgAOUVe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jan 2020 15:21:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:50554 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgAOUVe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jan 2020 15:21:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 12:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; 
   d="scan'208";a="225710570"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga003.jf.intel.com with ESMTP; 15 Jan 2020 12:21:33 -0800
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To:     Joel Stanley <joel@jms.id.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
 <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
 <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <794bcd23-185a-08c1-cdb1-9d7ca65bcb1e@linux.intel.com>
Date:   Wed, 15 Jan 2020 12:21:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfevBQxdAanN5QjiUv8KKevetjKP7cbr3tuL=mrULjttg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/14/2020 9:43 PM, Joel Stanley wrote:
> On Tue, 14 Jan 2020 at 19:53, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel,
>>
>> On 1/13/2020 10:15 PM, Joel Stanley wrote:
>>> On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>>>
>>>> BCLK for PCI/PCIe bus should be enabled always with having the
>>>> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
>>>> initcall phase as an unused clock, and eventually it causes
>>>> unexpected behavior on BMC features that are connected to the host
>>>> through PCI/PCIe bus.
>>>
>>> This is true for systems that have PCIe connected. There are systems
>>> that do not, and in that case we don't want to have the clock enabled.
>>>
>>> Are you doing this to support the case where the PCIe device not load
>>> a BMC driver? (eg for host VGA use). If not, then you can have the
>>> driver you're loading request the BCLK.
>>>
>>> If this is for the host VGA device, then you will need to come up with
>>> a mechanism that makes the enabling of this clock depend on the device
>>> tree.
>>
>> Is there any way to enable clock by just adding a node in device tree?
>> Do you want me to add a simple driver module for host VGA just for
>> enabling BCLK?
> 
> Okay, so this is for the case where we lack a BMC driver.
> 
> One option would be to do as you suggest, adding a simple driver that
> claims essential clocks.
> 
> Another could be to add some extra properties that clock driver parses
> and enables the clocks.
> 

Looks like it needs changes in clk-ast2600 module for checking of
'clock-critical' device tree property. Let me try to make it.

Thanks,
Jae
