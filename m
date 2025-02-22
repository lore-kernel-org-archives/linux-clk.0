Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5DF2AEE1;
	Sat, 22 Feb 2025 02:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740192507; cv=none; b=UaWQiT8tj7G1lbpdIJT6yWJS01aPVFPOy9VMbYf9RPn6uU6+AMAexmeXIbEEwkiNq7FPgaBZC3+NyScg6kjvD2XLaxJGPlqrsrLBRbKWAS3fPmbZRmdvcpn/5RM8yoMHpcrWsqiCWR+kFnacn3ONNVuLmt8ZlbDk44vpEkCBFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740192507; c=relaxed/simple;
	bh=NHnjuluBBV4NxVlFad4bdOku97NB5P20SjOv81aRVg8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RcRtdy5OhvE1qacYoVaJnZ3zQWOAQubrTBMp9DNplpwzu2O1feksXo+C+VOZaOTKlGJ6ndFGgTizvvugJYuTPpdiDZNhrV9ih/oT9ux8NUi+fmVF+LZmZKG9mxci/yvl78MOLIXD5qZTzHXw0pGGk9t8JFOk7Jwo4x8KR6nEDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=W9eTPIkt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GXuQ/77m; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="W9eTPIkt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GXuQ/77m"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id B21EA1380A37;
	Fri, 21 Feb 2025 21:48:24 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 21 Feb 2025 21:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740192504; x=1740278904; bh=+Ml4921wRMeo4Va2Ot0cFWeiFqoEb/Sa
	Xu+3hQO+9WI=; b=W9eTPIktQ2s23LhhHptCJ14xAtHMXQN1J5/nwPzlwHn5mb8X
	sI024syw071x9sjmeAMIh2ftcBEykETf38Nl2CP7BTK7GqWMZfX4fUmBmRkCIlMW
	dQhWbSSu2hdIQXmrR1r69jnBmAj8YpxtfcPMQbmNzV0zUl0h3pu7Zk0nBdM6fELV
	mUc989mZIHLY8Gmsp5Kwl1IUwa4e6VG35ej8EaAbZjxey4rjBVIDgHrHeq8YTq+m
	1fT5PIpqBLZdviWZZS6AOtgOS4tMgMONJuFtAay0fzNZVAHNRTAkMIM+T9de3zBG
	QVeI/YedqDEgPDzIHJripftg8fgCXMyWToPwsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740192504; x=
	1740278904; bh=+Ml4921wRMeo4Va2Ot0cFWeiFqoEb/SaXu+3hQO+9WI=; b=G
	XuQ/77mgC6GJMn17RU4R49h0XDjO1x78fm9CQsYnhSGGz7FGqN7m8MPASSVsdKX2
	XtRZlsjzBEfYdYiSaaOkLo4ipcW2Y4hjAO7Dsq52o/XbRhc9HHRJRuKsLGr70gid
	nIHrNBRBjZqfGl4KjkwXBQGlrzt3JaAZszJdI8sciJ47t51/JuxjoaQrFR2Qd7Ae
	Be/icjIs47N05h2qmtc4L4V3tlmDTwx7WbRgIvjm/YG2clO8rEg6VVOHohfflkql
	RecwZ3tCft1KmZ9d9l3ly40p8i3CiVbJMbc4vBTEIyX0hKsbASY/asSTDFO6YP4j
	dmRt/Px0h+KMkveO53KRw==
X-ME-Sender: <xms:9zq5Z0hLvkeuMwA_cnETwKqgUSlolXj9MQgsXpgwQzmaXeRWJMGNvA>
    <xme:9zq5Z9DZ_qFRkViArcKCqmvRfwe8qbS8DdjR44qSon968tNtS82Eb82LLfPVJL4ph
    gDB-8zLNei5Ue3SLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejudejfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:9zq5Z8H1UxQeIorLCKziqKv-KX9dnWKQiRQFXXGqAoBi65EUPZ6f7g>
    <xmx:9zq5Z1R1WkfRMZyxeOBaSEtFx6cRh4UH_ab5KOUMnXy_KDTCeK0r7Q>
    <xmx:9zq5ZxwxoeTWFJcclrbFIm3Ibl6snmPR30wUQy_jZDWm6wqtin3Syw>
    <xmx:9zq5Zz6tdzmIBMOl6MSs-EtVdatVYUt7niiNsSRE8LwWs3vQAfe2Jg>
    <xmx:-Dq5Z4ipYhLDsQw2gde9HrsjorcDR9629C5VR3jImetuL6B0DxBdTVin>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E245BA006F; Fri, 21 Feb 2025 21:48:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 15:48:01 +1300
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
Message-Id: <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
In-Reply-To: <2221204.Mh6RI2rZIc@jernej-laptop>
References: <20250216183524.12095-1-ryan@testtoast.com>
 <2221204.Mh6RI2rZIc@jernej-laptop>
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> Hi Ryan,
>
> sorry for very late review, but here we go...

