Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B09C04EB9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 22:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2D322146F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 22:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vjJcKGnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D322146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbeK3KA5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 05:00:57 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:49149 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeK3KA5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Nov 2018 05:00:57 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20181129225347epoutp012083dd8ab77bdcb994de389c5b736745~rujNm_deZ3251132511epoutp01N;
        Thu, 29 Nov 2018 22:53:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20181129225347epoutp012083dd8ab77bdcb994de389c5b736745~rujNm_deZ3251132511epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1543532027;
        bh=GC5T+12rS4hv6U7+JH7eAxBXXS/ILyN+ad2BuENgXkc=;
        h=Date:From:To:Cc:Subject:In-reply-to:References:From;
        b=vjJcKGnmMYZKroYql+C+spftw4dLsX3VG9fIjdk7eM3237GmPxax9FumRL1/bGMNq
         uRg0/w8+qk6l4cfs/4s/Pi1JEh/mFk05q13IQBFtgjpxwyPv5hsrbqCIEATEpBdqVR
         MtaubTJPt3xoiCv8s9EXSBJ9bggHhx5eS52iDyOY=
Received: from epsmges1p3.samsung.com (unknown [182.195.40.152]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20181129225344epcas1p366fb1fdcea2044350fc9f7edc9ad2f39~rujKzCK5E2443524435epcas1p3r;
        Thu, 29 Nov 2018 22:53:44 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        0B.98.04060.8FD600C5; Fri, 30 Nov 2018 07:53:44 +0900 (KST)
Received: from epsmgms2p1new.samsung.com (unknown [182.195.42.142]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181129225343epcas1p24ed56a7c15fd4163440a24b74e170e52~rujKWdnBm1747017470epcas1p21;
        Thu, 29 Nov 2018 22:53:43 +0000 (GMT)
X-AuditID: b6c32a37-429ff70000000fdc-96-5c006df864e8
Received: from epmmp2 ( [203.254.227.17]) by epsmgms2p1new.samsung.com
        (Symantec Messaging Gateway) with SMTP id 8B.17.03601.7FD600C5; Fri, 30 Nov
        2018 07:53:43 +0900 (KST)
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset="utf-8"
Received: from [10.113.63.77] by mmp2.samsung.com (Oracle Communications
        Messaging Server 7.0.5.31.0 64bit (built May  5 2014)) with ESMTPA id
        <0PIZ002D18XI9E30@mmp2.samsung.com>; Fri, 30 Nov 2018 07:53:43 +0900 (KST)
Message-id: <5C006DF6.5090506@samsung.com>
Date:   Fri, 30 Nov 2018 07:53:42 +0900
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
        Marek Szyprowski <m.szyprowski@samsung.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: samsung: exynos5433: fix typo in imem
 divider
In-reply-to: <20181129155134.19141-2-k.konieczny@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTURz27O5ud+nqtMoOSjkv9YeC5W1Nr6ElZDGoYBVUpGE3vWyy1213
        9iaSHpaaWRaIWVPKSLFy68GKnrasxBw9xJQ0emgyIysth2G2u4vkf9/5/b7vnO/3nR+BqY7L
        oog8q4O1WxkzKZsivfU4LiEhYAnLSrw8Hk67Kq7htNPbhtOl98cBfeLTAEb7fI1y+kdJD05X
        +O5L6Cvebjld2/FSQh++55XTj78W4nS16yNIj9A1nG8AOnf9MZnu0be7El3pjXqgG3LP1eOb
        TalGlsll7WrWmmPLzbMa0shV67OXZ2uTEqkEKoVOJtVWxsKmkRmr9Qkr88xBf6R6B2POD5b0
        DM+TC5em2m35DlZttPGONJLlcs1cCreAZyx8vtWwIMdmWUIlJi7SBolbTUZv+UeMexC+q6Ps
        rPwA6FUUAQWB4GL04kMAF7AKegBq7s4sAlOCeASgzoG3YILUOtQsFxuNABUUezGhoYTTUaC8
        R1oECAKDMcj7yiSUMRiH+odPScVLuwEa7NogUJQwHlV2cEJZCuejds9VmYBlwfKD/rchPA3G
        ovbAp9Czs+AmdNv5Wy7gmXAzujl4EwgWMBiQoJLOjhBpBtSji+7BkFgBV6A7heUhnwiOyNAj
        5yAuDpCBPrzslYp4BvI/vSEXDCEYjV49SRP5hQAN9x/ExUMZQN9brktEgQb11RRJxMmmom+/
        SnBRrERHj6hEig5V1TZiYkCvAfJ89UnLwJzKSRlV/s+oclJG1QCrB5Esx1sMLE9xmsmf5wah
        VYxP9oDGttVNABKAjFCmj45nqnBmB7/b0gQQgZEzlcvUYVkqZS6zew9rt2Xb880s3wS0wZBP
        YlGzcmzBxbY6sintIo1GQy+mkrQURc5Wfo46l6mCBsbBmliWY+0TOgmhiDoA9kO8uMrQoxnw
        /77zsPfLdtdVp38ese5SVefa0VUVY8SZZ2UrD20Zcbe3bysw+rtOe97tbHmj8M4+fzEaS3Jp
        1QN/wk0byfHnUu79s30L97baqutqqoYeRptcT9eM3b3gX9GMnS53dv3a1ZYTrSdMYz8jvW21
        b2pj6pT7Y3192r+klDcyVDxm55l/24kdiaADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsVy+t9jQd3vuQwxBnsXalhsnLGe1WL+kXOs
        Fn37/jNa9D9+zWxx/vwGdouPPfdYLWac38dksfbIXXaLpdcvMlm07j3CbnH4TTurxYKNjxgd
        eDzWzFvD6LFpVSebx8F3e5g8+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+PI5EfMBfu5K65P
        mM3ewPiUs4uRk0NCwETizOdj7F2MXBxCAusYJdY9OssMkuAVEJT4MfkeSxcjBwezgLzEkUvZ
        EKa6xJQpuRDl9xklWnc9ByvhFdCSmHW9AKSTRUBV4uqOdWwgNhtQeP+LG2A2v4CixNUfjxlB
        ykUFIiS6T1SChEUEoiTmP5vMBjKSWeAHk8TRp9vYQRLCAn4S81r2MUHsuswoMen3G7BBnAKu
        ErvaJ7NPYBSYheTSWQiXzkK4dAEj8ypGydSC4tz03GKjAsO81HK94sTc4tK8dL3k/NxNjMDI
        2HZYq28H4/0l8YcYBTgYlXh4X3z/Hy3EmlhWXJl7iFGCg1lJhNdegSFGiDclsbIqtSg/vqg0
        J7X4EKM0B4uSOO/tvGORQgLpiSWp2ampBalFMFkmDk6pBsZ5ETzLvJr61OKLtzzteuPzpbzF
        +/CCK4pf/aWefVja9kk6ycHntLqvyYf8UPsNRZ5sG88Z789TusHjvPnmtxRug8nRJ6pl39tW
        LNrdzL5dcedxkeLOZS/afsi+j8h706698IRbS8GFW1UMXjsfdZUJpyufP5RScMTquNGa46++
        xPyR3SL8+KgSS3FGoqEWc1FxIgCN5rToiAIAAA==
X-CMS-MailID: 20181129225343epcas1p24ed56a7c15fd4163440a24b74e170e52
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
        <CGME20181129155145eucas1p18b3f72cb77218279c9a844cbc179b728@eucas1p1.samsung.com>
        <20181129155134.19141-2-k.konieczny@partner.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 2018년 11월 30일 00:51, Kamil Konieczny wrote:
> Fix typo in imem clock divider 200 switched with 266.
> 
> Fixes: 5785d6e61f27 ("clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains")
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 751e2c4fb65b..ea47f49abc7f 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
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
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
