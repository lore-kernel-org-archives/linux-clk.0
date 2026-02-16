Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EDC1DE2AD;
	Mon, 16 Feb 2026 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241603; cv=none; b=EmvcTXhzCNMr+WfCTijUlRrXqZEn7Vo/xdbuvhATlbVBj54dvsNyH9wQkMPfDnqYP1wCIXLRLe7oMUTJF7PBt5CZEG/5ggnDqalze0sOEf57cRpcwrtgV/eUmRXwtfPKb7RRlGxs3xgcGyEEQ0k0otb269xN1leL7GACQOzIAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241603; c=relaxed/simple;
	bh=XfM+uO3B6t4V13J7WywM7ZB+hvwWMnXflkL5iW+xmD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eK08oP/lHribXby3a9zJaKoz5Ml/eM+NCzqHgxc7FjdjHxjM/tr2sylgliLOt2yoTlXD318r1fkSuDw8PdacjcCqmfJnNWYAjB1mQM/ysZSl9nHQa3NlqTj7SxWtt47ADnqF+ItyjF+l5xkpROxhBkYF1BewerB7LABMxiZ6tIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hlt37SUD; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hlt37SUD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E0410DFC3;
	Mon, 16 Feb 2026 12:33:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1771241599;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qoEb1XR+DvoKvuE1+8lQvknx+Q7A1egR2GoxJ6whEys=;
	b=hlt37SUDAjJI7q8KMVJO+g+KffWs5ok/uj1DyhEEpWVQiazm5kV0sjzPaHL/0L1eVUx1NZ
	M0XrcR10oOLIuVo7IDaZ6zfhzeSmUt+go0Wv9+KhksA7Dj1bHKri37q1ApbGrEaT1pxCbr
	do2rMtqJRY6yNzHjITgpVoDPZvvqcKOTIKt0+VfWgpyDVI+usLCBGhBZsJhggYLLIcx2HK
	rX1r4G+z/lF2UcrLsjOTy7IHUZCW4Q+V2DMV3d0S/LJsKVZ5C4cSiRhfA7wkyR8i0Bdn3S
	uPlAme14G7Ro/jMb45unQbCXuQSe6CbMqoJcmHex1tkVmmCZQQApZtz7Ox6Umw==
Date: Mon, 16 Feb 2026 12:33:12 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <20260216123312.4a310b39@wsk>
In-Reply-To: <jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
References: <20260129095442.1646748-1-lukma@nabladev.com>
	<aYAEM8pcuumly+hc@shlinux89>
	<20260216101538.0aeae484@wsk>
	<jk6roonftm44qwnyxezhukdoqahrj2l7zaa55w35oq3uj4en4w@obfufdazx3wb>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Abel,

> On 26-02-16 10:15:38, =C5=81ukasz Majewski wrote:
> > Dear all,
> >  =20
> > > On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote: =20
> > > >This patch series:
> > > >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> > > >  to driver code
> > > >- introduces support for several clocks required by MTIP switch
> > > >IP block
> > > >
> > > >Lukasz Majewski (4):
> > > >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> > > >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> > > >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> > > >  clk: vf610: Add support for the Ethernet switch clocks   =20
> > >=20
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com> =20
> >=20
> > Gentle ping regarding this patch set... =20
>=20
> Will apply after rc1.

Thanks :-)

--=20
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
