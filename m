Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA343F4B8
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148600; cv=none; b=gneYygyp7qc10BhK2bhcYnx8spL7jB96UMmLnwdQKA/K+nT5q8CYhpJsSzCzxzYX9owXjJNKcw6poTxmS/YgMMxK66XFWsOzo1Qb9GQbnMvaV7a2j6aMNvC9PS0392xDnr4eWMPC0rcnfitxndVPGdgEOTgaxEYlmJz9NS9UuZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148600; c=relaxed/simple;
	bh=Vj2X9K9rPf0LvjLyNei1z4XXYrolou0PRDoRFJ2UXhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lVtApooPQooK2H/qhScD0++6mx22N6FjTurHH67MNFlvFcT6i4PUx4kUQZa7ewqV3pWVdzJgq/yRN48SvvcAbF8mIWW1N64KrfqmG8z5mzUlGAB5MzQhLCf5xkslQ2kXFUC3V+HLD9ZiuvShkjb1ZMUs9SuCPbkuOGUTII6C2oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PCzNhswH; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PCzNhswH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D9AD71A113A;
	Sun,  4 Oct 2026 21:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D38E604FE;
	Sun,  4 Oct 2026 21:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6BC41032820F;
	Sun,  4 Oct 2026 23:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791148595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/J1CNps2JJKQJSD/9ngkF4RfpbWo/aO0HcABak3sjzo=;
	b=PCzNhswHSy+bcLazyPyPr8u1S4OgDphi3VSVxwZq1s5Kb4kHgtMXEYukAG+k9H3wm2XYeO
	6wr7CpPtWH00JchSSprtGm0lXhwqeECM1pz4uf+sJU8+2ITPCBpQJiLt2QtkTTJxUGHJw1
	Z6YODtYdhPgEg6spzGureZ5rPuNY59Xm78/Pkxqvvnj6dPQ0rzrQJYhvlkMQbL04YPxx2U
	DDLApOBtZXq0EKMEig2BTXk03zflXVFyFufP7DUWdOnh/sBauP18FMceXfKiimR1z0ueOA
	2toJZ9kw1t343Q3HIRIbuW/I6TzHkbZ7QQ6wgndylqtrAdJsSc0WHneO3YhbMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <20261004205903.E62F91F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 04 Oct 2026 20:59:03
	+0000")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
	<20261004205903.E62F91F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 04 Oct 2026 23:16:33 +0200
Message-ID: <875wzhjhe6.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> This commit modifies the clock driver to retrieve the external HXT and LXT
> clocks from the device tree instead of registering them directly. It falls
> back to registering LXT for backward compatibility with older device tree=
s.
>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-=
ma35d1.c
>> index ceebcbd8c18b3..ed61a990870e4 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> [ ... ]
>> @@ -240,12 +257,18 @@ static int ma35d1_clocks_probe(struct platform_dev=
ice *pdev)
>>  		return -EINVAL;
>>  	}
>>=20=20
>> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>
> [Severity: Critical]
> Does this unconditional removal break ABI compatibility with older device
> trees?
>
> Because HXT (index 0) is exported as a public ABI in the DT bindings,
> removing its explicit registration leaves hws[HXT] as NULL in the provide=
r's
> clock array. If an existing downstream or older device tree consumer expl=
icitly
> references this clock via clocks =3D <&clk HXT>, won't the provider's
> of_clk_hw_onecell_get() fail to resolve the clock and return an error?

Jerome, your wisdom matters here :-) For me this is a false positive,
because nobody outside this driver should access hws[HXT] and the clock
is still referenced through the DT, just not provided by this
driver. For me this is not an issue we should consider, let me know
otherwise.

Miqu=C3=A8l
