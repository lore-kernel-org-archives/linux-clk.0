Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F310A3E;
	Sun, 23 Feb 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740295993; cv=none; b=ExW1eNWDEgzUtjNYyOrHePkaCPHea8KXaokXbtpwpunhpXJa0EG9SI76OZQmsQcQb3D2iTP3iAb+dW0/4zEee+9mzo7mcXLco28ad7vc0YZ6PJObIWkU07cfFKGhBZeMPxbM1tQjaFzH1VQAnv0GGIDZdCek809x+AIDPuOocoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740295993; c=relaxed/simple;
	bh=1gXqHCBmzrV6qJi9c62MJx1/sCdNPW3bPDUKp+sdMHE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=i6P5vmOyzK4Et/VGHzmO+DmM/PlpAq7BgwREL3ZPSwbe0kzpUrIQJ9mBioy4Gu21LEvtTvCV1WFbtCK6MZyANAb69pvqPKaGE7uHvqLKk5zjfmr1XM1g7r181GtBMk6EtoV5rweoA8pok3g/erCaAyu4dcM7rdnP58Qe5ZbBlBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=B85Pk0aH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OOkWfm1q; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="B85Pk0aH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OOkWfm1q"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id 02074138098D;
	Sun, 23 Feb 2025 02:33:10 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sun, 23 Feb 2025 02:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740295989; x=1740382389; bh=YO/cwSARohYD9TXD0q8IqQzlCY/DK1dj
	Np+I0Bb/gO0=; b=B85Pk0aHwQOrsXRWLCJZbxiYDDxHSLrrHPt3K81mN79wkUP/
	Tsw9D8bX4J6WRPjHYjWFlT80ErJ8ITWr3JGVF/JGjS9lvhFLOowTpY3XbbNdSeIZ
	JVxL68NfTI8aKGboE+XqXsGmDl5YrWGKYuwP/K4jX/l3Z+RCRXdEGqpmhlh6Htj9
	jlN6sBZymlaE0D/DwHoysrKtOK2gqaOsM2xgnq6RSdZbla07qWS5uOYEIhH5XQqq
	cRe9aDkRCKJIZ1k81gJal7gWFXaJcPk7d6OHzYWADxOwOuXs9240xLhaz18ZoJtp
	yZ7xxbYOcmluZZwdVJZM5k3PxN0/iqy3wxD1hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740295989; x=
	1740382389; bh=YO/cwSARohYD9TXD0q8IqQzlCY/DK1djNp+I0Bb/gO0=; b=O
	OkWfm1qlADVUEjPOFggO5OUEZznUfHAn/OLo62JPh4oIaW+0g/vtuCVP1jQ9NL0f
	rcBn0tg5BbvZ5OkC47NPux3WJxOjuBx3lQVgAQT65e1D8l2pxGYLVSTGRLSVA5So
	DfIEf7TO0kwz8Hfsznch7YMDCjU3y4xA3GlByicglwNR9ht+5Y/CxSK8LwjFo1UW
	RYXhgSAtfDNC1+a88NJ6qj4pdSvIhDq6L1YF3WtKqphi7PtrRaTjrn4hxspRWIYs
	3yR9TWLQz6M1LmZFrkGbSqYPDI7scGrG2An6m0/OfTiHjxSZbLimjxIo3hj+3K24
	A127Uh6twNK0BHjdTlh4w==
X-ME-Sender: <xms:M8-6ZwmoqYi-W5Hxur5QDvuQq0s_erowB2HeyAaVrp1GUDCCdtDecA>
    <xme:M8-6Z_29dpt6xcy_txOx_KluiqsGOlOKINywf7KfHvZBGMt4zwA-FbJhr6Rlgu5AT
    s4LjI1FKPmDoxHgAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejhedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdr
    tghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:M8-6Z-qK3GJbOo2HrUtH1j6D8XhiVwoxyw9w5myfgVA9wMaBYp1b3A>
    <xmx:M8-6Z8nNUH3qZgdhVG4Sm377YpZEAIa-COENbbGPbz_dG2ITaWtgIw>
    <xmx:M8-6Z-342TNHw5ogjc7HuId_9-cE4ZAHRIXc1iShDeMDv9f185zfpw>
    <xmx:M8-6ZzuH1moPiT5amhZSr5tbvDlnsNtQ7zqa6ymFMKXI68WwhVUtIA>
    <xmx:Nc-6Z8l66FRADge18OgwVJ22ICJV6mgdyL1w-dxVaoKS7Qe7xa9EUVkV>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 76A89BA006F; Sun, 23 Feb 2025 02:33:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 20:32:46 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-Id: <90ecf54e-cd2d-4cf7-96f0-d93448111a7c@app.fastmail.com>
In-Reply-To: <15402414.tv2OnDr8pf@jernej-laptop>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-25-ryan@testtoast.com>
 <15402414.tv2OnDr8pf@jernej-laptop>
Subject: Re: [PATCH v7 24/27] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33)
 support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, 23 Feb 2025, at 8:15 PM, Jernej =C5=A0krabec wrote:

>> +	if (mixer->cfg->de_type =3D=3D sun8i_mixer_de33)
>> +		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_DBUFF,
>> +			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
>
> This was my mistake. There is no such thing as=20
> SUN50I_MIXER_GLOBAL_DBUFF in DE33
> anymore. Values are generally applied at vblank time (I think). Above=20
> write actually
> writes to RCQ register, which is not great. Just drop this code and fi=
x=20
> condition to !=3D.

Ah yes, good spotting.

>> +static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg =3D {
>> +	.ccsc		=3D CCSC_MIXER0_LAYOUT,
>> +	.de_type	=3D sun8i_mixer_de33,
>> +	.has_formatter	=3D 1,
>> +	.mod_rate	=3D 600000000,
>> +	.scaler_mask	=3D 0xf,
>> +	.scanline_yuv	=3D 4096,
>> +	.ui_num		=3D 3,
>> +	.vi_num		=3D 1,
>> +	.map		=3D {0, 6, 7, 8},
>> +};
>> +
>>  static const struct of_device_id sun8i_mixer_of_table[] =3D {
>>  	{
>>  		.compatible =3D "allwinner,sun8i-a83t-de2-mixer-0",
>> @@ -832,6 +907,10 @@ static const struct of_device_id sun8i_mixer_of_=
table[] =3D {
>>  		.compatible =3D "allwinner,sun50i-h6-de3-mixer-0",
>>  		.data =3D &sun50i_h6_mixer0_cfg,
>>  	},
>> +	{
>> +		.compatible =3D "allwinner,sun50i-h616-de33-mixer-0",
>> +		.data =3D &sun50i_h616_mixer0_cfg,
>> +	},
>
> This should go to separate patch, adding feature (DE33) and adding cor=
e support
> are two distinct things.

Thanks, will split those out.=20

Regards,

Ryan
