Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51062 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263AbbJTMmN (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 08:42:13 -0400
Subject: Re: [PATCH 04/10] dt-bindings: video: add PCLK clock entry to
 exynos5433-decon
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Inki Dae <inki.dae@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
 <1445332961-25419-5-git-send-email-a.hajda@samsung.com>
 <5626327E.3050002@samsung.com>
Cc: k.kozlowski.k@gmail.com,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-id: <56263691.1080804@samsung.com>
Date: Tue, 20 Oct 2015 14:41:53 +0200
MIME-version: 1.0
In-reply-to: <5626327E.3050002@samsung.com>
Content-type: text/plain; charset=iso-8859-2
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/20/2015 02:24 PM, Krzysztof Kozlowski wrote:
> W dniu 20.10.2015 o 18:22, Andrzej Hajda pisze:
>> DECON IP requires this clock to access configuration registers.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/video/exynos5433-decon.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> index 377afbf..3dff78b 100644
>> --- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
>> @@ -16,7 +16,7 @@ Required properties:
>>  - clocks: must include clock specifiers corresponding to entries in the
>>  	  clock-names property.
>>  - clock-names: list of clock names sorted in the same order as the clocks
>> -	       property. Must contain "aclk_decon", "aclk_smmu_decon0x",
>> +	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
> I assume that old DTB wouldn't work at all, so there is no point in
> maintaining ABI compatibility?

Yes, Exynos 5433 has not yet landed in mainline.

Regards
Andrzej

>
> Best regards,
> Krzysztof
>
>

