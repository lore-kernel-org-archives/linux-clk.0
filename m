Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A773909BF;
	Mon,  6 Jul 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326461; cv=none; b=cPtNhZ71ZKv0USyRazcDLMXWSnc3KDSmMpYygaC+RAa3zMejp680GpyEf5hzB6e5Pl9/pFG+Iv0SNArgRMZLJs43ssTpTBcYOFcNOh4OyrotgS60Wz2RCao5W3T7CoHepJ9v/jL2lFBE3AG6ctBdSmrvLKbxTzbxdFzE/Owuoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326461; c=relaxed/simple;
	bh=NkIZmh+s/VjlejKVHahLAUu+YBVSswgxPaKaVGW3dvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6r5HKWpFJhYscAX2BPe3JAq83DNd9ckOB32mp3QQyAwYc/xxKQkA8BoPBikKdkqfEeQodNZOB1VtP0qzsntGsR0Yty3HC7D/Z52uX9tvVS+oRpxrnq6KUv7WHC24K+W1cMB8Xre/dau3HJs+Jiia46niKBBmdRO4LwDxTZKQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KEmsYLTk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KEmsYLTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783326447;
	bh=NkIZmh+s/VjlejKVHahLAUu+YBVSswgxPaKaVGW3dvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KEmsYLTk8g2i1/b1AtD63hLseWnA7yL1At/puOH3wj17FmCA6Bn1HWvv5dQlt3GqO
	 CikRqyhgnQTISwAG/QoYTrvLC87QRO01vdkScdOuKmRaGNKp3CcFTqEbCHIOkeQ/oH
	 A+Cisw2qmt/WCpv6SJ6y++f0HjmNbnUVVq+Ei+VLjr0FdkYx1YYcfqBpkEgHBmXRIB
	 2XuGc80RjYTnoH+EG4+JAxi/wSeKmCTfHkeW/Ntm84oWqogT6ncUX0GxaHWRzdeOnq
	 Vc3CjbvHiCEU5GotgIJL518Ui4CF2kLHA99Cn3nPGWJQ1stE40DZ2LaxNI7nLiFo/f
	 h3nW+pIM3VfyA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2049517E018C;
	Mon, 06 Jul 2026 10:27:27 +0200 (CEST)
Message-ID: <efaffb1b-1084-40f1-8d32-2679f0a425ab@collabora.com>
Date: Mon, 6 Jul 2026 10:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/26 18:35, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

