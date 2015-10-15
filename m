Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20598 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbbJOHWN (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 15 Oct 2015 03:22:13 -0400
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
To: Javier Martinez Canillas <javier@osg.samsung.com>,
	Luis de Bethencourt <luisbg@osg.samsung.com>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
 <20151014183831.GH26883@codeaurora.org> <561EA831.2070001@osg.samsung.com>
 <CAJKOXPeNGiuokN-NeS068bZqpSaJNz9QvaxoSs33855GY3_N_g@mail.gmail.com>
 <561F5189.3070809@osg.samsung.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Scott Branden <sbranden@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <561F541D.6010006@samsung.com>
Date: Thu, 15 Oct 2015 16:22:05 +0900
MIME-version: 1.0
In-reply-to: <561F5189.3070809@osg.samsung.com>
Content-type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 15.10.2015 16:11, Javier Martinez Canillas wrote:
> Hello Krzysztof,
>>>>
>>>
>>> No, I only build tested on arm32 and x86. The 0-day bot haven't reported a
>>> build error yet and I didn't see any platform dependent code in the drivers.
>>
>> I see you guys with Luis are adding a lot of COMPILE_TEST. But
> 
> Yes, the motivation for this was that I've been helping Mauro with a big
> rework in the media subsystem [0] and was annoying to audit that all the
> drivers were converted to the new APIs and no compile regressions were
> introduced in drivers that could not be built with COMPILE_TEST enabled.
> 
> Most media drivers are able to be build though so I thought it would be
> a good idea to extend the build coverage in all the other subsystems.
> 
>> building only on these two architectures *is not enough*. Run at least
>> armv8, PPC and the x86_64. MIPS would be nice as well (I use the
>> CodeSourcery's MIPS). All of these (ARM64, X86_64, PPC, MIPS) can be
>> easily installed on typical debian-like Linux distro. Really easily.
>>
> 
> Thanks, Stephen also pointed out to the toolchains in kernel.org [1].
>  
>> By adding this non-tested build coverage you can actually fail some
>> other architecture's allyesconfig/allmodconfig builds.
>>
> 
> Agreed, unfortunately having more build coverage is not as trivial as I
> originally thought. Not only because it can break the build in obscure
> archs that I don't have a toolchain to test but also exposes more build
> warnings (as reported by the 0-day bot) that I've the bandwidth to fix.
> 
> So personally I'll stop trying to enabled COMPILE_TEST just to be safe.

I mean that in general I agree with the idea of COMPILE_TEST. I had
similar problems when I was changing the power supply API. Build testing
of each modified file required a lot of effort... but it was doable. I
just set up a configuration for build server doing all necessary archs
and configs. With COMPILE_TEST it would be much, much easier!

You don't have to give up entirely. Just use more compilers and in the
same time fix the warnings and errors. Send a patch fixing driver and
another one adding COMPILE_TEST.

Best regards,
Krzysztof


