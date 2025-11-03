Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59608313E28
	for <linux-clk@vger.kernel.org>; Mon,  3 Nov 2025 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762185341; cv=none; b=TOtKDvLpvtDVfEzgmSMpXsve84/cXpVmVACTDNySxvOtgfRDtIntiKKBSqqTrUKsb/1Pvq1qT+5ug8ZM+Fj7pe7ncpGSdB7R6FznOtODUGX9xw4NRwF/ZLWgLeiFIEBDgsVyvd0bJzXAK5rOVKFJ6FdoUMPfbn60XlRm2d5VV34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762185341; c=relaxed/simple;
	bh=a1cJ6933zWuAEtCOdOFxj9zB/l6u9l21zBJ6sLQdGdM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k2FoOg4l1SXXkj/dHghf2Mu7KM734NoD7r/Dd3T+q9qT/sWWK2JzwMCdAHefEFmZ4WobqIzxrtXD2BL6q/p41+9XlBEUaqfEFao7nx11yMk++TFit53+/NodVZMm/2TAMarztWbxE56tKWhEkhI4k2TPPPYZqNhZMelyVy9idv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YiP0Q3MG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YiP0Q3MG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B7940C0D79F;
	Mon,  3 Nov 2025 15:55:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A68A60628;
	Mon,  3 Nov 2025 15:55:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FA3310B5013A;
	Mon,  3 Nov 2025 16:55:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762185335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4c4LRRJ8sw5A6vf7y+x/rzyPGD7ZqnrLurNJrM/Rt1U=;
	b=YiP0Q3MGz6gKrdhEJYtIAzBLLE0V4pCs3lkwuur1gQC4tqTE93BsSj+Bkf4+dvh0NbYtmz
	IUJSHBgvH5XUn/58C/KgsMPolI+ztn40Eosus6fKiAeEC2MQzFJ9Ql4dCxLg6ThYVZ0eSE
	4TSuzPoVZZeQT/BHz2ADoIRkklr3QfnittPET7bboaawDrInQQqFr4V3/bSzm6zCa77kS2
	14dKpih+uvDajz56ookb4xHM/Q9DH+TGBidee0WG7jlqrMfPONznoMI/7Kt8A9aFT7TkWy
	fBGMPsAMqf3nFRfAfZQLmAsOJcC4OFThkJaD/C4YYUXGbgiSb/cupY0C4LE3cA==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 16:55:30 +0100
Message-Id: <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
Cc: "Abel Vesa" <abelvesa@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Fabio Estevam" <festevam@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Marek Vasut" <marek.vasut@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>
X-Mailer: aerc 0.20.1
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
In-Reply-To: <20251102170257.65491-1-marek.vasut@mailbox.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello Marek,

+Laurentiu Palcu

On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
> The DT binding for this bridge describe register offsets for the LDB,
> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

I was initially a bit skeptical because normally register offsets are
derived from the compatible string, not from device tree. But then I
realized this is about the LDB which has its two registers in the
MEDIA_BLK. This means all in all this looks somewhat like an integration
aspect (the LDB component uses two resources of the MEDIA_CLK component)
and your patch mekse sense.

So my only remark is that the above may be in the commit message, to make
the "why" clear from the beginning. It took a bit of research for me to
find out.

Laurentiu's patch adding i.MX94 support will conflict with this
one. Whichever gets applied after the other will have to be adapted
accordingly.

[0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76fcec=
fda919@oss.nxp.com/

> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pde=
v)
>  	fsl_ldb->dev =3D &pdev->dev;
>  	fsl_ldb->bridge.of_node =3D dev->of_node;
>
> +	/* No "reg-names" property likely means single-register LDB */

Uh? If it is "likely" it means we are not sure this code is not introducing
regressions, and that would be bad.

> +	idx =3D of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0) {
> +		fsl_ldb->single_ctrl_reg =3D true;
> +		idx =3D 0;
> +	}

From the bindings I understand that having two 'reg' values and no
'reg-names' at all is legal. Your patch implies differently. Who's right
here?

> +	ret =3D of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NUL=
L);
> +	if (ret)
> +		return ret;
> +
> +	if (!fsl_ldb->single_ctrl_reg) {
> +		idx =3D of_property_match_string(dev->of_node, "reg-names", "lvds");
> +		if (idx < 0)
> +			return idx;
> +
> +		ret =3D of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, N=
ULL);
> +		if (ret)
> +			return ret;
> +	}
> +

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
