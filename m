Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A73E1681;
	Fri, 17 Jul 2026 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276772; cv=none; b=GmMmKLB8j6rO9tooJfO1KGjIVKlpEBfvePJRIggxjMCKTNtlfIginDbhwqvOap3Vvr8wXhfvPoAxffkxr2s2EiJCr3Ny2ABUJwP4QPek+DLK+nc2bGW2NGG6FI++6HGO7y+tqZ4KgwBq9bwMMvKdF91U74c7w+JhNvzCiYEUA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276772; c=relaxed/simple;
	bh=qOf4KWE5579OXc/FTsEwoWFUP6wugOAh8wK83ntVp7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Npp7aKjQ9X6GBk+/pVyiWNxICD3H3COMyKkp7jI7X0iubni6U6FQcoMl4rOq1sQjaavSlKXZKUb/NrZXTAbMHyC8tPft8v7j0iYjBZhpyYzH/56idEXT6+2LOnWPUugBqh6+bT8TYq+aD/Ez2Sbf/StDiDvGa4XqY2Hcgb66n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rXXvwV9r; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rXXvwV9r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C6C61A1047;
	Fri, 17 Jul 2026 08:26:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E45EC60361;
	Fri, 17 Jul 2026 08:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 957DC11BD00C6;
	Fri, 17 Jul 2026 10:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784276764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFgb16gYZcQxOrWe2AYP5WgVgjd5v10MyTlmo0Qotiw=;
	b=rXXvwV9rFtftDsTDjTerfEqcyRwmyZC3pW9tyTv0Sqa/PNGSN1llUy4D0lYKVkBtIadCqz
	GDWuUQQCFYBnLMM4yP60s1q+6J9H09Ua4h6S+pOVyqqLUi8ma/pjCCspOi4Hqa24ATQmZ9
	tH94GQ7lY7xlwA3jtB3ZditO+im+MQMxOLWVCUM3eh8O3k408cgHDEVr2U//epgvE/l5/7
	MOVDBhPdzNpVxRh8jbaioyk4qUmTjyzUDSpOkLfMCl3/0g0YlGSXeXbx4mxNONFs01fLqI
	VhcvS8uiaenYNxPiJGkEm8RiNLyUe0e8vOwR+CABvxdkuBW4yh6Lx3QUOvh+7g==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
Date: Fri, 17 Jul 2026 10:26:01 +0200
Message-ID: <dUZ-Y63mToq5Uy17STAyZw@bootlin.com>
In-Reply-To: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com>
References: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Wednesday, 17 June 2026 at 11:25:03 CEST, Beno=C3=AEt Monin wrote:
> Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ7H
> SoC. It has been posted as a patch series previously, this pull request is
> identical to the latest version posted[1].
>=20
> Alongside the changes to the clk-eyeq driver, this pull request also
> provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to the
> reset-eyeq driver acked by Philipp Zabel and a small rework of the
> fixed-factor clocks reviewed by Brian Masney.
>=20
> [1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bootli=
n.com
>=20
>=20
> The following changes since commit 5d6919055dec134de3c40167a490f33c74c125=
81:
>=20
>   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.2
>=20
> for you to fetch changes up to fc58615596c5bd701d868813ac595489f3939d83:
>=20
>   clk: eyeq: Add EyeQ7H compatibles (2026-06-15 17:42:32 +0200)
>=20
So, this did not make the cut for 7.2... I am wondering what I should do.

Should I rebase on v7.2-rc1 and post the series again?

I would really like to see this series merged at some point.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



