Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37587 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753421AbcANKtk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jan 2016 05:49:40 -0500
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Message-id: <56977D42.2050904@samsung.com>
Date: Thu, 14 Jan 2016 19:49:38 +0900
From: Inki Dae <inki.dae@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 09/10] dt-bindings: video: exynos5433-decon: add
 bindings for DECON-TV
References: <CAJKOXPfXrEwu1egSnLxwYofu_scskkPRKOjOCskObPFn9yVcJw@mail.gmail.com>
 <1445860796-23045-1-git-send-email-a.hajda@samsung.com>
 <56977A3B.8020104@samsung.com>
In-reply-to: <56977A3B.8020104@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

+ Rob Herring

2016년 01월 14일 19:36에 Andrzej Hajda 이(가) 쓴 글:
> Hi Inki,
> 
> It seems this patch and 04/10 did not get picked up yet.
> Could you merge it?

Yes, I can. However, 04/10 is required for acked-by from dt or SoC maintainer.
Krzysztof and Rob, could you give me acked-by?

Thanks,
Inki Dae

> 
> Regards
> Andrzej
> 
> On 10/26/2015 12:59 PM, Andrzej Hajda wrote:
>> DECON-TV(Display and Enhancement Controller for TV) is a variation
>> of DECON IP. Its main purpose is to produce video stream for HDMI IP.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> Hi Krzysztof,
>>
>> I have decided to skip cleanup part as it would require more work,
>> not related to this patchset.
>>
>> Regards
>> Andrzej
>>
>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> index 3dff78b..c9fd7b3 100644
>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> @@ -5,7 +5,8 @@ Exynos series of SoCs which transfers the image data from a video memory
>>  buffer to an external LCD interface.
>>  
>>  Required properties:
>> -- compatible: value should be "samsung,exynos5433-decon";
>> +- compatible: value should be one of:
>> +	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
>>  - reg: physical base address and length of the DECON registers set.
>>  - interrupts: should contain a list of all DECON IP block interrupts in the
>>  	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
