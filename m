Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B12353A86;
	Wed, 22 Jul 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727875; cv=pass; b=hwh6jNqx/vivZ1qC2ZlyiZFNglNMobxkEdVrpTY+7yvYy7IJDmpMoe2tpJ1cWYheINFaRWlO8B6butw9ik8ERnewi3O7BZMVZtvji7/7r4acy86X/heUehZv5QCa9O4RlT9ltKtG6NPfoHHhs2TGhIiFNtXbcmJE8IIuvsGLEA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727875; c=relaxed/simple;
	bh=BGNGta0Th1BbHantorEBy2MK9WW2yjWjTxgQGn2Ki7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDgbuMSEzCjI5vLoi/hMa7E9poniSFacy13f1Fx1iyJ1NYMYNeCsjPfoRZzi8ybVV1FLg9l03iBY/Lv3YnGIGkSd9k9gVIDpTO6QeUBG2ayNxZFvD5ZY7c+9xZv77L0NWIHhQIpv5jWlVL9tr0/UTdGwIH/on/9LJowDpaRA2lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=h8g7xu2g; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="h8g7xu2g"
ARC-Seal: i=1; a=rsa-sha256; t=1784727845; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h8tWv/wBPEDSBfIo/DI73iRDbFHi6RiaCVImxXmEgtIgy06N/KdSmmNQXwlJtlwvRZ8Ws3pE+JfhMQcbvemIkkSG00N6Q6z1BobqiKGTELk2mIN/dwo6rbGyjkzOnXIqudy40L+6wYU7MrvRy/qV15O1ThBsM3iqTOQjYd4FEOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784727845; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BGNGta0Th1BbHantorEBy2MK9WW2yjWjTxgQGn2Ki7A=; 
	b=DMYewNjgiNpe0C+Cm+cDQ7ekMukv8EOAg+FqPrc+2/QOswEHdCu/wTa4oJD6LgQAMvwLDwgT1r7HBcim7sGOhHxLKk/19NdeSJlm6N5QVVxpum1qs9ylbv6+GruKLJ55qIK6VYM90VSgs0h4SSDOkgEC1VQUrJgInxcUpiEbBGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784727845;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BGNGta0Th1BbHantorEBy2MK9WW2yjWjTxgQGn2Ki7A=;
	b=h8g7xu2gzADe2+6650Mi4Fd9f8IlRhciEePMNKtgYwoIK/GjN9aQtpfq5s8eLx0r
	YQlbfviEuQ9NjpUu0qwX/uejoEDU7nI7hhue0kbAlkFMQXv/sM3sTLxW4QS03P3ss6G
	hbKdZUj+xl700ISMi9tp5m85d1r/tCAUSy342ID8=
Received: by mx.zohomail.com with SMTPS id 1784727842465237.23228134706085;
	Wed, 22 Jul 2026 06:44:02 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 608C318090F; Wed, 22 Jul 2026 15:43:57 +0200 (CEST)
Date: Wed, 22 Jul 2026 15:43:57 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Alexey Charkov <alchark@flipper.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, 
	Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
	Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
Message-ID: <amDC9ZfBAD2xbhqa@venus>
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
 <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0111164-3726-4a1b-bc3a-0e678ea2ecad@cherry.de>
Content-Transfer-Encoding: quoted-printable
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.708.77
X-ZohoMailClient: External

Hello Alexey,

On Wed, Jul 22, 2026 at 02:59:25PM +0200, Quentin Schulz wrote:
> On 7/22/26 1:00 PM, Alexey Charkov wrote:
> > On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schul=
z@cherry.de> wrote:
> > > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > > Not adding Cc stable, because while this fixes a real bug it's no=
t a
> > > > regression, as the issue was introduced in the same commit that a=
dded the
> > > > RK3576/RK3588 support.
> > >=20
> > > I don't think this is a valid reason :)
> >=20
> > I believe Linus frowns upon changes like "it never worked, but we've
> > fixed it now" being submitted as fixes. It's been broken for years,
> > and since nobody complained yet, going via the normal development pat=
h
> > (i.e. -next) seems perfectly fine to me.
>=20
> My bet is because of the Fixes: it'll get backported anyway even
> if you don't put Cc: stable. In any case, I don't care too much :)

FWIW you are mixing up things. Linus does not handle the stable
kernels. He does the release candidates and the initial version of
every kernel release. The stable releases are handled by the stable
maintainers. Linus only said, that he does not want to get these
kind of fixes during late -rc phase. That makes sense considering
fixes also have a chance of introducing regressions.

But if patches end up in a pull request for an -rc kernel or in the
pull request for the next merge window depends on the maintainer
applying the patch (i.e. Heiko). The maintainer can queue a patch
with all those tags into the normal for-next queue targeting the
following merge window. This results in the patch being in
linux-next for a while, then being added to the master branch during
a merge window and then being added to the stable trees (as stable
only picks patches that are in mainline).

The maintainer can also merge a patch to the queue for -rc kernels
without the Cc stable. That is exactly what happens for a regression
from a normal patch in the merge window, since the affected patch
wouldn't be in any stable kernel.

TLDR: The Cc stable tag has nothing to do with Linus.

Greetings,

-- Sebastian
