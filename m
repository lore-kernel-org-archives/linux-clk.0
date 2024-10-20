Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830493D6D;
	Sun, 20 Oct 2024 06:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729404315; cv=none; b=G7chdZTJ9QvbySg4zgLObd/3e45fwsGp76ocZZbtvVRQRUrGpy0iD0iXneelJBCTYlGQ7ubG5g4xNobAuMev3i8E7iQ2bYHLV6n/AU8WdvQnbmAhbR3CQcswNpkU5Y7+ZBNvoYplKAvDBrfytXXx3djt25E9cgMlZknC1XhujYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729404315; c=relaxed/simple;
	bh=edoSP7vgcWmHXm/JA9hZrNjLEbY+Vr4KbOd5G7BoYNU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Et4CEBDGuZpDjZjWmgtBOgYIl9JpyMiLn0v4b9FylrH2JmtGEFfMBW0aXaDeoheadtUseH5HpogXOBAkTxmDXxUEo3l219e3STXjZKOB4uQ6l3oPlxg37wqhGcKl12P20jo8GP4ZVStehFOTE45caNoG57vYECBVYjPUUIAlU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=2QlMLBjk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bwIL8t6n; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="2QlMLBjk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bwIL8t6n"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C538138013E;
	Sun, 20 Oct 2024 02:05:12 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 20 Oct 2024 02:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1729404312; x=1729490712; bh=hDZkJFrkEBlfJZm2OsTapntCfy+Z6v+O
	bKUtrPGKF7c=; b=2QlMLBjkUaU9jH4nnrSNeTn0XhSNDcQyl1UwbewTIi/EW9ov
	uItZcej3T3Eukg8GCgj+xdOcd2wUsNF/wM/6j3H82FjLA1llWE2MUZb1M9VbDQUI
	DcPB2mtSJNxH0FsfKc1X9vwtJrj+TpKd2Al+G7MD7Ax+mqVeoC61OibbmoNHhf33
	c6coVAByY+6+gOH7HbjCkiP5hiHh8xNsOAKnGCsZ3aPgAiBjVbHZWWVWaxezA2BO
	naj2KAb+myto0hTFRNGrlEbbFmQ9GWQ3T/V1JPC/fvGrJJnGlN2gohLUY9RsoiWG
	PfEWQD2q7VJYyYhG7Qgv/veAAj/HwfHSujA5dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729404312; x=
	1729490712; bh=hDZkJFrkEBlfJZm2OsTapntCfy+Z6v+ObKUtrPGKF7c=; b=b
	wIL8t6nwd8pygFMFAitBTL5Jcbg/WgHJT9P5Zjvo2vLu4ds57YfM/g3UOlGoNLqf
	Y+KEEorxGSen/xyntI4IjvRf/W3BbzAwUJ95j/ZoisWZykqjbc/aaLgcRLA0uAgv
	5B9GXPTBu1AgvJnihYpAdLK5wYBDBGP85fxV3kta98uerzBA+KvJdNol8V5K4dKa
	/d8IopEMv/YfnHaXbDOYdtydgK7+siDW0TOhuaQlceoV16sYY424gHKUQtAwip0H
	KeYrmLmgdfC9PnEiM6V2OJjwiu2BwzJOy4yl4YeRWddsFIYFlBscpDhH947kICh2
	jU16E1WC2mbS9J2yvseeA==
X-ME-Sender: <xms:lp0UZ0vCgCVS1Jx1Rwt6SpAroc1cEsXzMYM3G98zEeLwwyoSNt6GaQ>
    <xme:lp0UZxc4fBX-tZcYOYLelqUphkSGJAvlH9DnBRo8Hsn4zVjML_WGxzguNDyDlIbGz
    jKyVfxEzMAkbDBEyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehiedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtoheptghouggvkhhiphhpvghrsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnih
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgvrhgvgies
    phgvrhgvgidrtgii
X-ME-Proxy: <xmx:lp0UZ_zj3F4fDNCSz8sfEmtDznqvauG6ua7ow9Qv_xJBBYrHAe0KxQ>
    <xmx:lp0UZ3PmFNKy0OWfqANg4nMdTszzl72GTJD-SYnP3Eew8Fsqpqdo8w>
    <xmx:lp0UZ081OaLAVEKxRJYELQ-zwWFg8ZzG9OIOh9yzndJ2xdE1Wxtqlg>
    <xmx:lp0UZ_VI-58_TY_FZpapvHLTFDQ7j_g8kDXHqjwxvT1miUbffKw2Eg>
    <xmx:mJ0UZ-coZSVmiNShlHCGO76zGAq0gKPhb5XefdHDQXosLg_ithLfJ_aV>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEE74BA006F; Sun, 20 Oct 2024 02:05:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 20 Oct 2024 19:04:24 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "Code Kipper" <codekipper@gmail.com>
Message-Id: <87d9e653-a7d1-4611-9e9a-724bfd1be029@app.fastmail.com>
In-Reply-To: <20241008133204.3ea38338@donnerap.manchester.arm.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
 <20240929100750.860329-3-ryan@testtoast.com>
 <20241008133204.3ea38338@donnerap.manchester.arm.com>
Subject: Re: [PATCH 2/6] ASoC: sun4i-codec: Add playback only flag to quirks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 9 Oct 2024, at 1:32 AM, Andre Przywara wrote:

Hi Andre, thanks for reviewing! 

> On Sun, 29 Sep 2024 23:06:03 +1300
> Ryan Walklin <ryan@testtoast.com> wrote:
>
>> From: Marcus Cooper <codekipper@gmail.com>
>> 
>> Some devices only have the playback side of the codec implemented
>> so add a quirk to check for this.
>
> That's odd, is this really the only place where we need to 
> consider the lack of sampling functionality? I mean it just prevents the
> fields to be populated in our internal struct, how does the rest of the
> kernel know that there is no capture? Is that magically achieved by those
> fields being zero now?

Yes this is only used internally by the codec driver. The playback only nature of an individual codec is communicated to the DAI when the machine driver is created, for example in sun50i_h616_codec_create_card():

	card->dai_link->playback_only = true;
	card->dai_link->capture_only = false;

Regards,

Ryan
