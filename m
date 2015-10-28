Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62698 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932190AbbJ1Dbu (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 27 Oct 2015 23:31:50 -0400
Subject: Re: [PATCH v3 5/5] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-6-git-send-email-alim.akhtar@samsung.com>
 <56302514.4090407@samsung.com> <20151028015323.GZ28319@sirena.org.uk>
 <56303054.8060804@samsung.com> <56303DA3.5020306@samsung.com>
Cc: lee.jones@linaro.org, mturquette@baylibre.com,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <5630419F.1000300@samsung.com>
Date: Wed, 28 Oct 2015 12:31:43 +0900
MIME-version: 1.0
In-reply-to: <56303DA3.5020306@samsung.com>
Content-type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 28.10.2015 12:14, Alim Akhtar wrote:
> Hello,
> 
> On 10/28/2015 07:47 AM, Krzysztof Kozlowski wrote:
>> On 28.10.2015 10:53, Mark Brown wrote:
>>> On Wed, Oct 28, 2015 at 10:29:56AM +0900, Krzysztof Kozlowski wrote:
>>>
>>>> If that's true, then don't add new compatibles, new names etc. Re-use.
>>>> No new code needed, no changes needed. Keep it simple.
>>>
>>> Well, it depends - it can be useful to get the information about it
>>> being a different part into DT so that if in future we realise that
>>> there is some difference (perhaps a bug workaround even if the IP is
>>> intended to be the same).  Though in the case of a MFD that information
>>> can be obtained from the MFD for the device.
>>
>> We can always differentiate later and introduce new compatible.
>> Declaring a compatible right now would be useful only if we really cared
>> about using the workaround on older DTBs.
>>
>> Since I cannot judge the difference (I don't have the datasheet of
>> S2MPS15) then I don't see the need of adding new compatible/name for the
>> "same device".
>>
>> Of course maybe there is such need? Alim?
>>
> Well I did think of keeping the changes as minimal as possible, like
> just have "{ "s2mps15-rtc",        S2MPS14X }", since I don't have
> access to s2mps14 UM, I could not confirm that s2mps14 and s2mps15 are
> exactly the same w.r.t rtc block. So I proposed the current changes.
> 
> Well I do agree with Mark here, a name/compatible matching with the pmic
> is good to at least avoid confusion while looking at the sysfs.

What kind of confusion in sysfs? I don't see any... and already the
s2mps14-rtc name is used for S2MPS11 and S2MPS14.

The s2mps13 clock driver added new name and compatible... which was
probably totally unneeded (I missed that during review). We don't have
to make this as a rule...

Since we do not have any data about future workarounds and the
differences then just follow Ockham's razor - use the same name and
compatible.

Best regards,
Krzysztof
