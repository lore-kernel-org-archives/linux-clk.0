Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853BFC0B;
	Sun, 20 Oct 2024 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729406314; cv=none; b=cvkj+fRt2z5/XrUbgaVJX3pvyKdzSfN1FpE/q43Mr94Lk48SvgPjNsrBo5yPSjduVQ+vgWaZF6o0tU2o4/Cizj6iAwip7LOMVwzn6+N4ScZaCDgtTzSG0p2/NDijtIDsH6YyxuMBZY30Rv1o1ca4CDhWBtNt5So9GoKVmie2nLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729406314; c=relaxed/simple;
	bh=KXnPm9vIZwoC6JaCORU4/P2WZLvLDcadghl9ifr12X4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EeUpY6u71xeof+UHBJekGvxqvOUPdgfyLAqwQlk5BII9OpsFmNnlfVyGeAPImDpcKkM+jzjbXfmbm2S7e4boRwGp5v/M0Odq6ha+ZZmHCixgz0fqXpyNilBIMNVO1mVNN06F7Pc5T/gg9Ox2hzckIXkNZAvxRhaRnsN0eHkJrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=XCTbbKxH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OyD4P1k7; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="XCTbbKxH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OyD4P1k7"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C40BF138022C;
	Sun, 20 Oct 2024 02:38:30 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 20 Oct 2024 02:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1729406310; x=1729492710; bh=L+n/dgPeNQ+5xX5eQ0CHq90T4/FMoM/s
	+1gnEfSMX0U=; b=XCTbbKxHaSwiteCNxow8fF7tzyg+1GDIOEYHfQaI8/hRriMN
	iVoh1PJ0kJImuqfwKjORXxn1cyy0C6PDHnZVlExifXCJDEGeaBb5toGng4y6wccn
	j7ZEr2cadlJ7FT5LEoME2GGG3lLhVWdFg+N40cICuY6vtSd5aZP9ODYQs4FrM83e
	bwpL6OK+N5u8Hil6z8K4N7PN/1Ux/sQUF3oMQo4N0S0fYu2UQY5AIPAOaWkFOMD9
	S7LI5Ni+yR3Wd9NjkBceNE4lHLkrCp07LTmecDC57mv6DRwro2AV+kxtGYkeMlLv
	jI0rPMl9V+j0ne0Gcs7c+12wsfMiYhkdf0St8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1729406310; x=
	1729492710; bh=L+n/dgPeNQ+5xX5eQ0CHq90T4/FMoM/s+1gnEfSMX0U=; b=O
	yD4P1k7T+t7LcEH7rkrUeaXnJw1Vpj3TH05i7CCypHU9RHYVWTj0Fr4aaHPf7x3M
	5L632Mt/VFSdCI1W5VVSY4hMrrAqy0FkuigJRYP1p9LfaB5T37z7RP9A88WWCEh/
	GSKYskQtMGGS9aKud2NYBiXi8A/5CnLfPDj0GxY5SZL3si/lSkyq8YQNGEgLSIbf
	xxzbNAEVyMiAQLBb03AI6V6GHV0MtMwfPKI3afeSHTzqF/SG1cFU/vS1edh/p3Zq
	sW6dslVMoRrgwowFGINx9Vd4sD3u+Xww0oxJgCezSqIenL0uh4DOTZ7pWoKwTbLN
	NP63yzVr+9tzBsOLRIERQ==
X-ME-Sender: <xms:ZaUUZ8Rmr40gpspj07XAf7mLbac-ktz7SLH4Un4Jj4VGYYPTGdka-Q>
    <xme:ZaUUZ5z1qOYPB2XMz0rOiV-6epkHcxTKwz6FmMLBMa_BFU3uGaCEHf34FWRIbpVKh
    AU785-hEGBGuuFapA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehiedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthho
    pegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    epphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:ZaUUZ50Ty61DgHaUzZdkUZeGi7ntpP0oACXu7HQpvfzJO5fZZuZ-4w>
    <xmx:ZaUUZwDUtfI7dnoppIF6bPtQCNc1Kjm-iX2JnyuINIJS_hMF4dnMfQ>
    <xmx:ZaUUZ1gIJ2AFkpxIxduzLf1BOnr1fT-pHDCBb3GYZu1vho-Co-rlKA>
    <xmx:ZaUUZ8o5JISuuHOB95ptltraeDjJyMM3584iB8OeE4Vv2iJDSGL1ow>
    <xmx:ZqUUZ-baNB_zWDjuV04vbLLL3LDxcjwVA4OOi8EXo3aboDC7OqGsKupb>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C96AABA006F; Sun, 20 Oct 2024 02:38:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 20 Oct 2024 19:38:09 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <d7f782ae-9d66-4d9b-ba51-d55f307d658a@app.fastmail.com>
