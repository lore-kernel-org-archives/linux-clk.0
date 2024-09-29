Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18722AD2F;
	Sun, 29 Sep 2024 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727599986; cv=none; b=njg2h4q2eNrV2BX+lbcbvZy2AYMb2K18PDkxCYPumHqNeLSMzz2aihD0Dyl0RfZ8JsGgyFfTM8amMm7GxI/wbszqK2S1blnEwwKCF8vCZfmRq9qtKQdOqTfmmnWxeqVIgodqINjhPpfhIIKC0+4BZhAvPcxCouZwdi7wxVM/A0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727599986; c=relaxed/simple;
	bh=1PkOF795w3kt8UjhfPuwTTcq7ru+xoi0WPPYsSOrkE0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Spxy/ZPsUuSG450pWzIS+rrn6r1M8BtP2wC2c7QouPODYbs/D6laZ4/i9iRZjmKjLNDyfCtpNZ4s2Ud5uNo6EGRtif5E340Cof9RIwgJN87Owacz0vxONxNXECGsmLfmUNGF1et6ZQzpQX6RLfVr2vpIgMKfvT4I2kc50gD+qvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=5NmgZ0Fw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EK0RqoEs; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="5NmgZ0Fw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EK0RqoEs"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3BAA2138039C;
	Sun, 29 Sep 2024 04:53:04 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 04:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1727599984; x=1727686384; bh=T9BxQePmRdxHseNE/o37i5dBpNMdSdlc
	UT0o+FQkSSM=; b=5NmgZ0Fwe/2D0fLrp+ZDnXqSCpxO3GTeMtgO3vyltBG5fp9t
	li4MDj2bKH5KotZPJalgcvRDCuc8kiCMdN/Apz/8PRKVf+Xd1LkcFLQdwM8Vj0lB
	fY/3EiAQHWx32466qAYXhAvfhO7EfHnpd3KZd7UsbjFXUbOc2/NIpmN0HHxaMd/K
	F/DUGXSPxPJllS/axJecXxeSLxb0lks3akAQqfiQ9PxqaM2+dlkGTJ9H7vfKC/tF
	ooylDyaR1ZGtQkCCy16G/sbxm6tUHH9pxeNyJqNqxhjHVYvqHnn/gRFMDa9kaijs
	yKp/LsEFNUBu82TUfnK+r4xfr2jMM8SAY8iUXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727599984; x=
	1727686384; bh=T9BxQePmRdxHseNE/o37i5dBpNMdSdlcUT0o+FQkSSM=; b=E
	K0RqoEs825ywx7OQoWGXKtnPjTViCiPPUEiTKAYoV+nqWf+vK/DQVmR54PYIPGgN
	L/f7VONJWDeDkwljnjqBcN8h4tYrMNAWieqSfH40CaGT0cznG3rmFnDC4ukuRBiv
	CO+T90bClNywG07qSI4wslql6fseVcA3YzhVwrAenu6iOMXm38dGfyrHYlV6T9NH
	7SOslbNPZTzmwxwvsIytUSOuU9CVavEBj3s3IRaVnoaYEDs0Jj5qxIwdDWRiO8wl
	AWziSwJQED9cUPbwnjtt6uuSCteZFs5r/Yg5h3PFI9kSsRBBelNwdA70mcoUIaAh
	jYpJSL28nXDtx8/EgdI1A==
X-ME-Sender: <xms:bhX5Zo1fSJo930oekBINbZYPTPhH50-G9qG718n5q8l_O3vJzB55oQ>
    <xme:bhX5ZjF5m1qz7fehUqGebzukhvGazaWqzVpU1UCcN9S76al3Whh1RrkLSYdV5q4I-
    CO05eRh_gxYDBauGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorg
    hsthdrtghomheqnecuggftrfgrthhtvghrnhepjefhueekjeejgfduvdffheevveejhfdt
    uddthfduuddvveefjeffgfdvleefuefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggp
    rhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgv
    segsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpd
    hrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhi
    vggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhl
    rdgtohhmpdhrtghpthhtoheptghonhhtrggtthesjhhoohhkihgrrdhorhhgpdhrtghpth
    htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bhX5Zg74oHGh8ke1_LfKqmQS9XBdBYO2tbJ2sLr-e233TamBeVRvSg>
    <xmx:bhX5Zh2eMRaNI3Od9S8dVkFKCZ_9BZmJrbu5TbDt_0gHMai76_Tv5w>
    <xmx:bhX5ZrEkLiz-_kjy3kGwjPqTT_zUPeAQywZdiob6HdXiS1xEgjv0iA>
    <xmx:bhX5Zq9BrxaSSfWWjoSzdAsyG-WifU8CTmP3bjCtpE1gK5r0uU1EWw>
    <xmx:cBX5Zk1Ebam-cqKHpAufa2lsI7HhQd4eMFLh0vAfjJQTO0iKHSMyueq5>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 96816BA006E; Sun, 29 Sep 2024 04:53:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 29 Sep 2024 21:52:41 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
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
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>
Message-Id: <4a8c7dcd-d5be-41c4-9735-bf6810a076e9@app.fastmail.com>
In-Reply-To: 
 <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-22-ryan@testtoast.com>
 <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
Subject: Re: [PATCH v4 21/26] dt-bindings: allwinner: add H616 DE33 mixer binding
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 23 Sep 2024, at 8:52 AM, Krzysztof Kozlowski wrote:
> On Sat, Sep 21, 2024 at 09:46:10PM +1200, Ryan Walklin wrote:
>> --
>
> That's not a delimiter and you would see checkpatch warning (because it
> is quite confused).
>
Thanks, will correct these for v5.

> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run  and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
>
> Best regards,
> Krzysztof

Regards,

Ryan
