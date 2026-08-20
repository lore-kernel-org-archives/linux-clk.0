Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F8C30568F;
	Thu, 20 Aug 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206326; cv=none; b=fpEDUEd9N4w6BX/EyN1tvukSL7XjIk7UZHQVK306Rj+doaLuBSVXDPlDrzREOA7j7fxhrdYiPg7J0JvipsGEnY2UmUQbmFDM0rlP6kXodv4zeHonImwKxwuvd5GW9FIdD8rWhrqfklodqsniYomWjjICk0Fat0KnYI3dl7opUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206326; c=relaxed/simple;
	bh=8cMcgXFjzqn4OTSHoue7n+IbE1w0j0pCNeVFbh6GGlg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NPUaMB1eNPJyEsnCrZ3FLlQjO64LJ9B6GQk2XnWw6KHDwFeMxLTJLOt4GqItYkrmqwm1aQs487/uH6UpEk4AaVkgnwIrnw0SJ79bLuL6Q61IUO/x+Ywe0b1Pj9RmCCat+z5CqGZdYoQ7CpB/6P18v64rE9YtIluI5GzF/yNmXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJgwjULF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJgwjULF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406361F000E9;
	Thu, 20 Aug 2026 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787206324;
	bh=8cMcgXFjzqn4OTSHoue7n+IbE1w0j0pCNeVFbh6GGlg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=CJgwjULFFMWgz2kF0kKg1mYwFqhGiXf+W/uplILwyBcQ6+bRGop3IYO9VeROfQqCh
	 jiXx8rXKlp77C2oVPry6wfaaiQWTRghUhGKMvrrOWsQM1YhEOatS6R5Og920ajecmX
	 ah3/iHbJ0gk70gwPZ5oOI1E0TAhwanBlJj5ewtT+2DzRzj6+4fLv8RSwUNnyZ8leXM
	 W7dJBntqLPlJE8UsudvKTjX4ABSvZ7mudYmkvsJqri5unGr6r5WtgI5DZ8nJqlLfjs
	 gyXvSDEolDiia4TIEfahxYwnBBrBwvHS3gNKJJJ0Z4H9/obIdgwhAz3/3bXwrFcl21
	 GWD0OQFJhxsdw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260814092211.2158337-3-pedro.kopper@microchip.com>
References: <20260814092211.2158337-3-pedro.kopper@microchip.com>
Subject: Re: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val order
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, daire.mcnamara@microchip.com, mturquette@baylibre.com, bmasney@redhat.com, valentina.fernandezalanis@microchip.com, conor.dooley@microchip.com, pedro.kopper@microchip.com
To: Pedro Kopper <pedro.kopper@microchip.com>, linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2026 23:12:02 -0700
Message-ID: <178720632220.4726.4647859230125526989@lazor>
User-Agent: alot/0.12

Quoting Pedro Kopper (2026-08-14 02:22:13)
> mpfs_cfg_clk_set_rate() passes the mask and value arguments to
> regmap_update_bits() in the wrong order. The resulting write becomes
> reg =3D orig_reg | val, causing bits to not be cleared if the clock
> divider changes.
>=20
> Pass the arguments in the correct order so the divider field is updated
> as intended.
>=20
> Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
> Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>
> ---

Applied to clk-next
