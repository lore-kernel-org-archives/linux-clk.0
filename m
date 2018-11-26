Return-Path: <SRS0=+J6A=OF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475F1C43441
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 14:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B41D72086B
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 14:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gD0aUtkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41D72086B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbeK0BUG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Nov 2018 20:20:06 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46469 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeK0BUG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Nov 2018 20:20:06 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181126142548euoutp01e6629f66f33fa9585ff59d8b0fa66c39~qsr1OtZzr3092330923euoutp01N
        for <linux-clk@vger.kernel.org>; Mon, 26 Nov 2018 14:25:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20181126142548euoutp01e6629f66f33fa9585ff59d8b0fa66c39~qsr1OtZzr3092330923euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543242348;
        bh=1oXs78NejKccCVAlOGkCT6zVw1orUeI5d4tlY18BPZg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=gD0aUtkQKfQxd9DdN/7t2RJbxIvdEvIJiZWc0SfMJ84qFZP7YM9SDV8IBYETmvk9D
         AaPEyFmyZ+FomMlmOSPV8iqPTlVMkCggsluf7Ep/vZKIz4sNi7oUXrSnHo41AoueEC
         j0pfLWEStsI1sm7EhywaGnAKjT/bnk7XLnXR2Yvo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181126142547eucas1p1f55f942319fc640c4dfdaf34e0331b8f~qsr0cZ5oe1153511535eucas1p1W;
        Mon, 26 Nov 2018 14:25:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 78.39.04806.B620CFB5; Mon, 26
        Nov 2018 14:25:47 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20181126142546eucas1p29857de3bfc7619f9082e7a1e70ea1981~qsrzpbcS42765027650eucas1p2C;
        Mon, 26 Nov 2018 14:25:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181126142546eusmtrp11dfc7e902c968b2d5ac07235f9177056~qsrzaTTav1352213522eusmtrp1o;
        Mon, 26 Nov 2018 14:25:46 +0000 (GMT)
X-AuditID: cbfec7f5-79db79c0000012c6-42-5bfc026b7f54
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.DE.04128.A620CFB5; Mon, 26
        Nov 2018 14:25:46 +0000 (GMT)
