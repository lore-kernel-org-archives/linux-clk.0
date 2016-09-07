Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55613 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753786AbcIGEgI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2016 00:36:08 -0400
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Message-id: <57CF9935.2050802@samsung.com>
Date: Wed, 07 Sep 2016 13:36:05 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org
Subject: Re: [PATCH v2 1/7] clk: samsung: exynos5410: Add clock IDs for PDMA
 and EPLL clocks
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20160906120547epcas1p19f44da8b424f56fb05ada2b56f9f090f@epcas1p1.samsung.com>
 <1473163496-17820-2-git-send-email-s.nawrocki@samsung.com>
In-reply-to: <1473163496-17820-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2016년 09월 06일 21:04, Sylwester Nawrocki wrote:
> The PDMA{0,1} and EPLL clock IDs are added separately in this
> patch so the patch can be merged to the arm-soc tree as dependency.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
> Changes since v1:
>  - used same index values as for exynos5420.
> ---
>  include/dt-bindings/clock/exynos5410.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
> index 85b467b..6cb4e90 100644
> --- a/include/dt-bindings/clock/exynos5410.h
> +++ b/include/dt-bindings/clock/exynos5410.h
> @@ -19,6 +19,7 @@
>  #define CLK_FOUT_MPLL		4
>  #define CLK_FOUT_BPLL		5
>  #define CLK_FOUT_KPLL		6
> +#define CLK_FOUT_EPLL		7
> 
>  /* gate for special clocks (sclk) */
>  #define CLK_SCLK_UART0		128
> @@ -55,6 +56,8 @@
>  #define CLK_MMC0		351
>  #define CLK_MMC1		352
>  #define CLK_MMC2		353
> +#define CLK_PDMA0		362
> +#define CLK_PDMA1		363
>  #define CLK_USBH20		365
>  #define CLK_USBD300		366
>  #define CLK_USBD301		367

The CLK_FOUT_EPLL is used on patch4 and CLK_PDMAx are used on patch2.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
