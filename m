Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978782F363F;
	Wed, 12 Aug 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500509; cv=none; b=XtGf0DyL7Lp6FrCu2hGbO7xc/DFDvEfuCZ1hQkRx6K/bkSkAnWHz+ZEHy7VxGo8fkc6ad8RftO1qKWpnGL6J4F2aIwhbWvGy//Z7WOZhn19BPbjf8q6miaHSn+YfGiz0WA5wB/+uukoQpgIiaDkWIXFl9RD13Cmt4AoG8gKx9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500509; c=relaxed/simple;
	bh=M+WkQwdcROkpSS2O/Oa/EYbdpBpMmf0Br5JtbRSgQJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ii/ySIUFZDiYKPYxkCxgJAEaLHru/78OA0DlzYuFHdzCCZyDOZNDV1AuhF6zDMxstpXCyq3jR7zkcUPb9auquCzWGLCvGgSRwWaEX/Tmj4beo7QVsSGFGr4oteotQYX2GgiV5PGofwYrLMHYC/+kpKsaQQvoaqOaj+oi2VThcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF4Vhn4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF4Vhn4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D656B1F000E9;
	Wed, 12 Aug 2026 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500508;
	bh=NtVPaSEDTyCmXuupHJSHxz8roojxzubczUtxpn7UYiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BF4Vhn4evD6LGMPm6+Ayks/3u6V3JqPi1yk2XU2E/bNlPUoq23rpBPJFXU5q6Mgpl
	 7DU8yvim0j2vCeIHXZB8UJ82s4bFD9ZUm8oyY2cHWSSJrr3HP7DEp6//hfTBHxejtM
	 PgRv42V0006QG2qsrIaJdDgmxYR0aH1seN0Czym86m9eZZS2ESUtiiGaPN1yis1YXz
	 ojq65I7kvGg9VBY+EbE5y+i3wYZ8DH3w2BJUyvsshg0ZsRTfn8AvaPrkN1EEakHq9g
	 N1qW8ZXTj1jdfC682QtHiTt0GAryS3q8BnhcSBPMKHyC1HgA+vWC4jvcja47nArh0t
	 Hf6rBRO4IdXCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 04/11] clk: realtek: Introduce common probe() and
 remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812020009.3480538-5-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:08:27 +0000
Message-Id: <20260812020827.D656B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] rtk_clk_remove() manually clears regmap pointers before devres unr=
egisters the clocks, creating a fatal window for NULL pointer dereferences.
--

--- Patch [4]: [PATCH v13 04/11] clk: realtek: Introduce common probe() and=
 remove() ---
commit 85dc7ea7ea58332e5239ff20ff6e6669d56fbb6a
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Introduce common probe() and remove()

This commit introduces common probe and remove functions for Realtek clock
drivers. It handles setting up a shared regmap, registering clock hardware,
and optionally creating an auxiliary device for the reset controller.

> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/c=
lk-rtk-common.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
[ ... ]
> +void rtk_clk_remove(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc =3D platform_get_drvdata(pdev);
> +
> +	if (!desc)
> +		return;
> +
> +	for (int i =3D 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap =3D NULL;

[Severity: High]
Could this clear operation introduce a NULL pointer dereference window?

Since the clocks are registered using devm_clk_hw_register() in
rtk_clk_probe(), they remain active and visible to the Common Clock Framewo=
rk
until the devres release callbacks execute. This devres cleanup happens
after rtk_clk_remove() returns.

If a consumer or an interrupt invokes a clock operation while the device is
being unbound, the callback might attempt to access the hardware using this
newly cleared NULL regmap pointer.

Because the regmap is obtained via device_node_to_regmap(), which returns a
syscon regmap that is never freed, is it necessary to clear these pointers
during driver unbind?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812020009.3480=
538-1-eleanor.lin@realtek.com?part=3D4