Received: from [106.120.51.18] (unknown [106.120.51.18]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20181126142546eusmtip1dff658c897ffd6405b4fca055ea5e51a~qsry_NPIT2622926229eusmtip1U;
        Mon, 26 Nov 2018 14:25:46 +0000 (GMT)
Subject: Re: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, kgene@kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
Message-ID: <e5be6b20-b855-81b1-9b46-1d6e7a9c4eb3@partner.samsung.com>
Date:   Mon, 26 Nov 2018 15:25:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUhUYRSG++4ycx2bvI6aB0cTB/xRobZBN4xIDBHSsAUSRXTKyyjqKHNd
        Uv8YuKclKmriTmW55K6TpuDMmIiD4h+nMtNKU1ywcsQsy7zeIv89533P4Zz346NwmZZ0oCLV
        8axGrYxWiCRE96utMbcobDv4RHG2HdNW1kIyJvMCyVQbxkjmwadlnBkfbxUzX/Pek0zZ+ADG
        NBumxcxj0wTGZPQbxIx+JYu8aOnbVNWEfNsbckS+9zsbkO96+5EAIkhyPpyNjkxkNR4XwiQR
        jYuLKO6J5Z3JmVksDQ1RuciCAvoMGL8ZsVwkoWT0UwTz+n5cKMwINlankFCsI2j98Wa3oPZG
        vnxX8NMyuh7BvVG50LOKYD27i+QNG9oLFgY/4Dzb0kfB9GuT5JtwOh2HtXcVGG+I6LPwsce4
        x1LaB6bbzBi/gKBdoeNZJC/b0YGQPdMoElqsYeThHMGzBX0VZu5O7uk4bQ9v56oxgZ2hZ7Vi
        LwHQY2LIK8nDhZyXYE3XLBbYBpaGO/+yI4wW5RECJ0Ff12exMJyOoLKoDhMMT9APT5D8cfhu
        mpZeD0H2gqGSfLHwKIfg9aq1cMMhKOwuxQVZCtmZMqHbDap2jKTAcsjdeU4WIEX5vmTl+9KU
        70tT/n9vDSIakD2bwMWoWO60mk1y55QxXIJa5X47NqYd7f6n0d/DG1o0sH1Lh2gKKQ5KAzd+
        BstIZSKXHKNDQOEKW6n/o11JGq5MTmE1saGahGiW0yE5RSjspakHZoNltEoZz0axbByr+edi
        lIVDGspoqo3rF2WM7ER3akvN6WELfhmZopAgb4dlu9pCbYiLuDhgrquUdh0En3rzhOc5V91l
        d4OLaasPN0UtNdxM6a0MHa2JP34jq+6l4zUrvWOLui3L/XpRr/eVscNBL5xX5Ixf6Pysk1E+
        YOV/qsO20W0zJz+stlnl5FGgS/UPnVIQXITy5DFcwyn/AEPkKpNLAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7pZTH+iDXony1lsnLGe1eL6l+es
        FvOPnGO16H/8mtni/PkN7BYfe+6xWsw4v4/JYu2Ru+wWS69fZLJo3XuE3eLwm3ZWB26PNfPW
        MHpsWtXJ5tG3ZRWjx+dNcgEsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
        +nY2Kak5mWWpRfp2CXoZq1+8YCxYxl1x7f4DpgbGoxxdjBwcEgImEh9+KHUxcnEICSxllDjZ
        eY2pi5ETKC4t0Xh6NZQtLPHnWhcbRNFrRonFB5axgSSEBRwlnh98yAxiiwhoSlz/+50VpIhZ
        oIVZ4n7TAWaIjllMEr+WbwPrYBMwl3i0/QzYWF4BN4m7G78wgZzBIqAqsXllJkhYVCBC4uzL
        dYwQJYISJ2c+YQGxOQUCJe43XgMbwyygLvFn3iVmCFtc4taT+UwQtrzE9rdzmCcwCs1C0j4L
        ScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERiT24793LKDsetd8CFGAQ5G
        JR7eDd9/RwuxJpYVV+YeYpTgYFYS4fVdAhTiTUmsrEotyo8vKs1JLT7EaAr020RmKdHkfGC6
        yCuJNzQ1NLewNDQ3Njc2s1AS5z1vUBklJJCeWJKanZpakFoE08fEwSnVwFh5m9X1XzoH38uJ
        3175fpjw6N3U/5PFNddLOz6Tsu5OfhYul/3haqCDy85jXMotqu+CVru9S/9ocmLmpu7at7/+
        br5Z8pr9gawv04VnfdcWt5dfTtq65EaqxcJsif9fPTz/CjdsVPLevDOD9YxmfUTGDynD9stf
        333Oy7LZ2vjORvWQ8Ld28RolluKMREMt5qLiRAABg1YL3wIAAA==
X-CMS-MailID: 20181126142546eucas1p29857de3bfc7619f9082e7a1e70ea1981
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
References: <CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
        <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <20181121120509.18892-2-k.konieczny@partner.samsung.com>
        <CAJKOXPc4O7D_bptcM1hhDN6Xdahv9xaVST-9WgqWNyC9U_QOfg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 21.11.2018 14:13, Krzysztof Kozlowski wrote:
> On Wed, 21 Nov 2018 at 13:05, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> Fix typo in imem sssx name and typo 200 switched with 266.
> 
> These should be two separate patches. Then the one changing parent
> could go to stable. [...]

Thank you, I will split it as you suggested.

>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
>>  include/dt-bindings/clock/exynos5433.h | 2 +-
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>> [...]
>> @@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>>         GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
>>                         ENABLE_ACLK_TOP, 25,
>>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>> -       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
>> +       GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
>>                         ENABLE_ACLK_TOP, 24,
>>                         CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
>> -       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
>> +       GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
>>                         ENABLE_ACLK_TOP, 23,
>> [...]

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland

