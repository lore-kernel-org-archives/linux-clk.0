Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80AC32B132;
	Mon,  8 Jun 2026 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936182; cv=none; b=WSd+UfsbsA4s5QQHXXgyK/86QeIRU7vYs9O2mpMK/Ddquqd2aDu8DEpgB0oO7sPsvP1RsxXBB4TfwvKlIxY5Pw0qDbEPNYqNCeeAa8P03w7d9ip8MvjGhCUGHzZgf5Hsl7VCiFsE96IVVTsI6MPDQDRMSpEYZd4uooPMzlCWBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936182; c=relaxed/simple;
	bh=f/i7u1ZB+xcfFhCwaN1+gJjMrCNJnyf6QLMgddrR3v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObWLvmFswXIBKNVpxsZEYOLjvPH8tIpdhBb4QZtbWqAlYOitGMuV/8+T1mXBDP/GYLe21r0b8TJ5xza4z5Tg9lRivcxnAJifsghZ0tHStK4cDmSobFUXN78lHB7HlRWv0kFIcou46Aq1Q8/I2PPoG6JXpQ6xoOtTnjeyI0G4KgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AQE2xXfN; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AQE2xXfN"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gYyDd4cMlz9v04;
	Mon,  8 Jun 2026 18:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780936177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbSbELZ/qhJGz8m9PkFP4eZM/CFetLN6lwudktuynGY=;
	b=AQE2xXfNVLdb0zenRfKtc1yr7vSNa3ByjQ0rIG1J/Ql0m4lBUCNWwtIrp3znIEbEDtsn8h
	IMGOPgaK0+eCY7j1maEAItCcpQPyKJ7EnszJxY220kDYTU1J8pgWVcgvGRJmW0qTbOaB7D
	qeMglUL8Fp+gPnHx9kzN5tpB+fajuXZY5KKPH9qumH7BnQAdWg/B3XKTwzgUFL6SO75SDb
	I5g9Edd+BUNNLOAWjCxWxqIjDWMrqVw4VbJUSHIwz3efT8YHbNLMTMiFiMwwvEDuL+L9K0
	a3UnfU9QVReNX3lcogtEW1Jj6oSeI1xs5OgCPqZoaRRXyNJHAUHpGEwOl8uTtg==
Message-ID: <9ece4e08-a77f-4410-ba16-a77b9bd0aace@mailbox.org>
Date: Mon, 8 Jun 2026 18:29:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, Piyush Patle <piyushpatle228@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Abel Vesa <abelvesa@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yf38h31tgdjwq7mde8h8omnc7sio8pks
X-MBO-RS-ID: 587bbf07cc5c34a1000

On 6/8/26 9:48 AM, Liu Ying wrote:

Hello everyone,

>> I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI on
>> LVDS ch1). It mostly works, but I ran into a few issues around DI routing,
>> LVDS format handling, and DC enable sequencing which needed rework before
>> HDMI would come up reliably on the board.
>>
>> I don't see a v2 of the series and things seem to have been quiet since
>> November. Are you planning to post an updated version?
> 
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline,
> before adding i.MX95 display controller support.
> 
> Unfortunately, it seems that Marek is not a big fan of [1]

I am fine with [1] as long as it can be isolated and does not affect 
every SoC that might reuse this driver, which I think it can be done.

> and I'm busy
> with downstream development so the plan doesn't move forward well.  I still
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.

My only concern is, to keep it isolated to MX8Q, so this driver can be 
reused by MX95.

>> I've accumulated a fair amount of rework while getting this running on the
>> FRDM. If you're not planning a v2, I can clean things up and send one based
>> on the current series.
> 
> I still think that i.MX95 display controller driver should be in a separate
> driver, rather than sharing the same driver with i.MX8QXP display controller
> like this patch series does, because the two display controllers are quite
> different as I mentioned in comments on this patch series and in discussion
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
Are they really? It seems this series adds support for the MX95 DC 
without that many changes, so are the DCs really that different ? It 
seems the MX95 DC is simply a reuse/evolution of the MX8Q DC blocks, so 
duplicating the code seems like the wrong direction, it will only lead 
to disparate sets of bugs in two drivers, which isn't desired.

(I might not fully understand what you have in mind with the helper 
library though?)
