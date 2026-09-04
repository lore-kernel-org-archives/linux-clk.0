Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711213F12DE;
	Fri,  4 Sep 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529956; cv=none; b=djf4jEHGsCUmfuYSH+7A/9WdpfSO9OzMLuLjOOlgGv794qaVvvh0H/aHH7qGtW1xg+MFyTI8jXoFvtwxxIIiO8jSkSeivXJs7ugbMS/5Z3knDiAP/Doy9b5BDd1vu8qyH9h/M4dyRyxFKf3VvLXSWyM/8EPSte3ZrRs6OSibjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529956; c=relaxed/simple;
	bh=U3BHcGzy0XpbIDqERAPq2BemblqMmpns070yQ0jg+UI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yu0Z+1cMcczFEsGGBp3/Xpr2qs/JASXKhZXxrddvvMVQaMJ65Va9YJFJOp3qFsFbZziZIVBpZhyLFbPtuOdfccjI6VNP2zhhta9Ux0F87lyw97Ajsm38RQ4UcrAHoW3NqF/FrUpsbFguVxFdafizw8n8rjElxZIjiKG32lDeam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpBXPqMS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpBXPqMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8241F00A3D;
	Fri,  4 Sep 2026 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529955;
	bh=JLgwTSSCpM3L6iDJ0ynlXolF/uJm18acCEZZpWdVymM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpBXPqMS9xzgulJaIs2j+/CHJyl9XJXcCIVop/7FoAmnGIGxVjkGQ0Bt1M3HHXZU5
	 0szWoycEbq0vzieUVJayBYrhMw6lrAUWTc6CVrWItFRaUJ0/xyxyP21URl5HAjCeIi
	 4+GaztiJvJvT+NwE72sl5AVtstCxs2iD5F0AbxJpR/+6J1Sut+AuX+txXwkAs5nuhp
	 tcprpCwS+eLJ442vVGtmiYiIo9ghEacZaF65eMZ8+KhzKuSL5qvzj2ATVyO78te9MD
	 fJnbQO3t+DYnCJspgko0DhxABsc9yGxx9Q8/I/rjfE0mLelE175kHc8IY5hP0Ev8CR
	 e0UlTKnHDPSnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:52:33 +0000
Message-Id: <20260904135234.5D8241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect regmap configuration (.val_bits =3D 8) forces byte-wise =
accesses on a 32-bit register file, which may cause bus faults or ignored w=
rites.
--

commit 83ac96938fc0f15d53cdae0501c6e430a17c1c1d
Author: Michal Wilczynski <m.wilczynski@samsung.com>
soc: starfive: Add jh7110-hdmi-subsystem driver

This commit introduces a parent driver for the monolithic StarFive JH7110
HDMI IP block. It maps the shared register block and creates child devices
for the PHY and controller using a shared regmap.

> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/s=
tarfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000..e05b91825be4d
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
[ ... ]
> +static const struct regmap_config starfive_hdmi_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 8,

[Severity: High]
Will this regmap configuration cause byte-wise memory accesses on a 32-bit
register file?=20

Setting .val_bits =3D 8 forces the regmap core to use 8-bit readb()/writeb()
accesses instead of 32-bit readl()/writel(). The underlying Innosilicon
HDMI IP has registers spaced by 4 bytes and natively expects 32-bit
accesses.

On RISC-V platforms like the JH7110, byte-wise access to 32-bit APB
peripherals typically triggers a Store/Load Access Fault or results in
silently ignored writes.

> +	.max_register =3D 0x3fff,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D11
