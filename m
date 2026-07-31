Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2B13D567F
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 10:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492504; cv=none; b=Y2QnrMTOcPIer6P0D3TdcUr+k3sGiHShomBFOZBKVltS5SIJz/I74MKA6NYja2Y+RXlZMDGvDMBecXJE8aeXdCM/6K9SNNqvoSVeryrMezLqOmKx+P3W5r1/XwRGh5OJOhJJqh7JZA23b0z/w3yRYTv/8XfveWzVr4soySjiDhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492504; c=relaxed/simple;
	bh=c2NKW2S9iI2Ct1eGcq1wh41PlRwF66EdRpl0UNZCfHY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QoWE0ypjuiUVrpNR8sr4OaXz5onbf3SSS8bjVvoUrW54N9tYwlvOUj38AS6fDDCtGRJ3WTiPBt+YRCniMki7qrt07n5uiKeRMaxfQEyo45irxq/lPDAqcSlgP1T4QYi/K+zD3/2UKgiB4cEab9Y1mZDb/Y7yMnIfbvym/Cz+G8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=P4LhLTTi; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P4LhLTTi"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260731100809epoutp03aae595a00324df9c95e7b0de1a35f819~HV-WOiLpO0207002070epoutp03a
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 10:08:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260731100809epoutp03aae595a00324df9c95e7b0de1a35f819~HV-WOiLpO0207002070epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785492489;
	bh=10LooBlvorDPL6o6qEmmZQghJaXs6dTbeegH/Cv+CYQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=P4LhLTTi97XTT9oLmysZ+EBs0t5UcZZsH0cUhrQINBRDczwbGhGa4XSHV3xA+Hvjh
	 AekCgDNWJwD7mGW+YHA/oyH/3PYCxXSvtme5o664fycZ5dnxSrfnQto3009aYoov7I
	 ufLYFStUX1ZeUo8cybS1998rQLOUC/yUQUok1btM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260731100808epcas5p402da4c0a13bfe1989275538a97df1263~HV-VQfXdV2393523935epcas5p4e;
	Fri, 31 Jul 2026 10:08:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hBMFz36vdz6B9m8; Fri, 31 Jul
	2026 10:08:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260731100806epcas5p4e3e2518a0769b38a982e27704eab3711~HV-T3KbNh2478924789epcas5p4o;
	Fri, 31 Jul 2026 10:08:06 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260731100803epsmtip13330314e6b21ea219f26662e695a5e7c~HV-Q6oEHb2694426944epsmtip1P;
	Fri, 31 Jul 2026 10:08:03 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <peter.griffin@linaro.org>,
	<alim.akhtar@samsung.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<bmasney@redhat.com>, <robh@kernel.org>, <conor+dt@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <3ccaa869-c0cb-4708-adc6-f01f7b4412ac@kernel.org>
Subject: RE: [PATCH 06/13] clk: samsung: exynos8855: add block peris clock
 support
Date: Fri, 31 Jul 2026 15:38:01 +0530
Message-ID: <04b301dd20d4$7b047c30$710d7490$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygG4VZRiAgpYPWACoDz/R7XsV2sQ
Content-Language: en-us
X-CMS-MailID: 20260731100806epcas5p4e3e2518a0769b38a982e27704eab3711
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115305epcas5p4394f65825a0a04aa7d2bd5068507e8ca@epcas5p4.samsung.com>
	<20260728121111.2077860-7-raghav.s@samsung.com>
	<3ccaa869-c0cb-4708-adc6-f01f7b4412ac@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Tuesday, July 28, 2026 5:31 PM
> To: raghav.s <raghav.s=40samsung.com>; s.nawrocki=40samsung.com;
> cw00.choi=40samsung.com; peter.griffin=40linaro.org;
> alim.akhtar=40samsung.com; mturquette=40baylibre.com; sboyd=40kernel.org;
> bmasney=40redhat.com; robh=40kernel.org; conor+dt=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; hajun.sung=40samsung.com;
> is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH 06/13=5D clk: samsung: exynos8855: add block peris =
clock
> support
>=20
> On 28/07/2026 14:11, raghav.s wrote:
> > Register compatible and cmu_info data to support clocks.
> > CMU_PERIS, this provides clocks for PERIS
> >
> > Signed-off-by: raghav.s <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos8855.c =7C 117
> > ++++++++++++++++++++++++++-
> >  1 file changed, 114 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos8855.c
> > b/drivers/clk/samsung/clk-exynos8855.c
> > index 93528f0077a4..40745f04be0c 100644
> > --- a/drivers/clk/samsung/clk-exynos8855.c
> > +++ b/drivers/clk/samsung/clk-exynos8855.c
> > =40=40 -17,8 +17,9 =40=40
> >  =23include =22clk-exynos-arm64.h=22
> >
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> > -=23define CLKS_NR_TOP                     (FOUT_MMC_PLL_DIV2 + 1)
>=20
> You just added this line, so changing this is odd. Are your patches corre=
ctly
> split?
>=20
>=20
> Best regards,
> Krzysztof

Hi Krzysztof
We will re-check the patches' order
Thanks for your reply
Regards
Raghav

