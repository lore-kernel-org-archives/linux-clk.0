Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF80C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Mar 2022 15:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbiCVQBK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Mar 2022 12:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiCVQBJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Mar 2022 12:01:09 -0400
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211077CDE2
        for <linux-clk@vger.kernel.org>; Tue, 22 Mar 2022 08:59:41 -0700 (PDT)
Received: from [77.244.183.192] (port=64308 helo=[192.168.178.75])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nWgv5-0008bg-82; Tue, 22 Mar 2022 16:59:39 +0100
Message-ID: <158a5b3e-7ed0-c545-99d7-8890583facdb@lucaceresoli.net>
Date:   Tue, 22 Mar 2022 16:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Content-Language: en-US
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>,
        Adam Ford <aford173@gmail.com>
Cc:     Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
 <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net>
 <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com>
 <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xKbE9Rv3EsvFkS4Lk8nCwy1TK-xJQLk_h70PSVdeUHJcA@mail.gmail.com>
 <MN2PR03MB5008536F789B93337AF0BA6793039@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7xJFxtA=9GYkQ1dVig=sSRQY3yhjS9dO2GRtqn=zdc9w7g@mail.gmail.com>
 <MN2PR03MB500831D1691CE0416BE22C1593169@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <MN2PR03MB500831D1691CE0416BE22C1593169@MN2PR03MB5008.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Claude,

On 21/03/22 22:21, Fillion, Claude wrote:
[...]
>>>> Look at the use of devm_clk_get_optional and clk_prepare_enable from
>>>> that patch.  (yes, there is a subsequent patch that fixes something
>>>> I didn't quite do right, but the basics are here)
>>>>
>>>> The consumer drivers need to 'get' the clock so it can associate
>>>> itself to the clock in question.  Once the relationship is
>>>> established, the consumer needs to call clk_prepare_enable() which uses
>> the clock system to turn the clock on.
>>>> Without this step, it's likely the Versaclock won't generate a
>>>> signal, because it doesn't know it needs to turn it on.
>>>>
>>>> adam
>>>
>>> Not sure I fully follow.  I see that clk out1 is enabled but the other channels
>> are not so it would seem my difficulty is with individual channels.
>>
>> Do the devices that need the clock from the versaclock reference the
>> versaclock?  If so, to those drivers use the get and enable?  If not, the
>> versaclock will stay off.  In the patch example I showed, I had to modify the
>> Ethernet driver on a processor, because it didn't explicitly enable the
>> reference clock.  That Ethernet driver expected the refclk was always
>> present which was a false assumption.  Once I got the consumer device (in
>> this case, Ethernet) to request and enable the clock, the clock subsystem
>> enabled the corresponding output on the versaclock.
>>
>> For the Ethernet example I cited above, the corresponding device tree looks
>> like:
>>
>> &avb {
>>      clocks = <&cpg CPG_MOD 812>, <&versaclock5 4>;
>>      clock-names = "fck", "refclk";
>>      status = "okay";
>> };
>>
>> With this device tree reference, the 'refclk' gets associated to versaclock
>> ouput 4.  When the Ethernet needs the clock, it calls clk_prepare_enable on
>> that clock reference, and the clock system calls on the versaclock driver to
>> enable the output.  The reason I needed to submit that patch was that the
>> consumer driver (the Ethernet in this
>> case) wasn't calling the clk_prepare_enable, so the clock remained off.  It's
>> likely that whatever devices that need the clock from the versaclock will
>> need both a device tree reference to it as well as a call to
>> clk_prepare_enable.
> 
> For my application I would like the ability to set clock frequencies according  to values that are stored in a json formatted config file. Is there a way to change these values from user space app code?  If not, would it be ok to add code to my consumer driver (say in the probe method) that would read the values from the json and then call set_rate() and prepare_enable()) ?

This is absolutely not a standard practice in the kernel. If drivers are
well written then a consumer driver knows which clock it needs, it will
ask the produced that frequency and configure the consumer device
accordingly.

E.g. if the consumer device is an audio codec then user space will never
say "I want you to ask for a 1 MHz clock" but rather "I want to playback
at 48 kHz", then the driver will ask for a given clock frequency and
configure the codec to use it, perhaps setting divisor/multiplier
registers etc.

So I really suggest you to understand what the correct kernel-userspace
interface would be for your consumer driver. If you want you can share
what the consumer device is so we can be give some suggestions.

That said, if you don't want to mainline your consumer driver nobody
will prevent you from doing anything "strange". But keep it limited to
your driver, you don't want to have conflicts in the versaclock code
when you upgrade to a more recent kernel.

Also, I don't think json is expected to be in the kernel. If you want to
do something like that then maybe parse json at userspace level and then
send just the frequency in Hz via a sysfs entry.

-- 
Luca
