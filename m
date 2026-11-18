Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015513;
	b=4Yum6N8+uwNiqWrkfNslCEjIC0D4sYyeQouCDTMOkUyhj2zhmYq0/dBmFOm3kbl8wDBN
	 FSHTZrSG24V7n8WskT4XG1L0C51QsWrokNpF0+kKG0XXcVJls76DCTa/mZ8U2+znxJyNV
	 Ai/IblUxX+pJNgLJq6efq9H3GAHt3aOODnyy6BEANjN4XIPjL4mVgNv/EbiR7YMzJdz5l
	 HfVtwOj52gfHhH2Qm/WgqWodcVQdTam5F2NjAPy3wiTK5VAYw7ttDfSf1SNmyvSlOxN62
	 AswbmmIDWWshSNSwFXc6lPEbVCzQoUxC5Z1L7lXcpPVG+zKfJB3jgC2dbpIJVOp4zJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015513;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=HpJ3kkYf2H4azecU7Ab+KIleqIt1VUZxU/Xjj3cMu6QYyfTbahLkp6HFvWq975HcsLo3
	 EXQv/GBnFHOOWbT7ZG2qTxEEurouKibD9BItk35qGhJUOacgJf9E07XbsviOvK5FFWSXI
	 N1C+C1AtsXc9CntTYptkEOPgjWo8xjM+8TFnisLYT+L4uUCOARps94ybkejTHadjunH57
	 aOkzpmT9G7TkNPLbSl3EV127eDoX+xStTuMZjxA/0/1zB8tKiXXfxW3QV0Da+fkB8kiwS
	 rH/66FwzklgZNZesD9+Vp2MWF0ianfdjP/aP7HtZnAc/fivywAKUIHUX6Wnif0wYvfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7E606A335;
	Wed, 18 Nov 2026 15:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B7E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 566AD4E40B00;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CF7A5FFAF;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD84511BC24A1;
	Wed, 18 Nov 2026 16:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795015507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=ez0Qk31S9QtS5y2slTb9afsub9oCe6bae5MiTUqJxpin2qhPa/86oOfDJEL36e+gl/hq0N
	kEnC3vQ/205ru9vEC10gYcjPTsRmnX//2rgC5Wx2FKON3+9NT/nmkCxBY3JiKRzDAdVXDe
	X1QqcVc9mq8Tj81LItHKUr3ofwCvWX+JtRYzEAhcWSCgkhrhTRrfxydmvXQ95204cpIt6K
	wPa5K1JZo6iSY2/i9QSdi1nO5hAo9BZ0jMf4fM1/dGszaXdZohsemd7ReSwIaLpNxZ2kPx
	XVhMHVqEHsmm/OVrCmCKoxpzsAw/VuzxbkvgKNQKcjKbhZzL1VqNr1rtLkFGhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
In-Reply-To: <179501501070.639563.9357303541273366380.b4-review@b4> (Jerome
	Brunet's message of "Wed, 18 Nov 2026 16:16:50 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
	<179501501070.639563.9357303541273366380.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 16:24:56 +0100
Message-ID: <87o6bmgo1j.fsf@bootlin.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

> We've had to base clk-next on v7.4-rc2 because it carries a treewide chan=
ge
> around devm_kzalloc. This was triggering a lot of conflict in linux-next.
>
> I did not look at your series yet but it does not apply cleanly on patch 3
> (maybe others too) because of the same change. Would you mind rebasing on=
 -rc2
> or clk-next please ?
>
> https://sashingci-clk.liltaz.com/builds/555/steps/3

Yeah, it broke my MTD branches as well... Mark Brown is having a fun
time noticing all the subsystem maintainers one after the other.

Yes of course, I'll rebase on -rc2.

Thanks,
Miqu=C3=A8l
