Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC16B3C10AE;
	Fri, 24 Jul 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890157; cv=none; b=hu+Ki5yDUNN1158P90Ur5W2Y6u5c5UAKTWQaxXh+mpZUgAIBtGIfEU7W30GFbMah+ppQ+wzvIi8MJjMlImWCrDF+I0UYBW6mrPsENLirqBMhbpxiz/W8KYQTXlSzCYUXKVa//CtTVfTO2Te6vHOGiJ1TArUvpQEUHaOTW2e+NMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890157; c=relaxed/simple;
	bh=okXQBzs/oPe7SiFq0kQlbRNc2jeyn5LJ68OTdABhEuk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=phBj0ZzoMgJeJ1ZRt1Rz+4U2lhXx0ATeSEDQSsXutennrt9aiItflfRzFGdSBMkR1WIISvAuzrKsLlMe3Vp40SJkKm4C41S4Le4eqFf9qShxCAdQ0jCV1F3Lp1PTUPkyzAJpCe/9Gv/WN+jLELXfHSJCtuEl6YGiq3si23cS0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 31870202074;
	Fri, 24 Jul 2026 12:49:11 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wnDSp-00132y-0M;
	Fri, 24 Jul 2026 12:49:11 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wnDSo-000000006wz-4C49;
	Fri, 24 Jul 2026 12:49:11 +0200
Message-ID: <1eca6815953b50fe3f276b64d74be2795b8382aa.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/4] clk: qcom: common: Register reset controller
 only when resets are present
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio	 <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das	
 <taniya.das@oss.qualcomm.com>, Jagadeesh Kona
 <jagadeesh.kona@oss.qualcomm.com>, 	linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Vladimir Zapolskiy	
 <vladimir.zapolskiy@linaro.org>
Date: Fri, 24 Jul 2026 12:49:10 +0200
In-Reply-To: <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
	 <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-07-23 at 21:15 +0530, Imran Shaik wrote:
> Some clock controller descriptors do not define resets. Avoid registering
> a reset controller in such cases by checking desc->num_resets.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/common.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836=
af48090323248de 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
>  		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
>  	}
> =20
> -	reset =3D &cc->reset;
> -	reset->rcdev.of_node =3D dev->of_node;
> -	reset->rcdev.ops =3D &qcom_reset_ops;
> -	reset->rcdev.owner =3D dev->driver->owner;
> -	reset->rcdev.nr_resets =3D desc->num_resets;
> -	reset->regmap =3D regmap;
> -	reset->reset_map =3D desc->resets;
> -
> -	ret =3D devm_reset_controller_register(dev, &reset->rcdev);
> -	if (ret)
> -		goto put_rpm;
> +	if (desc->num_resets) {
> +		reset =3D &cc->reset;
> +		reset->rcdev.of_node =3D dev->of_node;
> +		reset->rcdev.ops =3D &qcom_reset_ops;
> +		reset->rcdev.owner =3D dev->driver->owner;
> +		reset->rcdev.nr_resets =3D desc->num_resets;
> +		reset->regmap =3D regmap;
> +		reset->reset_map =3D desc->resets;
> +
> +		ret =3D devm_reset_controller_register(dev, &reset->rcdev);
> +		if (ret)
> +			goto put_rpm;
> +	}
> =20
>  	if (desc->gdscs && desc->num_gdscs) {
>  		scd =3D devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

Is it possible to have num_resets =3D=3D 0 but num_gdscs > 0?
If so, the now uninitialized reset variable will be dereferenced and
passed into gdsc_register() a few lines below:

		ret =3D gdsc_register(scd, &reset->rcdev, regmap);

The whole gdsc reset handling looks very spooky, with
gdsc_(de)assert_reset() calling directly into the rcdev->ops with no
regard for reset control state.

regards
Philipp
