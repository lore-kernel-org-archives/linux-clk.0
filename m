Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8BD1D6DB9;
	Sat, 22 Feb 2025 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740266816; cv=none; b=DwsEJv9Uzq0Er1NLKxlBv8vGahoTQ8MQBR6yaK4Om6D7dTrh+XBsS4gMzJETgnd/Zs11yiLsBltS38QSUKF/NDHZX+GjkR/64etSwiRkO1iv4UHA5vhIk49wJmqRtA8O/vEo5bqbN/OggjVW1Fyqv74IBxSDczdSbl8Y/2U2Zo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740266816; c=relaxed/simple;
	bh=mDgOKJm5asYlG0UTXQh0eQj73mpjq3Z3D6VUArTpLus=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h1s1EGzdWpWlcdGZ/W7J3btVDNNqNSgvjP+FI7cWKAglk4aRNX1UG92W8o9kBBwf17a94KDqfZziTFdANZda3Dc25flsxTi5ycICZdBARtIdpNIhhUVjStlxBpxe1hMzBK+J3o/Aa7mlTGDXyPVtDbWLuuanO/Pzt7yxhbqsxvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=mSJuPdiL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=4G+8CdjT; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="mSJuPdiL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="4G+8CdjT"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 251401140108;
	Sat, 22 Feb 2025 18:26:53 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740266813; x=1740353213; bh=mDgOKJm5asYlG0UTXQh0eQj73mpjq3Z3
	D6VUArTpLus=; b=mSJuPdiLMVqlhvPFVqPxUarc1xh36WEBNJDEF0aOhocCy4X8
	7Zam/qV9r7iQsEtm94KwL96SJNjy5GumusBLbD7Yvh9eAJlyFGpR9dx/zRoFST7I
	0P5F5dC3cRzKezjG3/sANWWQAbOHqcUvuhV7X0dN67Trv+g59tHTwNrBXQIthONB
	FnzVs5jXUs62sRbRHUDbe0Nh7ahDV/hDQdMAbieSWfTa5k8HC04s2ejqp4Arf8mf
	4CV9xd2cA8D7nw36UaqhKjZ+Q22i5UPqHRreWpnTfZA9zUz5LCB8Kq4hrju2saeO
	JGuCb8wHOgfJxl9msq2yQ1Toz2+ZzQ7Kbc63Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740266813; x=
	1740353213; bh=mDgOKJm5asYlG0UTXQh0eQj73mpjq3Z3D6VUArTpLus=; b=4
	G+8CdjTB47JYOAtauLKYh5Enm2dhLuCzVbd2vZXL8ZSvLmzbUesoZ4ycl9dnPU8e
	8qFfhQ/SspMTqkXxk0r6daKBw+dh3+P+dxGGgVwPqHPjPF9e6Sjm2ohncLe3i+XG
	rx5o2/wBVwn1ARnbA90wC4heaPjXHE93gDtF6ipyAYYJnKmIW+CB8u80iQCMdFK0
	q9FJvERPOZdfAn3gh8cPxvXDA5xbHUbL41gN6laIQnmCXerO4GLSk8H+f+UGIQvC
	Zp7AZUH212xoQlPjvJjAiz1oCY7bqs/l6YP77qL6qoGPsU/jXGNKyUlvnSiIWk1h
	zLU4yLAF2TyJcQU1swtug==
X-ME-Sender: <xms:O126Z7MhVol6pbvKJR79nM5A2zx0E6En9v9vqRkZovpelyjl17K2Fg>
    <xme:O126Z19H7W7NY0J1PwMbpcdMHGkFitPIGRowE8Q1R5CNvpsQiCkW4lJFSR81VPW3d
    joINqtFXPkCqYNhmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpefftdeuveejteeluedugfffhfekhefg
    fedvgfeujeeiteeutedvgffhiefgkefhtdenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhih
    rghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopedvfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgt
    ohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprh
    gtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehf
    fhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghroh
    grlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhhsrdhphhhi
    lhhiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:O126Z6QVG45LFxjSqt-KjnsnFc7ZS8pVdHI_u2EnMuCfA5JVmcsg_Q>
    <xmx:O126Z_v6DEc-jCPyxH5nayPnym5NRDneUw9zUd_wyb3oi97XOHiMfg>
    <xmx:O126ZzcjrC9MWCreab1-EeEElnCY3YJTA1ErM9zmDcahlMw2dURd-A>
    <xmx:O126Z70EiZ257hUzdPwT4uj5TceUkDTqSIHZf3rOlVHMKnE3yQ8iHA>
    <xmx:PV26Z3MRteuWw0neHkoT6N7idaUjo2AJRhxt7mTNeXRQgzv8EoS3H7Ik>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3029BBA006F; Sat, 22 Feb 2025 18:26:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:26:17 +1300
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
Message-Id: <44980f16-4b9c-4e49-92fa-af8b2677ca31@app.fastmail.com>
In-Reply-To: <7770397.EvYhyI6sBW@jernej-laptop>
References: <20250216183524.12095-1-ryan@testtoast.com>
 <2221204.Mh6RI2rZIc@jernej-laptop>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
 <7770397.EvYhyI6sBW@jernej-laptop>
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Sat, 22 Feb 2025, at 10:28 PM, Jernej =C5=A0krabec wrote:
> Sorry, completely forgot. YUV420 HDMI code relies on my previous work,=20
> with which
> Maxime wasn't happy with:
>
> https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.sk=
rabec@gmail.com/
>
> So unless switching HDMI to bridge ops is implemented, which also=20
> brings format,
> YUV formatter and some other patches just add unused code, which isn't=20
> ideal,
> especially if we decide to rework driver before that code can be put i=
n=20
> acceptable
> state for all involved.
>
> From quick look, patches 5-13, 26 should be dropped for now. Not sure =
about 1-4.
>
> I'm fine with AFBC support going in, it's just one patch.

Makes sense, ok I will prepare a pure DE33 patch with AFBC and RGB suppo=
rt, removing the YUV code. I think the CSC changes (1-4) are good to sta=
y as it is a change that makes sense regardless and makes the YUV work a=
 bit easier.

Thanks for the other clarifications and vendor code links, will do a bit=
 of reading.

Regards,

Ryan
