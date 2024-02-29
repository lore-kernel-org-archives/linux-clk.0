Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FD2E415
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709168597; cv=none; b=g8CHaMhbCkrR887GjZ0S0AfuL0d7TDu1a7k1hIZP3azDXm85DhaRJSiiuFLeSptc9hhRD77tcKuEu9CxbReQQk3+SKNRNhbXRE4/fWHK3BIzIfYPKJKs2zJVqH9a+59fIfF6NWaPImc3yQBq8sVXfU2Opg8YMn19rxTWXUAYFPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709168597; c=relaxed/simple;
	bh=ptQH1dSLUS8Z0QW11kE0YWrg2GJOAi5+mQ1OGjU15J4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=lDQQY9QNi+Nn6LvKSAiHLZYbath//r7ypNsVj8NDrNXJvSv0Yf/XqRzO18/fnpxW3b6q9frXIaEWYS1nprlUQXoWWsFtG+Fl9feBwZss6cz2h8U9tV22GeLMgVes+dTks4EJr0v50df7K1tzLeBPNElUNIT5zICZZzIRpqN+e9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5R+gMQt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5R+gMQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1C7C433F1;
	Thu, 29 Feb 2024 01:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709168596;
	bh=ptQH1dSLUS8Z0QW11kE0YWrg2GJOAi5+mQ1OGjU15J4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=X5R+gMQtRzuflFVq/jdWIq70zK6yzFKP911wFutZIGpjBXy1DVJDJHeQ/ActE/cRw
	 Q9SqhzB41xsLyl262imyN8Ym5nM9eB5uSHnYN2+qUx/j3OcQjlNGBZdD1xvUNsrRRD
	 mOSPZk9Yh/K6l1PsuWmSNJOL2G9TDQy9Z4lNH4PKz7R1eD2copaC6AkOGhryeqFB2q
	 1wdSgOBtsgqmoUCQL3aunXywMFKFFhapbL77716mP6VgElOtxblfxUg1W9sSvaTCC4
	 eSVo0A7yQp14tteTjWqSOs7KEIm2V5c3FTJGwqNy5VwlfzqAkb0nh2qpEcg4EXh5J0
	 HTHqrtT00gaFw==
Message-ID: <66b2815288c4b4bae67af458b2589dc9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
References: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 28 Feb 2024 17:03:14 -0800
User-Agent: alot/0.10

Quoting Uwe Kleine-K=C3=B6nig (2024-01-04 14:55:11)
> This allows to simplify drivers that use clk_rate_exclusive_get()
> in their probe routine as calling clk_rate_exclusive_put() is cared for
> automatically.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next
