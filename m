Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48443 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932148AbbKMOqr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 13 Nov 2015 09:46:47 -0500
Date: Fri, 13 Nov 2015 08:46:42 -0600
From: Rob Herring <robh@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Inki Dae <inki.dae@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
Message-ID: <20151113144642.GA20904@rob-hp-laptop>
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 26, 2015 at 12:59:56PM +0100, Andrzej Hajda wrote:
> DECON-TV(Display and Enhancement Controller for TV) is a variation
> of DECON IP. Its main purpose is to produce video stream for HDMI IP.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> Hi Krzysztof,
> 
> I have decided to skip cleanup part as it would require more work,
> not related to this patchset.
> 
> Regards
> Andrzej
> 
>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
> index 3dff78b..c9fd7b3 100644
> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
> @@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image data from a video memory
>  buffer to an external LCD interface.
>  
>  Required properties:
> -- compatible: value should be "samsung,exynos5433-decon";
> +- compatible: value should be one of:
> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>  - reg: physical base address and length of the DECON registers set.
>  - interrupts: should contain a list of all DECON IP block interrupts in the
>  	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
