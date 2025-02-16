Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DACD19E96B;
	Sun, 16 Feb 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739730610; cv=none; b=ZPhl1mnrYeY6JWAcKRYIjSBqnTFH4tHYAUz+AEvFLYFKMrb/B28JHECLyEW2ZqxkpccVn7G0oZUeXlQvzz/F+v1yeGqSHobcObpEExiVTXEyc6BvxvO6PcYIxIlyFtCSr1K0IfzHCscH3uwTnb9wRpYonrWw+1kr4wKY4vLnRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739730610; c=relaxed/simple;
	bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJiw3aqC4IqVc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=F6AbESnqUrAJfggX5o7Z5Nmd1Tx0wU26b6KJSwkxIMxj57tSzGNYntUPUsm6zcyp59W2DjQ01b4fVpPxGgeWEPIx+FyR8/kLNUtaLHfN0xAvsUlMlrA5Wy9OjouDzoxRz2HgTk9hgSSJbrrCXhxfXLtcyARo0RiXRgaqau9Yhk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=N96rZAMe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MsEAHXpU; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="N96rZAMe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MsEAHXpU"
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8626925400FA;
	Sun, 16 Feb 2025 13:30:05 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 13:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739730605; x=1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJ
	iw3aqC4IqVc=; b=N96rZAMeR/tUe1AL5usu2jp9nGe3Hyfkkmq2eCGoZ+QLg6+h
	UzflLhFdaWXIo9en9Uh6fJCfEQSFkZrBwjJDCV74sP88H3HDnAK8+JR+WhysOkSx
	2sOET0FDZBJYqGyrH64XOlYiZVgCiitOeXnyJU0qZ1p758FRu6BiZ158Ss370JWh
	mKszyRDylBeSVqEt/+QpxNUw9TtC0tDIdU1rLKSd6Ln7qKjalkJY0ImXyPeI2rQ1
	PXxfWVANvrPl/JEtLYRKHXwFq0/mvxyJTIMDUj07gczRW6E1UJpjLid+XkC2j4Ue
	qPQyqOt83d9/j44XgfZmEgFCxrfwi4n0lXnaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739730605; x=
	1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJiw3aqC4IqVc=; b=M
	sEAHXpUU72PiET0Jr777/O6d8vZatx5/QLX5qDqIHuCwYZGGrRVA04SK3Si1ZlP5
	Exb2EdCQSZHP7yi1M54C54w5a3+W7qi7YZ6QnbnamcfgydNnn4oAeUrjYW+RSz1Y
	WIZ1KmzDVBURD8zGzSNwHbPTsABCO01J2lLsDGn/ThskhUbRVsC4a6XezRqtLfkW
	ewdbsff8/74+92c3K7LHZkeYrGlTlqdk65xE+tQGBjJSp/czF8gVxQRn3yLNFH9d
	opTIhG9Xy00/ixR22sQ403ct8v70+YupNzFznNhB9UdjTrRL02oiSwBX9fPKvWds
	WCSdut4RaBpLj/uRJWNvA==
X-ME-Sender: <xms:qy6yZ7GnieHTpuii2ZvseofaO8cOaXH9sCXG_09uEr1uTbOQ9r7jXg>
    <xme:qy6yZ4WIZxFsjqipW8-m7u1kSE_9HtFMSEgYk1NuAIQw08YKd6zX8dkbB1JLAw8o6
    -aEMAC4pFdHrRDfHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdr
    tghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:qy6yZ9L2uJVrlNNxyA26MmkE_CckIKK8KW3gsJR_gOurr6rPJd5p-w>
    <xmx:qy6yZ5Ev_dfVnN6se7DIqZk41wHkglkiTy19z1m1REKfSwHfZcqMQA>
    <xmx:qy6yZxVLeUOyv3pb7foJV63NVFMaZ0JT_sG9JhmSKr80BOdk5gnh9A>
    <xmx:qy6yZ0NyXKLBPTt7UscFwnUZUUQHACsICPODfhUJnJ38QpFEKtolcA>
    <xmx:rS6yZ3FuSdzvqzLJIcLw1zYQqYjGvmzBbnuYocMCl2AiaCigntDLEMGo>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7CE4DBA006F; Sun, 16 Feb 2025 13:30:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 07:29:42 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
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
Message-Id: <7897968c-da47-4dd0-8a79-cb8b2c3325e1@app.fastmail.com>
In-Reply-To: <20250216085432.6373-13-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
 <20250216085432.6373-13-ryan@testtoast.com>
Subject: Re: [PATCH v6 11/27] drm: sun4i: de3: add YUV support to the color space
 correction module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 16 Feb 2025, at 9:50 PM, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Add coefficients and support for YUV formats to the display engine
> colorspace and dynamic range correction submodule.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---

Apologies this patch inadvertently omits a helper function (sun8i_csc_get_de3_yuv_table). Please disregard and I will send a v7 shortly. Thanks Philippe for reviewing and letting me know.

Regards,

Ryan
