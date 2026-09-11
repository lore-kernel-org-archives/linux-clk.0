Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544213B14A5;
	Fri, 11 Sep 2026 07:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110445; cv=none; b=kysX63I2MDDmA5XyRi8q+59upKMMYnFG489R9FGMa7zBCLLPA2IL/qWRMmYa3dPUD/YxpdH08GRfCI6lgAxsSU34K6EhmfGGQsUeAbHn71aLk61v6U/vAG7yNGX+I4pWV+WGkpLt0ck5kn0quAuwTwXHwo8n9tJuAo31cNLw+Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110445; c=relaxed/simple;
	bh=/r+7JOA1R6vkpZwZjiLfITCVpMqEL7ms+Lgs78wkPK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7AKVUpb45jbJhvgrtHHh3CP2NsS/pxhnA+gfC0gBhCPgZqy0ymP+sq3kFcggBTPMZj+i5GQ4bv+LeJvxzFUt/GSJ4ELhBZxdzaxaMpQJ9Qq876vPVKfIUfCGzdFp8Y6ziS0T+fVktk76Kj6QTOfbOO7TdEdmPBsrmXas4AmIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tOqrpcJ8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tOqrpcJ8"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 489A963C;
	Fri, 11 Sep 2026 09:05:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789110333;
	bh=/r+7JOA1R6vkpZwZjiLfITCVpMqEL7ms+Lgs78wkPK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tOqrpcJ8PBOOuBIl5zseKneF37qtHkReKhqPNfjXPhAF0e7JFXjBd0KTXKhDo9dVx
	 LzoTmcIX/O/WSdKITbBP/MT600p1PqMHGTmMLDt1U2CwoVhd8DvpqLjHPCU0Q4ezkP
	 83vaa96Laiby10Z05/DnnsiRvMeHTXpO7PIUkX0E=
Message-ID: <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
Date: Fri, 11 Sep 2026 10:07:07 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] drm/rcar-du: Add support for DSI pipelines with
 DSC
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2026 12:29, Tomi Valkeinen wrote:
> Some DSI pipelines have DSC (Display Stream Compression) IP block
> between the DU and the DSI. Even if DSC is not needed, the IP must be
> enabled for the DSI output to work.
> 
> This series adds a basic DSC driver, so that the DSC IP gets enabled in
> bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
> board's second mini-DP output.
> 
> Original series from Marek.
> 
> Note: I see that not every run of kms++'s kmstest gives me a picture on
> my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
> but fails, and the screen stays black. However, I see this same issue on
> WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
> separate issue.

Pushed the first three patches to drm-misc-next. I'll leave the dts ones 
to Geert.

  Tomi

