Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB74A8FE3
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965833; cv=none; b=hcUZQ7WXCyINAVwxJhkbRSdv2RBSNVXaKUzpnbpx3u5ntKtf/e8ZsC5IrWlxUnjxH03HitfYeRsgr8ceJsWCxicvV/Ygcsq7vKjLCpFvXWpP0Eny5QeNqlC2DrkEUiewUHu+wPP78DcoWPFYmWT3Hq/l8vLLc1jvLLMxf1n2avo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965833; c=relaxed/simple;
	bh=ZqknzFJnaqs8TNK5pB9Ud8XpjTvw/yNTgnFo65a6Q1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MjSnZ7YjgVUMvawe3jM4si9IQuzxOL53keh4RO4FAZr9MVE5tXSQQTUx5Mp8q0OQnQd3BjiQ8eirsuOVDYM5Zhw00Ah8vKqREfISrdYk3i5KN9Aog4aeZsCgZNfECU8rLzPrETNBnuTuCnI0obpkhWcnAhLPnxnsM0BUTx2stGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ENCo/ahq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ENCo/ahq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B52F1A1224;
	Wed, 14 Oct 2026 08:17:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 504F560368;
	Wed, 14 Oct 2026 08:17:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D7D10328A1B;
	Wed, 14 Oct 2026 10:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791965823; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=UsYqxtB+jjJKShD2CRpUb5EwKh20eS1j7TXwCagXWeY=;
	b=ENCo/ahqL5UMHDeCrE46XKSa2vBT5wrSPwGZw5tuzAufesDlXCLi57bzyNDQGH9ioRJLj5
	oar7Hxnc4il7/gfOidI4lmWzKKYtqqbTCeEHCj4FBhgSUHRZBB0ac3yei62zKUerB4UzhV
	em2bDkSsaRDgy1aH7DencZ9x2MJG7j56QFwCNY+1K4jIPHJIBpUFlr0XuBcfjhBrSBjvzK
	f2fj9sqXQ4Qip4KeNU/853S+H3t/eoz6cKZLb8KZ2ohNAyMJ2Ga3uzXQr7TaqdHmstlpNp
	eUkaloijsD+aL7VH2RI7froFy0QDoK5oARBPoefmZpxalJFApjnTOJ514q9BEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <179191290452.266355.16355634952216272745.b4-reply@b4> (Jerome
	Brunet's message of "Tue, 13 Oct 2026 19:35:04 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
	<20261004205903.E62F91F000FF@smtp.kernel.org>
	<875wzhjhe6.fsf@bootlin.com>
	<1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
	<87fqy9v82c.fsf@bootlin.com>
	<179191290452.266355.16355634952216272745.b4-reply@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 10:17:01 +0200
Message-ID: <87wlrkzog2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 13/10/2026 at 19:35:04 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On 2026-10-13 19:12 +0200, Miquel Raynal wrote:
>> Hi Jerome,
>> 
>> >>>> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
>> >>>
>> >>> [Severity: Critical]
>> >>> Does this unconditional removal break ABI compatibility with older device
>> >>> trees?
>> >>>
>> >>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
>> >>> removing its explicit registration leaves hws[HXT] as NULL in the provider's
>> >>> clock array. If an existing downstream or older device tree consumer explicitly
>> >>> references this clock via clocks = <&clk HXT>, won't the provider's
>> >>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
>> >>
>> >> Jerome, your wisdom matters here :-) For me this is a false positive,
>> >> because nobody outside this driver should access hws[HXT] and the clock
>> >> is still referenced through the DT, just not provided by this
>> >> driver. For me this is not an issue we should consider, let me know
>> >> otherwise.
>> >
>> > Strictly speaking there is (used to be) a clock at this index so it is
>> > not a false positive. Someone crazy enough could have gone through here
>> > to get the OSC even if does not make a lot of sense.
>> >
>> > This clock should never have existed to start with but it got in the
>> > bindings ... and that is the pain of dealing with bad bindings :/
>> >
>> > You've got 2 options:
>> > * Removing the ID from the bindings explaining clearly that it conflicts
>> >   with the fact this clock is actually an input according to the same
>> >   bindings. I suspect the DT maintainers won't like this much ...
>> >
>> > * Keep the bad support binding in the driver: You'll need a pass-through
>> >   clock element where the parent data is the fw_name and a fallback to
>> >   an `hxt-fake-internal' fixed clock. Feel free to add a comment
>> >   explaining how bad it is to use that clock and what user should be
>> >   doing instead.
>> 
>> Too bad. I am pretty sure nobody ever used that yet (since it is both
>> very recent and fundamentally broken) but okay, I'll keep registering a
>> dummy fixed clock there in case anybody ever cares about that lookup.
>
> Maybe I'm a bit too cautious with this. If you get the DT folks to ack
> the removal of the ID, I'm fine with you dropping the workaround.

Ok, I will try.
