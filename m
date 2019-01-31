Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2981DC169C4
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 12:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F12982087F
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 12:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="MYvh12Ru"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732762AbfAaMbH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 07:31:07 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:31873 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732743AbfAaMbH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 07:31:07 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190131123103epoutp02b9d1648dc68d19d7e507bae646da03ab~_7se40_h32822428224epoutp02M
        for <linux-clk@vger.kernel.org>; Thu, 31 Jan 2019 12:31:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190131123103epoutp02b9d1648dc68d19d7e507bae646da03ab~_7se40_h32822428224epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1548937863;
        bh=DqeCPLLiGJBNvPfg1vIkpVn8YudBi03cYHiG7m/lXqE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=MYvh12Ruit8nhE/dcscq/rgXKqAZ38jnzusUv1YEJjYCXaTXcxAVRMuSrLlHDYXSq
         wHPyfamnUyGqY3mFiaSdNC19ZVdp6Dd+MX3mHXM/H8T35zUyPXsA6C5xZGGKknZsiQ
         9eX5j0tX6UA8jXy6dTouPIdzPJFwr9pnI5iB5CGM=
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190131123059epcas1p286e7385ca4149dcfe7e7c6aab280f289~_7sbMNg5J0492804928epcas1p2t;
        Thu, 31 Jan 2019 12:30:59 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.64.04206.38AE25C5; Thu, 31 Jan 2019 21:30:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20190131123059epcas1p328d6dd267ad3da2b7b96a6083195e98e~_7sa0a1Yr1770117701epcas1p3Q;
        Thu, 31 Jan 2019 12:30:59 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190131123059epsmtrp1c8e8c227cf79c00d46ab339bf7b55a67~_7sayzr_52582825828epsmtrp1M;
        Thu, 31 Jan 2019 12:30:59 +0000 (GMT)
X-AuditID: b6c32a39-d65ff7000000106e-5b-5c52ea8339c6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        3C.89.03601.28AE25C5; Thu, 31 Jan 2019 21:30:58 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190131123058epsmtip10c2a689334863812e0a4d7a1485b68a8~_7salaY602217422174epsmtip1_;
        Thu, 31 Jan 2019 12:30:58 +0000 (GMT)
