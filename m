Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7938F235;
	Wed, 29 Apr 2026 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434419; cv=none; b=G4eygRLKKUtg6I/NOLaRu1tyWHvjdoLCIFtj879GpoAUrlduD+Dn3cbf85QwIXNxqADxKVXHdxivLsxrPHzP3o/m8NPlNYG1eupRyUhSqpaSo6mW4DytcRuwl1nNCJSdug9YhsY/IijTIxDlcyfoBoZe0y5m/yu61//5cffSjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434419; c=relaxed/simple;
	bh=/MEa2Fq2BTYER4OXlPjCrO9/O5Ew6iOB5RCGtNlKWcE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=utDJ905O2763noFbq5UwM1P9r67bkNW2TYZ/X0pz1Nq/SjI9Kj9jLP+LUM3dkeArsI7/ybRfx+bZVdVBbsEHew9FF1KsFZ3nzeldSeuJKpgSAOOomMGty09KC1OPR3J1GV7z4KJvXje7KYr16pFuUvcUAEJW6LiP2v4xQV+tazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNVm7WTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNVm7WTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8F9C2BCB4;
	Wed, 29 Apr 2026 03:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434418;
	bh=/MEa2Fq2BTYER4OXlPjCrO9/O5Ew6iOB5RCGtNlKWcE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aNVm7WTB7e7SzAk10BZaFoD/ajSUxoQqIpS29VvLOv96dhn2Z9aqj1HtOOjfj7uQ/
	 X9LpKHpFmif1daqh926lk3zHtOonIyEU2fAAd+wBcwYbkOym4tPU3jUIB9Mdr9qOcK
	 09YYqw5fCfZJSdMdVgsKajmBOTsDrTHhX22yzSaiA7VeCTjjd0vGUTCu7M6gjUL50x
	 gsLIg3XngSO/S76dTqk+IO15kswblakumIGF7JYr6xv9yf2si0OzrwHo72C4wNgzan
	 WJB13VLsrCaAu9RD1H+IKUcMLKrCkyNyx5G6Cr6ydjsmg388OuElynCbPd5ROl/+Is
	 71selElWnjidQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com> <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
Subject: Re: [PATCH v7 3/3] reset: eyeq: drop device_set_of_node_from_dev() done by parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Tue, 28 Apr 2026 19:04:08 -0700
Message-ID: <177742824867.5403.11815560359227140766@localhost.localdomain>
User-Agent: alot/0.12

Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:07)
> Our parent driver (clk-eyeq) now does the
>         device_set_of_node_from_dev(dev, dev->parent)
> call through the newly introduced devm_auxiliary_device_create() helper.
>=20
> Doing it again in the reset-eyeq probe would be redundant.
> Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
> Also fix the following comment that talks about "our newfound OF node".
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-fixes
