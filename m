Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0236CE1C
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782791613; cv=none; b=ArmMTVFEQHxk1MSWzr/lQvwbTg7DxIPxeKeD57fw/nEiG6qrKizzrG2Xzk3whxabmBofJFfSf0ssTrnxK9QZGdpYoDUuiJ6Yl3OqLhcdCYluWWVuGhDpD7ukWNXtF0t1XNNcBeUOOXxHVmz3UvqSAvUfjQPIz6KvLG+J1QkaTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782791613; c=relaxed/simple;
	bh=piLhSl9xbxhGuA9PKqA38eEpjthF9cVZD+Z8+JAT6z4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=FSU61MxV5GyQPZw05x/DYPXIwNz5BI/aKHfL5Lizg8nmpO4gH6xUWjERvqBhJaZq5/oOeR1zxtnRxxhoTh6Z7xu04vR3dgo8mISX04bUX0ti1je0PGyIZTAJJcSg8fuEaZj6doDagpVD4/P6mn8H0rlWZbQ7IDJ/PbGEVcVh0VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bW7CwIwV; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bW7CwIwV"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260630035329epoutp04c372fa9673996e9e1d057ad740705516~9v4Xf5MBY1659316593epoutp04Q
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 03:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260630035329epoutp04c372fa9673996e9e1d057ad740705516~9v4Xf5MBY1659316593epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782791609;
	bh=piLhSl9xbxhGuA9PKqA38eEpjthF9cVZD+Z8+JAT6z4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bW7CwIwVa6VqDmtwk5H12vzp18ProctCyU2cjzm4CglhYIehHv81hTMXrFT1gUw8J
	 1CrSlEaNwokfpJl5lZoHy9e2NydaoSeJTOFoWhv251dorMkD/KyjylGV2+tdnb2VnX
	 BYdJ9hho2PBoAvJNqiERdwLhuMFcOLnqgF1aSp8g=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260630035328epcas5p20b91cf93730893d57a8304742eb23b88~9v4Waurrl0440104401epcas5p28;
	Tue, 30 Jun 2026 03:53:28 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gq8Pz0H02z6B9m7; Tue, 30 Jun
	2026 03:53:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260630035326epcas5p232c12f841f9ed8fa8fe81e8aa7eb45bb~9v4U1d5RT0440104401epcas5p20;
	Tue, 30 Jun 2026 03:53:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260630035324epsmtip178af641e049abbee3867634497dbd7e8~9v4SqM4BV2049720497epsmtip1_;
	Tue, 30 Jun 2026 03:53:23 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Denzeel Oliva'"
	<wachiturroxd150@gmail.com>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Sylwester Nawrocki'"
	<s.nawrocki@samsung.com>, "'Chanwoo Choi'" <cw00.choi@samsung.com>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian Masney'" <bmasney@redhat.com>, "'Rob	Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: RE: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
Date: Tue, 30 Jun 2026 09:23:21 +0530
Message-ID: <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEx4sfAWwy4gnk+MuXqAo8FFpNhngGTah19AjUYwH4DLBf1wbd1Fhhg
Content-Language: en-us
X-CMS-MailID: 20260630035326epcas5p232c12f841f9ed8fa8fe81e8aa7eb45bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
	<20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
	<CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
	<CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Monday, June 29, 2026 6:02 PM
> To: Denzeel Oliva <wachiturroxd150=40gmail.com>
> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Alim Akhtar <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; linux-samsung-soc=40vger.kernel.org; linu=
x-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v3 3/3=5D clk: samsung: exynos990: Fix PERIS gate c=
lock
> parents
>=20
> Hi Krysztof & Denzeel,
>=20
> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150=40gmail.com>
> wrote:
> >
> > Correct eight PERIS gate clock parents to match the hardware clock
> > tree and reorder the GIC mux parents so mout_peris_bus_user is the
> > default source.
> >
> > Signed-off-by: Denzeel Oliva <wachiturroxd150=40gmail.com>
> > ---
>=20
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
>=20
> =40Krysztof: I was thinking, maybe we should establish a new rule/best
> practice for Samsung clock upstream submissions whereby patch
> contributors should link to the downstream cal-if code for the SoC after =
the --
> - line. That would make reviewing the patches' correctness a bit easier, =
as the
> downstream cal-if code would be readily available to the reviewer.
>=20
We can leave this choice to the reviewer if they want to refer to downstrea=
m cal-if code.

Regards
Alim

> regards,
>=20
> Peter
>=20

