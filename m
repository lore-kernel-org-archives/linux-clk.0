Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297FFC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 05:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9F9D2084A
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 05:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c3sdAS9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F9D2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbeLKFHB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 00:07:01 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:41471 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbeLKFHA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 00:07:00 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20181211050656epoutp01554b41cc83ec59ce1cd9ecc227324e67~vLvKUlScM0992809928epoutp01R;
        Tue, 11 Dec 2018 05:06:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20181211050656epoutp01554b41cc83ec59ce1cd9ecc227324e67~vLvKUlScM0992809928epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1544504816;
        bh=0sunCkbqNJ9M5IR5CgqcdouvUDSefFI6HSyk/HzGRNE=;
        h=Date:From:To:Cc:Subject:In-reply-to:References:From;
        b=c3sdAS9chLtu9le/eBcu0SI7i27kqTq1KYE7byMylGWU+tJJ61tfbJ9SZKUtnHKtR
         DU6D2wVrLbBo8DXqqE7SYdfqFwqKEyZuJzVIcDjKjyedipuF70eN1RGKhzGM2LceSO
         uZIBly1YBRU3vYWPw2UaS24lKhzrA2CxxaHVzUyE=
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181211050652epcas1p16c2414c8334323cfad0270b4bcfbc441~vLvG5vLhl1402314023epcas1p1f;
        Tue, 11 Dec 2018 05:06:52 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        CB.81.04058.CE54F0C5; Tue, 11 Dec 2018 14:06:52 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181211050652epcas1p16c4d9e30947de8dd9b2440414c49e8f4~vLvGpWLAH0444004440epcas1p1L;
        Tue, 11 Dec 2018 05:06:52 +0000 (GMT)
X-AuditID: b6c32a35-e1fff70000000fda-50-5c0f45ec3590
Received: from epmmp1.local.host ( [203.254.227.16]) by
        epsmgms2p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E5.C4.03601.CE54F0C5; Tue, 11 Dec 2018 14:06:52 +0900 (KST)
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Received: from [10.113.63.77] by mmp1.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PJK004QW3JGB010@mmp1.samsung.com>; Tue, 11 Dec 2018 14:06:52 +0900 (KST)
Message-id: <5C0F45EC.7020509@samsung.com>
Date:   Tue, 11 Dec 2018 14:06:52 +0900
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
Subject: Re: [PATCH v3 3/5] dt-bindings: clk: exynos5433: document imem
 clock
In-reply-to: <20181204165248.17572-4-k.konieczny@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju29nZjtr0NLW+Fto60Q8NzaPOjtUk6MIiSemG6EhP7jRlV3a2
        TH/EopuJmKaSmJlKkiyjWpqmpegmRdQkI4rKRWgx85Z00TKpbafIf+/7vM/z8rzP92GIuFgg
        wfL1Zsakp7WEIJB/1xEVGzOxI0QZN9lKUbdrbqLUFacLpcp6fgPq/Mg4Qg0O3hJSM6VulKoZ
        7OFRN5zDQqr55TMedfqBU0g5Js6iW4MUrfWtQGG3nRMo+qbu8xRlbTag+GKPTEczNVvyGFrF
        mKSMPtegyter5cTufdnbsmVJcWQMmUxtJKR6WsfIie2p6TE787Vea4T0KK21eKF0mmWJDSlb
        TAaLmZHmGViznGCMKq0x2RjL0jrWolfH5hp0m8i4uHiZl5ijyZufaRAaO8XHBkvq+VYwHlwC
        AjCIJ8K6Ox9ACQjExHgngF+uv+ZzzSyApW/mhP9Y16xulBt0AzjzrYLnG4jwZXCu0u1VYBiC
        r4bOIY0PRvAo6Pl64e+iYQAnbjUJOH40nK1v8fP5+Dpo9ah9sMAL93pe+Skh+Br4Ym4E+Opw
        PAPeu/Ld7yEMz4Tt0+1+pwju5sGrjdOIb08ongZbJpf6OAH4Dmh7VwY4z+MCeNkKuXo7HB1q
        QLk6FH562Cb0SSG+Cg4NyH0rIX4WwK+ekyjXlAP4+fEdHidIgB8bS3jcYcFw6lspyolFsPiM
        mKMo4GRHl4C79zmAjp9v+eUgonZRRLX/I6pdFFEDQGxgOWNkdWqGJY3k4sezA/8vjJZ1gipX
        aj/AMUAsFUlPBSvFKH2ULdT1A4ghRJgo5ohIKRap6MIixmTINlm0DNsPZN6EKxBJeK7B+6f1
        5mxSFp+QkEAlkkkykiRWiEYll7PEuJo2MxqGMTKmfzoeFiCxgsygpoWV3R1jHUt6CiTxtqSC
        X3Z3c+XeAuklVXFRdfr+rrSi1U2CF9ZTRT+qZzdHHNE/GnvaaeebXPE55c7wXT9PpDgwlWW4
        SnHw8ALy5JDGtmkqdmZeeqLdocyKbDYirtQDYCDs4khhYrD0WYpyVUbG977jvXsi6za8X8u6
        1ssJPptHk9GIiaX/AEBFrh6bAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t9jAd03rvwxBsceKFpsnLGe1WL+kXOs
        Fn37/jNa9D9+zWxx/vwGdouPPfdYLWac38dksfbIXXaLpdcvMlm07j3CbnH4TTurA7fHmnlr
        GD02repk8zj4bg+TR9+WVYwenzfJBbBGcdmkpOZklqUW6dslcGX8/riAvWCHUMX5rnksDYyv
        +boYOTkkBEwkljfcY+1i5OIQEtjJKLHr3zQmkASvgKDEj8n3WLoYOTiYBeQljlzKhjDVJaZM
        yYUov88osWzBMhaIci2J7/NWgJWzCKhKNLxIBwmzAYX3v7jBBmLzCyhKXP3xmBGkRFQgQqL7
        RCVIWEQgSmL+s8lsICOZBR4wSbyY1Ad2gbCAr8TzTR/ZIHZdZpQ49XA62C5OAVeJVff7GCcw
        CsxCcukshEtnIVy6gJF5FaNkakFxbnpusVGBYV5quV5xYm5xaV66XnJ+7iZGYDxsO6zVt4Px
        /pL4Q4wCHIxKPLwVbXwxQqyJZcWVuYcYJTiYlUR4ddN4Y4R4UxIrq1KL8uOLSnNSiw8xSnOw
        KInz3s47FikkkJ5YkpqdmlqQWgSTZeLglGpgnJndfkk51PT+/7vJV6bMVq2/tDHMUedaQcHZ
        k48Ca668duZeV/ZJodQ5VfsUg2eK5r8n7H4My1f9Lfx91jzKObTbUSDtTm/X9wOfeMzFPu58
        VyGR17U2uegpny2btrt7xOcOTT/Ty+a5YhqilWGBivs3GM2cMl1jS/uvm/PPvzE8eOFh+QcR
        JZbijERDLeai4kQAex621IMCAAA=
