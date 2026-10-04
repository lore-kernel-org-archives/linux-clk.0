Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E42448BBB
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148755; cv=none; b=L1SaRpqeZLce8Mr5/H6f7IOPx9POluoLBWU4SZB/64IuCxjq42vBuYxklEfaRAP3I2E/GSar8J4yh2PTbGsFq6FNabIuf8EoKj6eGyLl+Bu+sTylByWoWxTpBkoZpNQq/BFtDm3ewSSHbU1izigFKHsecvpDRBCZd/UScY44pys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148755; c=relaxed/simple;
	bh=nGpEuimdXJJK+grRLfCMRLAmaHZIBGbXbdnVtIzeM9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oOAjmebQ2Ij8w5Roe0ilKXLR22u/E5JMEPK2PAim9yREZuvf4Vvs9uqGL5TB95cWYb/tQGL7kPN8USAkmtexGdSXMpVNf9wevr2tktWlTgETPFRPBoLEpfDmvgdya9V4JbDShWkSIf7vSbYCa9qQAFU5khDbXxYqNoWCzm+qUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B5t/Xuev; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B5t/Xuev"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 10E101A113A
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 21:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7862604FE;
	Sun,  4 Oct 2026 21:19:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAB331032820F;
	Sun,  4 Oct 2026 23:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791148750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nGpEuimdXJJK+grRLfCMRLAmaHZIBGbXbdnVtIzeM9A=;
	b=B5t/Xuevbe0azs2bAdTacTXq1ubkPUXqy5Bi43QtKNH2wB0H9T6JzevRp7Cm071+DPyWiT
	KY82EQCoUwnnHEoLbUxTqISYUCAXG2+3f9eCA1QlTDbYVs0mAXgCkYCF0r32UGgs6Gfndi
	DMCC9FFEpwieYXWER6YMfqDx8PCb7cm0ksQ57tT9tq0EgIkOfubzfoeZ6utX/I18IqbIWm
	jcyTkDF6a2m8nltcrApCDEsSuGqWuZ9BZjywz9DLzZy1/Vdj+ubm8c3mMvTijjakmLET3b
	si/wfYMxLqRTF3ABbcKuxV51K9yycw2tDNX8+1VW6HZExUlWz3pBnFgtzYiLmA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  linux-clk@vger.kernel.org,  robh@kernel.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <20261004205551.6279C1F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 04 Oct 2026 20:55:50
	+0000")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
	<20261004205551.6279C1F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 04 Oct 2026 23:19:08 +0200
Message-ID: <87zewti2pf.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] clk: nuvoton: ma35d1: Modification of global static state
> during probe

There is a single clock controller. Should never be a problem. I can
certainly move it in to more local scope if someone asks, but it's not
practically needed.

Thanks,
Miqu=C3=A8l

