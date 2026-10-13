Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A652489892
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912910; cv=none; b=TNHyNOJEiJ6X0ntaUV5JTSi+gB4/Jyb0oBZu6L30LQIuCwAaWX8b4hJHIxXhXGpS4RFuMBwpHEGv8D4vmaw/EWO5TGoiul0Wj0QS+PMeqp8HFEi+LNVHd0BdMt717w+hx4GtYPqjWRkwR94OVb7i4KPVke6aINAR+cL1nO/kj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912910; c=relaxed/simple;
	bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=J2aR3VrFyjgqOTpnFBlxRHARvl3J1MYpzQ9WpJaNtZ5Z9M6ygqd8Ti2PBiu4wNxo2a6xnUIEjJk+zoXd2BAPPqMQ0a2DEI+CxAWM9Vi21fnFGj1Pi9wnGZW3aLs3pQ1GTKCtPh6fUEfP7HH8uJCn2yq+muzOP7XYJYpGtvZ6nzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gRlSCGAL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gRlSCGAL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c399641so32639575e9.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791912906; x=1792517706; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=gRlSCGALR1cMhSLmk1EHyHG3Cn0GUrKn83hB7XFmRmo7kC72Q+SetqF27sYJart/qE
         hrcCvlTC2AMIEeVyQ2qVVobbGwJr6kmsNuDcSk/rNLRXNym6lq7q7KBDe9jxx1sdXjfe
         4VVjD9y3KaHcphsDAguNw9kw0jndGyhnTDM8RTCU33TlaLiaw0eRFEJpAu7KG6SaqKgf
         VYjKJeBboSVJ6X7nhub//Mme6hwoli0Q4nepQlgvRw2Zgug+BuoQ1saLmd7hEgvynhpn
         EYppN18ShaB6Dn6jFhCbZNho9U2/xqTEmVR+JDsvj9j+rcXdzBJFVJrHD26IXeIfs9WX
         VdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912906; x=1792517706;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvXZ6HBIwKrdmh6LJViiFdMYKRVjXSvkOWi1JS6VLBw=;
        b=KZLjfOZ2D8JZd4FanMefoUfZ80jqa1DfSOfxiP1A3tagwbeeoQzUB9LerSOYiiGR+R
         ImGruJnkv8YxTYnPkdar+Gk4IgJePdGNd/QJRMsoulqwWlVyCfuuar+vr5OwdecJ8DvD
         q9N94kG52T0g+qFyhpxdMgmNvHrLiYgx2CS2YBIxdTmkW0ZQKEMaGnjpF5jngNe6HXJK
         7WBGH2IruXP5ZlylYdY0J6+PtwBfMX0QUCPXif8BtzPOL2jnwPyf5H99ouvHnS+UwbJK
         z37DSPLUzKY8FYDstO+PGLBm7ajz9B2pKzkgtEvELLfJua0lxhfQVBg+tVzHtMnDmRpk
         mbmg==
X-Forwarded-Encrypted: i=1; AKwUvByDFgMu1DsaYNJiib/vRjmPZryw+hO2T8OyFBj/Nd8l4vGTcmr3oivjST4taqR+MlyUxAaJVjwl7kU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8woOVFioKIK4rUskJxGSDqtQLSIWcLtSTfuQ/RXo0tVux2NIq
	HyvNwijHxQu/pTluz9btTaqnxXZVl17FG6wHQjnGSmqbXO8d/QhVHSgktP92b5PZ6OI=
X-Gm-Gg: AYBFou1rNUBgjkadLY+77Fb+qxBPLI4rVdIA5qomvcH6AoJoQAzp8cEozBqAmkE9pzq
	ZTSSQbZcF9JbcoafoHfnjKZPVSHJWjdidms//wUlGEUVDR8hgYZI3VgOUOdlUls1CO3jCYZhdq/
	V4cSNNrJ0gPAUW18ewaOzop9KTsG05SsoVaWQyat8qgh+acvNh10a4D/DFbjaqcKHeNjlYb+PlB
	ouNL65T+9a1sevKqxRKQ4wdgOHjrtTWgyrRRnDRPYSoDdOBSZDMSFYxec2sUpS20oTopQ9XwXEx
	O2rVROxEW70dNQcZjIBO8zH0QVHFjK8uMbiHZrXx7fGVc64nIU3EgDRDoy4Qi84Jx1hOTbqc3g9
	GyIS2nWNpy2fp4Ad7ebyNkaGjw7OuDIyG32UZCoKwtg7Mu6DLv7FxJ7zoEQ7QoRiOuOHubA3CsQ
	QQP9GQFckyCo/gTG7o/f2H/7qFAeciHRh90QIQrB/Q44bcIpBVftkkPnxqSjIVHhQLi4r+zazIh
	SXlWl/6fpQbSrcG8BOk3CUuog37
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr140466375e9.6.1791912906474;
        Tue, 13 Oct 2026 10:35:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm684245515e9.9.2026.10.13.10.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <87fqy9v82c.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
 <20261004205903.E62F91F000FF@smtp.kernel.org> <875wzhjhe6.fsf@bootlin.com>
 <1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
 <87fqy9v82c.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:35:04 +0200
Message-Id: <179191290452.266355.16355634952216272745.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PqaAprE6zhOL8p22rLBYn5eJgHj6opqszjk2fOReKAQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnnsk9M2LU0baczm61fbMG91GMrv1geYA09+f3eywDbx
 X9miKc2dpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAiJvmMDL9US31uKJx48rTj
 Tr1oeNhpBvlLn0SD1ANYbrnab2W408Pwv0T0g0rGeTk/SeEuic5eEZOX+Q18pw4oJwnf0Tau0tj
 DCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-13 19:12 +0200, Miquel Raynal wrote:
> Hi Jerome,
> 
> >>>> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> >>>
> >>> [Severity: Critical]
> >>> Does this unconditional removal break ABI compatibility with older device
> >>> trees?
> >>>
> >>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
> >>> removing its explicit registration leaves hws[HXT] as NULL in the provider's
> >>> clock array. If an existing downstream or older device tree consumer explicitly
> >>> references this clock via clocks = <&clk HXT>, won't the provider's
> >>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
> >>
> >> Jerome, your wisdom matters here :-) For me this is a false positive,
> >> because nobody outside this driver should access hws[HXT] and the clock
> >> is still referenced through the DT, just not provided by this
> >> driver. For me this is not an issue we should consider, let me know
> >> otherwise.
> >
> > Strictly speaking there is (used to be) a clock at this index so it is
> > not a false positive. Someone crazy enough could have gone through here
> > to get the OSC even if does not make a lot of sense.
> >
> > This clock should never have existed to start with but it got in the
> > bindings ... and that is the pain of dealing with bad bindings :/
> >
> > You've got 2 options:
> > * Removing the ID from the bindings explaining clearly that it conflicts
> >   with the fact this clock is actually an input according to the same
> >   bindings. I suspect the DT maintainers won't like this much ...
> >
> > * Keep the bad support binding in the driver: You'll need a pass-through
> >   clock element where the parent data is the fw_name and a fallback to
> >   an `hxt-fake-internal' fixed clock. Feel free to add a comment
> >   explaining how bad it is to use that clock and what user should be
> >   doing instead.
> 
> Too bad. I am pretty sure nobody ever used that yet (since it is both
> very recent and fundamentally broken) but okay, I'll keep registering a
> dummy fixed clock there in case anybody ever cares about that lookup.

Maybe I'm a bit too cautious with this. If you get the DT folks to ack
the removal of the ID, I'm fine with you dropping the workaround.

-- 
Jerome

