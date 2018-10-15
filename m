Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E248C04AA5
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 007E1208E4
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aYnezPBB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007E1208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbeJOXoY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 19:44:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:52822 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbeJOXoY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Oct 2018 19:44:24 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9FFwOqf027979;
        Mon, 15 Oct 2018 10:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1539619104;
        bh=hMYOcYkEf7TmbhjGxOi7UuwxaJlHDxQK96z/7dkEqX0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aYnezPBBYQM9giZ0236hDfIxsepN2UF9+wE42yXMuiSvHc67nMoEeYAchS8Mjxbps
         iVmZ2VgEaOuee1/spHVA8z4ZpeEJsuFH+5SM3dXWuHt2TPsviNdOfVT0NUwXewkfpS
         8wQtUOFKVd0K3/5hiGOGVpoTkmRMlML3cOpUFCNg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9FFwOS7002660;
        Mon, 15 Oct 2018 10:58:24 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Mon, 15
 Oct 2018 10:58:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Mon, 15 Oct 2018 10:58:24 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9FFwL9Y017853;
        Mon, 15 Oct 2018 10:58:22 -0500
Subject: Re: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes
 under a cm node
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <1535728027-24573-5-git-send-email-t-kristo@ti.com>
 <153937953037.5275.784660292030040696@swboyd.mtv.corp.google.com>
 <CAL_Jsq+68yemY+6qxv7DrfHkdqiCQTOuCiLBtrWgYE+CPd1iGQ@mail.gmail.com>
 <153938180944.5275.885829910555690983@swboyd.mtv.corp.google.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <7163c8e6-9bd5-194c-c6f9-4ecfe83a214d@ti.com>
Date:   Mon, 15 Oct 2018 18:58:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <153938180944.5275.885829910555690983@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/10/18 01:03, Stephen Boyd wrote:
> Quoting Rob Herring (2018-10-12 14:45:08)
>> On Fri, Oct 12, 2018 at 4:25 PM Stephen Boyd <sboyd@kernel.org> wrote:
>>>
>>> Quoting Tero Kristo (2018-08-31 08:07:00)
>>>> @@ -492,19 +501,35 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>>>>
>>>>          provider->base = of_iomap(node, 0);
>>>>
>>>> -       provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
>>>> -                                      GFP_KERNEL);
>>>> -       if (!provider->clkdm_name) {
>>>> -               kfree(provider);
>>>> -               return;
>>>> +       if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
>>>> +               provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
>>>> +                                              GFP_KERNEL);
>>>> +               if (!provider->clkdm_name) {
>>>> +                       kfree(provider);
>>>> +                       return;
>>>> +               }
>>>> +
>>>> +               /*
>>>> +                * Create default clkdm name, replace _cm from end of parent
>>>> +                * node name with _clkdm
>>>> +                */
>>>> +               strcpy(provider->clkdm_name, node->parent->name);
>>
>> kasprintf can replace kmalloc, strlen and strcpy here and remove the
>> direct access of .name in the process.
>>
>>>> +               provider->clkdm_name[strlen(provider->clkdm_name) - 2] = 0;
>>>> +       } else {
>>>> +               provider->clkdm_name = kmalloc(strlen(node->name), GFP_KERNEL);
>>>> +               if (!provider->clkdm_name) {
>>>> +                       kfree(provider);
>>>> +                       return;
>>>> +               }
>>>> +
>>>> +               /*
>>>> +                * Create default clkdm name, replace _clkctrl from end of
>>>> +                * node name with _clkdm
>>>> +                */
>>>> +               strcpy(provider->clkdm_name, node->name);
>>
>> and here.
>>
>>>> +               provider->clkdm_name[strlen(provider->clkdm_name) - 7] = 0;
>>>>          }
>>>>
>>>
>>> This conflicts with Rob's change so I tried to fix it up. Let me know if
>>> something is horribly wrong with it. I suspect Rob will need to figure
>>> out how to make node::name usage go away again, but I put it back.
>>
>> Then I don't have to find and fix. :)
>>
> 
> Can you send a patch? Otherwise I will try and fix this up tomorrow.
> You can use this git tree for reference:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-ti
> 

Sorry, I've also been OoO for last week, just captured this.

Do you need help on this one? I can take a look at it tomorrow if there 
is a specific merge conflict you want me to take a look at.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
