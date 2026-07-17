Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F863B71BC;
	Fri, 17 Jul 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270255; cv=none; b=E7RerBRuEEHciOqvD4E65NF+jaNrn/+UcNkP7YOsHcH/cWyXH5CIQveMng8KCnBL38hYXcpy3kGsfifgf2jyO/ifiO/c7QImLGxhkw6MUVKAMZGSB+kdnmrwK/ittLMoIle0QSlHSj6pvw83qzWmHAy5kIgRghqb9Xgo5iiOBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270255; c=relaxed/simple;
	bh=xCuquY/F6jRPOIqXiEYxfkYbky36x8A0G994F705RxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivJ9Gr9MF7/YrnSMYhugnFXtUFIiq/52V36SnX+kAvmL85bkQeuAzbtSvK9IyihB7wOQtAm6otxvqJylZfheinrO9Rc3DuiuRbQZc8373Scrb/7856gLS2brv7wQemrpM5Bho89/BnEOYsPuySQJhCDRI9Y2G/1D2k0WuEFbV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwiE0MNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwiE0MNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCAC1F000E9;
	Fri, 17 Jul 2026 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784270254;
	bh=xCuquY/F6jRPOIqXiEYxfkYbky36x8A0G994F705RxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mwiE0MNqTye8d8JrDqSXXN7XMhLkFoVdHa65K4dvMEXBUsuupnxYeuQ/s6QI53Hhh
	 K5iDaFtKk2OyhK49xsGZzFINm6+2yA556i05NSeNUjjpVYY18REINwX+yb/SGsP17b
	 Sp+1jRISRyydKjy3YViqFHWZTfDXUYf7eCdHX9nC185lbJXjiYH8ht9g7JXDMVubYU
	 BNRKBVaAptkkiNexoZVcU1jinxsZFZv137ACnpHcfxuB/IrGi7qJ1ggUbchOrC4xAM
	 NZEQjs1R+ZPhxbj17Ba96ILna9ReqyIxtOW18fK0Z+Jyod29o48HORqEwkateUFrhC
	 2MA0IDR72VGRQ==
Date: Fri, 17 Jul 2026 08:37:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 00/13] ZTE zx297520v3 clock bindings and driver
Message-ID: <20260717-positive-terrier-of-realization-0e2a95@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>

On Fri, Jul 17, 2026 at 12:35:36AM +0300, Stefan D=C3=B6singer wrote:
> Hi,
>=20

Where did you explain merging dependencies? Patch 2 (or 3) depends on
patch 1, so do not expect maintainers to guess that.

Best regards,
Krzysztof

