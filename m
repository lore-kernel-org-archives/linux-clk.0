Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1933998AE;
	Mon, 14 Sep 2026 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373775; cv=none; b=mMffm2f31+CYK7CZAEvomduC3S65qXIgxn7vO6qQ0Eu3lHOusJcbZztbYIATN/F4eF8wW7ECyiS+yWgDQKfQGcQDsa/jQ1usfieHBZmJZYCHsHTKH49L9yr+OszMOU/3AXwWrcO8q4RoOmZehJ19lLOoUujMJb7Cr+bcWiIPCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373775; c=relaxed/simple;
	bh=KmDFdP2PCGwNHDyGmTqqOczfnEO4AH8iQhkGwRe5FO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDX5q0PR3pigK+tAIMFsaHEO9Iw/ufWw8riqQRRrD5TukcchZKxl62FaqGxXOjiSX9cSfLpy48usO1+HK/oXluudHaIxJwZqkC5+EdI4Z+UTsU0eJ8i+qTWlN2BEU+YEytZPH96O7pyXfWYL/klGKK4L0Bf/NWXeMLKRiHCZxqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y7RvtF2M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y7RvtF2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373772;
	bh=KmDFdP2PCGwNHDyGmTqqOczfnEO4AH8iQhkGwRe5FO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y7RvtF2MP6xjZFYMKxmDCKDtpY02DpCQAblLlSNyDzWAPmeYOsi1iFsvtq9xK8gld
	 9rDlVVb13kfU/MmLvqp1JgWUe0DUDlSludHi2488uUD9sJo4WEnPCOEROsTsI5o1G0
	 bU5Gzcv4mvcW/8cVY4ACwWqPRc71jGz3jxZCeJuWGspEEpWPyUVs+mlZ3HqvcizAzM
	 glz06CK7GUTBE5TmwdJ1vkIPiu72gkJr0Xk1hEdgikzbADwPOqWSFtAzxnRLpWL74i
	 rLiAzDm38lzFH6veUErnNvowB36Gqmd2vGQyqfIRq31T8tetuShapxEsUM6EvPk8EO
	 S9Fc+vrSFoZIQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFF1B17E091A;
	Mon, 14 Sep 2026 10:16:11 +0200 (CEST)
Message-ID: <811d2e61-cf30-40cc-9efd-02c11b79e747@collabora.com>
Date: Mon, 14 Sep 2026 10:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
To: Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 08:40, Ryan Brue wrote:
> MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
> 20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
> a status bit that comes up once a hop has settled, and new_dds from
> mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
> never matches and every hop runs to the 1000 us timeout. The PLL does reach
> the requested rate and clk_change_rate() discards the error, so the cost is
> 1 ms of atomic polling plus a warning and a register dump on each rate
> change.
> 
> Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
> GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
> with GENMASK(20, 0).
> 
> mt8186, mt8192 and mt8195 share the constant but are correct, as their
> hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.
> 
> Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

