Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7E45561F;
	Fri, 11 Sep 2026 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128635; cv=none; b=fstEr5yGXDC1kPSoikCAUPCgAJAGKLa4kVm/jgp9CI4qwJYOSaAqzBKL1gZx8zOQ4ZEFEYjbM+J1dODo7g4JNVNKrf2grztVyEzJ2uXb17PqS8iMLyu8Luqo/3db/YfeSH3Ov1nJAggK+e6bIOAy3cRR35ZlAWgoTEoQDqoAYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128635; c=relaxed/simple;
	bh=5W2posNnGBlLZmUaLH8hHgyDf+sWP+I78u0ehzeEhAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZXdCQJ7/QTAaAHhz/zrjaQd3Mll1prfdM/gDCIfLmgV0UW9/eB13utFjLhENw90Fx48JcQYYATRZvlLuli2tj7BtK59dg0Fd9MoNHyvvJPGVuohmryXCyLwaK2dT2c54Q+npC1XbzTJFCvGixfgprv69kOU6QVbNGudEYijvgHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o7cork8S; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o7cork8S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0078B1A01B0;
	Fri, 11 Sep 2026 12:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C800B601DE;
	Fri, 11 Sep 2026 12:10:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB6711C7AFA8;
	Fri, 11 Sep 2026 14:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789128625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DIhn8f/72jmJWSW/HlYmRI0afu98yrdkvSOKUdC9cFk=;
	b=o7cork8SNcBl95XwVojp7pcvk2ewbuVvTrBrUujxKCrvq8h4hryHI368+KXX7TUUtq2l1F
	lKc2U0+Yr8WxqhkeH0kNz9LKXAQdm0/GzzO2snvv7tLghznWYjVN5oCEDEPqkqBjuSv3J5
	niptgDLze+eDhhyV39vdvqrMcrXFuVedY7+mP9J8MC1MITYo0ppmT2VGQcWXcYjZNMMk5D
	hnt7WglE3ave4PcZy3k/Uo0LjA4glf+zVVu2Vi1gze4FSgC7IDt/jRKnSZMYt5Njtd77if
	Ee5bJgk8pBkrGQV22doXZ1vY1fkwfHeqzx4j/6hF2llRTKS96D4njmWKUYlMYQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:10:22 +0200
Message-Id: <DLCH5YITTX2H.2ZSGAKJ5WFCR6@bootlin.com>
Subject: Re: [PATCH] clk: eyeq: Use devm_platform_ioremap_resource()
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, <linux-mips@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
In-Reply-To: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Beno=C3=AEt,

On Fri Sep 11, 2026 at 1:48 PM CEST, Beno=C3=AEt Monin wrote:
> Convert eqc_probe() from the open-coded platform_get_resource() +
> ioremap() sequence to devm_platform_ioremap_resource(). Besides less
> code, this requests the memory region so the OLB registers are properly
> reserved in the iomem_resource tree.
>
> Move devm_platform_ioremap_resource() before checking for device match
> data, so OLBs bound without match data also get their memory region
> mapped and reserved.
>
> Add an entry for mobileye,eyeq6h-central-olb without match data: its
> clocks are all registered by the early init and it has no auxiliary
> devices, so probe() now reserves its region and stops there.
>
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-eyeq.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index cf37feccc734..bb680283b6f2 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
> @@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
>  	const struct eqc_match_data *data;
>  	struct clk_hw_onecell_data *cells;
>  	unsigned int i, clk_count;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
> =20
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
>  	data =3D device_get_match_data(dev);
>  	if (!data)
> -		return 0; /* No clocks nor auxdevs, we are done. */
> -
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	base =3D ioremap(res->start, resource_size(res));
> -	if (!base)
> -		return -ENOMEM;
> +		return 0; /* Early only clocks, stop here but keep resource reserved *=
/

Technically it is "early only clocks OR auxdevs", as is seen in.
Not that it matters much.

static const struct eqc_match_data eqc_eyeq6h_west_match_data =3D {
   .reset_auxdev_name =3D "reset_west",
};

> =20
>  	/* Init optional auxiliary devices. */
>  	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
> @@ -1175,6 +1170,7 @@ static const struct of_device_id eqc_match_table[] =
=3D {
>  	{ .compatible =3D "mobileye,eyeq5-olb", .data =3D &eqc_eyeq5_match_data=
 },
>  	{ .compatible =3D "mobileye,eyeq6l-olb", .data =3D &eqc_eyeq6l_match_da=
ta },
>  	{ .compatible =3D "mobileye,eyeq6lplus-olb", .data =3D &eqc_eyeq6lplus_=
match_data },
> +	{ .compatible =3D "mobileye,eyeq6h-central-olb" /* no data, early only =
*/ },
>  	{ .compatible =3D "mobileye,eyeq6h-west-olb", .data =3D &eqc_eyeq6h_wes=
t_match_data },
>  	{ .compatible =3D "mobileye,eyeq6h-east-olb", .data =3D &eqc_eyeq6h_eas=
t_match_data },
>  	{ .compatible =3D "mobileye,eyeq6h-south-olb", .data =3D &eqc_eyeq6h_so=
uth_match_data },

I can confirm this is the way to go! The open-coded
platform_get_resource() + ioremap() sequence is heritage from how the
series used to look during its first revisions.

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

