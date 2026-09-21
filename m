Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E53BFE2B;
	Mon, 21 Sep 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009993; cv=none; b=ZDxQ2T6lDpZIfLqa6FuHams8PWxKBcYdp1tlcSlNPkG/B2Bw4Oag/l5y+WoBRnztra9oB44XZ5nNsU7WsPNrttlH49u0FHw1bJsyOOFVc7E0PpnCODTdf2l20/0YHLM2eO5eKPcJxNMZ6C56QH2RtdKDtAjWy1f5Z9oCkc1ECIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009993; c=relaxed/simple;
	bh=Tp+rMX4Gditawhvnl0IiyBKLYE7Z0Xkyr1eNWtD0ShA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfxJl7cy4VhChWtBsh61kBw96/DDdVv1ZEqXb0p2XtkL7t4IYaugbmgLLDiHqNW963a+pykCRB+ZhaxghQlC3JcAZFVofJaEtuaKI7Y0t3DxIJcR2A57jEv/vCz4YvUJeFMF4n9ks4uJYqOhvizzXwg+A7F6kIFw1zyELPnEJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMLsAWVv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMLsAWVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4877D1F000FF;
	Mon, 21 Sep 2026 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790009991;
	bh=N1ZQvKTl/H+B2fdxCeUt1XbbUIpLrTGXvpTDgKU994I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kMLsAWVvY7fAyGkcIxwyFnaXR5kYlw9MFNCfX5PLF1nIgC2UUUPbNe6g8/dwdox+g
	 zQxUh5QnjuYC3C946b5y2oI/9EQ3lnyS0YVm1D0R6cS9VFCizxg7c28UFxnvFuFzw4
	 AUNxNdtMBrAOB8HCHy4vtBRpwwvTuMVDikxbbmdBbjLavVn+R1qLPaD/4FcaUhKckp
	 kbvvdryMCyNm62/hv9lx2aipNusXo1JeSS2DFfXmlLcrPsyYI1W0myewf+99P4NVfQ
	 sL/juqV9wSSQYW3pA+dE1F0OIKIsr+R5hRvWVgYhziQ/Hwo9xn/MSHFUqJb1WhJWF7
	 0GnBW9GL/oC+A==
Message-ID: <c89f566b-9fd7-4824-ad19-bd8b055d2736@kernel.org>
Date: Mon, 21 Sep 2026 11:59:50 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
To: Brian Masney <bmasney@redhat.com>,
 "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
 <arFEwdu6EucK1G9x@redhat.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <arFEwdu6EucK1G9x@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brian,

On 9/21/26 09:52, Brian Masney wrote:
> + Bartosz
> 
> Hi Adrian,
> 
> On Mon, Sep 21, 2026 at 11:17:13AM +0800, Ng, Adrian Ho Yin wrote:
>> subsys_initcall() / subsys_platform_driver() would not fix the failure we
>> are hitting. Both still run after time_init(), while the DW APB timer is
>> registered via TIMER_OF_DECLARE from timer_probe().
>>
>> So moving from core_initcall() to subsys_initcall() changes nothing for
>> this consumer: the timer cannot defer, clk_get() still fails, and the timer
>> is never brought up. That is why these patches use CLK_OF_DECLARE(): the
>> provider must be registered from of_clk_init() so clocks exist before
>> TIMER_OF_DECLARE runs.
>>
>> On the broader point about CLK_OF_DECLARE abuse: I agree it should not be
>> used merely to beat platform device probe. If the preferred approach is to
>> keep the clkmgr as a platform driver (subsys_platform_driver()) and give the
>> DW APB timer nodes a fixed clock-frequency instead of a clocks phandle, I
>> can respin that way. Please let me know which you prefer.
> 
> I wanted confirmation that you wanted to use CLK_OF_DECLARE() for the
> system timers.
> 
> Will you by chance be at Linux Plumbers Conference in two weeks? Bartosz
> is leading a discussion about the future of CLK_OF_DECLARE() and
> friends.
> 
> https://lpc.events/event/20/contributions/2503/
> 
> We want to minimize the use of CLK_OF_DECLARE(), so the preference is
> to keep this as a platform driver if possible. If you are able to get
> around using CLK_OF_DECLARE() by initially running the system timers
> with a fixed frequency then I think that would be preferable.

I originally pushed back on hard-coding a fixed frequency for these 
timers because if the bootloader changed the frequency of the clocks for 
these timers, we may run in to a problem. But I don't think the 
bootloader had changed the clock frequency in a long time, so it may not 
really be a problem. But it just feels wrong to not take in a frequency 
from the clock driver.

The other option is perhaps adding the ability to defer probe these timers?

Thanks,
Dinh

