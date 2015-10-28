Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
To: Mark Brown <broonie@kernel.org>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com> <20151028015323.GZ28319@sirena.org.uk>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, lee.jones@linaro.org,
 mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, rtc-linux@googlegroups.com,
 linux-kernel@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <56303054.8060804@samsung.com>
Date: Wed, 28 Oct 2015 11:17:56 +0900
MIME-version: 1.0
In-reply-to: <20151028015323.GZ28319@sirena.org.uk>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 28.10.2015 10:53, Mark Brown wrote:
> On Wed, Oct 28, 2015 at 10:29:56AM +0900, Krzysztof Kozlowski wrote:
> 
>> If that's true, then don't add new compatibles, new names etc. Re-use.
>> No new code needed, no changes needed. Keep it simple.
> 
> Well, it depends - it can be useful to get the information about it
> being a different part into DT so that if in future we realise that
> there is some difference (perhaps a bug workaround even if the IP is
> intended to be the same).  Though in the case of a MFD that information
> can be obtained from the MFD for the device.

We can always differentiate later and introduce new compatible.
Declaring a compatible right now would be useful only if we really cared
about using the workaround on older DTBs.

Since I cannot judge the difference (I don't have the datasheet of
S2MPS15) then I don't see the need of adding new compatible/name for the
"same device".

Of course maybe there is such need? Alim?

Best regards,
Krzysztof
