Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712D20B22
	for <linux-clk@vger.kernel.org>; Sat, 23 Aug 2025 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755914734; cv=none; b=IQgsEaPZkjquO6W/MXESzJi15myCpjW+RNpR9vj/joXxayrTWLkmqUXk6P2UMCbqqPsJGhWhi+nZWRMqeJhvyzATDxe1hHudEog7vcdjJoxsLouqdv/CB5vZa4c8lWx+yWS0p8jV4knD0MXUxJKIhfLaGQp89ndKTRFDpiwEd0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755914734; c=relaxed/simple;
	bh=2RyIzjXm7b9+cnzeMC18DAd1kJ8HkUkKDXL9CCakxGY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=PgINuSXcZnJ5FvvBj9Jgm9Ebbe5ZFDbEt4T2lqEEj49GR5hHQN5h49tBmI+xqwzaoMth/0hcYSXEHZnUsZFwzoBdkQz0nHcpu+4pMwjEG9iS8LExfLMLRhA6E75gcOD7y7nPO3kMi+uXo+cnaX19sotjsIT/p8Rc6Ba8DNZHpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c1Sv7Cnj; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c1Sv7Cnj"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823020530epoutp04a5f817ab8e5d373fffbe0fd0489d4657~eQyTbUa470121001210epoutp04K
	for <linux-clk@vger.kernel.org>; Sat, 23 Aug 2025 02:05:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823020530epoutp04a5f817ab8e5d373fffbe0fd0489d4657~eQyTbUa470121001210epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755914730;
	bh=qbnO/+sq+8ONZt0KTeFBgfHeWWE3a0C0n2e4rSAYFr8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=c1Sv7CnjQKX7XbuXu5Cv9J8czEpU4yZeeYXHw40EN0Eu5XvdvZSojdD3I4dYt3+Zu
	 cSlUyM76qwQrRTwr4iwftmmQ+bb+Lk/DmUxhy5yqgFGLAQR4h5ZA9GzF48v7smFb86
	 qOu6NeKL3Tb0MYeg1v+vlLUwJQYDjzTCjCwczAP0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823020529epcas5p46c5400dbc26564b90f4d6ffdf82d1e66~eQySihPyI0145101451epcas5p4H;
	Sat, 23 Aug 2025 02:05:29 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c80kw2NSbz6B9m7; Sat, 23 Aug
	2025 02:05:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8~eQyQxE8K70145101451epcas5p4E;
	Sat, 23 Aug 2025 02:05:27 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823020523epsmtip1c66b58ee1eac02d62d96b211baa19c19~eQyNFvkoL1748917489epsmtip1s;
	Sat, 23 Aug 2025 02:05:23 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>
Subject: RE: [PATCH v2 11/12] arm64: defconfig: Enable FSD CSIS DMA driver
Date: Sat, 23 Aug 2025 07:35:22 +0530
Message-ID: <00d401dc13d2$65033080$2f099180$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQHrKQRZAj9O8PIBXjI9/7KIHEcQ
Content-Language: en-in
X-CMS-MailID: 20250823020527epcas5p42973efe25536c7b5da0beb16e98e2cd8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141057epcas5p21ca33641e42164886dc1bf404237876d
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141057epcas5p21ca33641e42164886dc1bf404237876d@epcas5p2.samsung.com>
	<20250814140943.22531-12-inbaraj.e@samsung.com>
	<1b37bc94-8f2b-4da3-be2e-4d0076672169@kernel.org>

Hi Krzysztof,

Thanks for the review.

> 
> Tesla FSD
> 
> You are changing defconfig for all platforms, it's not your personal or
> company defconfig.

I noticed that Exynos and NXP driver configs are added in the defconfig.
Could you please clarify why I shouldn't add my driver config in defconfig?

> 
> 

Regards,
Inbaraj E

