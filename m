Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30B2C21E6;
	Wed, 12 Aug 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518668; cv=none; b=kwLA1XhEghtYEthq98kYs0WY+/8L8f4Sqiz+0v4ijSh2Ovgrv0Jupt6Rnl2Ps7hbTOzrbe6HWf/gCo3NwlPaMyaFNO+JEmJac4q9O1gdGQfTUnY3DdL7vQMijnqv+EcXzTSMTe5IzLq/jwR/LFkM7kQUEnZ1i52jrTkCZL+2ihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518668; c=relaxed/simple;
	bh=8CT7fuqIXGKPTgIYXZNJCMYNBstXXuvxUGDNQDv5nG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4Uge7WFczN8+bNLBcAbtnBZnZmSVSZGNaBQfA6hZH/I6I3hUUm3XpusVJGC3XsqiSAGO0LEH0ITwtoHquQAt+UpcZFsx7HhXqw7NHV+ArjP+sw6qvQzmhJszVnBTEoyqpX5fMw/BPscbRnqUh3KdziPQGm9bnDEVEtkk2P0Ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Td6m4XXD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Td6m4XXD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29E621A15AB;
	Wed, 12 Aug 2026 07:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E41D96045E;
	Wed, 12 Aug 2026 07:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEC1B11C4C199;
	Wed, 12 Aug 2026 09:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786518661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FMvXBS2LiPX7jOy5v0YilajvFrOePYTERShfhWrkTFM=;
	b=Td6m4XXDAo9hlz1xgnGvtFovShUS6AcBhTPuuOpwU+Thh3wzy9Nb7gQHVZkf8BIqUMWeLV
	6Hzv5Y2ody81Qjc9/8G4M2EkbgBKDwzWlJipn79obtl+H2T5GE9VTWg0ilPX2Otgl+UCrQ
	Rii9pSfb6XVTZV9sqjgtn+TsA7qrXGWmSpKEpT/d0Afzyrgej7n9wkzq/K+UIeZX7PcTdr
	D8xgglIIlF0fOcP9kUQy6nvgsVekV+udXOpfRTF6Nteb1PyDnDoWyFV782uRRfOYr+TILs
	ObJruWA1Am1AjG3hvA2G3fqYfTnGhYxme2sNOQBqPTWmikjQxOLb+mZdwJ5jEA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H for v7.3
Date: Wed, 12 Aug 2026 09:10:58 +0200
Message-ID: <QuiZG5wBQdGj3DlEKcJqBQ@bootlin.com>
In-Reply-To: <178651099021.5862.1840015036350433599@localhost.localdomain>
References:
 <RcAweJqGSl27gSWWG_TpDg@bootlin.com>
 <178651099021.5862.1840015036350433599@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Wednesday, 12 August 2026 at 07:03:10 CEST, Stephen Boyd wrote:
> Quoting Beno=C3=AEt Monin (2026-07-24 00:54:57)
> > Hi Stephen,
> >=20
> > Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ=
7H
> > SoC. This pull request is a clean rebase of the version that was posted
> > during the last release cycle[1] and it was also posted as a patch seri=
es[2].
> >=20
> > Alongside the changes to the clk-eyeq driver, this pull request also
> > provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to t=
he
> > reset-eyeq driver acked by Philipp Zabel and a small rework of the
> > fixed-factor clocks reviewed by Brian Masney.
> >=20
> > [1]: https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.c=
om
> > [2]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@boot=
lin.com
> >=20
> >=20
> > The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e5249177=
7482:
> >=20
> >   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.3
> >=20
> > for you to fetch changes up to 44af1b974949c8f2f7cca469c0c7eee481750309:
> >=20
> >   clk: eyeq: Add EyeQ7H compatibles (2026-07-17 10:09:56 +0200)
> >=20
> > ----------------------------------------------------------------
>=20
> Thanks. Pulled into clk-next
>=20
Thanks Stephen!

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



