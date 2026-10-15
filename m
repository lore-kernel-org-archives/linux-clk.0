Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE754529D
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083074; cv=none; b=AWVj2dIv3voRAuLfFHWOUBBtQUjdhol1NCBCQZrzCbwBWSRlZd5JMMu3pEiZfLFLR/RWexwHWAMV/TLOye2vVjM2LLSJVFuMO4eSffxcr8WN4LracLYUAkBerEAf3cLM/TfOyT1QzvB3/Pe28jf7XR65Gd4ke+oj9imj6FwrSI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083074; c=relaxed/simple;
	bh=+gN+eHbpvqXWWDtCmdUA8n+6sUZRn5xYwu7h88zKQvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EkhWIXP4qZyo1Awn/JAv3FLAN2ZkMaLapAHD+un4Kiu8oKr14O+Diqi3LiOzlhRbpLbUu9C1JwrzlT9skNatE18qEOr+H0Fza55WPGtMi9CT7QvQo9wOf7EyJo7BK7c0oXM/g6jTyT9NfOjr+dr7wNBjUFv7qoRO6oG4wy+nd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C08c266D; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C08c266D"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED7F24E41248;
	Thu, 15 Oct 2026 16:51:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A12D06075C;
	Thu, 15 Oct 2026 16:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 025FC10328B42;
	Thu, 15 Oct 2026 18:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792083055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+gN+eHbpvqXWWDtCmdUA8n+6sUZRn5xYwu7h88zKQvU=;
	b=C08c266DuaEI2T+0YSaPQ5Pn3fC4UKQzYrhEWxTE+KPHTATO+r4df4udlwhJ/bgFc9gJWD
	jtpzTUh8eiOQ+L2+VJ02pvrzaIoxFQsyJr6UjQ35NFf8FFnrE/QsmOre4Mh/RHMRhrn51H
	mwElXDkLo2ZcH1uC91xes7JQ+JUSgObol9xvbxV3fPEOpdDXqPhqc7FijAz9bQFuwsUCxZ
	qUZrTawxX95EJ2/pkJZv06cwqya9yHGDta47xyYLWJzIOFF/wZ1+YIh5urSwtv+ZnRjK2m
	pJA5G3BwyUOLrv/ZdYG68Dao/f2mpTga35aE1uaTyKEqvapRbBfJkSjWrurHWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
In-Reply-To: <sashiko-outbox-173157@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 15 Oct 2026 16:16:05 +0000")
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
	<20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
	<sashiko-outbox-173157@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 18:50:54 +0200
Message-ID: <877bjivrf5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4
> parents

This is a pre-existing issue. I will wait for the maintainers to comment
on the rest of the series. If they ask for other changes, I'll include
this to the next revision. If not, I will send a dedicated patch for it.

While at it I checked several others and didn't flag any (except the
other CCAP mux which suffers from the same issue).

Miqu=C3=A8l
