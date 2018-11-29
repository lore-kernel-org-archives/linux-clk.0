Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613E3C04EB9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 22:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 185D42146F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 22:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="djn7TYb2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 185D42146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbeK3KBx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 05:01:53 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:49305 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeK3KBw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Nov 2018 05:01:52 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20181129225444epoutp0123747f61ca201ecd322229fd8ef5a638~rukC_l0BJ3251132511epoutp01d;
        Thu, 29 Nov 2018 22:54:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20181129225444epoutp0123747f61ca201ecd322229fd8ef5a638~rukC_l0BJ3251132511epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543532084;
        bh=Ts8WP8gv+uqOqEVTh3kpJEEUsBahQJg3zgVDzcAsGK4=;
        h=Date:From:To:Cc:Subject:In-reply-to:References:From;
        b=djn7TYb2dHrfprxKjTxJl7NHcxs2bIDCeldJyg0uGjVMAy2jeTvhD2Yb6/mQun8OD
         Zd0rdVQ8K/8rKOOTXMbbCwpYRUyDvKeJ7UauXd4D/F7Ifyj5/b8KopjXF9rLxosBDa
         8rl7VZhbB6SgBAMtsaaKev2n6HldpJYxQyPNK+cM=
Received: from epsmges1p4.samsung.com (unknown [182.195.40.154]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181129225441epcas1p1ad44464d32dcbf3876aa7a257a6e72b1~rukATSLxH2703227032epcas1p1-;
        Thu, 29 Nov 2018 22:54:41 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        5A.21.04146.13E600C5; Fri, 30 Nov 2018 07:54:41 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181129225441epcas1p28f86f74a61ab99ebc7557bb49b509a67~ruj-9NsFX2213422134epcas1p2a;
        Thu, 29 Nov 2018 22:54:41 +0000 (GMT)
X-AuditID: b6c32a38-18fff70000001032-c8-5c006e31c419
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.17.03601.13E600C5; Fri, 30 Nov 2018 07:54:41 +0900 (KST)
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Received: from [10.113.63.77] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PIZ00LOJ8Z4AL60@mmp1.samsung.com>; Fri, 30 Nov 2018 07:54:41 +0900 (KST)
Message-id: <5C006E30.6060400@samsung.com>
Date:   Fri, 30 Nov 2018 07:54:40 +0900
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101
        Thunderbird/31.6.0
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
Subject: Re: [PATCH v2 2/5] clk: samsung: exynos5433: fix name typo in sssx
In-reply-to: <20181129155134.19141-3-k.konieczny@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupik+LIzCtJLcpLzFFi42LZdlhTV9cwjyHG4MFsVYuNM9azWsw/co7V
        om/ff0aL/sevmS3On9/AbvGx5x6rxYzz+5gs1h65y26x9PpFJovWvUfYLQ6/aWd14PZYM28N
        o8emVZ1sHgff7WHy6NuyitHj8ya5ANaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11D
        SwtzJYW8xNxUWyUXnwBdt8wcoNOUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWW
        BXrFibnFpXnpesn5uVaGBgZGpkCFCdkZuzoPshWc4q1YumgrSwPjUe4uRk4OCQETia0fT7F0
        MXJxCAnsYJTY8Hs2lPOdUeLg+n+MMFXzvt2FSuxmlLjycQE7SIJXQFDix+R7QAkODmYBeYkj
        l7JBwswCmhIvvkyCqr/LKDH9yAM2iHotiT2L5jOD1LMIqErcfV0CEmYDCu9/cQOshF9AUeLq
        j8dge0UFIiR2zv8GtkpEIEpi6/utjCAzmQXuMUksWfieGSQhLOAt8XRxG1gRp4CrxPdfO9hA
        iiQE3rNJPO16wgLxgYvErg8T2CBsYYlXx7ewgxwhISAtcemoLUR9O6PElxfNrBDOBEaJD6c2
        M0E0GEs8W9jFBPEan8S7rz2sEM28Eh1tQhAlHhKTm88zQnx8mVHiz6lrTBMYZWchBdIsRCDN
        QgqkBYzMqxjFUguKc9NTiw0LTJCjbxMjOB1qWexg3HPO5xCjAAejEg+vw6//0UKsiWXFlbmH
        GCU4mJVEeO0VGGKEeFMSK6tSi/Lji0pzUosPMZoCw3gis5Rocj4wVeeVxBuaGhkbG1uYGJqZ
        GhoqifM+kZobLSSQnliSmp2aWpBaBNPHxMEp1cCosKrWlsU4fWlKiuCWkCcqwkFvzOwillce
        X8X9+on/J72JL/4EJOXu6WzRNtpS4nd1x5UZOzY5iYo0Ou8/yWf95blb/KKtX+vvyqTkdEup
        5iX3KDyL8k1+47rc0+hnsuHMI4ndRcVpKZeyJ93cLyXzQdZQg83fQ099/jFVKVNJj10cm4Q+
        aiuxFGckGmoxFxUnAgCJSYM+nQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsVy+t9jAV3DPIYYg5dNAhYbZ6xntZh/5Byr
        Rd++/4wW/Y9fM1ucP7+B3eJjzz1Wixnn9zFZrD1yl91i6fWLTBate4+wWxx+087qwO2xZt4a
        Ro9NqzrZPA6+28Pk0bdlFaPH501yAaxRXDYpqTmZZalF+nYJXBm7Og+yFZzirVi6aCtLA+NR
        7i5GTg4JAROJed/usnQxcnEICexklHjZt5gFJMErICjxY/I9IJuDg1lAXuLIpWwIU11iypRc
        iPL7jBKHt/1lhyjXktizaD4zSA2LgKrE3dclIGE2oPD+FzfYQGx+AUWJqz8eM4KUiApESHSf
        qAQJiwhEScx/NpkNZCSzwAMmiReT+phAEsIC3hJPF7eBjRcSuMwosWSnH4jNKeAq8f3XDrYJ
        jAKzkBw6C+HQWQiHLmBkXsUomVpQnJueW2xUYJiXWq5XnJhbXJqXrpecn7uJERgN2w5r9e1g
        vL8k/hCjAAejEg/vi+//o4VYE8uKK3MPMUpwMCuJ8NorMMQI8aYkVlalFuXHF5XmpBYfYpTm
        YFES572ddyxSSCA9sSQ1OzW1ILUIJsvEwSnVwDjLuO+m3+w76e4vuKrb3+00W1jT/tjzmXmn
        hthuM/f1Ppp5mopCS3y2fk3e2dOTf+fPCQX9ad9tVOfoZshdZL3b6l48e9Fta4eJec4JeR8/
        8u10vWHqv2TrVLmTex52RH3yKrdmu3c3R2quw57z7nvlFlf79yqfqhGT/B7S8nrOvn3zfecL
        GSuxFGckGmoxFxUnAgAWJQV9ggIAAA==
X-CMS-MailID: 20181129225441epcas1p28f86f74a61ab99ebc7557bb49b509a67
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4@eucas1p2.samsung.com>
        <20181129155134.19141-3-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 2018년 11월 30일 00:51, Kamil Konieczny wrote:
> Fix typo in sssx name, there should be three letters 's'.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 2 +-
>  include/dt-bindings/clock/exynos5433.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index ea47f49abc7f..24c3360db65b 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>  	/* ENABLE_ACLK_TOP */
>  	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
>  			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
> -	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
> +	GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
>  			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
>  			29, CLK_IGNORE_UNUSED, 0),
>  	GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
> diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
> index 98bd85ce1e45..87bb2b017143 100644
> --- a/include/dt-bindings/clock/exynos5433.h
> +++ b/include/dt-bindings/clock/exynos5433.h
> @@ -156,7 +156,7 @@
>  #define CLK_ACLK_G2D_266		220
>  #define CLK_ACLK_G2D_400		221
>  #define CLK_ACLK_G3D_400		222
> -#define CLK_ACLK_IMEM_SSX_266		223
> +#define CLK_ACLK_IMEM_SSSX_266		223
>  #define CLK_ACLK_BUS0_400		224
>  #define CLK_ACLK_BUS1_400		225
>  #define CLK_ACLK_IMEM_200		226
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
