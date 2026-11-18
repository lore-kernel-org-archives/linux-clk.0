Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022190;
	b=CvHP4wcN5ZOkCjkmNpOt4E8juo8iKqIgk4rLc1LAJvMLj8rTfN1qr0Ztti5fX6T5p0Kq
	 lJ81HSmQhcrz+gX5Ak2kIjm/xqU0hO9QeSyzfBEJ3UGdH6q2yMOXdqP8BmseGOF/q8VJV
	 l/NLdLxkEqVkx5FsDNVcrtX4kbuc7qM897JTAXYBb5n5d4F/04FMgClu2wnlGSD3oW3gx
	 lS/FMWlROq8MVGBIHhutGIYkU3lS+NqJdT3sAYD+KUZ3d9uTpop9QiceYDkpXRkutXlKW
	 SiyFoicv2LJG6uh9d3kZRya7VBvA4/iGwMGT/xdKHV7iOj2Tcl8IwBOhdOeVW4YQzog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022190;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=JcG5i3n/enYidgqlQ6vBgqJiTw2tRlwgEdU7NIgWq/M=;
	b=Cq0+fWWur9bVYzAVIZXo/MyJT/0fSs9Us/KpwwvIEm+HWHKmJK0MQL4epiBudUd3oPK+
	 VrOVL7A+cM59iMrCmjw/EWRJkKEmw1f8eRLW1aTIo+de1T1t7x/g01lGuOUFZWILGnJza
	 0Qjhc6dO1Byf2fIvUusKZYvUSnSyzscBXsBa+HbsTm4imqZSf0BkwxEprQDrq2ZncW4+C
	 OgKmeelSpBD8kNMzhu5Lx3RItRk5j7+FUFA5Z3Klm96lr1x+Etc+32SaaBBQ5Urophz1T
	 WlC4V0FQBVMHu3XMcLwhX4ekjkc8+e5nJAx/bh8e2pQIYNhN6ybO1RBxQG/zhgzttdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=MDMIV7gp;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AD5606A325;
	Wed, 18 Nov 2026 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75AD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=MDMIV7gp
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id D5B9920DC666;
	Wed, 18 Nov 2026 18:16:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id B40A120D4CAF;
	Wed, 18 Nov 2026 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr B40A120D4CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1795022180;
	bh=JcG5i3n/enYidgqlQ6vBgqJiTw2tRlwgEdU7NIgWq/M=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=MDMIV7gpFlG4nWKnXQsyR2H8laq+en+JwUex05lJFXzBzE0m+pZAMpTmHq/mYFnhX
	 ETt2+pNDvKWDTSFUo+QIDbBiH5KXmQ/ESS/M8HGhZpr35hqRj9md3ip3C1KlgZb5eZ
	 vUBQ5j4R3PV8UE2Y4TaqWB2pjPohKozY+8duYsblm5XGZDmTbZtWNT66SaQP6mPk/+
	 zV9JEGy4wvx/EKCF/SFdcMG2MibDwPegaIXv/gBw52RmACqBES8sxqAJBZGZNiLe2m
	 Zg0qEf9Lnc2jIs6CIlT0liTD241SrtMPfIrAGKUrwQGzk5+NXbTZE8YYCgewBmLOBR
	 FT2Ro6bq5hdCg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id BA7VGU8kKTYl; Wed, 18 Nov 2026 18:16:20 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 9AC0920DC666;
	Wed, 18 Nov 2026 18:16:19 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Yixun Lan <dlan@kernel.org>
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>,
	Stephen Boyd <sboyd@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yao Zi <me@ziyao.cc>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Date: Wed, 18 Nov 2026 18:15:35 +0100
Message-ID: <20261118171536.197538-1-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118111528-GKD156369@kernel.org>
References: <20261117205951.140146-3-frederic.mahe@cirad.fr> <20261118111528-GKD156369@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

Thanks for forwarding it to SpacemiT.

On Wed, Nov 18, 2026 at 11:15:28AM +0000, Yixun Lan wrote:
> Access which register? is the PWM register in RCPU2?

No, the hang comes before any PWM register access. The PWM probe
first deasserts the reset and enables the clock, both in
RCPU2_PWM2_CLK_RST (0xc0888008, in the syscon_rcpu2 range), and that
access hangs. The PWM registers (0xc0888300) are never reached. I
have not tested each register on its own (every hang needs a power
cycle), but I can do it if that helps.

> It just happen to fix the issue, but doesn't sound like a correct fix,
> usually, it can be fixed with correct clock topology

Agreed. The vendor kernel never gates this clock either
(CLK_IGNORE_UNUSED in ccu-spacemit-k1x.c). If pll1_aud_245p7 is the
bus clock of the RCPU2 block, it could become a clock of the
syscon_rcpu2 node, and the CCU driver would enable it before its
first register access. I will wait for SpacemiT's answer before v2.

> maybe just "Assisted-by: LLM"

That tag was removed (1e035297ffda), so in v2 I will move the note
to the cover letter, as Yao Zi suggests.

Fr=C3=A9d=C3=A9ric

From frederic.mahe@cirad.fr Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Fr=3DC3=3DA9d=3DC3=3DA9ric=3D20Mah=3DC3=3DA9?=3D <frede=
ric.mahe@cirad.fr>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>, Troy Mi=
tchell <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney+clk@redh=
at.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kern=
el.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt=
@kernel.org>, Haylen Chu <heylenay@4d2.org>, Hung-Chun Tseng <alan.tseng.=
cs@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dab=
belt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti=
.fr>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@=
lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.o=
rg
Subject: Re: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BP=
I-F3 fan
In-Reply-To: <av3MI0wgou3pbab8@pie>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr> <av3MI0wgou3=
pbab8@pie>
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Hi Yao Zi,

On Wed, Nov 18, 2026 at 04:02:43PM +0000, Yao Zi wrote:
> I think spacemit,k1-syscon.yaml should probably be updated to make
> '#clock-cells' property mandatory for rcpu2 node? And probably also
> the other blocks capable of clock stuff as fix...

Right. In v2, #clock-cells will be required for
spacemit,k1-syscon-rcpu2 (on its own, since rcpu2 takes no
osc/vctcxo inputs). For the other blocks, I will check which ones
provide clocks and send a separate fix.

Fr=C3=A9d=C3=A9ric
