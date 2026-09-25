Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AD1DA60D;
	Fri, 25 Sep 2026 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342668; cv=none; b=pyHCTRagF9tgxG9q94YmCWSW3Wv0DT3YJ2BNOZxC4viYv6aNsabNPzlxEF0fAdRjo3peYSqYfCr1EBM1M+pClcJePWXDeWHsgk3wMdASqyV+XVhkrjGvSXhsZErVM3EGxQM/s1rmUtOETcVYw3jJrGB6sOJyK2EacSpuqdtKVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342668; c=relaxed/simple;
	bh=4y24Yk+Rzhuj1/s72AkBq6Szbdrt5sE0ovPW5rzCBo4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KDKqJV+rCZmg5iKlKJ8yiE8vvK2Ji0piNmTRz1Pp7FtRS1fg6HQ7S6Hem2M/d5Yu4i7UibBQYQlFNeU75R0TaX9siRzvyjEq6cWxWm8asTA2VyVtRuK830rZaLihkgUE80QdzbZj2o2MJfbqNIjIYfRd1XV7QE5WeFCB8l66nyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l9dlpdkD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l9dlpdkD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 550DD4E41070;
	Fri, 25 Sep 2026 13:24:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 114D06073B;
	Fri, 25 Sep 2026 13:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7FB8103282D5;
	Fri, 25 Sep 2026 15:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790342656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dWHwO8k89KMIOROmHdTn+tsJpwKFcpuMyDpGO9S6/Q0=;
	b=l9dlpdkDqiMckaNfwr7bun/p57zAVub7v1PghXsTuWnOsGqHAv7yuZLECjhqrrsOeJUlt8
	0yi7CHR2q3FKkEu2BWyKiTdGdFyriXxXWni+kPX//yN7vO8tYReF0gJRI4D6/VYNUXKadT
	P/NLpDmMJxWSM66/UTT8NCpc+1YWPVWxixpKyenM6bzKNGCL37wrmmjS5N884rAc0om23n
	FoLrsIGum1CEoiMAq5r1n1hPJ7y7vPZklmteNdn3HQb8/uEBaq9lATJSaE7nTOFVOESVEv
	0+UGOn3R4XdzuF3E1tQSRg6EQ2GujU5+bWm6Wn9LDddEUB91EaiETkax8M+e5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,  Jacky Huang
 <ychuang570808@gmail.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925-skinny-husky-of-cookies-4aaddb@quoll> (Krzysztof
	Kozlowski's message of "Fri, 25 Sep 2026 14:58:11 +0200")
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
	<20260921-perso-ma35d1-upstream-clk-v2-1-209fd32a8b00@bootlin.com>
	<20260924-bald-awesome-griffin-7d1d5b@quoll>
	<87jyo9ljlo.fsf@bootlin.com>
	<20260925-skinny-husky-of-cookies-4aaddb@quoll>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 15:24:08 +0200
Message-ID: <87a4p5jwg7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> Maybe one way to fix that mess is to:
>> 1- Add the 2 new values (238 and 239) + a new define:
>>    NUVOTON_MA35D1_MAX_IDX 240
>>    238 would then have two definitions for a short period of time.
>> 2- Replace CLK_MAX_IDX by NUVOTON_MA35D1_MAX_IDX in the driver
>> 3- Drop CLK_MAX_IDX in the bindings.
>
> Why we can't fix it like we did everywhere else?
> git lg -- include/dt-bindings/clock/
> and search for "number" which leads to recent commits like
> d10f26a7abbd3dd5d59bac1acdca117385b54ea9
> but there was same work for Samsung and many others (Renesas, maybe
> NXP?). You add define to the driver, then drop it from the
> binding. Can

Aaah, ok, got it. Now I get what you mean by "the max is not a
binding". While true, I find it much less obvious to have it somewhere
outside of the file defining the clocks. I would have "preferred" to
consider the name of the definition immutable, rather than its value,
but if that's the way, I'll comply :-)

> be a few commits like we did for many cases, but recent change from
> Linus I think went acked while combined binding and driver.

Thanks for the pointers, I'll "move" that number away from the bindings,
since the driver is the only consumer of that.

Thanks,
Miqu=C3=A8l
