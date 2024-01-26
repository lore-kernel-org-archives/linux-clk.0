Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C920DCD;
	Fri, 26 Jan 2024 19:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706297780; cv=none; b=t79DjD8GgntuwhThtTNzULsNraFH9qONfUCrPSlEl+aMpDK9t3DbwWwZrWOyO1RIBo0YgNWR0vj4aZNgJ5EsqKjgSKEzip7PF7CZe6yR/qbV/UzREOjoNoxlCOks/D9GUTWQtB44wEpSeeFGp6ZLclSD8rXZmMltNv2l4f81H4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706297780; c=relaxed/simple;
	bh=jT1yiOFNr0zy2VndOvm5oXGEcUf+bKXQciXRbfuUul8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqR+aVo7Mshu/rzK47PQcTCtGvFk7GIglaB5QyZUxCUS/V/vtSsAxEtfoUCG3C9gVQeyjMAcZXj6KzEmfk27BZEjmrw0zPY0Ja9Dh0RgW3CYsjMtAKKDzY4HpzBvWcfRfpiCykLIRkfs4N5IR19eBMK59BO+9cwdWluWodALcnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CvurSKtn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CvurSKtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706297777;
	bh=jT1yiOFNr0zy2VndOvm5oXGEcUf+bKXQciXRbfuUul8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CvurSKtn9FRcfO+oCvUDW4fFxhqqwN0IQZvEu0gFyFiYO9FDo2SlHmIekg0DIuRfu
	 xlhdU/wB9H7HTcLNiLVfavZsK2xB/D47a/ucc87tzjnvwCPDjyyoq71JfyrONj6vMJ
	 M448VNrd92Gf5Y/VCrpVtvcHwqaQysjJKBnM6QQZqkwRB7/V5k6uk/NlSrkcXcRtOy
	 fCF69UAcxCHId1lM6WMgMpziAcvisA/qzrT3uPZytFlsHrU4BmIH5y2+RFWFQnfzaA
	 ZTYluhaXE5OWmPfToGLY1L9ZYJls/opbfenac+CqSX8uXZNPGNOJ9RZ1IR3lm2hNrA
	 sH5Rxc7oX79cw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F8383780022;
	Fri, 26 Jan 2024 19:36:16 +0000 (UTC)
Message-ID: <8b4214a5-6ba7-402d-b2f6-f2424783d455@collabora.com>
Date: Fri, 26 Jan 2024 22:36:13 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, huangtao@rock-chips.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
 <20240126182919.48402-8-sebastian.reichel@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240126182919.48402-8-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/24 21:18, Sebastian Reichel wrote:
> Recent Rockchip SoCs have a new hardware block called Native Interface
> Unit (NIU), which gates clocks to devices behind them. These effectively
> need two parent clocks.
> 
> GATE_LINK type clocks handle the second parent via 'linkedclk' by using
> runtime PM clocks. To make that possible a new platform device is created
> for every clock handled in this way.
> 
> Note, that before this patch clk_rk3588_probe() has never been called,
> because CLK_OF_DECLARE marks the DT node as processed. This patch replaces
> that with CLK_OF_DECLARE_DRIVER and thus the probe function is used now.
> This is necessary to have 'struct device' available.
> 
> Also instead of builtin_platform_driver_probe, the driver has been
> switched to use core_initcall, since it should be fully probed before
> the Rockchip PM domain driver (and that is using postcore_initcall).

Why clk driver needs to be fully probed before PD? The PD driver
shouldn't probe until all clk providers that it uses are registered, and
then both clk and PD should be registered at the default level.

-- 
Best regards,
Dmitry

