Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756353E3D86
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285832; cv=pass; b=LKBDOlFLQMTWCNGE8+gDnTngHBggygTjqQPItnhx1cf8L+2xL2lK0CQFjgVN3dCJFe3uenTtg0ggr6QymtSbYqeqdRZCGA8ml4Qc6iZgSdODcbibsWXoWTPk8/UOxa+sVcw29gQNfmhkETB/RSBlOmhChZfupdu64rk0RXvoz5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285832; c=relaxed/simple;
	bh=z6yQYjaMST7T9xNUSIrjeUD0tICeIpWttHt7BzVViNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2WNY39RcCryXTGyA+UkFA30WuH8mss/8YU8GghxZV0Txbgl2vEq/Jz0x6IrZDITfTGzEtFFUI6v7ivLqJ2P6BHIkeIRnOWIFTOF7O2Bu7toNY8t4bgw1rHJj6YKmHQ0/H9Sjh/Wb8rO1KeYVNTlsOvTBY0RegLPCR9QmGIkWvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsndF0K+; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsndF0K+"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e6f83f0bbso33489685a.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 04:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285830; cv=none;
        d=google.com; s=arc-20260327;
        b=odm2MujCwjnsD54/AFi4C910Y5xLqzxshP6B5mjVSZ8iLfXsMRY4xww//ZqSj1hx5P
         R/IC4sB0SKGvHoO4TnX/hsKpxs5tRwjtvfRxX6TzTUYXwkZH6VnCMrHfv2OxDY521Gh2
         xAi/9yigeOWEEnvZq7DCHxMi0TE1gEypVarKkMma+Pp2JOwTOwUhBewuS2emlfcXUKRj
         nwtVO6aRY4ZkDAX3AkFu+bgD+ShdhY/0lps0shcqfRfxDevPq9fJgnPa/G4oYQFaZ0QG
         WhNz8VlLKABsJ9m1Efe+C8WAUCbi4lG/Bw+98gwdrKDnUBBHbwSqBCwJztE1yLvcwIfU
         szsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        fh=ME9afF8YLJDq6RaRhzpU8VnhGpLZcMcH0nMaMD/xz5Q=;
        b=m7wOjnrLl3/aX/394qXl05mX2n33QgTKucjS46NT+kT9cs/1+Eixz72V7MFRHp+JBh
         QVNKfc6VieE3ld5JMjcqa7KAjcrDb70oTXnx2lLfkBG+KIhd0NKsTgXvCItS5IhL8VL0
         2ZkqzKOzirMEX6N310AnLcBiZ/9AfW1aY+H3PjxMyBdAWHWHpTGFW1k88TRrg3blSGvs
         Yug33kgxQQSKzuoKMJ6oQl603euMWYhwm9fgl9W9Sz7GVwVXdULuDNFusJhUyUY9Dn97
         PJA8Iap5dqwODzn8mZ3jZyW/e21M8QZuRnrnR1Knr1OV0YG536fxAfLKXDq3X71qS1/W
         Gk6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285830; x=1791890630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=BsndF0K+g9/ZkmvRNDqmJvpJdG6HRqy2cVfLyK7lN9EvtPDIqkq8RXXchf/6jwyKMx
         IRd8itxYfwzjhcvWVctS5TdglM0lfriQfABg1NHQFI935h7k65LNTPGZO5h6+EcjC2UT
         qDqIksZySIgOvPN6ZYj5RSFmt6QiksbvjF/FXabLebRG516Vzv4FEvfRzQdYhgeUVURw
         ax6v7zRiKbS4daG92ikFw9gyfVy3M5csfSqVrrbJuY2rO27vmVKBGS6y81vIwPO2kTXH
         QhT7XSg42h8miObe45OrxVa8PwKbh3+fWr++/ACl4TGauDxAyXFddWr2n0WdY5QV4YoL
         cc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285830; x=1791890630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m0nrJ3awfIMvMCI5Pc5TdpanFYz+3b7qYjatFELYqnk=;
        b=MjndHc0Z4b4JFm5Lt8NyuL3YwJ7mZ+yeRLSbm1P4qzU3nYieWkzx4Ertl/DLw4oj5y
         g1tm2HiCY7dt13J8CihKp6w3BDTl3r2Q+vrkpwWrNkPytbY+6q9l9mYdI713v80ZRj/M
         w9yRgXLEBQSLyb4dzy5GKaSC0RryRJyfUiT46aehYtvwhBM7QethnhLYGu5CLWcFkQ9H
         biYe9Cls7yG1TDC8dmaL4HFNyCTHbZxlAojlErNMDBOipRBydU659Zcc2FK22ycwD0pp
         exhyaPan9NtG2Bpwst4NOnx9u7vyP/noLte8eWQXBNnd0/mA0z4NpgOt6VfakEDHxF2o
         fxXA==
