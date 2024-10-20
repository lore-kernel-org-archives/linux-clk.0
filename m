Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5531863F;
	Sun, 20 Oct 2024 06:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729407526; cv=none; b=XJoldT79KbbKmlOwf75H7zQ8fckiX+ezotvxS+0nZqxEIQk1ycZSaWaPMcH6rOGBL2s0R6FzI5jsv22QbMT9uerQhflN36cuLUznxhQGeMCwfyjINm9B3njjTtclhPqSyxayvxTDud68xOXloriS+AfU/leDcuIvjczayCZCc7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729407526; c=relaxed/simple;
	bh=e1jC3kCGXVFP6yG/A2EMJ/CcUeTkg2TnLCsRm0JlL64=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Tf+iLpPNENWpqLdJ4wTWGXaqm2GLhxH2rMGk+fVazX25i8XLSBROAyEnS1MVNe9/w/Z5nPjcpRredic3oAOHaI1I3KqLe9xSqseD7RJDnXkLeZ0ZLcf6EmM+ovsIlBgkuvXCDuMWc77/4upxEyJUinxIfsSXdJjPZh1w89Eo1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=ECMtwnWg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=diRpU7Jx; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="ECMtwnWg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="diRpU7Jx"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E92FB1140133;
	Sun, 20 Oct 2024 02:58:42 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 20 Oct 2024 02:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1729407522; x=1729493922; bh=Vxb29ne06TRdRyHH/Q3LilEsLkVyQZbu
	sIsSDPpBR/E=; b=ECMtwnWgDRs9yhVI2uZbJ4UjT1O5kDcKK8gKXAjarNjL4XNr
	UuyN5Osg1fyTVCuMI+YRHJIAG0bL0TQ56cWoAbDZMcK/ntvSAj6coOyk5Pun2xFf
	wTecRk+0eVVtO8ufdNJ+fABoRw45CHwTIFSOTLn4XpOybhgKWNR1yWxxprGOLlI5
	yzzC1yKGfAB+na5jbe/TsqJfbT4iWVWZPsZnjtjVubAMsONgD7xhRThNaxM21VSz
	crBPz6Yx9sL49rfgz3TuHSjabXkaIbokPskcHyUCWlZdUuhTF2a0/r/QIoTWoO2F
	O5L+pSaNC4hO4Hy6ETzspvOYmU+x4MEeo13Ytw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729407522; x=
	1729493922; bh=Vxb29ne06TRdRyHH/Q3LilEsLkVyQZbusIsSDPpBR/E=; b=d
	iRpU7JxMXnUUdyTnOdGleNL2BnRPTmIst0RovhpU8u+CIge03mdnJUn+4/gXdu+t
	6KCsbai5aEtSctKjwnms99jIaFTRuB+SYaNuK6JVt5qAhe49HREf9A8StWRSVZk4
	5JlWIVOakSu43Ysb3x8DQIdjtUQpgzBuLJ0LU13Pws1kbEwIgtoEcHChC43MhYOq
	Hmf+T3WystDdINCPbLfowHuNqvHQ0zu3A4FMnIUn2UOzT1mLjJUKy69G6xuPs30h
	G9odkKALx00KmUtjCKNi3sDcManPdNSsMcpL8WFVpfQj0LPkJy9gShI9O1MNEqMI
	XBW8PhwRFl08BUT0sLTMA==
X-ME-Sender: <xms:IqoUZ4rXTHTOfGpqIWwnwA5fTqZ6O-S-h8LHtZ3SKyF1b5INkA_XeQ>
    <xme:IqoUZ-rdizUi_rX1yGgAe05-S63HSiRjnRBI7bWWf6-HuzlfR71YjV9yZFj5vSt-A
    JO36ygJdPGx9pnBXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehiedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhii
    kheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    shhunhigiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvghrvgigse
    hpvghrvgigrdgtiidprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:IqoUZ9MQBu2SwWi5AMgW-Lm9wMpnJYJNpqHhFvHM1QIgad5a_n4WAg>
    <xmx:IqoUZ_4nGiB9eFRHLlDGOmWAnX4Bc82bPTPIWrgFddcySfBG_bhnPg>
    <xmx:IqoUZ37_fImOhwgRd20xL2bBmpP8OZGNNWe7fcKfnA83COaL0b-9Fw>
    <xmx:IqoUZ_iY0iQuLlKscEVV3Llx3fC_ihLXGLjJLrI4_SepJ4bn2WXseQ>
    <xmx:IqoUZ_yGgv_kx25UWkDzd8-vv-f0UBGwjoNg-b2HDNBs3ka_o3LIPs21>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F4C7BA006F; Sun, 20 Oct 2024 02:58:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 20 Oct 2024 19:58:21 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <3588e904-a511-4e6f-83fe-8be9856ce081@app.fastmail.com>
In-Reply-To: 
 <dwp5z7ioahw7hb5celwhmeooaku2sgj4srzq7z4xmb3i3sa7y6@27rnjl72a2fo>
References: <20240929100750.860329-1-ryan@testtoast.com>
 <20240929100750.860329-5-ryan@testtoast.com>
 <dwp5z7ioahw7hb5celwhmeooaku2sgj4srzq7z4xmb3i3sa7y6@27rnjl72a2fo>
Subject: Re: [PATCH 4/6] dt-bindings: allwinner: add H616 sun4i audio codec binding
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 30 Sep 2024, at 8:56 AM, Krzysztof Kozlowski wrote:
> On Sun, Sep 29, 2024 at 11:06:05PM +1300, Ryan Walklin wrote:

>>  
>>    clocks:
>> -    items:
>> -      - description: Bus Clock
>> -      - description: Module Clock
>> +    oneOf:
>> +      - items:
>> +          - description: Bus Clock
>> +          - description: Module Clock
>> +      - items:
>> +          - description: Bus Clock
>> +          - description: Module Clock
>> +          - description: Module Clock (4X)
>
> No, grow the list and add minItems instead.

Thanks, turns out the 4x clock is not actually required by the driver so will remove this and the clock-names change for v2.

>> +    then:
>> +      properties:
>> +        allwinner,audio-routing:
>> +          items:
>> +            enum:
>> +              - LINEOUT
>> +              - Line Out
>
> That's odd, why two same names?

These are the input and output sides respectively, the LINEOUT is the SoC pinout, the Line Out is the board connector as per the routing description above. Just looks odd because the H616 codec has only this single route.

>
> You must restrict the properties you just changed per each variant.
>
Thanks, will do .

> Best regards,
> Krzysztof

Regards,

Ryan
