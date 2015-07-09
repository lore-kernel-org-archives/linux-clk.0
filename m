Return-Path: <s.nawrocki@samsung.com>
Message-id: <559EB4FA.6080306@samsung.com>
Date: Thu, 09 Jul 2015 19:52:58 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 stable@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: exynos4: Fix wrong clock for Exynos4x12 ADC
References: <1434074005-18846-1-git-send-email-k.kozlowski@samsung.com>
 <CABxcv=mQfcb3jsRzOcWXAbNRf-dumoHS8X-2TEeOdB2E_T5BMQ@mail.gmail.com>
 <CAJKOXPeFxABcm27_tmriY6RreaRYZiEPvUvFav4DK-AoNbUs=Q@mail.gmail.com>
 <CA+Ln22HHpdKD8+_zSzX10FBM_aDByePfA3_vactLOxh_J961tA@mail.gmail.com>
 <CAJKOXPeGMTabQ6CEfMrd1S1dFYTfNoaf2XKvJwoEZzaiTUfq7A@mail.gmail.com>
In-reply-to: 
 <CAJKOXPeGMTabQ6CEfMrd1S1dFYTfNoaf2XKvJwoEZzaiTUfq7A@mail.gmail.com>
Content-type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 09/07/15 02:23, Krzysztof Kozlowski wrote:
>>>>>  drivers/clk/samsung/clk-exynos4.c | 2 ++
>>>>> >>>>  1 file changed, 2 insertions(+)
>>>>> >>>>
>>>> >>>
>>>> >>> Patch looks good to me.
>>>> >>>
>>>> >>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>> >>
>>> >> Hi Tomasz and Sylwester,
>>> >>
>>> >> Any comments on this version of patch?
>>> >> Tomasz, you gave me comments on previous version. Are their satisfied?
>> >
>> > Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> Thanks for ack.
> 
> Sylwester, are you gonna to pick it up or this should go through other tree?

I've taken care of this citizen, thanks for the reminder and reviews.

-- 
Regards,
Sylwester
