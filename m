Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AA43F4C2;
	Sun,  6 Sep 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788696006; cv=none; b=jcy/xsOQQCuDsIm915vSYRj+RwKc9lV9a+UmIlNeMTN4l7Rx3+awSJeweR6hFBWhaX7i5e8gfC2Z2QZhbckbCqQVNAg2y9KYZLRulDHe7yCoKV37OfZxAHZy2hdw83K1lwnbFgG5FBzkLhGOMKJ7NMgMIgcA4BaN/fnuN2/awps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788696006; c=relaxed/simple;
	bh=5Fd8GqJvNS9wPlHT4EfYNYFUrmUOvnxMN88/bw1yIhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7F41tO/p2CDA1Pq0IdBrnXGLmEPo2eHS20bFLKxO4kgsgGfpJKvj3cwEfSYEDpt6A9oC2PPRREIcaNM2/3vb2+mtms22+h5So8aZe54CIHEKyVSwD6xdX5TAOUwWExG/QFcWHS6+KOi/fEJ/kUR65/em3eoJNf07srAvHM1aJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsEubW4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsEubW4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1D71F00A3A;
	Sun,  6 Sep 2026 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788696002;
	bh=tpIg3TvddyiLXTXNM82gVxkqulczRwY8wSBX7Comeg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UsEubW4kU2ekf9vKWh/ZY4sgGrsrnFcVX7FuXzMVH2oYxV/Ona0cnzi06Ji2mmJse
	 WMJzrfuTLtodLpdH9P8/1VjeSpEttlqEXMAcO9NOChGXAcqHjSrJlPIfEm5S7vf6ir
	 UgEnjVKfANCUWmm2q5WygRSbcv5ZslHPAi2WGZ+cAHB7yetFw3AxIoC8a6SCgOe4ax
	 zweei73jMa/+jMs1A/2IbOIaU/nvZhB9WaL+wq/joYHpVPF9DDWsEb80umk53UL+h/
	 n4v2cTIubh0xzLhtw9R5Zd6Z4WFKL4lQLDxBHrjDF7rCrIwXe9e4x5EJX9dZgmuXQe
	 PR5Ikh0wVWbGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 5/5] media: qcom: camss: Use data-lanes starting at
 1 for new CSIPHY mode
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: media-ci@linuxtv.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-5-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 12:00:01 +0000
Message-Id: <20260906120002.4A1D71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces a build failure due to an undeclared identifie=
r `CSI2_MAX_DATA_LANES` used in the bounds check. The correct identifier is=
 likely `V4L2_MBUS_CSI2_MAX_DATA_LANES`.
--

commit 6412cb87019badaa2684393747963c54499766bc
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Use data-lanes starting at 1 for new CSIPHY mode

This patch updates the CSIPHY logic to accommodate a change where data-lane
indexing starts at 1 instead of 0 for new CSIPHY modes. It introduces a
lane_base offset to dynamically normalize the lane indices depending on
whether the PHY is legacy or new.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..8a4d8a206cf0d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>  		return -ENOMEM;
> =20
>  	for (i =3D 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +		u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >=3D CSI2_MAX_DATA_LANES) {

[Severity: Low]
Is there a missing declaration for CSI2_MAX_DATA_LANES here? This looks lik=
e it
might cause a build failure. Should this be V4L2_MBUS_CSI2_MAX_DATA_LANES
instead?

> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org?part=3D5