X-Forwarded-Encrypted: i=1; AKwUvBz3HLR+zzzwvXuM25G2tYPTXnsOPLNjcklmKoBPnhyfoQAiamTUm9iw9/mhzjaWJUUZR2iaDwIdvis=@vger.kernel.org
X-Gm-Message-State: AFuF++lpI9Ip3tOpTbSzOywi5W0+5HsOogSPfodKM9eBkze8DXdIr1Io
	uNFaol3DVSNcmptD7e4a1OyU4QdQTDuKPumIdSbvIPNl0uuALZ5SsEDNCj66xSUztJ7RKxAw+J9
	/QlGBIEWh+yGjwjOPdSB5rc65fH32LTk=
X-Gm-Gg: AYBFou0bZbcraysdx6VLRDTrzhR92ZKAl5gAmjGC7nR+HDvEpM+ad+p/pkZyUk5paHf
	IEjWHlRh6r3idM62vVImuy1ExKLvuozd8IKqir1vsA7Gxp+zFKicdLsef890ubkNBvJOV4FF6ig
	oW5ec+kwy2QCC6t/S7hx2LS6sFpaPfx9O29qduCiS0N3xfaxkSP/jhw9axY+V/dGec6u9HSJNwP
	l0K3+cAAUUixWiRiPhDenPvE/J4sJi0c+D7r6uaRazl6oSHlPRdOrt+JxKoBY3HJpN7tCDntZTu
	ezWycPa7U+B/sYyQtpke/uYM+s8urdkSRjkHi1XKeqZKX32Tt4L0/hV5CWYX2GahyvPpT22CS2F
	XaKxTEWDw
X-Received: by 2002:a05:620a:46a3:b0:93e:74e5:2b1a with SMTP id
 af79cd13be357-93e8f20be79mr176670285a.10.1791285830405; Tue, 06 Oct 2026
 04:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915125226.20579-1-ansuelsmth@gmail.com> <179000484817.707534.5059164498545591038.b4-ty@b4>
In-Reply-To: <179000484817.707534.5059164498545591038.b4-ty@b4>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 13:23:36 +0200
X-Gm-Features: AclHuK-A-f3KKOzsuweY0rlORNqVHnne0GeUJDA8hVjnwVqlWsoVNYQ_BtfV4wM
Message-ID: <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
<bmasney@redhat.com> ha scritto:
>
>
> On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > clk: en7523: Add support for selecting SCU serdes
> >
> > This small series is a split from the Airoha AN7581 USB PHY series [1].
> >
> > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> >
> > Changes v2:
> > - Rebase on top of linux-next
> > - Add review tag for Documentation patch
> >
> > [...]
>
> Applied, thanks!
>
> [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
>       commit: 11952173d8a180ac05641775f80bd6946327478f
> [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
>       commit: 4e39820b601221997cb2220edc830f92367cdfc2
>

Hi Brian,

is it possible to have a stable branch/signed tag for phy subsystem?
Commit 11952173d8a180ac05641775f80bd6946327478f is needed
to permit correct compilation of a airoha usb phy driver.
