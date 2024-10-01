Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EF1C7B6E
	for <linux-clk@vger.kernel.org>; Tue,  1 Oct 2024 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792156; cv=none; b=TsITR5KXscpdDn/vbeY9vuaMWAqR+N5VTsBXQ3pJhngR8/meL55ipiwvjmoiNO4sRgKdfce3V5sR2kq7Prf4XIgdmAxIqk+0iQLoJEcCPgLlec5MJHtLZTIdnyg0R7fn1wJ+kag3swULJh8K4qX8K9kT5GqCOT7jUwTuXNtMfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792156; c=relaxed/simple;
	bh=4crY4DMZchCUso0xHQK6QDXCoGjkbdMXg88jpoDYSPE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Is4ugwZgMEvxGVg9S14V1f4/eYSYE91OT/9MPq3391cvYBD369mMLf9kzKqNLpM+Z9/xw/uKjjMkmgZ3XE/evob7rq4Csb186kFyMqY4wdlhwcYR6nLegJayMmYhMUTOgXVMwa0v6N/7OyxgS4avxYR1sy/a96yhb+MGy82kBFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lUDJZRKw; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lUDJZRKw"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241001141547epoutp02f1f9082bf5fabc94a563034c42cec0c8~6Wc25bRz91653216532epoutp02c
	for <linux-clk@vger.kernel.org>; Tue,  1 Oct 2024 14:15:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241001141547epoutp02f1f9082bf5fabc94a563034c42cec0c8~6Wc25bRz91653216532epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727792147;
	bh=AVxicq+WMRR5pdb65xmmM8HEfEzRL5V6rdfzNtdSKTI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lUDJZRKwGABw/et8tDTIX650ZFVjNmnheDC06KQdkkHukat9q/q/lZZz5Cf70kInP
	 Gk8puiO3FHWKBNhWLDpwDov6PsNU2WgdsrNeX+L9SKkSLTEnknkTK/R8VApY/xKI8T
	 CdQgPvQlilhCQiVrH3VRp48Ja/HIMDKlRZ6+oqlk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241001141545epcas5p222f2d8ac503fd71ad2ec6f4a65f06bde~6Wc1z9o_W3068530685epcas5p2y;
	Tue,  1 Oct 2024 14:15:45 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XJ0N05h1Xz4x9Pr; Tue,  1 Oct
	2024 14:15:44 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	82.2C.08574.0140CF66; Tue,  1 Oct 2024 23:15:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20241001133011epcas5p44a364f9754b126ff3e183b3cffee7825~6V1DaRNSe1793517935epcas5p4c;
	Tue,  1 Oct 2024 13:30:11 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241001133011epsmtrp235991ff01d6451895426e365da6a0d70~6V1DZZrsK1808318083epsmtrp2h;
	Tue,  1 Oct 2024 13:30:11 +0000 (GMT)