X-CMS-MailID: 20181211050652epcas1p16c4d9e30947de8dd9b2440414c49e8f4
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20181204165317eucas1p10bef0207ee57a9420911410ed2a22453
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165317eucas1p10bef0207ee57a9420911410ed2a22453@eucas1p1.samsung.com>
        <20181204165248.17572-4-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Kamil,

On 2018년 12월 05일 01:52, Kamil Konieczny wrote:
> Document DT bindings for imem clock of the Samsung Exynos5433 SSS (Security
> SubSystem) and SlimSSS IPs.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> index 50d5897c9849..183c327a7d6b 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -50,6 +50,8 @@ Required Properties:
>      IPs.
>    - "samsung,exynos5433-cmu-cam1" - clock controller compatible for CMU_CAM1
>      which generates clocks for Cortex-A5/MIPI_CSIS2/FIMC-LITE_C/FIMC-FD IPs.
> +  - "samsung,exynos5433-cmu-imem"   - clock controller compatible for CMU_IMEM
> +    which generates clocks for SSS (Security SubSystem) and SlimSSS IPs.
>  
>  - reg: physical base address of the controller and length of memory mapped
>    region.
> @@ -168,6 +170,12 @@ Required Properties:
>  		- aclk_cam1_400
>  		- aclk_cam1_552
>  
> +	Input clocks for imem clock controller:
> +		- oscclk
> +		- aclk_imem_sssx_266
> +		- aclk_imem_266
> +		- aclk_imem_200
> +
>  Optional properties:
>    - power-domains: a phandle to respective power domain node as described by
>  	generic PM domain bindings (see power/power_domain.txt for more
> @@ -469,6 +477,21 @@ Example 2: Examples of clock controller nodes are listed below.
>  		power-domains = <&pd_cam1>;
>  	};
>  
> +	cmu_imem: clock-controller@11060000 {
> +		compatible = "samsung,exynos5433-cmu-imem";
> +		reg = <0x11060000 0x1000>;
> +		#clock-cells = <1>;
> +
> +		clock-names = "oscclk",
> +			"aclk_imem_sssx_266",
> +			"aclk_imem_266",
> +			"aclk_imem_200";
> +		clocks = <&xxti>,
> +			<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> +			<&cmu_top CLK_DIV_ACLK_IMEM_266>,
> +			<&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +	};
> +
>  Example 3: UART controller node that consumes the clock generated by the clock
>  	   controller.
>  
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
