Return-Path: <SRS0=Myif=3D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E67C33C9E
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 19:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73A4B24672
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 19:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgANTxc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jan 2020 14:53:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:55893 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgANTxb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Jan 2020 14:53:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jan 2020 11:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; 
   d="scan'208";a="242596404"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 11:53:23 -0800
Subject: Re: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
To:     Joel Stanley <joel@jms.id.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
References: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <255b53d2-d4b5-8bc0-393b-a2f531a98fc1@linux.intel.com>
Date:   Tue, 14 Jan 2020 11:53:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf0Oa62BsNOQ55rqAp_a=V-_9bm1c4nu_+Oo5zB=2+zpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Joel,

On 1/13/2020 10:15 PM, Joel Stanley wrote:
> On Mon, 13 Jan 2020 at 21:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> BCLK for PCI/PCIe bus should be enabled always with having the
>> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
>> initcall phase as an unused clock, and eventually it causes
>> unexpected behavior on BMC features that are connected to the host
>> through PCI/PCIe bus.
> 
> This is true for systems that have PCIe connected. There are systems
> that do not, and in that case we don't want to have the clock enabled.
> 
> Are you doing this to support the case where the PCIe device not load
> a BMC driver? (eg for host VGA use). If not, then you can have the
> driver you're loading request the BCLK.
> 
> If this is for the host VGA device, then you will need to come up with
> a mechanism that makes the enabling of this clock depend on the device
> tree.

Is there any way to enable clock by just adding a node in device tree?
Do you want me to add a simple driver module for host VGA just for
enabling BCLK?

Thanks,

Jae

> Cheers,
> 
> Joel
> 
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/clk/clk-ast2600.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
>> index 392d01705b97..42bfdc16bf7a 100644
>> --- a/drivers/clk/clk-ast2600.c
>> +++ b/drivers/clk/clk-ast2600.c
>> @@ -64,7 +64,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>>          [ASPEED_CLK_GATE_GCLK]          = {  2,  7, "gclk-gate",        NULL,    0 },   /* 2D engine */
>>          /* vclk parent - dclk/d1clk/hclk/mclk */
>>          [ASPEED_CLK_GATE_VCLK]          = {  3,  6, "vclk-gate",        NULL,    0 },   /* Video Capture */
>> -       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  0 }, /* PCIe/PCI */
>> +       [ASPEED_CLK_GATE_BCLK]          = {  4,  8, "bclk-gate",        "bclk",  CLK_IS_CRITICAL }, /* PCIe/PCI */
>>          /* From dpll */
>>          [ASPEED_CLK_GATE_DCLK]          = {  5, -1, "dclk-gate",        NULL,    CLK_IS_CRITICAL }, /* DAC */
>>          [ASPEED_CLK_GATE_REF0CLK]       = {  6, -1, "ref0clk-gate",     "clkin", CLK_IS_CRITICAL },
>> --
>> 2.17.1
>>
> 
