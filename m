Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B522126D;
	Mon, 27 Jul 2026 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182817; cv=none; b=HU+KPJM9jlIy8tSke/y6qPE22QWIfdGpbc1lXBlelLBUldid1WvXOMPwyp9EtnQYUuTafw0okqcY1NMX8OKoiIqGN/GaB8dYDrOoVytkhKK8v1ck1xyza76IYh1RC3hlf2D84wk9hsyZ9QYOft1hZzrWBqS1lbAY+ts0w803ZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182817; c=relaxed/simple;
	bh=AQrN02w9UEIIkDU7l1vw0DVQDBQGBuk08HP1hAU5Tdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/KT/6+WzSrXybGRzieIEPPllc2pg0QXL9n6ua3kIEdJX6pY0xSd7lVFPT2zUiWpnItbohNyB9NvtYTsd78MA/xxya3WvX2Hnya7AIoP5wnkB9cAhHKz/preNIIbwZ8mfriQ1EpxxCwQPGCcfg5aP4OXy1MRHWJGdCg4Qa05BUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaeAYkNu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaeAYkNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C1B1F000E9;
	Mon, 27 Jul 2026 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182815;
	bh=jxhfi3VWM2ZO5rpEKIfZcY3s5wKcbQuJh8HHKhGOQwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YaeAYkNuQfx46iAf6KSXNj9qHCWO5lV+G+qet8NRJdQfc4wNO31nxmofjnmqa5wem
	 ZFmwDUQDvBYNq7gS5WCJ8RzU5KDKToMrwW5lnJ6Morwd2KUriV2zYNRYM1XIn7zMb6
	 oN0dZZY54FbxuRVxXHWsINTAbn1fGYiIrh5NO6OclOsJvtZnSsFAS1VcufY3VR8JVJ
	 qd8HqIc0eSLtzpVxn5w2bX2y6Pem0uW/fzZ5TwpMDJ45g+xa1IiY3oPF6oCz7FbSeJ
	 IqfKMtHD4Lz4AH6roB6cnrmtFeUN9vq07sc9cpvcsHAlN5Al7ykOGKlpeeflUBH6sV
	 029sOVB0+MLzg==
Date: Mon, 27 Jul 2026 21:06:52 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] clk: scpi: register scpi-cpufreq once and clear
 on failure
Message-ID: <20260727-towering-spicy-starling-da9cfa@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef515019f96.1785118770.git.liuxixin@kylinos.cn>

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_clk_probe() walks clock children and, for each DVFS provider, calls
> platform_device_register_simple("scpi-cpufreq"). Two related bugs:
> 
The function named above appears to be scpi_clocks_probe(), not
scpi_clk_probe(). Fix that.

> 1) Multiple DVFS children each spawned another virtual cpufreq device.
>    If cpufreq_dev is already set, continue and skip a second register.
> 

The registration uses id -1, so every device must be named "scpi-cpufreq".
A second device_add() cannot register that name and must return -EEXIST;
platform_device_register_full() then drops the second pdev.

So the above information could be misleading.

Can you state it as each additional DVFS child attempts a duplicate
registration and overwrites the first valid pointer with ERR_PTR(-EEXIST),
rather than saying that each child spawns another device?

> 2) On IS_ERR, the pointer still held ERR_PTR (e.g. -ENOMEM). remove()
>    treats any non-NULL cpufreq_dev as live and would call
>    platform_device_unregister() on the error pointer (oops). Clear
>    cpufreq_dev to NULL after the failure warn so remove() skips it.
>

This also fixes bugs introduced by the original virtual device support and
by moving registration inside the child loop. So

Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
Fixes: 67bcc2c5f1da ("clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled")

-- 
Regards,
Sudeep
