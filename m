Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7F27AC31;
	Tue, 28 Jul 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232381; cv=none; b=nYf1hEc0CUo/9/uFG+0p3Nr/A7aegpSHkgrYN8ePRGCoH5ojHGOrDyNvtRAMk2/3s9Z4HPkV4plUOgytEA4Z81axOZRIDOGJGtoATRhustygpB1LKAAIPwO0sfnO/2PIy3xLT56/B/Sb+14SdMz0puxeV2No+kqY+GVW5YFusOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232381; c=relaxed/simple;
	bh=BLzdzEohdcbtZxjx7d/Eeu8JRbcKAEaChBChj3tj5No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ogw8vnixRC9fD+gZ21Fy8dY9wxgFXPtpEerTDyzf3J/UswDquNEJ7vT9aYnWm0GBnyH9I2LSWh9gNvEnXNTrRnLYJyx45riTRUXF1OUEbNjIoSGLLoW+BICrYhgiM/vh+ke7W3TrJYZPWfWDTrcw4IXIj7D4a8w+zSRvT36Xj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+TVU+VG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+TVU+VG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F761F000E9;
	Tue, 28 Jul 2026 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232379;
	bh=3Yzas/8UGeVn5Kj9PsqEqfdR5PzjNdmPToWDa74/rgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h+TVU+VGVEACQv2BALZS8b57h9oGpn8EBE+4LmElFBqY3c9BPYDKgZO0O9NOgEtZK
	 e0ZZHDrGy5kSNSGnDYMFxIV/X2JGczdFc88TGFzaBllMKWERvAjOMYwEBC+dN0t4ai
	 6MelX/zjgaCH9gvRZVoQ3mSWFqijCoeYZ2JHgfIU4W6ZACm1pwvt6W4pj2tR8zGZ69
	 C8eACTh224xnvg2c4UdfP9S11yn7eVxVXhY1m8hjIifKJNH+vd99uwtVv9rS3TwWLq
	 V6DjpSyrIvA5y6t6YHEB1n/NUl/YhwTfn4JmasEusNxe70SS+NcyIx8wKlbjP3UWwj
	 EQd4Uqhe1AnHg==
Date: Tue, 28 Jul 2026 10:52:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for
 scpi-cpufreq
Message-ID: <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <cover.v2.1785200642.git.liuxixin@kylinos.cn>
 <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn>

On Tue, Jul 28, 2026 at 09:27:31AM +0800, Xixin Liu wrote:
> Replace the magic -1 passed to platform_device_register_simple() with
> PLATFORM_DEVID_NONE. The constant is defined as (-1) in
> platform_device.h; this is a readability cleanup only and does not
> change behavior.
> 
> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")

This is not a fix, just a clean. I will drop this when applying.

-- 
Regards,
Sudeep
