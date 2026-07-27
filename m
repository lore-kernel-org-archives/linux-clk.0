Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E313F4DF8;
	Mon, 27 Jul 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151604; cv=none; b=ENR1yEgF0g9C9qbtfN4QDLS8RrmIP48zBXY0rRQJDV9pmNuW46+RW7MdsiNbDo8U79KfpEcshDi5xhdlHQcMJgRLuvBdq/3RiSpVEZUVdEMCfrVJciMSem68ZS+cspeb4/s4mxj4jhuY72DwdYiEU5+4CIqLRUiuT/BOB7hLZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151604; c=relaxed/simple;
	bh=VudUmPApW/6BvsASJRAn2l9GazNPQVjwVnEN7CPOftk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DbwzTz3WIi2mVfk7l5zLH7F9HrSqAMGp+WADfJAzXv8One/7CbA3TxVylxHKA97LprtsrgLfA0cvrrNGq1/UcYufMNOdVxmP9wlrBpHSVpHVCVyaAlIQZGMOBm11OGEsb5+OEZRLzDVzvX961bsvekg2WkZo3dzD331X548/TR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cx65eFm0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cx65eFm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785151600;
	bh=VudUmPApW/6BvsASJRAn2l9GazNPQVjwVnEN7CPOftk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cx65eFm0WM++0oMh/QxN4GR3DLdeSsiDf9NEHkLeYcjzhh84UFgH9aV2k6APGtgip
	 60YJWQDaXtpyjZn4ygUN9hn+a30uGV6Mgblx6n+HN6WNN85TVsaP2G0rfZDtL/SvTV
	 ZHxyCYXmzvsm+K+bclQF0w96Ny2jFxX3w+4Xt1O2c6ryv58VQqEDLqRv7N7I/ZiE9l
	 9FUJFZS3ZxVTGdlqOM82G/aptq/agSpjvEuaeAjubXkyP12zTZrr0yUKtBeaUuPnEk
	 zFZZ1zpsLYtkzXn6Stgw7rhgCe8XTshGeGC/asygXNoV2gt+P3yDQUXiYthVK+ehC+
	 uso9C8wYachzA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A905B17E0682;
	Mon, 27 Jul 2026 13:26:39 +0200 (CEST)
Message-ID: <3c17cdf1-7e75-4002-9ce2-08d4dc56198d@collabora.com>
Date: Mon, 27 Jul 2026 13:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] clk: mediatek: Add mt8173-mfgtop driver
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
 YoungJoon Lee <getfeus@gmail.com>
References: <20260727091555.1023910-1-wenst@chromium.org>
 <20260727091555.1023910-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260727091555.1023910-3-wenst@chromium.org>
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
> Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes since v2:
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>    - Needed since the driver implements PM domains using the generic PM
>      domain library, which also depends on PM
>    - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>    clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>    (Dan Carpenter / kernel test robot w/ smatch)
