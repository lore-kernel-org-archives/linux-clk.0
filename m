Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:59424
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751634AbcKYNXA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Nov 2016 08:23:00 -0500
Subject: Re: [PATCH] clk/samsung: exynos-audss: Replace syscore PM with
 platform device PM
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <dce8ffa9-7392-774c-c3b9-791aa5a2ffb0@osg.samsung.com>
Date: Fri, 25 Nov 2016 10:12:09 -0300
MIME-Version: 1.0
In-Reply-To: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Marek,

On 11/25/2016 06:39 AM, Marek Szyprowski wrote:
> Exynos AUDSS clock driver has beem already converted to platform driver, so

s/beem/been

> remove the dependency on the syscore ops - the last remaining non-platform
> driver feature. Platform device's system sleep PM provides all needed
> infrastructure for replacing syscore-based PM, so do it now.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
