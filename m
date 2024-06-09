Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75386139;
	Sun,  9 Jun 2024 03:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717903230; cv=none; b=gLfuyXr2vF1UjQk1wWszXgP1NdcIDmt6TFLy19yE//ZRy1tbdgwNXjetP0gMeWDkkpv55v5VtgKL6SWGYDiNwBV6SPErpa7VMSAh7kcfkEGqvlBItixBYO8A2dUq22PkGrOs0l1XrLfaYj8oXfSfPq5xKX0OdqJHos6t1loARZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717903230; c=relaxed/simple;
	bh=Le9WBgmA0YpV/A0GmNkYA2wHA97wE3nPFDySMUZ0UuA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=SDvxpnDbGFTNznHlIGyJ+9x3WjkA+wz7BTLah7oyCu4MvCfgaxASvnQf/E1pBewMJquKmzaU7EGD45O4SN56EW3gmZYiejtiwv3GSLo2PwDRG2Ya0b9X1xiUtawpgaM2HOERW7Xz5WYulf5utXIEN9YwnCGc0p3liE8Cm4DSG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=VD/49Dn4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ADdG47QY; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="VD/49Dn4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ADdG47QY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id CD21013800E5;
	Sat,  8 Jun 2024 23:20:26 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Sat, 08 Jun 2024 23:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717903226; x=
	1717989626; bh=gmUkjBG9eKIc8kATrXroPkry8GdBqTJDN2D9sjhCJqI=; b=V
	D/49Dn4YVDQybyngGLmUlKXdGLIaTfzeCDqPQloKq9COJUFUR8+z4KvqD7wlG/Yr
	R7u0f5NebFqKXMgBltvt7sjFmfq8z5q9fLiAr/61w7RJX5gFotBjnZ3cYAgAahK5
	wyGPF3yu6Z0cUwxZPTUJWv2CTeHQvLJL0IjFLTwxNNPY12tGhxleIrPbaG7pFVA1
	co83g3AdbrSbsqns+NqqeiaqkEpl1Q9R4UUpDKGZugNdeR2qVekTxCd3RQCFpRM5
	FeeVi/2DlsKTbma8tx1+awD6h1YE+G56gf60TpfEro5yIB41wX1+07PujagGut4r
	jnRucC2o6Dafdun9zrIjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717903226; x=1717989626; bh=gmUkjBG9eKIc8kATrXroPkry8GdB
	qTJDN2D9sjhCJqI=; b=ADdG47QYsC8/N7wDVHfbHOWsfIb68Ow9km7WaQpO+zgD
	hyZLJUXMKiaEIEf3LD7nnqSVo4Nzwyg8KPhlqsNQ2ov9zpCtTZ0NiYnEXUpHivL+
	Apjj4rfJVrnf4a5mZ29P0V4XBDndP/DK1RFSgV9mxaXqn1OjpQMDgEv5aDO6MDgA
	xq3sVQRhIeEDq3OaTA+axIoldmuVdCxFqqPy1a+ltnaCFrXDSn6MyCKsQqjhQYsJ
	ZiZtSoz8vnfzFtTsnv83B5EOE+Mp+QwzzMZLkNz0NCvSHT6Jjf37DyJ8oXyxQbAW
	8qPjviDytAK5tyEN4AayyX6gaSjYYqn5SIzIzp6BBw==
X-ME-Sender: <xms:eR9lZqsdHfxQ5RxzoH0mm-D2kaixrg3VGeslTWp-PXsXdlDz3BqlIA>
    <xme:eR9lZvdfp2xXrNRpmNLcOBO9eX1FkSPaPeOcmgAgUsU5TqKSbu3q6Gluf9uhjc55u
    CDM8a4eAcPgrRJKFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedthedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
    rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
    ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
    ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:eR9lZlwekETTJ6ICLO-9RPdoB-lOcanPHbzsQJZL1CP4drSFEx_WOg>
    <xmx:eR9lZlMBV7YIUUDnUHxkRDj7u8ekjaGfhY_tC_3ETeZ8C_7GX3InjQ>
    <xmx:eR9lZq_mAz18BLGtc3y_4wUcfy6V8AcvFOmp4Pkw8NrkgKXyYFdWlA>
    <xmx:eR9lZtUOJWg9WVYK8H5cUactdBN22XoOBU_CH2EY-Igmt-yHaa8H2w>
    <xmx:eh9lZglttGZrqC_j6eB2uq5IXUoWgo3DsW-05hE1oeYqFayWKzM6D3xz>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4A703A60078; Sat,  8 Jun 2024 23:20:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e9e7a362-c41e-41f8-b6cd-02fbbd16ce8c@app.fastmail.com>
In-Reply-To: <20240607-gag-radiantly-37bc3ac76907@spud>
References: <20240607110227.49848-1-ryan@testtoast.com>
 <20240607110227.49848-2-ryan@testtoast.com>
 <20240607-gag-radiantly-37bc3ac76907@spud>
Date: Sun, 09 Jun 2024 15:19:55 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>, "John Watts" <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] dt-bindings: bus: allwinner: add H616 DE33 bindings
Content-Type: text/plain

On Sat, 8 Jun 2024, at 2:23 AM, Conor Dooley wrote:

Thanks for the review!

>> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
>> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
>> @@ -25,6 +25,7 @@ properties:
>>        - const: allwinner,sun50i-a64-de2
>>        - items:
>>            - const: allwinner,sun50i-h6-de3
>> +          - const: allwinner,sun50i-h616-de33
>>            - const: allwinner,sun50i-a64-de2
>
> This does not do what you think it does!
> It needs to be
> items:
>   - enum:
>       - h6
>       - h616
>   - const: a64
>
Thanks, will correct in v2.

>> +      - const: allwinner,sun50i-h616-de33-clk
>
> I think this is not right, as a corresponding driver change is missing.
> Either you're missing a clock driver patch or you didn't test your dts.

The clock driver patch with this compatible string is in patch 8/8.

>>        - allwinner,sun50i-h6-de3-mixer-0
>> +      - allwinner,sun50i-h616-de33-mixer-0
>
> Your commit message should mention why a fallback is not suitable here.

Will do, thanks.
>
> Thanks,
> Conor.
>

Regards,

Ryan
