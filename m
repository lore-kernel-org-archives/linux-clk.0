Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C3EC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  3 Mar 2022 14:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbiCCOm0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Mar 2022 09:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbiCCOmY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 09:42:24 -0500
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171F818F212
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 06:41:38 -0800 (PST)
Received: from [77.244.183.192] (port=62720 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nPme8-00005A-2Y; Thu, 03 Mar 2022 15:41:36 +0100
Message-ID: <59a74714-ae45-897e-57b9-7346998442cb@lucaceresoli.net>
Date:   Thu, 3 Mar 2022 15:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
Content-Language: it-IT
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>,
        Adam Ford <aford173@gmail.com>
Cc:     Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Klein, Jesse" <Jesse.Klein@mksinst.com>
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
 <fa9aa952-6560-7123-d095-32e88ecc5fb3@lucaceresoli.net>
 <MN2PR03MB500847D9F5BFF44F5E98ABA893039@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <MN2PR03MB500847D9F5BFF44F5E98ABA893039@MN2PR03MB5008.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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

On 02/03/22 21:49, Fillion, Claude wrote:
> 
> 
>> -----Original Message-----
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>> Sent: Wednesday, March 2, 2022 12:27 PM
>> To: Adam Ford <aford173@gmail.com>; Fillion, Claude
>> <Claude.Fillion@mksinst.com>
>> Cc: Sean Anderson <sean.anderson@seco.com>; linux-clk <linux-
>> clk@vger.kernel.org>
>> Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
>> versaclock5 driver
>>
>> Hi,
>>
>> On 02/03/22 16:45, Adam Ford wrote:
>> ...
>>>>>>>>     versaclock6: clock-controller@6a {
>>>>>>>>
>>>>>>>>         /* Clock Consumer */
>>>>>>>>
>>>>>>>>         compatible = "idt,5p49v6965";
>>>>>>>>
>>>>>>>>                                 reg = <0x6a>;
>>>>>>>>
>>>>>>>>                                 #clock-cells = <1>;
>>>>>>>>
>>>>>>>>                                 clocks = <&x304_clk>;
>>>>>>>>
>>>>>>>>                                 clock-names = "xin";
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>         assigned_clocks = <&versaclock6 1>,
>>>>>>>>
>>>>>>>>                           <&versaclock6 2>,
>>>>>>>>
>>>>>>>>                           <&versaclock6 3>,
>>>>>>>>
>>>>>>>>                           <&versaclock6 4>;
>>>>>>>>
>>>>>>>>         assigned_clock_rates = <46800000>, <250000000>,
>>>>>>>> <1000000>, <13000000>;
>>>>>>>
>>>>>>>
>>>>>>> Assigned clocks and assigned clock rates should be hyphens and not
>>>>>>> underscores.
>>>>>>>
>>>>>>> assigned-clocks =  <&versaclock6 1>,   <&versaclock6 2>,
>>>>>>> <&versaclock6 3>, <&versaclock6 4>;
>>>>>>>
>>>>>>> assigned-clock-rates =  <46800000>, <250000000>, <1000000>,
>>>>>>> <13000000>;
>>>>>>>
>>>>>>> Another thing to check is to make sure the consumers of these
>>>>>>> clocks is enabling them.  They do not necessarily get enabled by
>> default.
>>>>>>>
>>>>>>> adam
>>>>>>
>>>>>> Doh - thanks.  I looked at it a million times 😊 .
>>>>>>
>>>>>> Now getting desired out1 frequency but nothing on other outputs.
>>>>>> From
>>>>> the code it seems vc5_clk_out_prepare() is the method that enables
>>>>> outputs but this method is not being called I am not clear how to
>>>>> make the 'consumer enable them.'
>>>>>>
>>>>>> I have added this to my dtsi to no avail.
>>>>>>
>>>>>>          /* Consumer referencing 5P49V5965 pin OUT1 and OUT2 */
>>>>>>         consumer {
>>>>>>             clocks = <&versaclock6 1>, <&versaclock6 2>;
>>>>>>             /* ... */
>>>>>>          };
>>>>>>
>>>>>> Looking through device tree documentation.
>>>>>
>>>>> It's likely going to be in the consumer's driver.  Check the
>>>>> consumer device tree binding to make sure you've correctly
>>>>> associated the clock.  If the binding doesnt't show a clock is
>>>>> required, it might not know that you using a programmable clock.
>>>>>
>>>>> Here is a patch that I needed to apply to an Ethernet driver which
>>>>> wasn't expecting a programmable clock to drive a reference clock, so
>>>>> the clock wasn't being enabled.
>>>>>
>>>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ker
>>>>> nel/g
>>>>> it/torvalds/linux.git/commit/drivers/net/ethernet/renesas/ravb_main.
>>>>> c?id=
>>>>> 8ef7adc6beb2ef0bce83513dc9e4505e7b21e8c2__;!!KnJ4-rp7!1Qb17q-
>>>>>
>> TWrV62AeQtTNNVDErVbyhbXB1sukyT2ggvFPUltIBI5nIKzNnjVOcqlw8qJyy$
>>>>>
>>>>> Look at the use of devm_clk_get_optional and clk_prepare_enable from
>>>>> that patch.  (yes, there is a subsequent patch that fixes something
>>>>> I didn't quite do right, but the basics are here)
>>>>>
>>>>> The consumer drivers need to 'get' the clock so it can associate
>>>>> itself to the clock in question.  Once the relationship is
>>>>> established, the consumer needs to call clk_prepare_enable() which
>> uses the clock system to turn the clock on.
>>>>> Without this step, it's likely the Versaclock won't generate a
>>>>> signal, because it doesn't know it needs to turn it on.
>>>>>
>>>>> adam
>>>>
>>>> Not sure I fully follow.  I see that clk out1 is enabled but the other
>> channels are not so it would seem my difficulty is with individual channels.
>>>
>>> Do the devices that need the clock from the versaclock reference the
>>> versaclock?  If so, to those drivers use the get and enable?  If not,
>>> the versaclock will stay off.  In the patch example I showed, I had to
>>> modify the Ethernet driver on a processor, because it didn't
>>> explicitly enable the reference clock.  That Ethernet driver expected
>>> the refclk was always present which was a false assumption.  Once I
>>> got the consumer device (in this case, Ethernet) to request and enable
>>> the clock, the clock subsystem enabled the corresponding output on the
>>> versaclock.
>>>
>>> For the Ethernet example I cited above, the corresponding device tree
>>> looks like:
>>>
>>> &avb {
>>>      clocks = <&cpg CPG_MOD 812>, <&versaclock5 4>;
>>>      clock-names = "fck", "refclk";
>>>      status = "okay";
>>> };
>>>
>>> With this device tree reference, the 'refclk' gets associated to
>>> versaclock ouput 4.  When the Ethernet needs the clock, it calls
>>> clk_prepare_enable on that clock reference, and the clock system calls
>>> on the versaclock driver to enable the output.  The reason I needed to
>>> submit that patch was that the consumer driver (the Ethernet in this
>>> case) wasn't calling the clk_prepare_enable, so the clock remained
>>> off.  It's likely that whatever devices that need the clock from the
>>> versaclock will need both a device tree reference to it as well as a
>>> call to clk_prepare_enable.
>>>
>>>>
>>>> In my simple application I would like to enable outputs, on a per channel
>> basis, from the device tree.  Would it make sense  to add  an 'idt,enable'
>> property in similar fashion to the existing idt,mode, idt,voltage-microvolt,
>> and idt,slew-percent properties?  Then vc5_get_output_config() could be
>> modified to also call vc5_clk_out_prepare() (or clk_prepare_enable(), which
>> in turn would call vc5_clk_out_prepare()).
>>>
>>> I can't speak for the linux clock group, but the advantage of patching
>>> the drivers that need the clocks generated from the versaclock is the
>>> ability to stop these clocks when the drivers are halted and/or
>>> suspended.
>>
>> Having the consumer driver get, prepare and enable the clock is of course
>> the best as Adam explained.
>>
>> However I think using assigned-clocks and assigned-clock-rates should
>> enable the clocks unconditionally even if the consumer driver does not do
>> any clk_*() calls. Might be worth double checking that.
>>
>> --
>> Luca
> 
> In our application we plan to use the 6965/6901 to replace a part that does not use a consumer driver.  We just set clock options in our device tree.  Ideally that is how we would like to use the Renesas part as well. 
> 
> In the limited testing I have done thus far behavior is a bit puzzling.  From the device tree I am able to change the clock frequency for out1 (which is enabled by default) and I can disable outputs using 'idt,shutdown', but I cannot change the logic levels for out1 using the 'idt,mode' parameter.

This is very strange.

Did you double-check that your device tree description of the versaclock
node is correct according to [0]?

Please send the complete  description of the versaclock node in your
device tree, so we can check it and see if any detail is misplaced.

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml#n169


-- 
Luca
