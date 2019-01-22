Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B4DC282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CCFA218D9
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 09:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TSbNBflK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfAVJla (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 04:41:30 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:16808 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbfAVJl3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 04:41:29 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190122094125epoutp025051e8a3448103980fc15d2b28deffb9~8IkzfZP-r0470104701epoutp02Q;
        Tue, 22 Jan 2019 09:41:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190122094125epoutp025051e8a3448103980fc15d2b28deffb9~8IkzfZP-r0470104701epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548150085;
        bh=Nd86UkDNv3x2YFkbo9ERr3vqDYld4tPzDvt8sdiMIuc=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=TSbNBflK4LnQH1W4erDvr6Im2TWPyzB0IaqX3V3xrVueTrdE02yniZeezlVfG9BVB
         QK5INbJ3ihY2TCBccA9C/X7gJfympIpb21ca3+7i3leKTMowWOecP9g72KJr6T+uHe
         FRWKDski/PqUxIZPN9+Lg0uDfDr5/RVhfcK+uUXA=
Received: from epsmges1p3.samsung.com (unknown [182.195.42.55]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190122094125epcas1p4417ef8f43df0d354720efd7f60e2e4e3~8IkzJStac0147801478epcas1p4k;
        Tue, 22 Jan 2019 09:41:25 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        2D.EF.04069.445E64C5; Tue, 22 Jan 2019 18:41:24 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190122094124epcas1p4fb6ca917b6e3b3208deebe1a3996cff1~8Iky35tZK0154601546epcas1p4j;
        Tue, 22 Jan 2019 09:41:24 +0000 (GMT)
X-AuditID: b6c32a37-989ff70000000fe5-66-5c46e544682a
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p1new.samsung.com
        (Symantec Messaging Gateway) with SMTP id 06.13.04015.445E64C5; Tue, 22 Jan
        2019 18:41:24 +0900 (KST)
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Received: from [106.116.147.40] by mmp2.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PLQ0086I88VPB40@mmp2.samsung.com>; Tue, 22 Jan 2019 18:41:24 +0900 (KST)
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh@kernel.org>,
        Chanwoo Choi <cwchoi00@gmail.com>
Cc:     Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <6c0b770d-817e-6e71-ce10-d276c64054cc@samsung.com>
Date:   Tue, 22 Jan 2019 10:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
In-reply-to: <0a803aee-b8f2-0d9b-dc63-f6cee9d4d42f@samsung.com>
Content-language: en-GB
Content-transfer-encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7bCmga7LU7cYgwn3rS02zljPanH9y3NW
        i2dHtS3mHznHatG37z+jRf/j18wW589vYLf42HOP1WLG+X1MFmuP3GW3WHr9IpPF/z072C3+
        XdvI4sDrsWbeGkaPnbPusntsWtXJ5nHw3R4mj74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4Mro
        ezSfteCiYMXtO+sZGxhX8HUxcnJICJhIbG49y97FyMUhJLCDUeLjuqXMIAkhge+MEo3XKmCK
        3n3ZD1W0gVHixOQvTCAJXgFBiR+T77GA2MwCmhIvvkxigSi6zyhx6uIENpCEsICHRNOWH+wg
        tohAjsTVjnVgk5gFVjJLbN9wAmwSm4ChRO/RPkaIqXYSjdObwJpZBFQlznRPBTtJVCBCouP+
        arA4p4C9xIfpdxghNotLHLt/E8qWlzh45TnYFRIC7ewSq7euZIH4wUXi2bHzQM0cQLa0xKWj
        thDhaold27uZIeo7GCVaLmxnhkhYSxw+fpEVYiifxLuvPawQvbwSHW1CECUeEptv9kKD5QOT
        xPm9k9gnMMrMQgqZWUghMwvJrbOQ3LqAkWUVo1hqQXFuemqxYYGxXnFibnFpXrpecn7uJkZw
        qtEy38G44ZzPIUYBDkYlHl6Oc64xQqyJZcWVuYcYJTiYlUR4XS+6xQjxpiRWVqUW5ccXleak
        Fh9ilOZgURLnXe/gHCMkkJ5YkpqdmlqQWgSTZeLglGpgnKMUuuqZoX8DX5LthSkGXet1PC05
        X+crlJ+7VFf/U7N8s9ukl51PzjJplffoufKv+RQk8mBfXHV9jGbatZ7TrxaemZmXMqGbyfmn
        uZlR6W9ZgzO/s56JvQ4v9LWMiU+9No3hoXfzdSGthq03H8vqBh/PdZiRzR0jdrO0RKDo56M5
        au/+3Q1VYinOSDTUYi4qTgQA1AdoxjEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42I5/e+xoK7LU7cYg3uHNC02zljPanH9y3NW
        i2dHtS3mHznHatG37z+jRf/j18wW589vYLf42HOP1WLG+X1MFmuP3GW3WHr9IpPF/z072C3+
        XdvI4sDrsWbeGkaPnbPusntsWtXJ5nHw3R4mj74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4Mro
        ezSfteCiYMXtO+sZGxhX8HUxcnJICJhIvPuyn72LkYtDSGAdo8S8k8sYQRK8AoISPybfY+li
        5OBgFlCXmDIlF6LmIaPEnNuH2EBqhAU8JJq2/GAHsUUEciRu/7jMDFLELLCaWWLzgwNMEB2f
        mCQWLd/PAlLFJmAo0Xu0D2qDnUTj9CawSSwCqhJnuqcyg9iiAhESZ1+uA6vhFLCX+DD9DpjN
        LCAucez+TShbXuLglecsExgFZiE5dhbCsbOQdMxC0rGAkWUVo2RqQXFuem6xUYFhXmq5XnFi
        bnFpXrpecn7uJkZgLG07rNW3g/H+kvhDjAIcjEo8vAkXXGOEWBPLiitzDzFKcDArifC6XnSL
        EeJNSaysSi3Kjy8qzUktPsQozcGiJM57O+9YpJBAemJJanZqakFqEUyWiYNTqoFx1aUYq1TV
        x/VS+pcmT4tYFzAtbu7p3iORNh/Or1fY90L3kizDLi9dl1zpI5MPp8gYnP9XuqDWnuHEzHs7
        uxX1iu1qeRg99GaKm09e97X9jNRGLr6UqJ9WXzLWXhdgm9P146G1/rJA8V+vN5TqzL9duehx
        laax7ZbtJ5/v9Na6oaovs3Px1rR7SizFGYmGWsxFxYkABLbcbaECAAA=
X-CMS-MailID: 20190122094124epcas1p4fb6ca917b6e3b3208deebe1a3996cff1
CMS-TYPE: 101P
X-CMS-RootMailID: 20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
        <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <20190118131639.17578-5-k.konieczny@partner.samsung.com>
        <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
        <20190121145132.GA19195@bogus>
        <0a803aee-b8f2-0d9b-dc63-f6cee9d4d42f@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/22/19 01:27, Chanwoo Choi wrote:
> On 19. 1. 21. 오후 11:51, Rob Herring wrote:
>> On Sat, Jan 19, 2019 at 09:40:10PM +0900, Chanwoo Choi wrote:

>>> This version only adds following two clocks without that other clocks
>>> be included in imem block.
>>> - CLK_ACLK_SLIMSSS
>>> - CLK_PCLK_SLIMSSS
>>>
>>> Usually, the users only refer to
>>> 'include/dt-bindings/clock/exynos5433.h' in order to get the supported
>>> clocks. It means that if there are different between the clock list in
>>> 'include/dt-bindings/clock/exynos5433.h' and the supported clock list
>>> of drivers/clock/', it make the confusion for users. So,
>>> 'include/dt-bindings/clock/exynos5433.h' have to define the only
>>> supported clock ids.
>>>
>>> Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.
>>
>> And add clocks 1-by-1 instead? The binding headers are a pain to merge 
>> because they are a dts and driver dependency. Having a complete header 
>> is preferred unless there is doubt in the correctness of it.

Exactly, this is also what we agreed with Stephen, to make a complete header
with all IDs. I believe the list of clocks is correct, this clock unit is
pretty straightforward, it's just a collection of gate clocks.
But chances are that the other clocks will never get added, as those seem
to be normally handled outside of Linux kernel. It still might not be a good
argument against having complete header describing the hardware completely,
independently of an OS, the bootloader might use those IDs, etc.
In practise it will be adding likely never used code though.

> As you commented, I knew the dependency between dt-binding head file and
> drivers/dts. But, IMO, I'm not sure that it is right to define
> the unsupported ID in dt-bindings header file because we don't know
> the correctness without any real test. The author explained why dropped
> the clocks except for two clocks on cover-letter. It means that the clocks
> except for two clocks might be never added to clock driver because He was
> unable to test them..

I agree, I doubt the remaining clocks will ever get added in case of this SoC. 

>> The driver can warn users about unsupported IDs
-- 
Regards,
Sylwester
