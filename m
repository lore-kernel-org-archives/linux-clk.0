Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0239D6D6;
	Thu, 17 Sep 2026 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647163; cv=none; b=uo+bmzynXQPhosB7zDcwoBPa2In3a/Y8+bYJ91Jt9oAGDzFVvgf1LR+7Pj2V9JWi7Bx9KiAiZdqIfeqf80saWfJkntNhxDCEaR8KQmINt2GWGDmq4g9/0ih1WOoZ9sxmy679NP8JXK9RTzppQqW++cYNgJF3tqVyC5FTmQGavwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647163; c=relaxed/simple;
	bh=f//S1JNn3xUVUXgnc51kKsn5YQuil30/jQXof9WcDmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OfYdxPc9dItT41YIH8Y8sylcekk4KjPXPcMfrSkg18itU4z1WF7aLxAfQ9fHQyYitjqbzr8DsKPvXYQ/t9kNpPolp0KrqvtYw5dPHhbRTxPkdm3ytgNFjR9rH2QAtvTEuH/wivGRhtGF33Z+XiJhIyucTqC+FI7I2Ga9w+9Z47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD5B6dss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD5B6dss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732DC1F000FF;
	Thu, 17 Sep 2026 12:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789647151;
	bh=L2SI8CVbawKcxcMWSoidENJlS9DjceTbY62UfTYZbk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nD5B6dss0+VqeitObqG5QC1hcKo1iMK5Je3dr+aUdJ5eF7Hb+6maObMP7TcNy4OJq
	 VahmFaDbBQC694itll6FDtB2vC5HpLvVOYgBoWs78rxZBpsafqY8KIUQGxb1SAn1ZG
	 zJOveaTlncV9xgkm1W3W2LoVwWd8cIRKh/R5POYOxxfu8M8YCMC8arQEoBzCcyxS0I
	 3eD8msoaNXaA2CXa6RA0uoJ0OgRP0I86KhtQYpc0MZloc4QPU7FsU+aLGQi3dSllJK
	 YYsAkW+tCv5n7gJPRF6cuiC9LeqIVvpT34KnvfJVDrS7cNK/BOJw+qhvBI9LqywPXY
	 OJRo178FcoSfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] media: rcar-fcp: Check device revision at probe
 time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, media-ci@linuxtv.org
In-Reply-To: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-6-4c72d4e086dd@ideasonboard.com>
References: <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com>
 <20260917-epaul-v7-3-rc1-x5h-vsp-fcp-v1-6-4c72d4e086dd@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:12:30 +0000
Message-Id: <20260917121231.732DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] pm: async pm_runtime_put cancelled by pm_runtime_disable
- [Low] macro RCAR_FCP_REG_PICINFO1_STRIDE_DIV16 uses unbound identifier 'n'
--

commit 0a2b449894e5bebc78fab36701f40043d23860e2
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

media: rcar-fcp: Check device revision at probe time

This commit verifies that the device revision register reports a valid value
during initialization. It adds type information and rejects devices with an
unsupported version.

> diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/pl=
atform/renesas/rcar-fcp.c
> index dfb0ca93e854d..d99b3ff976e80 100644
> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c
> @@ -14,26 +14,75 @@
[ ... ]
> +#define RCAR_FCP_REG_TL_CTRL			0x0070
> +#define RCAR_FCP_REG_TL_CTRL_TLEN		BIT(31)
> +#define RCAR_FCP_REG_TL_CTRL_VPOS_C(n)		((n) << 16)
> +#define RCAR_FCP_REG_TL_CTRL_VPOS_Y(n)		((n) << 0)
> +
> +#define RCAR_FCP_REG_PICINFO1			0x00c4
> +#define RCAR_FCP_REG_PICINFO1_STRIDE_DIV16	((n) << 0)

[Severity: Low]
Is this macro missing its parameter list? It references the unbound identif=
ier
n in its expansion but doesn't define it as an argument, unlike the
RCAR_FCP_REG_TL_CTRL_VPOS_C(n) macro above.=20

Any code attempting to use this macro might fail to compile or silently=20
capture a local variable named n.

[ ... ]
> @@ -169,6 +269,15 @@ static int rcar_fcp_probe(struct platform_device *pd=
ev)
[ ... ]
>  	return 0;
> +
> +error_pm_put:
> +	pm_runtime_put(&pdev->dev);
> +error_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
>  }

[Severity: Medium]
Can this error path leave the hardware powered on indefinitely?

When rcar_fcp_setup() returns an error, the error_pm_put path calls the
asynchronous pm_runtime_put(), which queues idle/suspend work. However, the
immediate call to pm_runtime_disable() will cancel that pending work.

Because the suspension is cancelled, the device hardware remains active with
its usage count decremented, causing a power resource leak. Should this use
pm_runtime_put_sync() instead to ensure the device is properly suspended
before runtime PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-epaul-v7-3=
-rc1-x5h-vsp-fcp-v1-0-4c72d4e086dd@ideasonboard.com?part=3D6
