Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97531378830;
	Fri, 15 May 2026 08:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832183; cv=none; b=F/qhL9rCa252Wace7xtLmgwWtdoHqnh5bJHtX0Cr5pyhw8K1QgsdysNqaC72SLA8XrRwiNTNg7gbD4dXS0AnXoYpuvXjoOd2zNho9sZCraByWWHJoJAmucFpoL3ypUezYmD7+QhHlZg/jpI19jv8LuTyhfZdiP9qCO82mYhuVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832183; c=relaxed/simple;
	bh=BEKWtgaIVhEiq1VmEfN2oPMg1YJY/RV9AAVxvidyvKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPD3rezKtDQD7OiaB17L9sncWt2lrWOgu1EWXGu/UTm1lBhTUatvy5TfH/YBgIaCGw35XGYqVIryMZdJ0t+1BG0cUAR2LVyYV8dZ1TLNLUqquDtPESBn/hJkrRnJs3mtYqt9pKFUc1EYoMRuBJSmAoC9TH7sIpAFNXYwswxHBdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nYPHGW4U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nYPHGW4U"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06C7D63C;
	Fri, 15 May 2026 10:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778832170;
	bh=BEKWtgaIVhEiq1VmEfN2oPMg1YJY/RV9AAVxvidyvKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nYPHGW4UQIhJCre358b2q6pW4Zwj7YcqcngcihcTNnh+MGrNnKrkzPj08sfve3Fio
	 YUOwX2G5twgcqYArSSenDzY9tXoiUUBw9xg6eCr0+lMiNo7LcbX8B0PqOicm0uvbrA
	 tBSfJ74CcgMouz5xq3e9DWKRyZyIfyLIG124xo/E=
Message-ID: <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
Date: Fri, 15 May 2026 11:02:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
 <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> The Renesas DSC Display Stream Compression is a bridge embedded in the
>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
>> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
>> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> [tomi.valkeinen: use bridge->next_bridge, minor changes]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> 
>> +
>> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
>> +                                  struct drm_atomic_state *state)
>> +{
>> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
>> +
>> +       WARN_ON(clk_prepare_enable(dsc->clk));

Ah, just missed your comment and sent the v2.

> Who don't you use pm_runtime_resume_and_get() instead, like
> rcar_cmm.c? Then you don't need to get the clock at all, and the driver

Hmm, why wouldn't I need to get the clock? What does the runtime PM do 
on Renesas?

> will keep on working if the DSC ever ends up in a power domain.
I can add runtime PM. I just felt that it was overcomplicating a "dummy" 
driver that just needs to enable the clock when the video pipeline is 
enabled.

  Tomi

