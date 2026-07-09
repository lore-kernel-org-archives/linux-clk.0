Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54020423147;
	Thu,  9 Jul 2026 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600651; cv=none; b=QtbeNNfi89XKmPmBn/2eedOCtpntsaJ5EWGBCekrdhd0HEnNIKeuuLjdQcd96JDQXkLcPvvt62xdhSeJAz64Ktb0zhA4IXM58IgO7k+lWI06bJ5TdnNqCk/45rnqyzFxGjOFM6jMRJ0SjsZ1jZgztEtnW89GeCoMxbstsIW8hXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600651; c=relaxed/simple;
	bh=8yyJEbIHI2mkuZBKd8+eqb/esgh9Y/d8wQDBk8sgJeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaX+j7TAiEa0aUY5qtmURSv1wkzk9ZcGeJR2fy6uNYNXqC64oMwE0B5usPEN1xZVO8RvlSeP4UzgF6w/xDwc98dQxHrEUC8vjqseX4wAFhbpmVmXg6kP0AiyOu41PzsqTLCbd9A0qsCzUZ6yX0JJ8wJ3x8z4Prtg81BoyceCAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bILNGBKV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bILNGBKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783600648;
	bh=8yyJEbIHI2mkuZBKd8+eqb/esgh9Y/d8wQDBk8sgJeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bILNGBKVnYxOwqyfBhm9l4O+SEleUGbT1RuohSDGjgux6kPL6NhAJDnR0UE3AXNFN
	 WD/IcfHv6DhjbOlZKc8xRe/tUzhZT54m9UTuXWrYjz8to9q3gqaczIm7KnQOBzfRbw
	 enJvAZvVHpiEo1QjZUBlHcFo0jjzpnZXRoVBTmUFZWUHXk2MPVuiiyN2WK/uoXvBTQ
	 FgUvLGP1fpQGZfVKKabsniJEgwUQ5fPdx6sDXMUIOUGmwxXquBnloZhnLDY9J+cT7c
	 sLVrQxVpLITaWSYbRH3OHCW9CusnPb59BlJxIdRWlAQU06ouMyqfULUykW5D6JN4VO
	 CBLnLflspAz0Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3284A17E079B;
	Thu, 09 Jul 2026 14:37:28 +0200 (CEST)
Message-ID: <ed27cde0-2a52-49e2-b4a5-a6fbb4be2112@collabora.com>
Date: Thu, 9 Jul 2026 14:37:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: mediatek: pllfh: Fix IO remapping leak in
 register_pllfhs error path
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-clk-mediatek-pllfh-fix-v2-1-a235078fe9d5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 14:23, Louis-Alexis Eyraud wrote:
> When mtk_clk_register_pllfhs function fails to register a PLL, it
> unregisters all PLLs and cleans up itself in its error path before
> returning, so the function callers don't need to do it.
> 
> But contrary to mtk_clk_unregister_pllfhs function, that does almost
> the same sequence, it does not free the IO memory mapped on fhctl node,
> leading to a leak.
> 
> Fix this leak by factorizing the cleanup sequence in a new private
> function and use it both mtk_clk_register_pllfhs and
> mtk_clk_unregister_pllfhs functions.
> 
> Also, change the loop index start value to avoid the -1 operation on
> index at each loop.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
