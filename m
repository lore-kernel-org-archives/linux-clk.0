Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FB6BB5B;
	Sat, 15 Feb 2025 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739591345; cv=none; b=EV/9RUsBIEUdq0DYW5wQko8sPG1UU5zoSD6wt4zTXfNG832WgLUnHmSnxcwJx6a6HXhT8y60xr/sYIGyQ9bIR8G9b+mFy92+s6JgVHbpCH7yNo89L3ll81XWyahhuX6eUpKlKG5VNdVQY44nAiLXgMywq7Mr4YTNZa1dexrqkwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739591345; c=relaxed/simple;
	bh=R1sxzCqvhdem/phYlSbYJoFA5ZHeSTwnLYouy/wFB3g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bG5fpwz5i1dQ4vPeDG3JWfoGnxvpfW74khAOdRlS58uBOLNLtwu+2FCHJiGUaCZHcGzNZHnp9LlgqkVngnA4MV/ZAkQnmtSmpPxjfMf8+zlwb7bp13w7tCarK8jjvGqDGbognE1j7Ms2yshYEEGy91+epYIb6bzKZ889Mzca+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=f2mN4FYA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h5kGlGKe; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="f2mN4FYA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h5kGlGKe"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C4F5C11401A1;
	Fri, 14 Feb 2025 22:49:01 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 22:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739591341; x=1739677741; bh=myPH6l0fPDFrYP8tIa5SQdEq5I1Vnw5X
	3g3YUMM3Fvo=; b=f2mN4FYAsZWTmcoXQzLdOm6nhCSQVsklPCaxxA3I0gRl6Llb
	r7XnsUtluxKlfvd0CvNdhDXW5oqw0eXUTxWXGPRwEAe8/48OmMyUZ5DaRga+/+om
	T49CWoIlw6YUesuxbcrecerkGSFutscBq4RLnY1K+DaTvzDIhbaEHI6ax33FgLgC
	zk486z37on20gABwb27Uludiseema+Zywyshlxfjg23XHb1u1FqUPP0o0wbSLfOE
	PgFdntSbZxXBHsucZTX6a1r2UgZiaumeoVzSaJENkC5DisSWrs2ueAAoxpCG8CvJ
	9O+DVifnxQo1Up2Tm7ZUi4DsqFT7BLF9FICa+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739591341; x=
	1739677741; bh=myPH6l0fPDFrYP8tIa5SQdEq5I1Vnw5X3g3YUMM3Fvo=; b=h
	5kGlGKe8nmS4hPtg4pyM/dztqaM1EI/EUXKsufWrss4oipO4lSS9bFUucVo4SNp1
	+JXOOypne61enHqc5tB5kn88ixbz/gd5CDUao5NaeDAq8x7/E6tuc27d16u48QfS
	J9Iu9d8r0Dl+brQaLUprh0KktWb+CYPA0S6JztTAyEdR3yRcZ1ez0ZrzBHN3qU95
	QNhuPw65PjxSjtqcrzSwynVyKoB6pffHN8Nz8U8XLUutkCAHeKFLjQuiswM4xVPu
	QL42I5S4zEcIODBJ8U5WQRaJkgPEV5TgHhhHgq7bDfN5W26/5to+X4KAtzajydcc
	WBVM+Q5TSBs0pR5iPkRcQ==
X-ME-Sender: <xms:qw6wZ3Nc5rAOzMC_OTcN0l0edsxhS-uHEt9Sa7PrG6D6mwUQAtKocA>
    <xme:qw6wZx_LHoVEOB_G13QugvaiTAkZRDFj1YEa9aHqHFd8i9vQqGs7dbXxGCPuXrDmp
    0CcVTkoHx1_LLGRgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qw6wZ2SujnKu_6uipJMxuvzHBwznXkOUFi4IQc6DAf04ouMRp0sR3Q>
    <xmx:qw6wZ7uEgbjmfrGBLm1FIJath51BFS5DtwamInX0oUUVWq--KZOe0Q>
    <xmx:qw6wZ_dJDa88Ul43SQZRdrfFvtanu8cSuRQkj_uri896EP7RTUWTjw>
    <xmx:qw6wZ30Et1uGUl--L6okTQMkGs0qI1C2w6hwzu_tR1UxvxTfY84y7A>
    <xmx:rQ6wZ18oljfrxqA20zSQwEBuF_J-YT7KozvLnYThvbAI55hTEkpjvDsM>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 981AEBA006F; Fri, 14 Feb 2025 22:48:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 16:48:39 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
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
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <6f14b319-fbb8-413d-a88d-edebf624c7fb@app.fastmail.com>
In-Reply-To: <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
 <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 15 Feb 2025, at 2:18 PM, Ryan Walklin wrote:
> On Sun, 20 Oct 2024, at 3:14 AM, Dmitry Baryshkov wrote:
>> On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:
>
>>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
>>> index c48cbc1aceb80..ffafc29b3a0c3 100644
>>> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
>>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
>
>>> @@ -151,6 +153,9 @@ struct sunxi_engine {
>>>  
>>>  	int id;
>>>  
>>> +	u32				format;
>>> +	enum drm_color_encoding		encoding;
>>
>> Should these be a part of the state instead of being a part of the
>> sunxi_engine?
>
> Sure, would you suggest in sun8i_mixer_cfg?

Hmm, on second thought the mixer config is a const struct, presumably because it is defined per engine variant in sun8i_mixer.c. Is there a better place to store state like this? Otherwise the engine may not be the worst choice, as the color format and encoding apply to the entire pipeline, at least in the case of a single display?

Regards,

Ryan