In-Reply-To: <20241018102929.0eda3fc8@donnerap.manchester.arm.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
 <20240929100750.860329-4-ryan@testtoast.com>
 <20241001142850.1c275f78@donnerap.manchester.arm.com>
 <20241018102929.0eda3fc8@donnerap.manchester.arm.com>
Subject: Re: [PATCH 3/6] clk: sunxi-ng: h616: Add sigma-delta modulation settings for
 audio PLL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, 18 Oct 2024, at 10:29 PM, Andre Przywara wrote:
> On Tue, 1 Oct 2024 14:28:50 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
>
> Hi Ryan,

>> 
>> Can you try to add a .fixed_post_div = 2 in the ccu_nm definition, and
>> then put the real dividers in the fixed-factor clocks?
>
> So I tested this change, and it seemed to work for me. Please don't
> forget to add CCU_FEATURE_FIXED_POSTDIV - as I did initially ;-)

Thanks, have updated the patch as above and the manual-described multipliers are working.
>
>> And please explain all this in comments ...

Will do.

>> 
>> >  #define SUN50I_H616_PLL_AUDIO_REG	0x078
>> > +  
>> 
>> Can you please (re-)add a comment here explaining the sources of these
>> parameters? Because the values deviate from the ones in the manual.
>> And also please mention here that there are two more divider bits (named
>> m0 and m1 in the manual), that we cannot model in our ccu_nm struct, and
>> thus force them to fixed values in the probe routine below?

Thanks, noted.

>> 
>> > +static struct ccu_sdm_setting pll_audio_sdm_table[] = {
>> > +	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
>> > +	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
>> > +};
>> > +
>> >  static struct ccu_nm pll_audio_hs_clk = {
>> >  	.enable		= BIT(31),
>> >  	.lock		= BIT(28),
>> > -	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
>> > -	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
>> > +	.n			= _SUNXI_CCU_MULT_MIN(8, 8, 12),
>> > +	.m			= _SUNXI_CCU_DIV(16, 6),  
>> 
>> Can you please keep the original indentation? You could add a "post-div"
>> comment after the .m parameter, to map to the manual.
>> 
>> And add that ".fixed_post_div = 2," here.

Corrected for v2.
>> 
>> > +	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table,
>> > +				  BIT(24), 0x178, BIT(31)),
>> > +
>> >  	.common		= {
>> > +		.features = CCU_FEATURE_SIGMA_DELTA_MOD,  
>> 
>> Please indent like the other parameters below.
>> 
>> >  		.reg		= 0x078,
>> >  		.hw.init	= CLK_HW_INIT("pll-audio-hs", "osc24M",
>> >  					      &ccu_nm_ops,
>> > @@ -690,13 +693,13 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
>> >   */
>                      ^^^^
> There is a comment up here, not shown in this diff, which doesn't apply
> anymore. Please update it.

Fixed, ta.

>> >  static const struct clk_hw *pll_periph0_parents[] = {
>> >  	&pll_periph0_clk.common.hw
>> > @@ -1135,13 +1138,10 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>> >  		writel(val, reg + usb2_clk_regs[i]);
>> >  	}
>> >  
>> > -	/*
>> > -	 * Force the post-divider of pll-audio to 12 and the output divider
>> > -	 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
>> > -	 */  
>> 
>> Can you please keep the comment, and adjust it accordingly? Saying that
>> the recommended BSP parameters for the PLL audio recommend M0 to be 1, and
>> M1 to be 0, and that we enforce this here?

Thanks, have updated.

Regards,

Ryan