No problem, thanks for the review!

> This patchset actually introduces 3 disticnt features, which should IM=
O=20
> be separated
> and thus making reviewing patches easier.
>
> 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=20
> this is used on
>     HDMI for proper 10-bit 4K@60 HDR output
> 2. Display Engine 3.3 (DE33) support
> 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> output rendering)
>
> If I'm not mistaken, your goal is only DE33 support.=20

This is my initial goal, but I would still like good HDMI and video supp=
ort (including HW decode).=20

It took some refactoring and resequencing of (your) existing driver work=
 to get to this series, and I have left out the HDMI and separated the T=
CON code for the same reason, that initially I am intending to just supp=
ort RGB operation to an LCD. I do intend however to use the HDMI code ei=
ther in or out of tree but think that will be a much bigger/more complex=
 change to mainline given the current HDMI code is more invasive to the =
generic driver.

The YUV and AFBC changes seemed more self-contained and seemed reasonabl=
e approaches given that they were both features of the DE3 and up. I am =
happy either to split these into either 4 or 5 separate patches ie:

1a. refactor CSC code to prepare for YUV
1b. add YUV for DE3
2. refactor mixer enumeration and regmaps to support DE3+
3. add DE33
4. Add AFBC

My only reluctance is that that adds more work to manage multiple patche=
s which are logically grouped and in terms of ease of review, all these =
4 steps are in the current set in that order (apart from AFBC which is c=
ompletely standalone), and I don't think submitting them separately redu=
ces complexity. It however will reduce reviewer burden as you suggest, b=
ut this has been a slow process already.

I am happy to accept either process but this has been some time already =
now with lots of stylistic feedback but not much on the correctness of t=
he approach and code, and I am keen to get this landed.

There is are two=20
> reasons why
> I've never sent these patches myself:
>
> 1. scaling YUV images doesn't work
>
> Not a problem for any user who doesn't use video player with DRM plane=20
> rendering,
> which I assume is most of them. We can get around of this issue to den=
y=20
> scaling
> YUV buffers until the issue is sorted out.

Good to know, I hadn't appreciated that. Mostly relevant for video as yo=
u say and it would be good to land YUV support without scaling, then ext=
end subsequently, possibly when we get to the video engine?

> 2. plane allocations are hackish
>
> DE33 for the first time introduced option to move planes between the=20
> mixers. DRM
> has also support for this, but for time being static allocation is=20
> acceptable and tbh,
> even dynamic support need appropriate initial setting.
> As you might guessed this is done in DE33 clock driver using magic=20
> values. Proper
> way would be to introduce some kind of connection between mixer/plane=20
> and clock
> driver, so initial configuration can be moved to appropriate module=20
> instead of
> being thrown into clock driver. I need to check where to put it and ho=
w=20
> to properly
> connect DT nodes. Maybe syscon phandle? I'll do some research.

Thanks, I was not aware of this either.

> There is one glaring issue (when you work on driver and test every=20
> aspect of it).
> DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> registers
> from memory buffer directly to hw registers. IIRC it does that at=20
> vblank time. This
> tells you that current concept of writing register values at any time=20
> userspace feels
> to do commit is wrong and we've been lucky that it works as well as it=20
> does. So,
> in order to fix this, driver would need quite a big reorganization.=20
> Introducing
> shadow buffers would solve most of the issues, most likely also with=20
> YUV scaling.
> Implementing RCQ would be then relatively simple and even improve=20
> timings.
> Note that even DE3 has occasional issue with YUV scaler and also=20
> read-modify-read
> access to some of its register can produce bogus value and thus corrup=
t=20
> image
> until next commit.

Thanks, again I wasn't aware. All my testing has shown remarkable stabil=
ity and there are some downstream users out-of-tree with good feedback, =
but would be happy to support an effort to improve this.

Regards,

Ryan
