Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E718FC8F;
	Thu, 16 Jan 2025 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062924; cv=none; b=daP+N/G5BaAZZYcckKXShdBHSmXGeFPmLXtETRGzYPP82cBypLiRYpPOJV71G/qkNrS5d6sLutxDTLkHFoMYvLizMJTjcYz8vceP8g54SdM1qoVEnz+Gz1/zEKMMy0/hrk8bbuy0AKHRdq5eK5ph1NNaLaG/H8ZE8zv1RbAplSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062924; c=relaxed/simple;
	bh=8kH3RcHClvLWKy+O/o5Npjm9FhOjWPnQCjMka/A5bg0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NUulSKAxqIQTzkFhtA656glRhI08Uxe9LLvvRX2dnvSg4zx/B0UkWGSWxmGCYC6H007pYChKEwAqGE+6eJaXfwU+TpVA3bcu5lqrdxVlStKXkvJFkRFfEUuAvrEp/C+qwBN7iEqeZgvZ8vGMfgeJyE1HF2KXkx3t2IX0POJ35/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA/xqa4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA/xqa4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DADC4CED6;
	Thu, 16 Jan 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062923;
	bh=8kH3RcHClvLWKy+O/o5Npjm9FhOjWPnQCjMka/A5bg0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DA/xqa4WVBH7wp9VxGtnyGLywk3sydajZ0wutylhwpoaUNrojkjls8GOyPH9Kh4u4
	 1a8f1gxUkgzmOdx44hG5gk9eiv6WS6NbTycQLdsfvPG24iB68Af+XQhsXvG74mMJIm
	 v57b/XwGMlba01LELvdzlkpM4j4udg4gAj/sEXvbUKVgF8+nviGGTClrbERGB0cDGJ
	 luETH36vDFYduOdNJvM6P0HrpYjcnjd0uHTQwnJVmk2PMHglTeg3rCBvBIWsoaQhBp
	 KNjz/IlIF9wXS4Axqu9gTbyjcJuTqGFhFzjlnPgfavFTaUNmysi2re8drTsIcXqsMS
	 q7QOgBNHvkvWQ==
Message-ID: <323a1abcf2c1cef2e2e3e002f0a81919.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-1-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 1/5] clk: bcm: rpi: Add ISP to exported clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:28:41 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dave Stevenson (2025-01-16 08:24:08)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> The ISP clock can be controlled by the driver, so register it
> with the clock subsystem.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next
