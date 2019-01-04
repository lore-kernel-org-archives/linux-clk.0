Return-Path: <SRS0=Wo9f=PM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6A7C43387
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 09:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FAA7218CD
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jan 2019 09:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c/hMRVSj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfADJak (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:30:40 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:32525 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfADJak (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jan 2019 04:30:40 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190104093037epoutp0115b89215fb8d19ac5a658d5ec8ba0953~2m0Pb3rxz0301803018epoutp01f;
        Fri,  4 Jan 2019 09:30:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190104093037epoutp0115b89215fb8d19ac5a658d5ec8ba0953~2m0Pb3rxz0301803018epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1546594237;
        bh=rAuUhlcWuGKwbn7geXrX9I1Pwo5hFkoElQ0VdQn0dLg=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=c/hMRVSjW9ZGTM+tyM3TYYBblAQogXmediNSHyAwBC5eslv5JSABJOzmXoEmQZem8
         1LLEnR+KmM2xaTtSFNtG/eFUFGNOSGul6/wxWYAQICnefIab1G/TR+5/xAIQcuzZ+e
         CIkfwZFZq8543a9ApIuUOVa9046oHV/VR3Sz38cE=
Received: from epsmges2p2.samsung.com (unknown [182.195.42.70]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20190104093037epcas2p12becc505df6b4d0f2e6d19ca45a4ad2e~2m0PSG4QM1884518845epcas2p1D;
        Fri,  4 Jan 2019 09:30:37 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.89.04060.DB72F2C5; Fri,  4 Jan 2019 18:30:37 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20190104093036epcas2p4d68eac64fa40e3f5e8da6e26dddcee30~2m0OPHlxN2893128931epcas2p4N;
        Fri,  4 Jan 2019 09:30:36 +0000 (GMT)
X-AuditID: b6c32a46-b2dff70000000fdc-84-5c2f27bd6077
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p2new.samsung.com
        (Symantec Messaging Gateway) with SMTP id 20.74.03627.CB72F2C5; Fri,  4 Jan
        2019 18:30:36 +0900 (KST)
Received: from [106.116.147.40] by mmp2.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PKS00966VQXV730@mmp2.samsung.com>; Fri, 04 Jan 2019 18:30:36 +0900 (KST)
Subject: Re: Informing common clock framework driver of externally-derived
 base clock frequency
To:     Jonny Hall <jonny.hall@boxcast.com>, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <32a08ee4-3989-3785-88d6-7d215147eba3@samsung.com>
Date:   Fri, 04 Jan 2019 10:30:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-version: 1.0
In-reply-to: <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsWy7bCmqe5edf0Yg+ffVS16di5ktfjYc4/V
        4uIpV4t/1zayOLB4vL/Ryu4x79F3Jo9NqzrZPD5vkgtgieKySUnNySxLLdK3S+DKOLVZruAi
        Z8Wv3wtZGxjvsXcxcnJICJhITHz2iLWLkYtDSGAHo0RbYy+U851RYtHFjawwVZ/udjJDJDYw
        Svx6eg+q6j6jxJIHF4AcDg5hgUSJXXOYQEwRASeJF9/4QHqZBYIkXj5pZAOx2QQMJXqP9jGC
        2LwCdhLb9/9nBrFZBFQlrkxtB7NFBSIkOu6vZoOoEZT4MfkeC4jNKRAsMWfTdBaImZoSL75M
        grLFJY7dv8kIYctLbF7zFuxOCYE1bBIzNsM84CIx/extZghbWOLV8S1Q70tLPFu1kRHCrpbY
        tb0bqrmDUaLlwnaoBmuJw8cvskJs4JPoOPyXHeRJCQFeiY42IYgSD4lpOw9DA2gJo8SFl63s
        ExhlZyF5YhaSw2chOXwWksMXMLKsYhRLLSjOTU8tNiow0itOzC0uzUvXS87P3cQITghabjsY
        l5zzOcQowMGoxMMbwacXI8SaWFZcmXuIUYKDWUmEN5FJP0aINyWxsiq1KD++qDQntfgQozQH
        i5I470PpudFCAumJJanZqakFqUUwWSYOTqkGRla9a7sVWW5xpG/lfbE69FuQ8fxehwmBEm3r
        VqxsTi3XaD5ef+2QUkLK6/KLOZeqL+yO31OV0Ma5m+mn9deLp4W2ym1J9J9kF1X1O3WzRsSn
        xWWPHhTzZuVui4iwCfs383TQ99JD2z0NL+tzCH84+OLyif6+6bvWfPD2U9165HHqPQ0VHXYJ
        VSWW4oxEQy3mouJEAEJjpD8EAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsVy+t9jQd096voxBkemSVn07FzIavGx5x6r
        xcVTrhb/rm1kcWDxeH+jld1j3qPvTB6bVnWyeXzeJBfAEsVlk5Kak1mWWqRvl8CVcWqzXMFF
        zopfvxeyNjDeY+9i5OSQEDCR+HS3k7mLkYtDSGAdo8T9OytYIJyHjBKTe56wgVQJCyRKvO59
        CNTBwSEi4CTx4hsfRM0yRomnnV/BapgFAiQOPN/ACGKzCRhK9B7tA7N5Bewktu//zwxiswio
        SlyZ2g5miwpESJx9uQ6qRlDix+R7LCA2p0CwxInOtSwgu5gF1CWmTMmFGC8ucez+TUYIW15i
        85q3zBMYBWYh6Z6F0DELSccsJB0LGFlWMUqmFhTnpucWGxUY5aWW6xUn5haX5qXrJefnbmIE
        hvW2w1r9OxgfL4k/xCjAwajEwxvBpxcjxJpYVlyZe4hRgoNZSYQ3kUk/Rog3JbGyKrUoP76o
        NCe1+BCjNAeLkjgvf/6xSCGB9MSS1OzU1ILUIpgsEwenVAMjA0/7vXdTfX/f8prxvqosTEdM
        NDD9utm6PTftQ7TMJLKmrI/K25lzL3Nm0pJ7nya1u11tLHkhZMi4+//2GvdZ1ZUHtl3TL372
        TubTwj8Su+y5iwr82xLZDW5U5PvXXXayYFK15n3EMb+qyfz66vzJipyzWZJ+LOm4XSutHfV5
        kv3tkgkfDCKVWIozEg21mIuKEwELUWRmZwIAAA==
X-CMS-MailID: 20190104093036epcas2p4d68eac64fa40e3f5e8da6e26dddcee30
X-Msg-Generator: CA
CMS-TYPE: 102P
X-CMS-RootMailID: 20190104023702epcas4p4e6b225121db059cb6ed167581c303e92
References: <CGME20190104023702epcas4p4e6b225121db059cb6ed167581c303e92@epcas4p4.samsung.com>
        <CAP_wsPYwykAPF=aedoHkZnKhLgFdbUNMK7tpFJkhMfr_X2Gnrg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Cc: CCF maintainers

On 1/4/19 03:35, Jonny Hall wrote:
[...]

> ... However, in my application, the input frequency of
> the si5342 is not known in advance, is derived from an external
> source, and can change during runtime. The si5342 will need to be
> (re)configured during operation with the frequency of this root clock
> source in order to properly lock onto it and generate the correct
> output frequencies -- it cannot independently determine the input
> frequency, only "locked" / "unlocked" state.  The application software
> (other drivers and usermode application code) will know the input
> clock rate.  I've though of a couple ways to do this:
> 
> -Implement the root clock source as an "imaginary" divider where the
> set_rate call actually configures the input dividers of the si5342.
> This approach seems to abuse the common clock framework, as I'm not
> actually *setting* the rate, I'm *informing* the driver of a rate that
> was determined independently.

It sounds like registering a clk notifier on the si5342 root source clock
might be a way to go, wouldn't that work for you?
For an example you could have a look at drivers/clk/sunxi-ng/ccu_mux.c.

--
Regards,
Sylwester
