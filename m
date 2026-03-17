Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E83E316C;
	Tue, 17 Mar 2026 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756179; cv=none; b=rXieIu9mrIF4Tlqqd40jbZyz3VsGPuMkSNmBRQVGpT7kr4R42w3Ot8LMTnVffPADsFOAYx1WjKRoHKl69jKa6UMDY9okV3Kd37XwuJ2subNhNkjcFTRFijKuwTvu9COJOjOq3adh9uZ6p3ndVwGdBXdD2sE5qd9Poo0ZqTYeu7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756179; c=relaxed/simple;
	bh=hRddStNa/LqE+5aOvgbIw4hxl71kQ3ZMPI2fKxsZ1NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBGC+29Jzr7cXk21AW5vraXh3T6fHjBeFSL5DsND4fnayGfrDJRaxTszkZeDw8hkQOXnketYvhmtpVmeZvSBRCtXnMwhqUCxENBlCDrFCv68bYzLV+BBDnOn88UxuRXff+6C/1oUj1ujADUal1FKrGVRNLERXgdRor8Tx3Vj/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpI6C8N6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpI6C8N6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA527C2BC86;
	Tue, 17 Mar 2026 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756178;
	bh=hRddStNa/LqE+5aOvgbIw4hxl71kQ3ZMPI2fKxsZ1NU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HpI6C8N6xjT9mXhnNFqRngVS2TknpB+zxWNU6R5SnibU09Qdf9YiGeIuifzJnx5Lk
	 lRP1EtTh3CslgY1HqrgO19A+tuvmw5uS/o8TiZTuQf2HYLK0qt/nPQZxrIhNyAX4St
	 UfTH9qGUCc3R6AE81yQZ0zfE18qLgOIm7JzrQQAtuInECFx8UNAp0e5EqB6tD4gxUG
	 oJ3qPmLrQQ2YysjJhYVTohsV8tLGV+RbZsQ/l88qsYI1iK9uNE+cQ4oZXaFpFI52Ks
	 ziRGIRbZUKEuN6OXqILl3yEoh8hcOkFZv8+0eDdMQx/gNyDaodEY6wWvfPVihRFkvC
	 ST5RQamJ5t3kg==
Message-ID: <e4844549-9e7b-4491-9150-7a322973ce49@kernel.org>
Date: Tue, 17 Mar 2026 15:02:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
 <20260317-tough-slim-sunfish-fbe9da@houat>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260317-tough-slim-sunfish-fbe9da@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-26 14:32, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 12:53:10PM +0100, Hans de Goede wrote:
>> Hi Maxime,
>>
>> On 17-Mar-26 08:30, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
>>>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
>>>> discussion about how large number of systems need to boot with
>>>> clk_ignore_unused. Per the discussions at the conference, the existing
>>>> behavior in the clk core is broken, and there is a desire to completely
>>>> remove this functionality.
>>>
>>> Broken how?
>>>
>>> clk_ignore_unused is to a point where it's seriously cargo-culted and
>>> documented as a silver bullet, when in reality it's just a debug tool
>>> for broken drivers, and the driver must be fixed.
>>>
>>> But nobody is actually fixing it.
>>>
>>> See
>>> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
>>> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
>>> fedora wouldn't have to package anything, change anything, etc. But no,
>>> the problem is clk_ignore_unused.
>>
>> Both things can be true at the same time. Yes there are ways to work
>> around issues causes by clk_ignore_unused and those ways should be
>> used more often. And in example of the X1E laptops I do indeed want
>> to try and figure out which clocks must not be turned off and
>> try to see if it will be accepted to mark these as CLK_IS_CRITICAL.
>>
>> But at the same time the fundamental concept of turning off all unused
>> clocks as soon as all *builtin* drivers are done probing is a broken
>> concept when working with generic distro kernels where many drivers
>> are modules. To me it looks like this was very much made with
>> embedded systems with device specific kernels where all drivers for
>> the used SoC are builtin.
> 
> It's not about embedded systems, it's about shitty, inconsistent,
> closed-source bootloaders. If bootloaders weren't enabling far more than
> they require and / or if we could fix them when they do, we wouldn't
> have more clocks enabled than we need to.

Right, so those bootloaders are part of the reason why we need to disable
unused clocks and some point.

But the current implementation in a late initcall, with no regards for
clk consumers showing up later through module loading is something which
I believe was accepted in its somewhat broken current state in the first
place because of the module problem not being a problem for device
specific disk-images with device specific kernel-builds with all
relevant clk-consuming drivers simply being build into the kernel.

Anyways that is just speculation from my side how we ended up in this
broken state and not otherwise really relevant.

Regards,

Hans




