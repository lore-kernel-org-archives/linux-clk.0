Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E741F77B8
	for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.8.165.127
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731583268; cv=none; b=Q1ewYmluOG1SN2VSZpkJyuod5I38tKYdByKzG+TIrAbG+fiTnFlqtH1a6uADIFAWsB/ywKpNFuG6HuNgiwNgsRNe1T++Qe4bduj5S3CJXc6BrvYEPr/5c9usgeh6cuotue8dmMnhHd1lxh2YE1IOXoGApfBVPJENfJpUaxWeG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731583268; c=relaxed/simple;
	bh=AVZNQAlU7+ZpAb7hQ/Q+oevBEVygnQyFV6H/sTq2pbQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AVmpg1dZyiFohOzFZ41xOLp4HaHR0/MjlHrygXIa4aXxFmDT11/O0Xs2ZV7Rqer59LWca298OkVpiMLC3aCJqCP5c5reVQGTYzhwYlhFcseB9bycYWtPB4d7RYn0mNUswNeWVJUsCGGAS3SGZySm4+shQLOqgvLO6qi9wbFJQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org; spf=pass smtp.mailfrom=cutebit.org; dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b=L6On/y7y; arc=none smtp.client-ip=185.8.165.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b="L6On/y7y"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1731582876; bh=AVZNQAlU7+ZpAb7hQ/Q+oevBEVygnQyFV6H/sTq2pbQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=L6On/y7yfj0le00M9cmM7nVAN9LOBwYp1ICAEYj4z0NO6oESXKUJB5dY2ucnBFbH8
	 5FMpWiht3uVgpoulm5F5cLXXjDmqJnbLEydwu08+eUjVxauovHAv6ycDbhWj2Ko2ih
	 tHSev2EyHI5XbCIZW0HztCK02YDB2XkIPh6ay3cY=
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20241114072820.3071-1-hanchunchao@inspur.com>
Date: Thu, 14 Nov 2024 12:14:24 +0100
Cc: marcan@marcan.st,
 sven@svenpeter.dev,
 alyssa@rosenzweig.io,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <96592A7F-0E4A-446F-A88F-4C7E2F8F3A14@cutebit.org>
References: <20241114072820.3071-1-hanchunchao@inspur.com>
To: Charles Han <hanchunchao@inspur.com>

Thanks.

Reviewed-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Martin

> On 14. 11. 2024, at 8:28, Charles Han <hanchunchao@inspur.com> wrote:
>=20
> Add NULL check in applnco_probe, to handle kernel NULL pointer
> dereference error.
>=20
> Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
> drivers/clk/clk-apple-nco.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
> index 39472a51530a..457a48d48941 100644
> --- a/drivers/clk/clk-apple-nco.c
> +++ b/drivers/clk/clk-apple-nco.c
> @@ -297,6 +297,9 @@ static int applnco_probe(struct platform_device =
*pdev)
> memset(&init, 0, sizeof(init));
> init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> "%s-%d", np->name, i);
> + if (!init.name)
> + return -ENOMEM;
> +
> init.ops =3D &applnco_ops;
> init.parent_data =3D &pdata;
> init.num_parents =3D 1;
> --=20
> 2.31.1
>=20
>=20

