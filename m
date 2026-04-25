Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713F830DEA5;
	Sat, 25 Apr 2026 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777140372; cv=none; b=QUaB2v7iUbt5pRViPLi+My32gc+tEqApqY7vRFr0qxxnXGnzUfCIs7h5M85epLW47k2zS69DNp4065XXy+Zuw5diCmcZ0VvmuoPSmyn16d0bUxkQn+Jz2a0D718eebDiPvQT/PBjD/9jOjtfkROZsoTSruQan8g55Pa9//S8pWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777140372; c=relaxed/simple;
	bh=j4x77fxXY22WXvwryDVC86O+Q1rVaLtByjJ8OgF8+LY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qTEP3JqieCN/LMQV2MKRlC7NFbuO8e+hf4k8KMnmn4SsbPlwRRGN5SDScCCptFXZgsO9A/auiHwC+iaX+8Fdz4LJ1Sc+329KeaVCDctOgE2ZMoK+SnAD/cW/Jh21KnOyQVStcGrVutb4WRT5iVIYIrbiLfylNwYJwRZnMh4TtD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNx3KmxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNx3KmxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B6CC2BCB0;
	Sat, 25 Apr 2026 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777140372;
	bh=j4x77fxXY22WXvwryDVC86O+Q1rVaLtByjJ8OgF8+LY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LNx3KmxQLFWN1Dw4QmBHWaAWOVmT4Y4Xxe1HAiBwWQ4J4k4rr55F/Y3BibKZ6toiZ
	 bhXCBd5xVLlLEkaud+y2P2as6atWflgmCCQk+X66PEUknK9Up7u1SS8fEeVfuF2pC3
	 mCk9qz9MgDJ1WTqtiUS57pkkhVB0H109kalsH/ZHr47J2zIoCnmYzZI88nxKJyci/3
	 kTArO8m3uX9tI66kReEM0sECs5YWhi8it+HOZyCyOx02FxPJxA6oNgPGqIkjteWsmp
	 PdK28MdUCOQIHzBwT6ecef9xZZ+l/K0/Hh6kqsiWze/7jpSwc1CYQ5jRQayF+SZ37C
	 /2F4G+Sbvqp2w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHk-=wiKrwKPye8PRhvHxY3DB6cq+_Xby-OAigJOrcPHEZbDjQ@mail.gmail.com>
References: <20260420183208.2287306-1-sboyd@kernel.org> <CAHk-=wiKrwKPye8PRhvHxY3DB6cq+_Xby-OAigJOrcPHEZbDjQ@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 25 Apr 2026 10:30:33 -0700
Message-ID: <177713823341.5403.13182816167027469071@lazor>
User-Agent: alot/0.12

Quoting Linus Torvalds (2026-04-21 08:45:33)
> On Mon, 20 Apr 2026 at 11:32, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> >  179 files changed, 19422 insertions(+), 5066 deletions(-)
>=20
> I get something *completely* different.
>=20
> I can approximate those numbers with "git diff -C" that takes file
> copies into account, but your summary just then has "create" and
> "delete" lines, nothing like
>=20
>    copy drivers/clk/qcom/{gcc-milos.c =3D> gcc-eliza.c} (74%)
>=20
> to indicate that that's how you got there.
>=20
> I do see the
>=20
>    drivers/clk/qcom/{gcc-milos.c =3D> gcc-eliza.c}
>=20
> in the file listing, so that must be how you generated this diffstat,
> but your summary is then very misleading and just says
>=20
>    create mode 100644 drivers/clk/qcom/gcc-eliza.c
>=20
> instead.
>=20
> How did you actually generate that diffstat? Very strange.
>=20

I merged the tag into your tree and then diffed the merge to the parent.

  git checkout linus/master
  git merge clk-next
  git diff --stat HEAD~..

When I used 'git request-pull' it gave me a super wrong diffstat. I
forgot to add --summary to the diff command above so I didn't replace
the super wrong summary from request-pull. Sorry.
