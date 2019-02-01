Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCB5C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 10:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E658421920
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 10:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q2MPBkLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbfBAK5S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 05:57:18 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:19919 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729754AbfBAK5S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 05:57:18 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190201105715epoutp01472de9b9edefe4e3c207d2f365662389~-OD4A70oH0691106911epoutp01X;
        Fri,  1 Feb 2019 10:57:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190201105715epoutp01472de9b9edefe4e3c207d2f365662389~-OD4A70oH0691106911epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1549018635;
        bh=dzoczv0OLoIvMZx1qJXccJpEgNr2df0VjW+tf8DzCrA=;
        h=Subject:To:Cc:From:Date:In-reply-to:References:From;
        b=Q2MPBkLtZNubfLM+mqu55ilpGapfgqmxS+8NlTRlYAr773KvaIUzB7CYHd9Fjvy9h
         E0d9M+52TQ0bO5ckYgnAfzzuPjSBMY4/bRerpIPmNqNj2GQioR8TLfTOoXn3oISS93
         87uUBkQVxlpyVZeKdY31GnfodD03tB6IaMfcb2qc=
Received: from epsmges1p5.samsung.com (unknown [182.195.42.57]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190201105715epcas1p4710e92703ed1a084a462d4f2deb0b78a~-OD3dvFxo0624006240epcas1p4n;
        Fri,  1 Feb 2019 10:57:15 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        A6.01.04206.A06245C5; Fri,  1 Feb 2019 19:57:15 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190201105714epcas1p4842ecae9f278c9ce2b5966f6f932c7c5~-OD2y5cqx0624006240epcas1p4m;
        Fri,  1 Feb 2019 10:57:14 +0000 (GMT)
X-AuditID: b6c32a39-d7dff7000000106e-4e-5c54260a6623
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C2.E0.04015.A06245C5; Fri,  1 Feb 2019 19:57:14 +0900 (KST)
Received: from [106.116.147.40] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PM8003JUUF93690@mmp1.samsung.com>; Fri, 01 Feb 2019 19:57:14 +0900 (KST)
Subject: Re: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <ad3926f7-8884-9f2b-85d7-8a50a028d075@samsung.com>
Date:   Fri, 01 Feb 2019 11:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.4.0
MIME-version: 1.0
In-reply-to: <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZdlhTT5dbLSTGYPo6NouNM9azWlz/8pzV
        Yv6Rc6wWffv+M1r0P37NbHH+/AZ2i48991gtZpzfx2Sx9shddoul1y8yWbTuPcLuwO2xZt4a
        Ro9NqzrZPA6+28Pk0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBm3NrIXNHJXrL90hbmB8SVH
        FyMnh4SAicTaD0dZuxi5OIQEdjBKvJxxnxHC+c4o8eDdDnaYqlPPbkNV7WaU6Ho+jwnCuc8o
        8f72CrAqYQEPiVlv94DZIgL5EqvWtrGDFDELHGKSuPtmOjNIgk3AUKL3aB8jiM0rYCdx9/NX
        VhCbRUBV4umC22C2qECExOHed1A1ghI/Jt9j6WLk4OAUsJfY2OMEEmYW0JR48WUSC4QtLnHs
        /k1GCFteYvOat8wQV79nkzg1QxnCdpF48P4AI8gYCQFpiUtHbSHC1RK7tnczg5wpIdDBKNFy
        YTtUr7XE4eMXWSFm8km8+9rDCtHLK9HRJgRR4iExb9tBaKB0MEncOb6KeQKjzCwkV89Ccuos
        JKfOQnLqAkaWVYxiqQXFuempxYYFpnrFibnFpXnpesn5uZsYwalEy3IH47FzPocYBTgYlXh4
        N/wKihFiTSwrrsw9xCjBwawkwrtAKiRGiDclsbIqtSg/vqg0J7X4EKM0B4uSOO96B+cYIYH0
        xJLU7NTUgtQimCwTB6dUA2PAlgNL7h/hVPk/zyqYdbJWdX/r8Yod97bdehXKNiXJzrjoUOX7
        Q6ZnJp999XLJLOOehU+mKaZOZdy+4LWWeJbXHLFzSzfPajrZu6ty5wX3nZMl2Co/1fLOWNsX
        FizabbLVyTrYPyTXvZHBeOWXn2cY1p7yN+/MsZn84YDyKq0jh4IPWvrxFigosRRnJBpqMRcV
        JwIANuWq2iEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsVy+t9jAV0utZAYg4bbohYbZ6xntbj+5Tmr
        xfwj51gt+vb9Z7Tof/ya2eL8+Q3sFh977rFazDi/j8li7ZG77BZLr19ksmjde4Tdgdtjzbw1
        jB6bVnWyeRx8t4fJo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDJubWQvaOSuWH/pCnMD40uO
        LkZODgkBE4lTz26zdjFycQgJ7GSUOPL2OyOE85BRYvbf1cwgVcICHhKz3u5hB7FFBPIl2r9v
        ZQEpYhY4wiQxZ9INFoiODiaJnvN3wTrYBAwleo/2MYLYvAJ2Enc/f2UFsVkEVCWeLrgNZosK
        REh8fLqPCaJGUOLH5HtAgzg4OAXsJTb2OIGYzALqElOm5IJUMAuISxy7f5MRwpaX2LzmLfME
        RoFZSJpnIXTMQtIxC0nHAkaWVYySqQXFuem5xUYFhnmp5XrFibnFpXnpesn5uZsYgbGy7bBW
        3w7G+0viDzEKcDAq8fBu+BUUI8SaWFZcmXuIUYKDWUmEd4FUSIwQb0piZVVqUX58UWlOavEh
        RmkOFiVx3tt5xyKFBNITS1KzU1MLUotgskwcnFINjBuTHJ4WpjdXJmzbutZD0bh+6uSP/7tn
        vMp6kFZbeW2/qnUyV61ZKMPTL9enuSktFuT6ejvsuzaHnuAUcd0zMX2FM394HW+9nC+se5FP
        rjb2dfbj0msrGKv05W8e2Hz7RVxTwbJuZ9YvEyQ1TRUlj+94lRIjXbf5w6ZI1ggz84nsfLmr
        eq1vKbEUZyQaajEXFScCAJqJV36RAgAA
X-CMS-MailID: 20190201105714epcas1p4842ecae9f278c9ce2b5966f6f932c7c5
CMS-TYPE: 101P
X-CMS-RootMailID: 20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
        <20190122090232.29194-5-k.konieczny@partner.samsung.com>
        <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/31/19 13:30, Chanwoo Choi wrote:
>> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
>> index 87bb2b017143..52652aaabc06 100644
>> --- a/include/dt-bindings/clock/exynos5433.h
>> +++ b/include/dt-bindings/clock/exynos5433.h
>> @@ -1406,4 +1406,10 @@
>>  
>>  #define CAM1_NR_CLK					113
>>  
>> +/* CMU_IMEM */
>> +#define CLK_ACLK_SLIMSSS		2
>> +#define CLK_PCLK_SLIMSSS		35
>> +
>> +#define IMEM_NR_CLK			52
>> +
>>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
>>
> If you define that IMEM_NR_CLK is 52, clock driver allocates
> the memory for 52 clocks. It cause the memory waste.
> IMO, you better to change it as following:
> 
> #define CLK_ACLK_SLIMSSS		1
> #define CLK_PCLK_SLIMSSS		2
> 
> #define IMEM_NR_CLK			3

Let's keep the clock ID enumeration as is, so sorting is per clock
type as for all other CMUs in this header file. I.e. first all ACLK
then all PCLK clocks in case remaining clock ID get added in future. 
I'm going to adjust IMEM_NR_CLK to 36, as is not a part of DT ABI 
definition and for now it will allow us to save some memory. Although
I think the memory saving is negligible, we have already similar gaps 
in the clock ID enumeration.

I'm going to apply the patch with IMEM_NR_CLK changed 36, assuming
that Rob's Reviewed-by still stands, if not please let me know.

-- 
Thanks,
Sylwester
