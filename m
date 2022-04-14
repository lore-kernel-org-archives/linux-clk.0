Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347076AbiDNWjh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbiDNWjg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:39:36 -0400
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FF4C6B54
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:37:09 -0700 (PDT)
Received: from [77.244.183.192] (port=63006 helo=[192.168.178.75])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nf85L-0001KR-Nm; Fri, 15 Apr 2022 00:37:07 +0200
Message-ID: <732f0618-43a3-50cc-7afa-d3eb0c5466fd@lucaceresoli.net>
Date:   Fri, 15 Apr 2022 00:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
 <158a5b3e-7ed0-c545-99d7-8890583facdb@lucaceresoli.net>
 <MN2PR03MB50085D86CF1C1CC89FD74E0993179@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <MN2PR03MB50085D86CF1C1CC89FD74E0993179@MN2PR03MB5008.namprd03.prod.outlook.com>
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

Hello Claude,

apologies for the extremely delayed reply...

On 22/03/22 21:09, Fillion, Claude wrote:
>>> For my application I would like the ability to set clock frequencies according
>> to values that are stored in a json formatted config file. Is there a way to
>> change these values from user space app code?  If not, would it be ok to add
>> code to my consumer driver (say in the probe method) that would read the
>> values from the json and then call set_rate() and prepare_enable()) ?
>>
>> This is absolutely not a standard practice in the kernel. If drivers are well
>> written then a consumer driver knows which clock it needs, it will ask the
>> produced that frequency and configure the consumer device accordingly.
>>
>> E.g. if the consumer device is an audio codec then user space will never say "I
>> want you to ask for a 1 MHz clock" but rather "I want to playback at 48 kHz",
>> then the driver will ask for a given clock frequency and configure the codec to
>> use it, perhaps setting divisor/multiplier registers etc.
>>
>> So I really suggest you to understand what the correct kernel-userspace
>> interface would be for your consumer driver. If you want you can share what
>> the consumer device is so we can be give some suggestions.
>>
>> That said, if you don't want to mainline your consumer driver nobody will
>> prevent you from doing anything "strange". But keep it limited to your driver,
>> you don't want to have conflicts in the versaclock code when you upgrade to
>> a more recent kernel.
>>
>> Also, I don't think json is expected to be in the kernel. If you want to do
>> something like that then maybe parse json at userspace level and then send
>> just the frequency in Hz via a sysfs entry.
>>
>> --
>> Luca
> 
> Hello Luca,
> Thank you for responding.  I will attempt to provide a little more detail on our use case.  Our products do a fair amount of signal processing, both in transmitting and receiving chains. The clocks we would like to adjust control ADC and DAC sample rates.  These rates do not change frequently, but depending on particular features we enable or on conditions that are specific to a certain customer there will be times where we will need to change sample rates. Our products have an extensive set of configuration parameters contained in json files that control many details of our signal processing chains.  Ideally we would like to add the ability to get/set clock rates through this mechanism.
> 
> When changing frequency we expect to reboot the device, but would like to avoid rebuilding/distributing new code.  Essentially  1 code package, configured multiple different ways.
> 
> The idea of parsing json at userspace and just sending the frequency in Hz via a sysfs entry seems appealing. I thought I would need to call the set_rate() method of the driver in order to change frequency.  If it is not too much trouble can you explain how I could change frequency via sysfs call?
> 
> This is what I see on the device in /sys:
>       root@CLAUDE:/sys/class/i2c-dev/i2c-1/device/1-006a# ls
>       driver     modalias   name       of_node    power      subsystem  uevent
> 
> From this I am not clear on how to set frequency.

You can't change the frequency using those sysfs interfaces. This is
because you are not supposed to change a frequency from userspace.

The reason is that a clock is not generally supposed to be used per se,
but rather to be consumed by another device (hence the name "consumer
driver"). Se my example about an audio codec.

Given the use case that you broadly described it looks like you need one
or another clock frequency based on some features that the consumer
device can optionally deliver. E.g. is you enable feature foo then it
will need a faster clock for the extra processing. If it is the case
then a proper way is probably to write your consumer driver to request
the clock it needs based on the enabled features:

  clk_set_rate(clk, feature_foo_is_enabled ? 2000000 : 1000000);

Does it make sense?

-- 
Luca
