Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF738BEC;
	Thu, 11 Apr 2024 03:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806607; cv=none; b=sUmk1aJpQ2YN0YtAWnvexk73oUBfwvrESseEGlwzVHqN2NBvyjbLpySyXqfrsrO1y0hl9MX5JdFCXIDRnZHhY+mFaNwc8zxn0zn07svjJ3WS3nhsYdyIK5KYIcgWBtEd5vxEPjOtKsw6iAUUHdUYrv2M0ww9NVxO9/IubRmsfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806607; c=relaxed/simple;
	bh=5uToFoOLJxtR0Fi7hhm2CFmH5JXOj9348fyOigQZ9Ic=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=DzAOc2eSP5QubzIAtBWD6oy8P1gH7DrmLB7xTSTYzAtzJozk0a2SfCWAc9/6FDvnCyxlvQq0ZW0613ey0kZFHX1jE9OOMF9gC2hSJasnW/B/+uM/lJuLdN0bX3f1PfnsI/Sqthi4tIP6170QzjVb63ZhQDa486MOV5YgGTVnExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIamxlJz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIamxlJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639D2C43390;
	Thu, 11 Apr 2024 03:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712806607;
	bh=5uToFoOLJxtR0Fi7hhm2CFmH5JXOj9348fyOigQZ9Ic=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FIamxlJzVnowmi5HwHzfyGBGfpSi6hK0SlNHh28i/dlED1nPEnoHMFFPvo2pEwF8A
	 xz5UFJQ3le/mEW6fWgpUrm26ShRV+BEls0QQ9NjHZ7eaesUSpBBEMLjzVBv5SbpOPJ
	 3/krE1Fgdin6xdGCwyPtGmlbFLyz21sZpRltCJ4qWbBmkuI9MyhB0NzQ5XW4ABF0FE
	 WyF17tyhEBnWOZllfTC18XzkWgmNgHo1NWDFN1AEZ0YWitAAvRlDCQiZZ3TMQQkU3Q
	 iXz6LkJJpxcxNk0EB7KbWDUGHvN4obv36AUD5gYgPAP60GLp7+4GrGbr/IRs87PDhy
	 I5Uh27BGGSZ7Q==
Message-ID: <2517cb6d502620d5c30154a9344e4aa6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <57b6e53ed4d2b2e38abff6a3ea56841bad6be8a9.1712399981.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org> <57b6e53ed4d2b2e38abff6a3ea56841bad6be8a9.1712399981.git.lorenzo@kernel.org>
Subject: Re: [PATCH v2 4/4] clk: en7523: Add EN7581 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 10 Apr 2024 20:36:45 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-04-06 03:43:44)
> Introduce EN7581 clock support to clk-en7523 driver.
> Add hw_init callback to en_clk_soc_data data structure.
>=20
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
