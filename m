Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38832129E9C;
	Sun, 18 Aug 2024 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724014272; cv=none; b=YQCUWUUTm7NcVvSzWhFej4lBTBGPpiHMWTrcI1vcOuL+kDmqobfN2kvIztQLH/LFAL/9yBdxSozattretcWTArOHLJMOtB10JpLXLSCPJFshkmT2V9eUz9+LQDaodnGaglD29xU8VNsczUgqIwIAhkHa1nKhPdECbjZAjbUpmMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724014272; c=relaxed/simple;
	bh=i4cnKscBdUtY9R9p+tbVpHTOzg1eZ65JGPwxbgvxMQo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gSwjSmsPG11bYgmHB/xzhWH4OGlktaC9i4DuSRK+H5Xow+Yv+lYe6r6SImjlEG7GTeEGrDdJVKLqPxUqYBR+pmxZ9dR9khUPShCn+9owD2SH4OUA+AuLDE4vGnGlo4eT+1KMcWczNDCPUUQWxpapD/9KaZjZn0+hMu4d5BcxttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Iv8myUGf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PTI81+ny; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Iv8myUGf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PTI81+ny"
Received: from phl-compute-06.internal (phl-compute-06.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4E0C6138FC91;
	Sun, 18 Aug 2024 16:51:09 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-06.internal (MEProxy); Sun, 18 Aug 2024 16:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1724014269; x=1724100669; bh=i4cnKscBdUtY9R9p+tbVpHTOzg1eZ65J
	GPwxbgvxMQo=; b=Iv8myUGfGqVKAWYcsIRMDJf5QNCfBR/hr3q8RgfKgyytW1wk
	guOQHCpyPgR2jNvR2EdgehleX6ZWt1xAHX0u2dpSYRDdTzWMfMeohmGOF5KHlABB
	Ve9DXFugDUXDju+a28oszKWhqiREIsNTj7TISaiaQl8Ep0H+ia5MZbw6ODejvZ6N
	TxI+U6kACONWUY8CETT06tty19Szdv0HlKxFSkZvLK9urmnE6b0juxO1ZH8Xc4Je
	E0PO12o8R/TU8WSrEvSTcLYWlyYlg2DvHxbHymXZmdfRMKYI4U2R3UMsVGFK+q0R
	EatHVzD1efuI5zt52sYLrmFPZZwjxM07Z9OWAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1724014269; x=
	1724100669; bh=i4cnKscBdUtY9R9p+tbVpHTOzg1eZ65JGPwxbgvxMQo=; b=P
	TI81+nyiGQ4fr5z9Ah3KK77a/B8I8MH9ATRrvdEYWwwjJnt/Kg4tQ1e9WiI2TB7O
	0XiYkoMd9LNSWMJu0C1yeTqJydl2rpicjjjnG0SGcS1zIvzAA6ymHzxt12yGGnJ5
	Qkeo2BK4TOjkeNn6YyH/DZBgFKaLxA2OhRMWXNkIbATL4oIT9tCLGu4SLa2a33L2
	GMtrKiFQd8KLp9rLWw+UDPGc33yQGSexUa/jSAmA9XyRUHny2RmvxLchnBR813XI
	UMucQwSQupv6ATLBU5QYtmXG/rfbQopAalXvVmNaBOEuV1KfQS4yVEeSdBJNGq06
	mXqczhnUHsAYySzgUJXPw==
X-ME-Sender: <xms:u17CZiqlCbWzP-WANzheacZaDIKqQpj7siouw6qs2IWuZJtyDnqFKw>
    <xme:u17CZgorLbYzG8P_kUJreZssG7uUY8v7jVU3GLb5AUmsEa0e5o_OShRf7kEGAllS1
    w73g0NoP8AUeiStVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduvddgudehfecutefuodetggdotefrod
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
    lhdrtghomhdprhgtphhtthhopegtohhnthgrtghtsehjohhokhhirgdrohhrghdprhgtph
    htthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:u17CZnOnfnY5rLXqdzT_InQzSm68suAboVSZBHTrxL-rqNxO-uOung>
    <xmx:u17CZh4KRpsiCBBWa3VcCPgnD2d6TjeFQLlqx3ymGKqEUnsn7J5dlA>
    <xmx:u17CZh4H1Z1NtFh5vqnb3q7IcLRjnLzbx0eN3LXWFbuVR6oi96tcWQ>
    <xmx:u17CZhiYp6y5XjsMPtUfeZ3wBy4Mx277uTPFg1UJF8vuRaJ8hqLqTA>
    <xmx:vV7CZv65o8E8ELuZHA4h1TGRWAM7lnh4kAeNxBjSCjU_BTOHL8raJvbM>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B634F276005E; Sun, 18 Aug 2024 16:51:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 19 Aug 2024 08:50:46 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Chen-Yu Tsai" <wens@csie.org>
Cc: "Maxime Ripard" <mripard@kernel.org>,
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
Message-Id: <4a5e5c54-71dd-4069-8543-d3c341369242@app.fastmail.com>
In-Reply-To: 
 <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
 <20240817230503.158889-23-ryan@testtoast.com>
 <CAGb2v64Fpt_tP5gSZftmexOY-sS6dsC=+KmgAJmMoRuhsEvK7g@mail.gmail.com>
Subject: Re: [PATCH v3 22/26] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 19 Aug 2024, at 1:40 AM, Chen-Yu Tsai wrote:

Hi Chen-Yu, thanks for the reviews!

>> +#include <linux/of_address.h>

> Still incorrect.

Whoops, only fixed the changelog it seems. Will correct.

Ryan
