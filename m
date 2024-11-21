Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E080027
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 04:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732162592; cv=none; b=WQEGf0bYjX/k5BiCyZWOyVVIjgwVK1tk+DBYWCaBsIKQRevBEMwiUpoNaRO36kpE/rrzZ7j0oi7cr1lu7zJvunIQyDQb0XCsnK3Jj2US5haclQgVhCS34ifrYM95ig8VVaOs1f+HBOZsINH94c5sd8lUe2bN5SwNcM+ToR8X02s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732162592; c=relaxed/simple;
	bh=MHlNy/0tw8Q0FVWot95NbIAN831BQMEo/m14012GQ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fW/EBbQXCmZdMgce7LgR9hBv+jLIIWOfMEDwnNcbZ5IYq0xZACBr+MYh0F3H2Ts0cJL02k9DIL0aEhP77BPynLd/Fb0LZzHn4s+NM7TTcFucAuVSZE0mKlfZF3gUXXAkuav0ZQSmrzkGnPj7lFxpjwAAAvLW3m9ogMesNL+24nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Z47VNZrj; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Z47VNZrj"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6131789634;
	Thu, 21 Nov 2024 05:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1732162589;
	bh=/h+Aqf+FUd6Y7eBOAWkUFVG4S9BbIuewS7MSwsHNJ0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z47VNZrjkXdRpTnkUBfyeS+GzuPm3YNuXhwk4wB3lz3abLpC5KL+scqK74W7Qk6y2
	 Ykr9H/DHfjCHTHs4j0YoPjoj+Fb3BioGcvxQXmbexmKYeR8atLfkVNsyA5rr600KlS
	 GpFsOwPSmL9PQMEczOJRqQDKGz/93fO0sovc7vN7FLrey6j0cyuN6jgUZP8KtQeO2/
	 1FH6gk2or/Btc9F9JdpgirEgjHGTjOR9Xj9lIIXz/qI5KVnDhPBbfrzTOV0wdyBqF5
	 lEXsCO+3TQaC5xG7dcbbVKJI/A3LOlw9OMnhQsmLcMNdeDAf4ZcTe5Gw0WqpVUVKzl
	 nqjaRa7D319qg==
Message-ID: <5f56ac1e-7b88-4962-838f-66dbac292828@denx.de>
Date: Thu, 21 Nov 2024 03:47:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
 <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
 <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <41855af3-53bf-4a02-bd5a-9982becf2726@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

I'll stop this thread, let's continue the discussion in one place in:

[PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp pixel 
clock reconfigure parent rate"
