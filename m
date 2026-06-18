Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF1271A71;
	Thu, 18 Jun 2026 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772573; cv=none; b=HoIopnt1vuBoZI78mPUWVk2x2YuvFocUR8VvJmaw7eMItjF1WJhLkHFXA3fhPC69MSJm5WtHe64S+ed9/vp8RMkzPbo4FJfWSWTnG0rIl7l72USNDzQiVrPtUlcu9XQCxlmn+wCNU2ajLhfki4TaCMBSlFZmJFb7naEVaFFuc5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772573; c=relaxed/simple;
	bh=Qco/LJBMTkGeaS+CG9RMYVxourHKcGsH5iGN24vmpPg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kol0fTyw1f8dUoqLM2c+Pu5MQagvJ6gAjC4WGPxpqrMGDsH1qvjo7+BkBQoLUmNe+56mFffBANbIGuAjuLJJM8O/InSPjCQz6s6WHoM+C9S53LUTv4/cAeve/70GTxUmPbBG0+U/Dx7CH8zsIv9HI+UeJxNQej93HoQA6Psj81o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A3BF72002AA;
	Thu, 18 Jun 2026 10:49:28 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8RE-003PSu-1n;
	Thu, 18 Jun 2026 10:49:28 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa8RE-000000003qH-1ylc;
	Thu, 18 Jun 2026 10:49:28 +0200
Message-ID: <56c99d63c2c1b8116b9fb779b413e3240816b89a.camel@pengutronix.de>
Subject: Re: [PATCH v4 resend 2/5] reset: cix: add audss support to sky1
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Jun 2026 10:49:28 +0200
In-Reply-To: <20260617064100.1504617-3-joakim.zhang@cixtech.com>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
	 <20260617064100.1504617-3-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-06-17 at 14:40 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Extend the Sky1 reset controller driver for the AUDSS CRU syscon. The
> AUDSS block provides sixteen active-low software reset bits in one
> register for audio subsystem peripherals, reusing the existing
> regmap-based reset ops used by the FCH and S5 system control variants.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/reset/reset-sky1.c | 86 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 83 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/reset/reset-sky1.c b/drivers/reset/reset-sky1.c
> index 78e80a533c39..af32ee005ebc 100644
> --- a/drivers/reset/reset-sky1.c
> +++ b/drivers/reset/reset-sky1.c
[...]
> @@ -343,21 +379,65 @@ static int sky1_reset_probe(struct platform_device =
*pdev)
>  	sky1src->rcdev.of_node   =3D dev->of_node;
>  	sky1src->rcdev.dev       =3D dev;
> =20
> -	return devm_reset_controller_register(dev, &sky1src->rcdev);
> +	ret =3D devm_reset_controller_register(dev, &sky1src->rcdev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, sky1src);
> +
> +	if (of_device_is_compatible(dev->of_node, "cix,sky1-audss-system-contro=
l")) {

The compatible was already evaluated by of_device_get_match_data(), you
could check (variant =3D=3D &variant_sky1_audss) here.


regards
Philipp
