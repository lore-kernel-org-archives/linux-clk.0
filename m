Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36607 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751270AbcEEOY3 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2016 10:24:29 -0400
Subject: Re: [PATCH] soc/tegra: pmc: Fix "scheduling while atomic"
To: Jon Hunter <jonathanh@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>
References: <1460900051-3065-1-git-send-email-digetx@gmail.com>
 <572B47DE.1090804@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4a3fb3f-adb8-c167-d660-55d3f803c9c3@gmail.com>
Date: Thu, 5 May 2016 17:24:26 +0300
MIME-Version: 1.0
In-Reply-To: <572B47DE.1090804@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello, Jon!

On 05.05.2016 16:17, Jon Hunter wrote:
>
> Thanks for the report. I have been unable to reproduce this, but then I
> don't see my tegra20 entering LP2 during cpuidle. I did force my tegra20
> into LP2 during suspend which will exercise the same code but I did not
> trigger this either. However, from looking at the code it does appear
> that we could hit this.
>

As I wrote before, it's quite difficult to reproduce.

>
> Ideally, it would be great if we did not need to add another custom API
> for this, but I did not find anything in the CCF that would allow us to
> avoid but that was only a quick look. However, we could ask the CCF folks.
>

Yes, CCF doesn't expose locked API. Code should be designed to avoid it.

> What I plan to do next is to understand if the pclk is likely to change.
> I know that it comes from one of the plls but I am not sure if we ever
> change the rate. If not we may be able to move this to probe time and
> avoid this.
>

That's reasonable, I'd also take a look at it. Thanks for the comment!

-- 
Dmitry
