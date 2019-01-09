Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD2C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 14:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F04412075C
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 14:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="s1S35ost"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbfAIOWM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 09:22:12 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:12826 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbfAIOWM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jan 2019 09:22:12 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190109142210epoutp018eda0fc4d77e19d3a1dd1ade14565eb9~4NBNwUG8Q0996209962epoutp01P;
        Wed,  9 Jan 2019 14:22:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190109142210epoutp018eda0fc4d77e19d3a1dd1ade14565eb9~4NBNwUG8Q0996209962epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1547043730;
        bh=8bDMvRpJ/Yh/Jb2wYY/ds0yHxLF5uUVimVtfo2RNVbA=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=s1S35ostDSVafUfUr+OLNci7hYDkh40PR+UruXQDpFKykIRDc19FoZNgRVS8xSGMP
         VbQi3RotBNd5gPsAwOSAh3qirZSoA/QvYSlzrFUIuZC4e5irslsh0pxxf10D6IlD8V
         cP77jJhAVzND1FoLIbbXhtOz5t3ax9CbkTCINlUM=
Received: from epsmges1p4.samsung.com (unknown [182.195.42.56]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190109142209epcas1p24933b8e45fb2fe3a534ee1f71af184e4~4NBNdD4Ru2321223212epcas1p2R;
        Wed,  9 Jan 2019 14:22:09 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        D7.EF.04146.193063C5; Wed,  9 Jan 2019 23:22:09 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190109142208epcas1p142f795e0cc8f4de05aa189b843bc2dbb~4NBMf12PI0606506065epcas1p1R;
        Wed,  9 Jan 2019 14:22:08 +0000 (GMT)
X-AuditID: b6c32a38-18fff70000001032-f9-5c360391f393
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CF.DB.03601.093063C5; Wed,  9 Jan 2019 23:22:08 +0900 (KST)
Received: from [106.116.147.40] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PL200DWCIKUQE60@mmp1.samsung.com>; Wed, 09 Jan 2019 23:22:08 +0900 (KST)
Subject: Re: Informing common clock framework driver of externally-derived
 base clock frequency
To:     Jonny Hall <jonny.hall@boxcast.com>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <f5d6c493-5e7e-00ec-a547-c952369630c6@samsung.com>
Date:   Wed, 09 Jan 2019 15:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-version: 1.0
In-reply-to: <CAP_wsPa5qsuUhDNXWe55612xY-ppytj+jX4+5s-bFxn5BURoTg@mail.gmail.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7bCmvu5EZrMYg2WvNSx6di5ktfjYc4/V
        4uIpV4t/1zayOLB4vL/Ryu4x79F3Jo9NqzrZPD5vkgtgieKySUnNySxLLdK3S+DKODb3LmPB
        U6mKA/MXsjQwHhbtYuTkkBAwkeie+J+5i5GLQ0hgB6PEprXX2SGc74wSK9beZYaputA5gQ3E
        FhLYzSgxZ04+RNF9RolvN28AFXFwCAskSuyawwRSIyKgLrFz2WMwm1kgV6Ln5XkWEJtNwFCi
        92gfI4jNK2An0fRwLVgNi4CqxPE5G8B2iQpESHTcX80GUSMo8WPyPbBeToFgiU99l5khZmpK
        vPgyiQXCFpc4dv8mI4QtL7F5zVuwbyQE1rBJrJh/jxHiAReJFbs3skPYwhKvjm9hB7lZQkBa
        4tJRW4hwtcSu7d1QvR2MEi0XtkM9by1x+PhFVogFfBLvvvawQvTySnS0CUGUeEhM23kYGooL
        mCROvzzKPIFRdhaSH2YhuXsWkrtnIbl7ASPLKkax1ILi3PTUYsMCE73ixNzi0rx0veT83E2M
        4ISgZbGDcc85n0OMAhyMSjy8OxjMYoRYE8uKK3MPMUpwMCuJ8KrfMYkR4k1JrKxKLcqPLyrN
        SS0+xCjNwaIkzvtEam60kEB6YklqdmpqQWoRTJaJg1OqgTHeVEVe5eMbLs0vGl7xb2Tuvg7+
        UVK4e9/uFQ9cj3/8/vNvZtrdTabqcp9vZHasXM+3K8RB4fLx8scMly0TH+54FCGddCdxXYz1
        Brnlh88nTDwVInPP8QVPuaQhi9+LSybNBxT+a4dGPinQ2n7J9O0F26Pb5i34OY3xQ+a2zyFL
        CtLXrk7awVGrxFKckWioxVxUnAgAVeZVHAQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsVy+t9jAd0JzGYxBhNbtSx6di5ktfjYc4/V
        4uIpV4t/1zayOLB4vL/Ryu4x79F3Jo9NqzrZPD5vkgtgieKySUnNySxLLdK3S+DKODb3LmPB
        U6mKA/MXsjQwHhbtYuTkkBAwkbjQOYGti5GLQ0hgJ6PEqTuPGCGch4wSnXfPMYNUCQskSrzu
        fcgOYosIqEvsXPaYCcRmFsiVOLh9O1T3IiaJzf/WgRWxCRhK9B7tYwSxeQXsJJoergVrYBFQ
        lTg+ZwPYUFGBCImzL9dB1QhK/Jh8jwXE5hQIlni9fAdQPQfQAnWJKVNyIXaJSxy7f5MRwpaX
        2LzmLfMERoFZSLpnIXTMQtIxC0nHAkaWVYySqQXFuem5xUYFhnmp5XrFibnFpXnpesn5uZsY
        gaG97bBW3w7G+0viDzEKcDAq8fAm/DONEWJNLCuuzD3EKMHBrCTCq37HJEaINyWxsiq1KD++
        qDQntfgQozQHi5I47+28Y5FCAumJJanZqakFqUUwWSYOTqkGxvKHnnKGnqfrgs1mtN9euCtd
        zNmqfie3wqmGuOs8/0M+XVlfuHfFRtOXS5fs+5exkymiN22WSK7t/WvRV5UOtOU/npXwVlXW
        mi/6+Xm5Y/0Pp0e1n+1fvylD9d6FS14uIg+bPQ45McvcN1uqzxE1s+7ZNs/MNdLH0k+6a7F9
        Km2YsuP8CaXNKkosxRmJhlrMRcWJAK1kHIZpAgAA
X-CMS-MailID: 20190109142208epcas1p142f795e0cc8f4de05aa189b843bc2dbb
X-Msg-Generator: CA
CMS-TYPE: 101P
X-CMS-RootMailID: 20190104023702epcas4p4e6b225121db059cb6ed167581c303e92
References: <CGME20190104023702epcas4p4e6b225121db059cb6ed167581c303e92@epcas4p4.samsung.com>
        <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com>
        <32a08ee4-3989-3785-88d6-7d215147eba3@samsung.com>
        <CAP_wsPa5qsuUhDNXWe55612xY-ppytj+jX4+5s-bFxn5BURoTg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/4/19 22:29, Jonny Hall wrote:
> On Fri, Jan 4, 2019 at 4:30 AM Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
[...]
>> On 1/4/19 03:35, Jonny Hall wrote:
>> [...]
>>> ... However, in my application, the input frequency of
>>> the si5342 is not known in advance, is derived from an external
>>> source, and can change during runtime. The si5342 will need to be
>>> (re)configured during operation with the frequency of this root clock
>>> source in order to properly lock onto it and generate the correct
>>> output frequencies -- it cannot independently determine the input
>>> frequency, only "locked" / "unlocked" state.  The application software
>>> (other drivers and usermode application code) will know the input
>>> clock rate.  I've though of a couple ways to do this:
>>>
>>> -Implement the root clock source as an "imaginary" divider where the
>>> set_rate call actually configures the input dividers of the si5342.
>>> This approach seems to abuse the common clock framework, as I'm not
>>> actually *setting* the rate, I'm *informing* the driver of a rate that
>>> was determined independently.
>>
>> It sounds like registering a clk notifier on the si5342 root source clock
>> might be a way to go, wouldn't that work for you?
>> For an example you could have a look at drivers/clk/sunxi-ng/ccu_mux.c.

> Maybe my understanding is incorrect, but to me it looks like a
> notifier (callback registered with clk_notifier_register) is actually
> the opposite case -- this method would be used by a clock consumer
> that wants to be notified by the common clock framework that a clock
> rate has changed (I, as an endpoint, want to know when my clock
> source, which is controlled by CCF drivers, changes rate).  The use
> case I'm looking for is when a clock chip needs to be notified by
> *something else* that something in the system has changed (I, as a
> clock chip, need to be informed by other parts of the system what my
> input clock rate is).

How about modelling SI5432 input clocks as clock objects? Don't you do it 
already? These are clocks the SI5432 consumes so would be needed anyway.
 
> To add a bit of clarity to the scenario -- in my use case, the si5342
> is generating video pixel clocks for video outputs from the system.
> The inputs of the si5342 are other video pixel clocks, from video
> inputs to the system.  The parts of the system that are aware of the
> input clock rates are things like HDMI subsystem drivers and usermode
> application code.  I need a way to connect these
> "parts-that-are-aware-of-the-clock-rate" to my si5342 driver so it can
> properly configure that portion of the si5342 -- preferably within the
> common clock framework, because on the output side of the si5342, our
> video output drivers already work with the CCF.

Assuming the HDMI receiver is source of the clock, couldn't the HDMI 
driver just register a clock and modify its rate according to the HW
state changes or user ioctls, etc.? The rate is then propagated through
whole clock tree and any element can get notified about changes.

> It looks like some similar chips use recalc_rate as their function to
> configure input dividers -- but there appears to be no way to call
> recalc_rate through the clk.h API -- it looks like recalc_rate is only
> used for keeping track of things internal to the CCF.
-- 
Regards,
Sylwester
