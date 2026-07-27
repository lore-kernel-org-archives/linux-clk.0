Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C073E4C8D;
	Mon, 27 Jul 2026 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151602; cv=none; b=BAwBG3XMqitOvfkRQm4EY13VNYpKBfH7ICa9nvWwUW/nBYSqWURUbRIsgPFqt39LXpgOA84G+R8WNOkugWbVMO8FEnJmVuFhdoOXg53nZYAidOpIU+2ug1gHWJEwhNefGM6oOtO1B2PL3ck46knaPsbhDG6RDE6ZOVb5PeeXPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151602; c=relaxed/simple;
	bh=PxursN61kh6Aec8NWrNjqV1VnT3lTqwDy1MoMDvk4SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abCfF2PgPwpH9SFrTxM/7PmXPuE+NSEPHBV00YkCdxRSM+fHmxy9PbaAAqy9Zk9WMp8JjEj8q+8+IYVBmJCQ372ru7r0EiptdyhdxRUK2ws4UwRyoo4CeJbqIP47p/vjlL40+kp9GZLvwg1IPmpZ8++mxwN8Usxn234ZTaaGpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yql08sWy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yql08sWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785151599;
	bh=PxursN61kh6Aec8NWrNjqV1VnT3lTqwDy1MoMDvk4SY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yql08sWyeQQpzOvqehN/AhCCx8GUyn/3e2cItgKWDOCGwZyAz79tgrmcMh7s0y1q+
	 l1rlb72WY8w8xymDZgrNyr6fqz57A8iLy5W5Luv5XHdwmV63DXNOUfJRzAiY99vJ7E
	 3qLRqYm60AW36mZIqnXwada+povnk8n0f8AoGrVcEQcf+Mt6I8wXSeZ3xlLzcYjvxF
	 4r+Am2zCMLClkUmTRUErskbtjLOry427j+aHLlbo8UzZZfwpCnNdXTySFs9RwKvx0c
	 gAx1nQRGmuETEX7wtH27S2O2jU4yLNaU08tg+P9JWJuuwCa9yCsu20IIwMsSmcsp2r
	 SEApApOK4zDQQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 534A817E0678;
	Mon, 27 Jul 2026 13:26:38 +0200 (CEST)
Message-ID: <6f91dfd9-16f4-44d4-be24-7abc89b9894b@collabora.com>
Date: Mon, 27 Jul 2026 13:26:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: mediatek: Add mt8173 mfgtop
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 YoungJoon Lee <getfeus@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260727091555.1023910-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 11:15, Chen-Yu Tsai wrote:
> The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> in the datasheet, that contains clock gates, some power sequence signal
> delays, and other unknown registers that get toggled when the GPU is
> powered on.
> 
> The clock gates are exposed as clocks provided by a clock controller,
> while the power sequencing bits are exposed as one singular power domain.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

