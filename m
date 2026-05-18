Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A418372B51
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104629; cv=pass; b=iQaD3+PuLUvIAww5GyY4v94pNUaHQf1/OvD7RYWdbkrpvyUTdro+pz1dKLuxA4/Tg68KAiIqF0PhCESmdcnKEmAsR15ayGPQdwt1cY7ySyfl52gDdsPH7cBvGgQYKkyhcgX7+Pi5B2/0Esde+10SmWHSLczpdP36I0fkrqXcW/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104629; c=relaxed/simple;
	bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQYmYyHeaPLTrrL6/q1fZvSNC/4SrmAl+81izVD7eWw+6KP3/b/aT3T6/USvjkk/KNFZfhiS9xiSfawC924Msahkgvu7aF6xvP6Xf4AmfQ4WWdH854bfUoyhlOUPP7oDoWJXRpdcktG9oj7+6pl/TyagrTS+lgwlTNu1+op7QoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krFb0vYv; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krFb0vYv"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47cbd444fd0so1447450b6e.2
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 04:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104627; cv=none;
        d=google.com; s=arc-20240605;
        b=Ad4Z5pyNZzln2bcJpB0GxBio0YLbBHqcc8dMVMTFCaqFW/F9YXvU7dCO4MOG9OnHh8
         GPqLph/6w91tSIT41EMXDUVeLCNZk2QdHhnNzkv8kITbl3yEVYQHbp0KhnhQNvBapxnk
         /Cb+Gvbf8abBvf3+fFx/ztTSJl+4LTsH16tBSBR7ZzuT5PEdtbAh5OJi/wqFcHrNjSeG
         5eCSanX74QvNmLezUsVF8Bpgm4M4H3g+3qk8pGmS7jODWGdj2aP3PmbuAZhuB1rWcO+N
         SlcFX8luPrtstU1KxLstDLO+KkviqF3HKXJe3dfeUKy7kP9JzO/VgUrZMbblBseu3nRp
         LvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        fh=CQ0t3L6Qdq+Jt4N7c1oC99KZLiZZZ5j7AAPm9Jo1rL0=;
        b=jwaDB5TXZxBX/lt39UmmX1Pcy+gX3t31H7Df37NLi2+0JaeRIH+SL5ritH23nQEQWG
         aE6YsRM65MVvR6L+iOWB0oMr5nl+d6e7GM+l4MHQRqfTJDc+GLljv2rnzgzivrblggEZ
         YrD1jy7yGsVdJ7TlWD6/54fz1Vfs+i5wa95aPRrt6BSs+SPwq+SzZ+5Yu8DakkcZPejD
         /XjjE79ENjNFcFqIgO6Zz4gUpV9Pz0G/IpONCDd9QssSyM3QoEugvq1Em5sHnoPIp06H
         iuUoBI+km01Y6MlCu50IQjYZ1e1YAEaJcb07BOAjA3jxX29dVHIWf4NQ3NzaWiW9sHsn
         y9zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104627; x=1779709427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=krFb0vYvhGHSwdPLGfjo2Bl8bgsF60o5tn5Tx4QfZWInOaY9385QtflOf2BV1ludm7
         NnVBJ+5pNkYMfAnlkxsCpAsE5CwOVH4Tb0DP5rd1rzOYtgQDx2fN0uQzcgv5ukbnqdIp
         Rcdn6Vc1CdC3j3EhvMOebsXi8fPHdsnRTsq2bvtjLPrcdAOVPXaOynA70Yg+TR2IOdFG
         LxR9i5UMYgsgkaBTHAwduIt+SSAwY2nEol6NQbRLfeTBpK8RGYhqBsM4sNm0+TAwskoD
         WL9GgJ6jWN2zU0pFd6haXV6oNaW8IawTflwUFFJVIMWrRfbEg5cSERtj/+o/gFTmG7R4
         Evag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104627; x=1779709427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRAYjqwlB+OxplAp/qyDNTlYSuMhMlrxJbK2n+hb2TE=;
        b=pvYAAfCuIhRM1mwE4WJkbg+vKfK3MYee9XaO8fs8MbaKkfBf8OyVyrPGT7m69Qxtgy
         RqF7xVO7t/nbyotvcR5gSXqrZ+yttJovBDfcZIh+bsnvzfw3PWlhIKPxtbfZmqr8p90K
         Xfh9TeygNtGSpyAnTpOHGValTk8b7x92zGEn61W2sokn1oBPlFipI+6sl6u1ntqU7Lb6
         HSda0p73ccXzETq8koeS2Lv+VMi2ggH2y9CADCJK4DaUtYNqpkyHO69SR9JD25iYlTiR
         ZPKlu3kzah5tXZ2GnYocnGZp3XyMpbAsdRfdhe4NDhc64Sq13kM0SLVja+bURcg0cQhI
         k5vw==
X-Forwarded-Encrypted: i=1; AFNElJ8YSlnL6RXqOrCz68QeQk2YKmYzpilmWwFvYlVxdP0+KGCMt9JY7ejRHIr0Dt0UmQIEMwfemdLpEUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhmoeVuFMr4hDT0XT42NsdlKpg0suEgsiMyoBeFRmyh96N3cs
	/jgF0+8Mm0PjIvKL3e/w8W9YGC1tz2D1TndAhk2eLRmNtC2vMMg8kyY39aguXhdmlG40b7hahS1
	L9T7GKu8z3I6v1IJp4l2VcZrIZQtd1+SbhMQO
X-Gm-Gg: Acq92OE90AhCzOip2jxng9OFgKVlIK1sHAuCRKtRlbwVLP23kOi/WZ4HvlC0X3DF7KE
	nebrQ3Wf5rGEdyXx6kL+BKqyePBv0DzNKSTmcDBDZQd7Rm3oVxdLVb80S2CVyYhuJ0cUFLWi5fu
	rLevxGcrQzmfu6NJaErp7ngXyXatYJHV9mntdOnuv8oQKLWJHlJimAGKY8idKeSMV1MQdN112Hq
	RcOX03nNtcOLf70FyzuJd/nw+iGtwRZtjnrUVAUMsbIVHcPkoyLvUU59sxkUua1KqLf7Rdi3E5+
	KdKEum17G/5OOYtnbWiRl296bu5D6Rgitnb9
X-Received: by 2002:a05:6808:e412:b0:479:f9df:ab44 with SMTP id
 5614622812f47-482e576d9b8mr7135028b6e.35.1779104626807; Mon, 18 May 2026
 04:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <agryR7TRtYeILSeb@pie>
In-Reply-To: <agryR7TRtYeILSeb@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:43:35 +0800
X-Gm-Features: AVHnY4JxCy_yj0ct8SUGbokzSlNpNk15B0EZlHkNvjOJV4hCGN2eYVdaxEIO11A
Message-ID: <CAJsYDVLvA_ASpctsC_HKA6mUMqp93J58c=nghCeP_jWpzkaf6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:05=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> > Add the device tree binding header for Siflower SF21A6826/SF21H8898
> > toplevel clock and reset module. The header covers both clock and
> > reset IDs provided by the block.
>
> Would it be better to split reset stuff into a separate header in
> dt-bindings/reset, so it ends up with a clearer structure? This
> shouldn't cost a lot.
>

Sure. I'll split it in v2.

--=20
Regards,
Chuanhong Guo
