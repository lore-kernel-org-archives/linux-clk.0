Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2FC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C4D52147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qgIVAEGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4D52147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbeKUW5n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 17:57:43 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:12028 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeKUW5n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 17:57:43 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20181121122330epoutp03e837f7ee970559c393d39dbf3df2470a~pIyn2Ykoq1104511045epoutp03-;
        Wed, 21 Nov 2018 12:23:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20181121122330epoutp03e837f7ee970559c393d39dbf3df2470a~pIyn2Ykoq1104511045epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1542803010;
        bh=RX93crTKG1tqNUsR3wDkCqfNcaSOL+BfkIbZHNHGxeo=;
        h=Date:From:To:Cc:Subject:In-reply-to:References:From;
        b=qgIVAEGQUJ9Mvur93RcYPMZ0+UPz5m2iRApJ5+PtdnxgtEqEFQt+aa6E4f+Rpp8HL
         5A5SFEc7+i1Bdmyxhm6kS6ziWKk5hkPGT90F+9ie3hc1eDdQFh3Ci2inAkn/+DNSs8
         v1gJZ799rSvf/S1OtyTR3dR/XYaonfvtjtHJtoCQ=
Received: from epsmges2p3.samsung.com (unknown [182.195.40.158]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20181121122327epcas1p3fe8a6270eee73d30fa8bc3e27b980b2b~pIylfGtP41210912109epcas1p3X;
        Wed, 21 Nov 2018 12:23:27 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        03.11.04062.F3E45FB5; Wed, 21 Nov 2018 21:23:27 +0900 (KST)
Received: from epsmgms2p2new.samsung.com (unknown [182.195.42.143]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20181121122327epcas2p4c43dc272d58ac3dc8a1d61fd80097bbb~pIylDGCkA1980719807epcas2p4M;
        Wed, 21 Nov 2018 12:23:27 +0000 (GMT)
X-AuditID: b6c32a47-2f7ff70000000fde-58-5bf54e3fcc89
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p2new.samsung.com
        (Symantec Messaging Gateway) with SMTP id B2.2F.03627.F3E45FB5; Wed, 21 Nov
        2018 21:23:27 +0900 (KST)
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Received: from [10.113.63.77] by mmp2.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PIJ0028RMEYH710@mmp2.samsung.com>; Wed, 21 Nov 2018 21:23:27 +0900 (KST)
Message-id: <5BF54E3A.60704@samsung.com>
Date:   Wed, 21 Nov 2018 21:23:22 +0900
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
Subject: Re: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
In-reply-to: <20181121120509.18892-2-k.konieczny@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xNYRjed879ccLl6xS+ZXQdy9y2cn90dbJCU7kIGUY11Vl9bun+2j33
        Gv4gI+kqKjbJlDZtXEVS7WYqt9psNkWEpDYz1dLKj8RM4957mP573vd5nn3v+3wvRdKFkiAq
        x2TDVhNnYCRzRM2dijVh67d/S1VePhvB3i2/I2arurrF7Lm234A9//4jyfb01EvZz0VDYra8
        p41g67oGpWzNq2cEm9/aJWU7xwvEG+bqaitrga7BWSjRuSceELpzjU6g+9qwLEmckhudjbks
        bJVjU6Y5K8ekj2G27krfmK5do1SFqaLYSEZu4ow4holLTApLyDF4RmPkhziD3dNK4nieWb0u
        2mq227A828zbYhhsyTJYoizhPGfk7SZ9eKbZuFalVKq1HmFGbvbN9gxLTeDhtrJCSR645O8A
        fhSCEaiutlXqAHMoGroAGistBELxHaDz5QXgnyqv/gkhEPUANTaXSLyEDPqjHxeGRA5AUSQM
        Rl29ud42CRVodKpM5MU0HARooDdNkK9CTSdqfFYRDEF9+b1SL5bAUNQ++trXXwCXo74f733v
        LoT7UEvVtE8TCFNQ02STbzgSDhHoevUk6SUCYCwacb/zYT8Yj2aKJn2DIjgpQV/uXxAJG8Sh
        9mvTf3EAGnvUKBXwEjTsvAsEQwFAU6MnxUJRAtCnx/cIQaVBw9UOQthtPjrTOSP1roygDJ05
        TQtQh3pPxQsJPQfow6kb0hKwtGJWSBX/Q6qYFdI1QDrBImzhjXrMqy2a2b/XAHxnGLrJBZq7
        EzsApAAzT0b5T6XSYu4Qf8TYARBFMoGy5OhvqbQsiztyFFvN6Va7AfMdQOsJuZQMWphp9hy1
        yZau0qo1Gg2rjYzSKKOYxbJ3S66m0lDP2XAuxhZs/ecjKL+gPCAO393fEaev1s80yF+ucN1a
        dWLnFsXBgbl76ePmnxuLFxU8xGNvu2+EBff/Ml103V7Z0qamN//s3NHiLnpDTj+V2+2X1SOZ
        CSEHQg9yaY6M8aWDlX0TsRMvgKtubP/wsT1EMdfvTg5xvm0KpL7mz3MrFDAfb6vxe0YnV11J
        Gh1hRHw2pwolrTz3BwFwAtecAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t9jQV17v6/RBqufiFlsnLGe1WL+kXOs
        Fn37/jNa9D9+zWxx/vwGdouPPfdYLWac38dksfbIXXaLpdcvMlm07j3CbnH4TTurA7fHmnlr
        GD02repk8zj4bg+TR9+WVYwenzfJBbBGcdmkpOZklqUW6dslcGWs3J9QsFSkYt+kTrYGxumC
        XYycHBICJhING84ydTFycQgJrGOU+LyynxEkwSsgKPFj8j2WLkYODmYBeYkjl7IhTHWJKVNy
        IcrvM0q8vPSeHaJcQ2Jr41I2EJtFQFXiauslsDibgJbE/hc3wOL8AooSV388ZgSZIyoQIdF9
        ohIkLCIQJTH/2WQ2kJnMAg+YJF5M6mMCSQgLOEo8P/iQGWLZZUaJhQ8Os4AkOAVcJf72vGea
        wCgwC8mpsxBOnYVw6gJG5lWMkqkFxbnpucVGBUZ5qeV6xYm5xaV56XrJ+bmbGIHxsO2wVv8O
        xsdL4g8xCnAwKvHwJgh/iRZiTSwrrsw9xCjBwawkwhtp8zVaiDclsbIqtSg/vqg0J7X4EKM0
        B4uSOC9//rFIIYH0xJLU7NTUgtQimCwTB6dUA+N8jhRZYWYL/ma97Xdic3m/2OYYK3Hfn3pB
        sd055W9YmMfa9NhZ0R6FRlKqb377PNMNVOnY8/vqPc//63SOvLQQXXnojf/B2TvWbFCuPhjr
        bP0npfP4tO1yE6vZV008HVpQZXfk7iyOJTcObA4stjGamsmXt/3iYp4T0uKLG+c9i/+Sf+NM
        fIYSS3FGoqEWc1FxIgDwoqSFgwIAAA==
X-CMS-MailID: 20181121122327epcas2p4c43dc272d58ac3dc8a1d61fd80097bbb
X-Msg-Generator: CA
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
        <20181121120509.18892-2-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 2018년 11월 21일 21:05, Kamil Konieczny wrote:
> Fix typo in imem sssx name and typo 200 switched with 266.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>

Looks good to me. 
But, You have to add the 'Fixes' information and then send this patch to stable mailing list.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
>  include/dt-bindings/clock/exynos5433.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 751e2c4fb65b..24c3360db65b 100644
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
> @@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
>  	GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
>  			ENABLE_ACLK_TOP, 25,
>  			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
> +	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
>  			ENABLE_ACLK_TOP, 24,
>  			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
> -	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
> +	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
>  			ENABLE_ACLK_TOP, 23,
>  			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
>  	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
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


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
