Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E233DCD9B;
	Tue, 17 Mar 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760505; cv=none; b=SVmntcjiVwxs5wHhvi6+fD2ND8uxh2kLLNTX+EZkYKUmef0xSe7hopSKThAy2nZEysVgEXbmpQVPqXI/qydydfgFyOF0IQTbnU8LHARWGjHYDbKh/QMQ05paawjCf9aNIrtmzMEU2sZm73BSoZgXf6lIVE7okjecXxcV9ZPdXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760505; c=relaxed/simple;
	bh=GnoZF4xXU3Ru3GlNC9iVumHKiNxYJyGj7qMhDqY4N5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/qzGDgH+++oQBodXZkiml7BFM/6ALqLpTc0ntzAmdMcGNdJ4EDOt51APhwnfUH6CWuI/H+VOWkpl4+FKbjL5n2Ds4jr+9U+9UbgWXAg3k1PoYfctQCQRPXBzwCcEs/BiVNRsV8w6qd/DjQ8rilc0Lsusra4PJxH39xNUbbApbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clN6vGOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clN6vGOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D239CC4CEF7;
	Tue, 17 Mar 2026 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773760504;
	bh=GnoZF4xXU3Ru3GlNC9iVumHKiNxYJyGj7qMhDqY4N5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=clN6vGOrofyGydrKNTqPJPBNPRTECyfCIRSdnCnCswoycIWxt4o0IKddpC8uvFaf0
	 LLdL87DXDeAbzpNschaaFbQTn3H8l89eQhpvPP7Zkzky0Q3EfA7zX/wE+HdcxMVuLB
	 ySMr5hJmZDsUMgdWZgc7Q+r94rYEdut7WGBjYt9z0tZDu/4GXV9VivzxD/koinLkyD
	 OkrfjW2w15tp3YIgDLI0rgvWvBPVgfIzmyBaurSgLfmnH5S1e2tjDruIdA5SR8MIU1
	 VBqFRFlXDYKokw6WsUXivO3/E9QnCpxef+y/wM36wAC7OXJY7ykQXt4Uog4jGB7Fh+
	 ROBwl/7Yg32+A==
Message-ID: <24801cf0-2c68-4b8c-b35f-b95e9688fcf5@kernel.org>
Date: Tue, 17 Mar 2026 16:14:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
To: Brian Masney <bmasney@redhat.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
 <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
 <ablslaSoUraCRPKl@redhat.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <ablslaSoUraCRPKl@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-26 16:00, Brian Masney wrote:
> On Tue, Mar 17, 2026 at 04:20:06PM +0200, Abel Vesa wrote:
>> On 26-03-17 10:13:08, Brian Masney wrote:
>>> FWIW, the only reason I posted this patch is because at the end of
>>> Stephen's LPC talk I got the impression that this was also an acceptable
>>> change. I'm fine with dropping this change.
>>
>> Here is the scenario that proves adding such config isn't the right
>> solution: think of single kernel image working with different SoCs from
>> different vendors. This is actually the case where distros need to have
>> a way to provide one kernel image + thousands of DTBs and be able to
>> boot one each one of the boards. Whatever this config is set to in the
>> kernel image, it will not work with all platforms.
> 
> Agreed.
> 
> However, with or without this new Kconfig, we have this problem today.
> Right now the kernel isn't bootable on large numbers of systems, and
> people have to manually add clk_ignore_unused.
> 
> I agree though that we don't want to penalize boards that are doing
> things right, and have a full clock tree described with higher power
> draw. 
> 
> As a test, on my Thinkpad x13s (sc8280xp) clk_disable_unused on Fedora
> 43 turns off 96 clocks on this laptop! I can infer what some of the
> clocks do based on their names, however I'm not in Qualcomm, and some
> of these clocks I'm not entire sure which ones would need
> CLK_IGNORE_UNUSED. I got it down to a set of 7 possible clocks that
> may need that flag by excluding some classes of clocks, such as usb.

My plan for the T14s is to:

1) Make sure I've working debug output in some form at this point
of the boot, since lately the screen seems to go black during boot
until the msm driver loads. Something which I / we really need to
get to the bottom too.

2) Add printk-s of the clock name before disabling the clock,
then sleep 10s then disable clock and move on to the next 1.

So the last clock you see printed before things go sideways will
then need a CLK_IGNORE_UNUSED.

At least that is my naive plan for when I can make some time for
this.

Regards,

Hans



