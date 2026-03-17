Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B583B0AEB;
	Tue, 17 Mar 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748395; cv=none; b=ouFObD/H0ObrKNm7pwmq+sM9mJUPxF24O5WI1w08KsCNGoen8RbJb1KiKEi3gMhAN6Fbkmw3bULfiP0yndrNF7UXCrv2IMFORlh04liyDmfKaS/WvLcPYNooSX8FX10nhQcd1cxycd/1o2TGQ1N7zU178KS4PTRkCc358VN7j7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748395; c=relaxed/simple;
	bh=brli9ew/1kEFydbwt1i+/HJoKvUGHUJK7SfebWE4nDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eV0oPadxGgUUgVebTAhnv/bo75AA5i5QBcNz5wGAwpq5veEDBWM5wDx6+3fyQQjY0WCbKIbRHZpFY/w6BLG4OHZNYdvbqo+nIjK1D2aG/g754aUyd4p7YCbLjW3YnXfhjTbXX8l0KSgXNJrqgmS9wioVJ82kQ5ybP0c/JDkqr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPAgqGur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPAgqGur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C04C4CEF7;
	Tue, 17 Mar 2026 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748395;
	bh=brli9ew/1kEFydbwt1i+/HJoKvUGHUJK7SfebWE4nDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vPAgqGurQFJ5ZJ6k07PeIT9oXa+5+lFr1Kjy0BV/JRg756dFQjAfgeblL3L6XAWX1
	 O/cDIxkZj2XZGRd6NpJa53pbfChyJYLLC+ARK+UDYP7cRBtZli28UkI/GsJqSHKjbB
	 8vm7VgiTUWrebxwI++b0VDsW5EFSO0N0Kt22O1KbhPEViVRyvhmqUBVvRFx3nDsHqq
	 QkQoSczCQcUcmILjD9BhFrI+TaSJfhID5VTFN+CBT46pe7+42TIUCcpOOPfdE8oNBa
	 4hnCtLEMkSpocbWeCG2fAkg5nyFcxyYuFi2/nxbpX5qYBTXCh7J5UErjzXp+4IbJ/A
	 bPqSKkrd6mIpQ==
Message-ID: <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
Date: Tue, 17 Mar 2026 12:53:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
To: Maxime Ripard <mripard@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260317-almond-leech-of-correction-2a2ef6@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 17-Mar-26 08:30, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
>> discussion about how large number of systems need to boot with
>> clk_ignore_unused. Per the discussions at the conference, the existing
>> behavior in the clk core is broken, and there is a desire to completely
>> remove this functionality.
> 
> Broken how?
> 
> clk_ignore_unused is to a point where it's seriously cargo-culted and
> documented as a silver bullet, when in reality it's just a debug tool
> for broken drivers, and the driver must be fixed.
> 
> But nobody is actually fixing it.
> 
> See
> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> fedora wouldn't have to package anything, change anything, etc. But no,
> the problem is clk_ignore_unused.

Both things can be true at the same time. Yes there are ways to work
around issues causes by clk_ignore_unused and those ways should be
used more often. And in example of the X1E laptops I do indeed want
to try and figure out which clocks must not be turned off and
try to see if it will be accepted to mark these as CLK_IS_CRITICAL.

But at the same time the fundamental concept of turning off all unused
clocks as soon as all *builtin* drivers are done probing is a broken
concept when working with generic distro kernels where many drivers
are modules. To me it looks like this was very much made with
embedded systems with device specific kernels where all drivers for
the used SoC are builtin.

The problem basically is, that if we want something like disabling
unused clocks at all (1), it should happen when all drivers including
those build as module have had a chance to run. ATM the clocks
simply get turned off too soon.

Also see Stephen Boyd's LPC talk about this:

"Make sync_state()/handoff work for the common clk framework"
https://lpc.events/event/17/contributions/1432/

When the clk framework maintainer themselves are arguing for
replacing the way unused clks are disabled atm with something
better then to me that is a clear sign that there is something
wrong with the current mechanism.

Arguably it would be better to tie this into the deferred_probe_timeout
mechanism with some way for subsystems to register callbacks for
when the deferred_probe_timeout triggers. This way there will at
least be some attempt by the kernel to delay it until all probing
is done.

Even though we do really have a problem here I'm not convinced
that this patch, which allows disabling the entire mechanism
by default, is a good idea though. There will likely be issues
with systems consuming more power then they should, especially
when suspended when unused clocks are not disabled. So allowing
to change the default behavior will just swap one set of problems
for another.

Regards,

Hans



1) One can also argue that the need to do this at all is broken in
itself. If all clks have a consumer driver they will get turned off
anyways; and if they lack a consumer driver then maybe they should
have never turned on by the bootloader in the first place. I would
expect any hw critical enough for the bootloader to also have an
actual Linux driver.


> 
> Maxime

