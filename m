Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E610EC28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 11:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 945AC25801
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 11:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NVnYPMtZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfE3LNZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 May 2019 07:13:25 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43972 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfE3LNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 May 2019 07:13:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190530111323euoutp0184a814f6a50a058c6bba79ee9e2ad20d~jcZpKMVWM0891708917euoutp01t
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2019 11:13:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190530111323euoutp0184a814f6a50a058c6bba79ee9e2ad20d~jcZpKMVWM0891708917euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559214803;
        bh=BfhHNZxrJQwUOEFilSzsVER/q8DLDg227clvMkyf9Tg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=NVnYPMtZpHys+hY7tos7EOUEsqa5rrG06HXeW2intLiATrXn6RfqTckqnkiIqnVXJ
         hPUZlvO5DpWGqDZij6g/3qa5cRJKAhcYAo05sXdF+5GmFpw/ipF+hCeeWEL98YbfGX
         +Xtktjtw1mUKzTFzzGUW3ZHnBw0sgm2hnhvakLwk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190530111322eucas1p2bb9a94497bcc26d656899441dda8cb86~jcZoaGmly1273212732eucas1p2J;
        Thu, 30 May 2019 11:13:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id FA.A8.04377.2DABFEC5; Thu, 30
        May 2019 12:13:22 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190530111321eucas1p2941943c0bbd01e9bd2ad078fd2734d36~jcZnYzOqe1058510585eucas1p2b;
        Thu, 30 May 2019 11:13:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190530111321eusmtrp253cac4dbe7583aad1fedbee86fea1595~jcZnJR4da0638806388eusmtrp2E;
        Thu, 30 May 2019 11:13:21 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-ee-5cefbad2465d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.DD.04140.1DABFEC5; Thu, 30
        May 2019 12:13:21 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190530111320eusmtip2df9bcccdb1e84c7ac6d8bba3fd7858d7~jcZmzO9-Y0782107821eusmtip2a;
        Thu, 30 May 2019 11:13:20 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <b57d66da-9b18-7b1d-ffa6-3b4600f9dc5a@samsung.com>
Date:   Thu, 30 May 2019 13:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djPc7qXdr2PMbj7Sdii//FrZovz5zew
        W2x6fI3V4mPPPVaLGef3MVlcPOVq8e/aRhaLxs/3GR04PN7faGX3aDnyltVj06pONo/NS+o9
        Pm+SC2CN4rJJSc3JLEst0rdL4Mp42fSXreAOZ8WS2SvYGxj7OboYOTkkBEwknsycygpiCwms
        YJTYtEmii5ELyP7CKPGo+yYrhPOZUWL77mmsMB2PZ+xmgkgsZ5T4/m8OM4TzllGi7e1aNpAq
        YQEfia2n3gAlODhEBHQkFh4uBalhFuhhkph3/SsLSA2bgKFE79E+RhCbV8BOonXuVrBeFgFV
        iVmda8C2iQpESHzZuQmqRlDi5MwnYL2cAo4Sx25cZAaxmQXEJZq+rGSFsOUltr+dwwxx6S52
        id6XCRC2i8Stq4/YIWxhiVfHt0DZMhL/d84H+0ZCoJlRomf3bXYIZwKjxP3jCxghqqwlDh+/
        yAryDbOApsT6XfoQYUeJC6dB6jmAbD6JG28FIW7gk5i0bTozRJhXoqNNCKJaReL3qulMELaU
        RPeT/ywTGJVmIflsFpJvZiH5ZhbC3gWMLKsYxVNLi3PTU4uN8lLL9YoTc4tL89L1kvNzNzEC
        E9Hpf8e/7GDc9SfpEKMAB6MSD++E/HcxQqyJZcWVuYcYJTiYlUR4fy4HCvGmJFZWpRblxxeV
        5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamCUt7Vo1X+pn2xif6GhcY356YJ3
        1bu5FmnyZnOWXAm7dTbg5A43lstm9w8p3U9a6ivIdrU4+H2/g7W7SEiVaN7Ri1pxa4rn301V
        OKJrwKf6el5fs5vJrrp9u+K/vzsyJ+7tDK/qhgzPNQrPxHvPqqx9/7vksMM9J/aHH64Jaet8
        rxaeY6hZWKzEUpyRaKjFXFScCACieAJmQAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7oXd72PMXj/SMii//FrZovz5zew
        W2x6fI3V4mPPPVaLGef3MVlcPOVq8e/aRhaLxs/3GR04PN7faGX3aDnyltVj06pONo/NS+o9
        Pm+SC2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL
        0Mt42fSXreAOZ8WS2SvYGxj7OboYOTkkBEwkHs/YzdTFyMUhJLCUUWL9+5OMXYwcQAkpifkt
        ShA1whJ/rnWxQdS8ZpQ4dLyRESQhLOAjsfXUG2aQehEBHYmFh0tBapgFepgkth3/wQ7RMIVR
        YuubH2ANbAKGEr1H+8BsXgE7ida5W9lAbBYBVYlZnWtYQWxRgQiJ2bsaWCBqBCVOznwCZnMK
        OEocu3GRGcRmFlCX+DPvEpQtLtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGK
        pJYW56bnFhvpFSfmFpfmpesl5+duYgTG3rZjP7fsYOx6F3yIUYCDUYmHd0L+uxgh1sSy4src
        Q4wSHMxKIrw/lwOFeFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YFvJK4g1NDc0tLA3Njc2N
        zSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTDuji5tvzRR3+GjYQaHwS7u3XOM1262WH9I
        K+2ynItyCufsK87GKpOEwyOKp9t995GI+KFyYFmlZdBO2zvPHMUXvUs+Kd+0ccmKh9smpHG6
        BuU76r16nLb719r2tcm+33t2K0XVie88ZVz4fsP5zIYd+ZMezHCcdrOMP/S+ZVPRPcmUGUn3
        M2OUWIozEg21mIuKEwFt29Rf0wIAAA==
X-CMS-MailID: 20190530111321eucas1p2941943c0bbd01e9bd2ad078fd2734d36
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190525114732epcas3p1fdc42650975c9f7b1a39a87561e65a29
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190525114732epcas3p1fdc42650975c9f7b1a39a87561e65a29
References: <CGME20190525114732epcas3p1fdc42650975c9f7b1a39a87561e65a29@epcas3p1.samsung.com>
        <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/25/19 13:55, Kefeng Wang wrote:
> Use of_clk_get_parent_count() instead of open coding.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Patch applied, thank you.

In future please make sure to also Cc linux-clk@vger.kernel.org mailing list 
and the clk maintainers (Stephen, Michael) when sending clk patches.

> ---
>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index dae1c96de933..14e253915ca4 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5590,8 +5590,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	data->nr_clk_save = info->nr_clk_regs;
>  	data->clk_suspend = info->suspend_regs;
>  	data->nr_clk_suspend = info->nr_suspend_regs;
> -	data->nr_pclks = of_count_phandle_with_args(dev->of_node, "clocks",
> -						    "#clock-cells");
> +	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
> +
>  	if (data->nr_pclks > 0) {
>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>  					   data->nr_pclks, GFP_KERNEL);
>
-- 
Thanks,
Sylwester
