Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969D145A0E;
	Fri,  5 Jul 2024 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720168988; cv=none; b=W5KOTkUrHWHAFSPouKTjQda9sKXWBewPxq1Ay3HA6tiLxd6hxWemLWPPuFQp51iv6r+RJJtbumlP/EWJZfODSwFATLxRADQNWS3/jp2v61nKwQbsoEt9G92d/esPrBir6u0jhCjkaXpCMmRaNHaaxM8ve+NWDNsJqmrdMFZ0Jx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720168988; c=relaxed/simple;
	bh=IltzSQ/5X4Ajsi1LSF7L+gqy/2Zwm5dKRi9xBtY40KI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=cm258UNtnQ02esgJd97oILF9vFUbEgEcnX+L5ImOl9KP7iwsfqBU8U/LD1dWh2lqwSMDXWCpmta1LdOIjEjhdc7J2VEgG45LTQoQhhMsKBYtkVKz20JQUrP8HhtFLDIv0vAZzTi8V9gA+Uq0UL4xyQA2Fec+sLxzHbHGX9OFMZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=3tdvylt0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cjslrqmf; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="3tdvylt0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cjslrqmf"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 797B41380461;
	Fri,  5 Jul 2024 04:43:06 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Fri, 05 Jul 2024 04:43:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720168986; x=
	1720255386; bh=RKV00q6lSm2tO3hKipSYrp0qt46JHSY9gtuafqcyWeU=; b=3
	tdvylt0coff7sn2DlN4UnLxawJqN2MlPBuSCUyGfqfxe80aB0xe8fcyVPFO8hVUp
	LoJAEKyl9UnAVzekwbwRVdYFEphSegZDZjzh9wMO38Kl0wqE0In10xBCY5C68RAE
	Ktp5Emsj3ldxPSvcNadLD20MePj/Be1zIbxp3zDiIGaGVuqSPCdQIoBer/pWRylJ
	rW3R2n4btdvnvMEfG4oXmln5CmRfsA9C/YtT1kwnjYy2gIOvZuACjHoZlhG6UXy2
	HLl+vHjoSSMqtMLjdrzgPo5IVorqpIgpmjLIUzVfb7pHBw+qsn65zBWgfFINZrkS
	tyuAEN+BKW5KALVciqQrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720168986; x=1720255386; bh=RKV00q6lSm2tO3hKipSYrp0qt46J
	HSY9gtuafqcyWeU=; b=cjslrqmfXdY6hETVXHDgnL6HyNqrQrS4icGId5yd5SjI
	5eVLk8VWoRf8KWC6GiGWLacTNiqlO8IEaSbEvV+LhVEGeyLqNqRX+vBGHcmQvcvv
	9/Bc2YkR87FZSnxLaozSkBvSrZZ6IcG6OWD5RAvtfMBeTKg8dXxf/dPCFF9LH5Ej
	1Z8l9nT/gv4mO5pirRMTIIE0gwVNhc1HphGad5rQ7/e6hftXhceBprD22hXByOxS
	BCySGXA6NkyKZDZMCKAGIgHotH0+Uywz2xpOoCW+IjCbE9MUFmeN7WvzYPQJbWYV
	N4hDA+T7tog9dbPv4R/3kM4opBT4FRd8vy7m0+hL/A==
X-ME-Sender: <xms:GbKHZvInD--y0myNt-IrD8_EkS7ozWVgW8pcig0wCQi4iWXWvR9sQA>
    <xme:GbKHZjKKZV468F9xn8tYoKUPEQSL-YPA2DYi96vHFn3XyUdXeC-V2rcwQZNfZXmp9
    kB9hTW4eZlKf4Yfbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfthigr
    nhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehvdevieegudejueefgeffhefhffevudfhieejgfdtffetlefgteeu
    veeiudeijeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:GrKHZnsb3SR0FV3e5O0EfNseDorhA4j9fx3Fs1WRTFUKPg3mRXWPGw>
    <xmx:GrKHZoahHJ1QufOL2rOPmRdGHSOn7XDVihL-obblfxaS-xxegeUflw>
    <xmx:GrKHZmbuGvblbSyv0FTLI0T_ZtsANEKpkB_7INRG6Mtr0PWTJotNMw>
    <xmx:GrKHZsDBlbZDJ2W7zDiKVLCmEMuHoQTRpQXPBAMlYJWhRMQYd1ppoA>
    <xmx:GrKHZox9r7c7mE_WnPAxJGejGc7XKXbISUeI6_0qi6grBwI24iE-8MT_>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E1469A60078; Fri,  5 Jul 2024 04:43:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cd8652aa-2272-4f07-ac65-e414e83925e6@app.fastmail.com>
In-Reply-To: <20240703-concerned-geranium-dd89f3f82375@spud>
References: <20240703105454.41254-1-ryan@testtoast.com>
 <20240703105454.41254-19-ryan@testtoast.com>
 <20240703-concerned-geranium-dd89f3f82375@spud>
Date: Fri, 05 Jul 2024 20:42:45 +1200
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
Subject: Re: [PATCH v2 18/23] dt-bindings: allwinner: add H616 DE33 bus, clock and
 display bindings
Content-Type: text/plain

On Thu, 4 Jul 2024, at 3:28 AM, Conor Dooley wrote:
>> Add display engine bus, clock and mixer bindings for the DE33.
>> 
>> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
>
> Probably this should be 3 patches given 3 subsystems, but the content is
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.
>
Thanks Conor, will separate for v3 but ack noted.
