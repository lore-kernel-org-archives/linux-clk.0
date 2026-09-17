Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605AB4EB857;
	Thu, 17 Sep 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659490; cv=none; b=rupKJ2uG+TPDNB392/OPosg4dUZbx/2GsLZc/yHVomCGMnig5adHqZ5YvPwPfcOAwUGT7OECKQvba+rl5fwT/LkrLs9IZiKMe2PWXdPJLqIRN28wwiib45/zEUcq5W3oLomCP4BJshUnV9lnp6WcKA7h+lxon7NkMDMIfLwucg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659490; c=relaxed/simple;
	bh=SVDRCsMJFYfaEIT7XBtR73vvE7TyuE51DOQ9bCVkXC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rh3UHJNDRShsdYlpz8ep58D8bDy+CU/dXVwatRV+HFMXUdUpb7bbjjKmDWyhq7bbqTd8QJNfAPRXnmktJSOOaXdjdcNlN8ctKWzOLs8kR98e0lEYEYNmkskcb74nPPT6ZgWNKux9R4DGnTzkgE70fI5pyFIYjp/atOzGQUb1UxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFTxNrKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFTxNrKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258D21F00899;
	Thu, 17 Sep 2026 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659476;
	bh=3TzLXrcGuASJ1qHzqcwSdM1+hZ8ISdHdTfVfEWZJH1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFTxNrKsWrlaB7PZVZc3eA3KAUUTyyBRbFrDbSnvc/A1WiZBX5Tn3PJAlaySwQLJw
	 Tp8N1EdNSgmwTFyOC1k38xUjhmG0iWm1i5Z8+OxsjCAzEkz2MQWnAZsqmRJw02UYMT
	 FqowuUSV+mARg5b/GPLg2xRhHtpKmS2QRR2QNYm1g5XIzd9uLKQHyZODDrFEwy+b9a
	 6CY71BWZ1RDjCMhmOA8RiP3VBJpM4bPWvVSMnThpb7nTt8XE/aIla0rKZ6gO2Zpuhx
	 3WDXyTs3OWxpn6ZbJmZ5urATbkNRQu0QJqSwTbLa6jGnZtOgBtQuYtoHkWoiKrKIH7
	 gDHBcyCj6expA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 4/5] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-4-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-4-21ad8a76e941@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 15:37:55 +0000
Message-Id: <20260917153756.258D21F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] kconfig: selection of non-existent symbol PHY_QCOM_MIPI_CSI2
--

commit 585e1d52eb0f705ed19df22dc9f45b8bef14c8a9
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

This commit adds the ability to use a PHY pointer which interacts with the
standard PHY API. In the first instance the code will try to use the new
PHY interface, falling back to a legacy method if no PHYs are present in
the device tree.

> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2

[Severity: Medium]
Does this statement select a Kconfig symbol that does not exist in the kern=
el
tree?

When a user configures the kernel with VIDEO_QCOM_CAMSS, this select
statement targets PHY_QCOM_MIPI_CSI2, which appears to be missing. This
leaves the required PHY driver disabled by default, causing the camera
subsystem to fail at runtime because the PHY device will not be present.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org?part=3D4