Subject: Re: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <fd39fd40-f452-f763-c9ab-d717c80967cd@samsung.com>
Date:   Thu, 31 Jan 2019 21:30:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190122090232.29194-5-k.konieczny@partner.samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0hTYRTv293drtXqa2WeRpRdKUqwdp2ra6UEVqySsAcUIq2bXnS4x213
        SlMCMfJRtrJ3i7Iog5ZlmSsRp6VSRDGLXmL4KKV32jspqLbdRf73O+d3zvl9v/N9H0WoGxUa
        ymR18HYrZ6YVo+XX2uZo43a8XZuh/V0cxV45WkuyVe1+knU1/0Hs3v53BNvRcVnJfqroIdmj
        Hc0y9mJ7t5KtfvpAxu70tSvZtvel5JIxhpqTNchQ5ylXGG4ONskMrnoPMnypm5ZGpucuzuG5
        LN4ezVszbVkma3YSvWqdMcWon69l4phEdgEdbeUsfBK9NDUtbrnJHDgaHZ3PmfMCqTROFOl5
        yYvttjwHH51jEx1JNC9kmYVEYa7IWcQ8a/bcTJtlIaPVxusDhZtzcx5VNsiFLmqbu3dTEdqp
        3IUiKMAJ0Pu7T7ELjabUuAHBjeEqQgo+Izh38EyY+Y5g/8fnin8tL48NkhLhQ9DpeYykYAjB
        pyNfQ4MnYgO4PzSF8CScDt4hb6iIwD0yOHt6iAgSChwLLa87Q2PH4xnweLgfBbEKJ0NfTU+o
        WY5nwlWfmwziSLwR2vYMhmsmwJ1jA/IgjsDL4Pnhz6GZBI6CroEqmYSnww7v8ZAhwLuV8KjX
        hyQPS8H14xAh4Ynw9nZ9eB0aeLO3JIwL4fyddoXUXIagvuU+KRE6aKk+EFCgAgpzoLZxniQ2
        Dga/VZDBNGAVlJWopeoYeNjXLZPwFDhTWh5eowFOXrtJ7kMz3CPsuEdYcI+w4P4vdgrJPWgy
        L4iWbF5kBP3I665DoXcbm9iAbvlTWxGmED1WVXZhTYaa5PJFp6UVAUXQk1SavrUZalUW5yzg
        7TajPc/Mi61IH9h2JaGJzLQFfoHVYWT08Tqdjk1g5usZho5S1S5JyVDjbM7B5/K8wNv/9cmo
        CE0RujDwFL8yben2xxeO8psO/DDdczZVCP5LCckJ31Bx7MrDs++VGdWuKs+LntaSlAJucvHG
        n6ndxutThmbNPtS5vTFmz9T+rtWVjbChY2y6c1FXQ365sOLF7pmFW5tPRJQ62dMPnxWtL4h0
        D5fTBU+8JcSGqb/A9+Fu3H5Xr/dPus5Py8Ucjokl7CL3F6tuMazNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsWy7bCSnG7Tq6AYg6XPLCw2zljPajH/yDlW
        i759/xkt+h+/ZrY4f34Du8XHnnusFjPO72OyWHvkLrvF0usXmSxa9x5htzj8pp3Vgdtjzbw1
        jB6bVnWyeRx8t4fJo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDKuTNzBUnCLo2LW/bgGxlb2
        LkZODgkBE4lnM9+xdjFycQgJ7GaUmPLnESNEQlJi2sWjzF2MHEC2sMThw8UQNW8ZJVZt72YG
        qREW8JCY9XYP2CARgSiJ+c8ms4EUMQs8YJJ4MamPCaLjMqPE7++9YB1sAloS+1/cYAOx+QUU
        Ja7+eAy2jVfATuLBmntgk1gEVCU2753FCmKLCkRIfHy6jwmiRlDi5MwnLCA2p4CrxMNpn8Bm
        MguoS/yZdwnKFpe49WQ+E4QtL9G8dTbzBEbhWUjaZyFpmYWkZRaSlgWMLKsYJVMLinPTc4sN
        C4zyUsv1ihNzi0vz0vWS83M3MYLjTktrB+OJE/GHGAU4GJV4eB+sDYwRYk0sK67MPcQowcGs
        JMIr9SAoRog3JbGyKrUoP76oNCe1+BCjNAeLkjivfP6xSCGB9MSS1OzU1ILUIpgsEwenVAPj
        BIvmStGyh5M7f13kyq13ri87oqqrsm5Tx/yPDeekj6yxmC9UvWLm3aCoSYyyDuvs5O2mnI5M
        uHk0ddNEpuJOD7v0fSut3nmubaqT+JfhV1zk3id08n1W22erhIX56ll3OQ+43ZAOZN//PcNL
        dHKTuEONOmOPiZqxp5rF53N1Yf6JbJ5htkosxRmJhlrMRcWJABDV5Aq3AgAA
X-CMS-MailID: 20190131123059epcas1p328d6dd267ad3da2b7b96a6083195e98e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
        <20190122090232.29194-5-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 19. 1. 22. 오후 6:02, Kamil Konieczny wrote:
> Add Exynos5433 DT bindings to describe imem clocks for SlimSSS (Slim
> Security SubSystem).
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5433.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
> index 87bb2b017143..52652aaabc06 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -1406,4 +1406,10 @@
>  
>  #define CAM1_NR_CLK					113
>  
> +/* CMU_IMEM */
> +#define CLK_ACLK_SLIMSSS		2
> +#define CLK_PCLK_SLIMSSS		35
> +
> +#define IMEM_NR_CLK			52
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
> 

If you define that IMEM_NR_CLK is 52, clock driver allocates
the memory for 52 clocks. It cause the memory waste.
IMO, you better to change it as following:

#define CLK_ACLK_SLIMSSS		1
#define CLK_PCLK_SLIMSSS		2

#define IMEM_NR_CLK			3


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
