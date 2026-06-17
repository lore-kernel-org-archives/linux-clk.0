Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BA23D7C2
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701458; cv=none; b=snQZjbHHOpIB9ieQWosrflf4bl7ZXW8ZcMh6YIw5z2jkTOWxy3YF0i4LrKL2qQhpPdChFSRPdW/VOvOsl+NEuznB3FXa2hCgvkJAJ55HZmUbO7WZ5kxBqc53sE3qQ2k7X07ONMJF91gC+BvGTSyrXLgC3CiEj97zWE4r2zxqHVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701458; c=relaxed/simple;
	bh=RlnscID/TiF1Iv3AL2ROD7+wNb6joOqpHkR6faz74Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkmz+5ntPej2EJoc3lI8wTFzyoqVDI2YjaKX4/yOtANMadHY+U2YJ+cWEsI544lIiOoo096EpwWwMFNKOtYrENFOqvRjmbri/0eW178zPa8LshFiHVbKn1PN0mkDJCGqLyS0SIeZ/dg0s4T+oANqLEt9iJsCkLyQ7FPoKcPg8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TaNJdn0C; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TaNJdn0C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFD54C24608
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:04:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1953601AA;
	Wed, 17 Jun 2026 13:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5DBB106C824B;
	Wed, 17 Jun 2026 15:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781701453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9bdLJrjRf/kUy3XTODZBz19qwZtFYJ5qXvKut2QTWWg=;
	b=TaNJdn0CnKK7aDA7vt+bbz/+WN0rY92JwMCbP30XkYjXTfDYYSL3YMXEOP1iHA0DJyuiV2
	XZQ54IPMhbjWDcJBtmg6ujO/LXin+aRcvP4oPZcNJ9QuUW7wRJGiCWhQc+kIedLv8a4pk7
	OdZ6GhTgjxUWo/95z4+d82bcHEdsHKKTh/5+k9ElmUQQYRtwoAkH1qNDPSIcFh7jBmqAkR
	GFP4m2VEcSLJvpSCc9nJoUmFOh6XSmX5/in9fniCxut1HbrrCdvtaEHRO52OjUCfopIEMh
	Z/cnAzGOwrSP9J+rUSeHNAcY8QU6FM9fw045wxi+73QISbTIl7O5WzwfFJd4Sg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
Date: Wed, 17 Jun 2026 15:04:09 +0200
Message-ID: <55Q7Bvj0QhWyFjlQP2EQZA@bootlin.com>
In-Reply-To: <ajJ8OSemkwebmolg@redhat.com>
References: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com> <ajJ8OSemkwebmolg@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Brian,

On Wednesday, 17 June 2026 at 12:51:37 CEST, Brian Masney wrote:
> On Wed, Jun 17, 2026 at 11:25:03AM +0200, Beno=C3=AEt Monin wrote:
> > Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ=
7H
> > SoC. It has been posted as a patch series previously, this pull request=
 is
> > identical to the latest version posted[1].
> >=20
> > Alongside the changes to the clk-eyeq driver, this pull request also
> > provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to t=
he
> > reset-eyeq driver acked by Philipp Zabel and a small rework of the
> > fixed-factor clocks reviewed by Brian Masney.
> >=20
> > [1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@boot=
lin.com
> >=20
> >=20
> > The following changes since commit 5d6919055dec134de3c40167a490f33c74c1=
2581:
> >=20
> >   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
>=20
> This patch set should definitely go in, and thanks for setting up the
> pull. Is there a particular reason that this pull is based on rc3
> instead of rc1? Stephen usually bases his pull to Linus on rc1. Ideally
> Stephen should get the rc2+ changes directly from Linus. It's no big
> deal if rc3 is needed, but the dependency needs to be documented at
> least. The reason for this is the unlikely case that the pull needs to
> be reverted.
>=20
=46orgot to explain that: It is based on v7.1-rc3 as the series depends on
fixes to clk-eyeq driver that were merged in that version:

    79a1886be156 ("clk: eyeq: use the auxiliary device creation helper")
    a25ab518f355 ("clk: eyeq: add EyeQ5 children auxiliary device for gener=
ic PHYs")

These fixes were merged via the clk-fixes tree.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