X-AuditID: b6c32a44-93ffa7000000217e-9c-66fc041008e0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	93.51.08227.369FBF66; Tue,  1 Oct 2024 22:30:11 +0900 (KST)
Received: from FDSFTE353 (unknown [107.122.81.138]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241001133009epsmtip1484f0ed92977a7b11bac7387c2e18e08~6V1BYgXJm2457324573epsmtip1q;
	Tue,  1 Oct 2024 13:30:09 +0000 (GMT)
From: "Varada Pavani" <v.pavani@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Cc: <gost.dev@samsung.com>, <stable@vger.kernel.org>
In-Reply-To: <ec670e21-91a8-4ba9-96b0-cf641fda3179@kernel.org>
Subject: RE: [PATCH 2/2] clk: samsung: Fixes PLL locktime for PLL142XX used
 on FSD platfom
Date: Tue, 1 Oct 2024 19:00:07 +0530
Message-ID: <009501db1406$0a71c8b0$1f555a10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDvh8uU0zxgNFRzBC70X3AF+basEgIbK1n2ASqSe4IBuIpVHrQhCVEQ
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmlq4Ay580gyUr1C0ezNvGZnFo81Z2
	i+tfnrNa3Dywk8ni/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrVYtHWL+wWh9+0s1r8
	u7aRxWLBxkeMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAyBSpMyM44+mwuW8FzrooDq3YzNTC2
	cXYxcnJICJhIPFh/nL2LkYtDSGA3o8TsjT2MEM4nRokNc94xgVQJCXxjlOjcqQjTMeX+dWaI
	or2MEq+aXzBBOC8YJe5smsEGUsUmoCOx++VyVpCEiMA3Jonvi+ezgCSYgdp7p81kBrE5Bewk
	Dna1gjUIC8RIbN25HSzOIqAi8ePdFLDVvAKWEudWX2eDsAUlTs58AjVHXmL72znMECcpSPx8
	uowVxBYRcJNY8/MRVI24xNGfPWCnSggc4ZD4Ov0V0KccQI6LxN/NwRC9whKvjm9hh7ClJD6/
	28sGUZIs0f6JGyKcI3Fp9yomCNte4sCVOSwgJcwCmhLrd+lDhGUlpp5axwSxlU+i9/cTqHJe
	iR3zYGwliZ07JkDZEhJPV69hm8CoNAvJY7OQPDYLyQOzELYtYGRZxSiZWlCcm56abFpgmJda
	Do/v5PzcTYzgVKzlsoPxxvx/eocYmTgYDzFKcDArifDeO/QzTYg3JbGyKrUoP76oNCe1+BCj
	KTC0JzJLiSbnA7NBXkm8oYmlgYmZmZmJpbGZoZI47+vWuSlCAumJJanZqakFqUUwfUwcnFIN
	TKrOLcYq8a3B7z4d8o6boNNo36oseapr1btSHd7j0cHiXRqGaQ27ovM2vJw13+dGkc9y1gr/
	qJQ7MiwuD69J1n3aqXkn71pU2Re5SV82f0pV6WzRqWvpMfyembMn+Wmsvt3+RyVlOzvKN98o
	55/Ww8Mi6xC1cIoGW/LmCfn7uza/VVnpvGbSusbZenYT7u20v3MyyMT18cU0rpnHXs9b2LBv
	o2imqgvb26QDSsfelT9bJCx46UnxA6bcxwqu8Ws3H3gyzWXP0zlfY84ZPtnBvfHplIUMa8+q
	ZZdJHtt52nOptEfFlartZ5sFTB8EVCSxBRzX+3I2o8pz6fWHv1eZycXs27XN/3+O0IIAoen3
	upRYijMSDbWYi4oTAY0IsGBOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnG7yz99pBp+3als8mLeNzeLQ5q3s
	Fte/PGe1uHlgJ5PF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxaKtX9gtDr9pZ7X4
	d20ji8WCjY8YHfg83t9oZffYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJzcksSy3St0vgyjj6
	bC5bwXOuigOrdjM1MLZxdjFyckgImEhMuX+duYuRi0NIYDejxJ9nU1kgEhISO7+1MkPYwhIr
	/z1nhyh6xijxvWEqG0iCTUBHYvfL5awgCRGBJmaJw/2LmUASzAJmEm++f4Ua+5pR4uXGVrAO
	TgE7iYNdELawQJTE11mvwNaxCKhI/Hg3BayZV8BS4tzq62wQtqDEyZlPWCCGakv0PmxlhLDl
	Jba/nQN1noLEz6fLWEFsEQE3iTU/H0HVi0sc/dnDPIFReBaSUbOQjJqFZNQsJC0LGFlWMUqm
	FhTnpucWGxYY5aWW6xUn5haX5qXrJefnbmIER6WW1g7GPas+6B1iZOJgPMQowcGsJMJ779DP
	NCHelMTKqtSi/Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYdi3dx5qV
	+K3+y3/niueHe6baLOgWbBZon3/27xXLk1emnJXN/iSxW6DIJOVRXshLC20l/d2JTiabXfke
	PxXY77V7yrl/K5orMnfzCy34rbMg3/NmztrJPBOn3npSc9LR4PIn3XtqryL2vGwvWXSr59ef
	8NB6U+a9F7b/fbJStFD2ZH1KSOcLnmm/K84z9XJu8baSa/TRrDZMmb10Z8htx8u3gu/3RB7o
	YbyusCPeQXXaiXN1qaddzqjaql2+8VHvj7PXRr+4ycHLcg7XrT/nxKpavT+Cu2QG89U9W/cZ
	3Hui0jrn+cVUlbObL1T+WLvaav2RJNcvjnEiOZMmbrX1OWzGzhezUoXhxslLmkFm3EosxRmJ
	hlrMRcWJAB36TfQ5AwAA
X-CMS-MailID: 20241001133011epcas5p44a364f9754b126ff3e183b3cffee7825
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926144743epcas5p2047d01217bf90d6d52ec97c9b3094c82
References: <20240926144513.71349-1-v.pavani@samsung.com>
	<CGME20240926144743epcas5p2047d01217bf90d6d52ec97c9b3094c82@epcas5p2.samsung.com>
	<20240926144513.71349-3-v.pavani@samsung.com>
	<ec670e21-91a8-4ba9-96b0-cf641fda3179@kernel.org>



> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> Sent: 30 September 2024 16:07
> To: Varada Pavani <v.pavani@samsung.com>; aswani.reddy@samsung.com;
> pankaj.dubey@samsung.com; s.nawrocki@samsung.com;
> cw00.choi@samsung.com; alim.akhtar@samsung.com;
> mturquette@baylibre.com; sboyd@kernel.org; linux-samsung-
> soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: gost.dev@samsung.com; stable@vger.kernel.org
> Subject: Re: [PATCH 2/2] clk: samsung: Fixes PLL locktime for PLL142XX used
> on FSD platfom
> 
> On 26/09/2024 16:45, Varada Pavani wrote:
> > Add PLL locktime for PLL142XX controller.
> 
> You marked it as fixes. Please describe the observable bug and its impact.
> See submitting patches and stable kernel rules.
> 

We marked it fixes because there is a software bug.  Both PLL142XX and
PLL35XX have same configurations with only change in locktime period
which is 150*PDIV . Hence updated locktime as per the defined spec.
Will update this information in the commit message and push V2 version.

Regards,
Varada Pavani

> >
> > Fixes: 4f346005aaed ("clk: samsung: fsd: Add initial clock support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Varada Pavani <v.pavani@samsung.com>
> > ---
> Best regards,
> Krzysztof


