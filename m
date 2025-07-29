Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F797239E62
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790061; cv=none; b=bBdKTtQ0yIBfGrgSXQVeHz6dMFoSZRfLAlqnm53Ufu51tZViguS8G9q1TLMI/2msi7QJXT2edZDcJ9QgLxqk+FhTwuI4ViHUdMXu/GRZTkiO+mQcySKMJMP+/8dQs96qyMW8KDaFIAYihoSVQHR0XkEoGjhkb7Nrw5yjE7eS+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790061; c=relaxed/simple;
	bh=4JPRiebjWUfZ5T4wil40nVhIgOZOPWqxucow90LgkM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCoS7dHtKEKwt/C3QkepqO8IHsNGlyfgbt8Tyjg89VLOhmbDi1xSBHzrV3LarTEpd7SMHvx/U17L8TWkFhykYFMmKEob/hgHDanqAPASeK/TFmN4+BIL9j83GrZs9aflHkvl2LjQGbb63rko89exzuCcO33pYK0DQNFEkgOpubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p1v3Xmas; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p1v3Xmas"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yYnbywAQMxSgmkBg9bfzNajHDUz7u130g9a2sd9vZdU=; b=p1v3Xmask9tJwEmYfcxRWyJFFW
	GKU4VDAtVzwsDNhPFLlPx/Z3PYhL02HcepdLmLvK2RCKgVeJ5J+ViPZUr3FniwoA3dLGj1oUpVIjF
	Ju2XKx6otFq1ha5qM++Y3YOlfnSSKMLs3yXjvYeXHT3p80+/39R1+ozHIhva/vjfwGnlIGoG/yWa5
	xTUZUz1EpDzNZoclzxcLDwb7pT/bAjhb1FvBimWEzWC/a7C0tP7ryhvNs5XHsU31M67TLt3Bz4Jy4
	v9MsGJ1YzGLoqZ2GAj6wR3Lni2IlZB5fQkXHcoijgcUSo55R/cpCE8w24NQiWCmFLPyi3fzXmNbJ4
	gT04WqyA==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ugiu8-005Q0t-9h; Tue, 29 Jul 2025 13:54:00 +0200
Message-ID: <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
Date: Tue, 29 Jul 2025 08:53:51 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250729-tall-fluffy-grouse-f5deec@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 29/07/25 04:27, Maxime Ripard wrote:
> Hi Maíra,
> 
> On Mon, Jul 28, 2025 at 09:35:38AM -0300, Maíra Canal wrote:
>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>> enable/disable the firmware clock. This means that
>> `clk_disable_unprepare()` doesn't actually change the clock state at
>> all, nor does it lowers the clock rate.
>>
>>  From the Mailbox Property Interface documentation [1], we can see that
>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>> prepare and an unprepare hook for RPi's firmware clock.
>>
>> As now the clocks are actually turned off, some of them are now marked
>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>> early boot or are required during reboot.
> 
> What difference is there between the CLK_IGNORE_UNUSED and
> CLK_IS_CRITICAL clocks?

 From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
gated during boot (on "clk: Disabling unused clocks"), but after it, the
clock can be gated.

With CLK_IS_CRITICAL, the clock will never be disabled.

For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
enabled at boot (I tested; if not enabled, it won't boot). However,
after vc4 is probed, we would like vc4 to have control of it and be able
to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
CLK_IS_CRITICAL, vc4 won't be able to unprepare it.

I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
RPi won't reboot.

Best Regards,
- Maíra

> 
> I'm asking, because CLK_IGNORE_UNUSED is mostly useless, and
> CLK_IS_CRITICAL is probably what you're looking for for all of them.
> 
> Maxime

