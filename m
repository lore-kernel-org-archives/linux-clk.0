Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6E83E63A6;
	Mon, 15 Jun 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525735; cv=none; b=IRlCjcoeRYgEObWrmLjIi6mDUteteoHfgvPeOTJVF/mfAJSaIRgtahVef2vAup8f1zUrIETprbvtZN+ylkXdUqo+gePgabROtx7ViV166jB6jKsOx65SRNjHFOwNbummxbTXcWRI7Xz+eAO9bmT7Dza40wqaqejo7IOcFMqoX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525735; c=relaxed/simple;
	bh=S3qYVE+IsQdmBW/YqaJdxU4w3VEbDSI3GdWVg9g6mQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkFD0b7cx7wGjk9gfk5uB0lNP0zREXo5/DHAP/Vu64ibRUAcnMXMiAg8OLLN7bQSMyOmxN8nTN8FLKrjE7KE5waUloW8nPGQZVfa6RWac5PTyn0881vNVkzXRXiXlr4nbsbB3ZmLXUYcDI+wa6FCFHgDZvy2ONxSFXksjvuqsJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oU35YR8c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oU35YR8c"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDF7A227;
	Mon, 15 Jun 2026 14:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781525698;
	bh=S3qYVE+IsQdmBW/YqaJdxU4w3VEbDSI3GdWVg9g6mQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oU35YR8c4uvW8k5J9DXStw65+9RcZWov1x86+/Ngmm1XxbVSNrTiRvlsvhBwm7vMa
	 Pa2A6WIuhWokS/xEamL1yqwj7z7rbfYIz4hh6l1IsL2Mvr5r+JgkgbG1P58AiMWRCt
	 oSIvXrR4/whmh2cZ0W7qR/brvih6O459pa4yh9Ks=
Message-ID: <72189515-4566-46fb-9277-50570b8d28d6@ideasonboard.com>
Date: Mon, 15 Jun 2026 15:15:26 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
 <20260615-rcar-du-dsc-v4-4-93096a1b56a3@ideasonboard.com>
 <20260615091911.GB2821720@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260615091911.GB2821720@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2026 12:19, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Jun 15, 2026 at 09:28:09AM +0300, Tomi Valkeinen wrote:
>> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
>> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
>> crtc, when enabling the crtc.
>>
>> With DSC (added in upcoming patch) in the pipeline, between the DU and
>> the DSI, the above call path is broken as the crtc tries to call
>> rcar_mipi_dsi_pclk_enable() on the DSC.
>>
>> To solve this problem, add checks to rcar_du_crtc_atomic_enable() and
>> rcar_du_crtc_atomic_disable() to detect the DSC via the bridge type, and
>> skip the DCS bridge when needed.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c  | 18 ++++++++++++++++++
>>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c |  1 +
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>> index 6c07c406f725..f14fd89f9104 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
>> @@ -754,6 +754,15 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>>   	     (BIT(RCAR_DU_OUTPUT_DSI0) | BIT(RCAR_DU_OUTPUT_DSI1)))) {
>>   		struct drm_bridge *bridge = rcdu->dsi[rcrtc->index];
>>   
>> +		/*
>> +		 * When we have a DSC block between the DU and the DSI,
>> +		 * the "bridge" points to the DSC. Detect the DSC by looking
>> +		 * at the bridge type, and skip the DSC if the bridge is not
>> +		 * the DSI bridge.
>> +		 */
>> +		if (bridge->type != DRM_MODE_CONNECTOR_DSI)
>> +			bridge = bridge->next_bridge;
>> +
> 
> Is there a reason you don't do this in rcar_du_encoder_init() instead ?
> It would avoid running this code on every enable/disable.
That works too.

Both options feel a bit confusing, in different ways. Your suggestion is 
less code and, I think, more correct as rcdu->dsi[] will always point to 
a DSI bridge (although that itself is a bit confusing, as one could 
expect it to point to a neighboring bridge from DU...), so I'll switch 
to that.

  Tomi

