Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C8447808;
	Thu, 17 Sep 2026 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643996; cv=none; b=puQUoE58KkEYrCyDFXh1+k6N/i0wYSxxaOxYXzRPX+fGtVdub42kZcZOFwylKGjEyL7AUCKUWVGgURM8YXUqD7K8pyQCrXANWkZ1aVnChmPXkpHGyR+DIRaBnOGP7eBJ0H9tQifPR15VSxTkWwVjZ6cmQhlrvoLnxrztPQY6/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643996; c=relaxed/simple;
	bh=s/XRwizFNtdbIAyWdJqAYf6knSola/50Axn0lz7I6nA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dSG+lGdIfS1bIoYLBWZd2R33XYeFWbQtwdJQ6FRAioHJv3eyJ+qaIe2c7lSFl/JHEUjbUq6RX5xAVBUhiWHPtpPhNFUkj6O3GMk6MuwWzR+WD85GKv4v1okicif5UiUE/jnq1ZcXSYQ7KU3bxW+Zh+NVsM0wP4W13LKN3kuyt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzgtyKtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzgtyKtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88BE1F000FF;
	Thu, 17 Sep 2026 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789643988;
	bh=+gYBqCu155OhLXvJ/oea/vKBeIQvwk1zdpOhFSgJ2yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzgtyKtcQYqvt6AA69miMM6AqL+YAX/O7Ukz6yeIsVIQK+0O3hHHKS8nGP4Dbgjfh
	 Ugl+K9DOyf/FwueXB+mEjWudNxXmJeW3/u52lj2pgDsY5eAc5SM3kDUOD3d1gyM/rF
	 jzV8yfhNNyohxN/ahO3VKMC5n7b7mpSHmU2Z99k7zarSdcqQJLXBR5Hgz1KaRFeKBq
	 +g2JT3Z178BFB9dWUuJGsrARQ1ZTREbTvaJX6XCuQ+9ipRnBHYRCFpMCM6l7HYCsro
	 dn0PwRRKcoijoViBe6MWr+LxTOrvssZ01jcgSeTxyE24EX9l9XwoD7zfq0zlKiOoV/
	 ZUEbkwxf5K3Bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/5] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-4-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-4-f85c9103177e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:19:47 +0000
Message-Id: <20260917111947.D88BE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kconfig: select of non-existent symbol PHY_QCOM_MIPI_CSI2
--

commit b03573fcd1f12d4d07c40dc4f1d37bb4aa02040b
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

This patch adds support for using a PHY pointer that interacts with the
standard PHY API. It will try to use the new interface first, and fall back
to the legacy method if no PHYs are present in the device tree.

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

[Severity: Low]
Is the symbol PHY_QCOM_MIPI_CSI2 defined somewhere in the kernel tree?

Selecting a non-existent config symbol has no effect. This means the
required PHY driver might not be automatically enabled as intended, or it
could cause Kconfig build warnings when configuring the kernel with
VIDEO_QCOM_CAMSS enabled.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org?part=3D4
