Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F024A64D5;
	Mon, 19 Oct 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403749; cv=none; b=hM3qCTWceMBA1Zq/rvcfYLYAS4WAAYHU+o1ZBQr19HPpp25m8m8KKgCJ8q5EwXACnGv8g2lfG8JFve4Z1yyUILgKw13nnQmJqGmOb/OGDUWYnEHLuXKtBzkvLi7BkoHUMuKJthUPoy1qyWqS8/0wveO7o1MrD6z4XIttoc47n88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403749; c=relaxed/simple;
	bh=WY7dkoHNxdfw3FP1Y8UPHLwUUxou+v+KbEKXraSJmdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iqsBWw1eIL5jF6wLHCJYacO+IO+y8u6sjT31B2am/8uMNWDuAkR4UnjnJWqMBlq27HtZ0C/oCfWEX8kr7IlH1xLm/wsvGyvwXMHlNi7obEGgLOq7wyzKkI0JWoa+hLpDTQjnfukE0abgJQMmnICVSDCIAoWgXpnXJc6/inUQ8j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vcnxa2RM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vcnxa2RM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FA1B1A1271;
	Mon, 19 Oct 2026 09:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 623F560582;
	Mon, 19 Oct 2026 09:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C51B10328429;
	Mon, 19 Oct 2026 11:55:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792403744; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WY7dkoHNxdfw3FP1Y8UPHLwUUxou+v+KbEKXraSJmdE=;
	b=vcnxa2RMnNL2AJxYf35XTCw5sY39XqS5dnoj3MH9sIqq9iBKSorWg38+IRx9O3Om3yiDs7
	5Slt8dhe5JAlVyu6Ji7ujjss71YjJPRpcPAiKQQ8wNsytOClTg6sb6xw/w9delGgaTa92U
	jeMHRUX8CR7BljJgxe2yTPRrk9mSpH97hgqp3Q3ZcuP+UhAJUam+qNan/NC7YQ7zeD1W5w
	XDwCSZF4E+FPMxMka8XSq5aawTNestnLVhP+GapEuMaI+wtQC0TZdCFVdrpKCf5IDwZBlM
	GRaSPpizIFSXKVX0Jt8fkFjhhuGmcL5ZjOffXzoYVSy3r3ImOVy3nfoo5+dTyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,  robh@kernel.org,
  conor+dt@kernel.org
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
In-Reply-To: <179224878757.859276.836775392883899374.b4-reply@b4> (Jerome
	Brunet's message of "Sat, 17 Oct 2026 16:53:07 +0200")
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
	<20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
	<sashiko-outbox-173157@kernel.org> <877bjivrf5.fsf@bootlin.com>
	<179224878757.859276.836775392883899374.b4-reply@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 19 Oct 2026 11:55:43 +0200
Message-ID: <87cxt6ypy8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 17/10/2026 at 16:53:07 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On 2026-10-15 18:50:54+02:00, Miquel Raynal wrote:
>> > Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>> > - [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4
>> > parents
>>=20
>> This is a pre-existing issue. I will wait for the maintainers to comment
>> on the rest of the series. If they ask for other changes, I'll include
>> this to the next revision. If not, I will send a dedicated patch for it.
>
> It is too late for cycle for this cycle and I'll wait for rc1.

I understand your reluctance, but in case you delay the clk PR or make a
second PR during this merge window I'd like to stress the fact that the
very first patch of this series is actually fixing the probe of the SPI
controller on the Nuvoton platform. The rest is general improvement
which makes sense to merge after -rc1 at this point, but in case there
is still a window, I believe from a maintainance standpoing it makes
sense to take it.

> Best would be sent the next versions without the DT stuff, so we can apply
> the series using the cover as merge description . It makes it easier for
> us to then provide an immutable branch, should you need it for the DT
> side.

I don't know what is the canonical way, but myself when I apply series
with patches that do not belong to 'my' subsystem (typically DT patches)
I do apply the whole series using b4 using the cover letter and then
just `git reset --hard <before the DT stuff>`. When sending the `ty`
letters, it just states something like "<no commit>" under the said DT
patches, which is perfectly fine. Most maintainers seem to just do that
given the various `ty` letters I receive when I am the contributor.

> You can fold pre-existing issue fixups in your series if you want to,
> or you can send follow-ups later. Fine with me either way.

Since I will re-send it at -rc1, I will include that extra fix.

Thanks,
Miqu=C3=A8l
