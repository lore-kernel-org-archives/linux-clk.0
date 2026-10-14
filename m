Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20853F6BC
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987652; cv=none; b=MeJg4pSWfYmnCyjenoCFIORB4Bnppd2lUNGzp/sn3fBamiw3Vqroi3zsURYx3+di0RQedkpy9YNdeAIRL7wTlNps2grAny9Dl4wwi99/sA96EZGdEK6xVtQqHYAJ6lmt/hfbV1gl9SIilzAkCkyLipWaOKb3siq+cupDCmm2ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987652; c=relaxed/simple;
	bh=0vkgScNjk0FeEApM5592IqDNqPxwZ6cp5Ok4J3uj89g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qxHqVaXLCqKwhTCaDJwMi1IwRy4kkVj3PgpNL93pVwQfc2NPXXFlSY33RjpwvmgYjTsEkhmUtS5HlqqNg0H2VEjFZaAiiadmjxghqrVoWJIFvu6ZfbJYm1evHgdiLXhjkGV/S3ljuIWxljoeE27LGXXq65JPIZ9PCkau30dIiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FiZtFlyw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FiZtFlyw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 586E34E41227;
	Wed, 14 Oct 2026 14:20:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AAE560368;
	Wed, 14 Oct 2026 14:20:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0FD410328A4A;
	Wed, 14 Oct 2026 16:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791987638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=3F8TAptLzVl/pAtD0MwYH1gnZrqAcrHZKcdljRfH8y8=;
	b=FiZtFlywkfFHhu5Fp8SSVauY8LD3I2zaiudqAdBbBu54EKBI29OyC90d4vcuJCPMR7BV0R
	RLbolPztpiC1XVt9lbB6iT4k/tuG2Z1BjhKY+g2yXrKcYro8cg+L1x/GfDay7gVz4PfR/f
	nZczQU4IuvqJB7ZWr/pcQtl0A5doe5rOxrjYbRzixarfMMPTenv6idvb2X3LU6eLr/471B
	Nuy14xH4g4aXzacEQuh3lEw96r2S3keZxtE2i5dA4TeAf4XaWLHAzkWWDM14hh7vFBsl7K
	1TmOfGXtIiUxJ4zFRNwQxpG9DrIwvk8VhNlLEPQGmHBR2lUp69WLypuMBp1SzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <87wlrkzog2.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 14
	Oct 2026 10:17:01 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
	<20261004205903.E62F91F000FF@smtp.kernel.org>
	<875wzhjhe6.fsf@bootlin.com>
	<1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
	<87fqy9v82c.fsf@bootlin.com>
	<179191290452.266355.16355634952216272745.b4-reply@b4>
	<87wlrkzog2.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 16:20:35 +0200
Message-ID: <87a4ogxt1o.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 14/10/2026 at 10:17:01 +02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On 13/10/2026 at 19:35:04 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> On 2026-10-13 19:12 +0200, Miquel Raynal wrote:
>>> Hi Jerome,
>>> 
>>> >>>> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
>>> >>>
>>> >>> [Severity: Critical]
>>> >>> Does this unconditional removal break ABI compatibility with older device
>>> >>> trees?
>>> >>>
>>> >>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
>>> >>> removing its explicit registration leaves hws[HXT] as NULL in the provider's
>>> >>> clock array. If an existing downstream or older device tree consumer explicitly
>>> >>> references this clock via clocks = <&clk HXT>, won't the provider's
>>> >>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
>>> >>
>>> >> Jerome, your wisdom matters here :-) For me this is a false positive,
>>> >> because nobody outside this driver should access hws[HXT] and the clock
>>> >> is still referenced through the DT, just not provided by this
>>> >> driver. For me this is not an issue we should consider, let me know
>>> >> otherwise.
>>> >
>>> > Strictly speaking there is (used to be) a clock at this index so it is
>>> > not a false positive. Someone crazy enough could have gone through here
>>> > to get the OSC even if does not make a lot of sense.
>>> >
>>> > This clock should never have existed to start with but it got in the
>>> > bindings ... and that is the pain of dealing with bad bindings :/
>>> >
>>> > You've got 2 options:
>>> > * Removing the ID from the bindings explaining clearly that it conflicts
>>> >   with the fact this clock is actually an input according to the same
>>> >   bindings. I suspect the DT maintainers won't like this much ...
>>> >
>>> > * Keep the bad support binding in the driver: You'll need a pass-through
>>> >   clock element where the parent data is the fw_name and a fallback to
>>> >   an `hxt-fake-internal' fixed clock. Feel free to add a comment
>>> >   explaining how bad it is to use that clock and what user should be
>>> >   doing instead.
>>> 
>>> Too bad. I am pretty sure nobody ever used that yet (since it is both
>>> very recent and fundamentally broken) but okay, I'll keep registering a
>>> dummy fixed clock there in case anybody ever cares about that lookup.
>>
>> Maybe I'm a bit too cautious with this. If you get the DT folks to ack
>> the removal of the ID, I'm fine with you dropping the workaround.
>
> Ok, I will try.

Actually while reworking a bit my series I realized keeping HXT and LXT
is only needed for legacy DT, so we can keep their registration limited
to these old cases, and just no longer care about providing valid HXT
and LXT lookups in newer cases. Bindings shall not change, so let's keep
them that way. It is just no longer valid with newer DTs to reference
the clock controller to query HXT nor LXT. The result is pretty clean,
developpers will very easily identify the legacy part (as opposed to the
current state) and we avoid the churn of removing stale clock IDs.
