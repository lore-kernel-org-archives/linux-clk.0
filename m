Return-Path: <cwchoi00@gmail.com>
MIME-Version: 1.0
Reply-To: cwchoi00@gmail.com
In-Reply-To: <c9b51cb6-f798-d41e-afff-f779b963345c@samsung.com>
References: <20170114123642.15581-1-krzk@kernel.org> <CGME20170114123727epcas2p296aae6459c8575d7e5def74f18e5c64d@epcas2p2.samsung.com>
 <20170114123642.15581-3-krzk@kernel.org> <c9b51cb6-f798-d41e-afff-f779b963345c@samsung.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Sat, 21 Jan 2017 14:08:34 +0900
Message-ID: <CAGTfZH2Eh67iMb7bBY2ostNUbxmOtQxy=P7ZRSEDzS4=enyMKg@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: samsung: Remove Exynos4415 driver (SoC not
 supported anymore)
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
	Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
	Kukjin Kim <kgene@kernel.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sylwester,

I add reveiwed-by tag from this patch. But, on you tree, this patch[1] does=
n=E2=80=99t
include the my reviewed-by tag.

[1] https://git.linuxtv.org/snawrocki/samsung.git/commit/?h=3Dfor-v4.11/clk=
/next&id=3Dcb4ac949ea14416a2d57b7a343bc4b571074e3bd

2017-01-16 19:32 GMT+09:00 Sylwester Nawrocki <s.nawrocki@samsung.com>:
> On 01/14/2017 01:36 PM, Krzysztof Kozlowski wrote:
>> Support for Exynos4415 is going away because there are no internal nor
>> external users.
>>
>> Since commit 46dcf0ff0de3 ("ARM: dts: exynos: Remove exynos4415.dtsi"),
>> the platform cannot be instantiated so remove also the drivers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Applied, thanks.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
