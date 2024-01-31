Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226012BF20;
	Wed, 31 Jan 2024 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717447; cv=none; b=gBYvZuOIyZJUZZD4rwAtVA025fvphGFsvqJAsYoZ3KEjmVv3DEB0ZCzrcli9DQJwl3vVOjb/r5FdlKGscywLe0t0jI4vMdH5i9nVq0lZFwQ0e4d2hVBz1CkQD31Dn7QrTrtpIKVGgcA2v5s+qBEAd2TRS86ME2ssOubJL/0AZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717447; c=relaxed/simple;
	bh=mOgddOnlFNve156jpGaNRlrIn0v6Pm2QIzZnnQ1nVh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TdxKub8MWFYQBoZ5L7bHJ5FHu0ZUNwWZkk9yYrOjYLWjdvbJyXs1OLQgdERVbCndQRk8BacmwDK/dsR+zg0YS0kVM/gyKjGFImPJjL89v8vgnVY+DH5/ver5IaQHCUysYLxD5esyKhzfieOKr3vWWKtz7PAwPuXb5xgoEAMRmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Qnt8lHTo; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Qnt8lHTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706717443;
	bh=mOgddOnlFNve156jpGaNRlrIn0v6Pm2QIzZnnQ1nVh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qnt8lHTonSrYxRLxk4GqeiGzZNZIuilfAUR08dkJ0euHbBts2iy0ewRfDZLw9JFGg
	 bS7RrxfVAByoKWo3jr2HKptQXNqQTawOfNxIeV/ACPlPg1IjehtJwrHjIevwsum3Ii
	 MKELhBFwlagnTy+ikrsUFXQuOhEuZyK+nZP8weMIR+AZy+SxlDFwOL+GTz7/3HZC7/
	 G/F/BztkbODFzyVOx3O4/hSwPncpUsWd7SiQPCktsVPsZwOb0RSQgXndvzAIh0vkEG
	 ONmzSef2ZZDkc8j7hLAlBolCM1QZTDN8G0yMZAJHnHGX/hlqskqvGIqc1jOQQZD/pC
	 UpLp/r+pDvKtw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42AEC378202B;
	Wed, 31 Jan 2024 16:10:42 +0000 (UTC)
Message-ID: <a0f26bfd-5c78-4c5f-9c37-dc1cc3925ede@collabora.com>
Date: Wed, 31 Jan 2024 19:10:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
 <20240126182919.48402-8-sebastian.reichel@collabora.com>
 <8b4214a5-6ba7-402d-b2f6-f2424783d455@collabora.com>
 <i5qagtdg73rhojifmublx2w2kxvjeisd6qwqbo5vnhrgyedx3i@pyckzpstlnvb>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <i5qagtdg73rhojifmublx2w2kxvjeisd6qwqbo5vnhrgyedx3i@pyckzpstlnvb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/24 17:47, Sebastian Reichel wrote:
> Hi Dmitry,
> 
> On Fri, Jan 26, 2024 at 10:36:13PM +0300, Dmitry Osipenko wrote:
>> On 1/26/24 21:18, Sebastian Reichel wrote:
>>> Recent Rockchip SoCs have a new hardware block called Native Interface
>>> Unit (NIU), which gates clocks to devices behind them. These effectively
>>> need two parent clocks.
>>>
>>> GATE_LINK type clocks handle the second parent via 'linkedclk' by using
>>> runtime PM clocks. To make that possible a new platform device is created
>>> for every clock handled in this way.
>>>
>>> Note, that before this patch clk_rk3588_probe() has never been called,
>>> because CLK_OF_DECLARE marks the DT node as processed. This patch replaces
>>> that with CLK_OF_DECLARE_DRIVER and thus the probe function is used now.
>>> This is necessary to have 'struct device' available.
>>>
>>> Also instead of builtin_platform_driver_probe, the driver has been
>>> switched to use core_initcall, since it should be fully probed before
>>> the Rockchip PM domain driver (and that is using postcore_initcall).
>>
>> Why clk driver needs to be fully probed before PD? The PD driver
>> shouldn't probe until all clk providers that it uses are registered, and
>> then both clk and PD should be registered at the default level.
> 
> The error handling in the rockchip PD driver needs rework to
> properly handle -EPROBE_DEFER, which I consider a separate series.
> 
> Note, that the driver currently has 'builtin_platform_driver_probe',
> but does not actually probe anything. All clocks are registered via
> CLK_OF_DECLARE, which happens even before core_initcall. So this
> does not make things worse.
> 
> Also the OF node is marked as initialized by the early clocks
> (CLK_OF_DECLARE_DRIVER) via the call to of_clk_add_provider(). This
> is necessary, since otherwise the early clocks cannot be referenced
> and we need the early clocks for the timer registration (so it's not
> possible to move all the clocks to late init). This effectively
> results in fw_devlink not working properly. It will tell PM domain
> driver too early, that it may start probing (so a bunch of useless
> -EPROBE_DEFER will happen).

Thanks for the clarification! Definitely will be good to improve the
probe defer handling in the future. And indeed, it can be done
separately from this patchset.

-- 
Best regards,
Dmitry

