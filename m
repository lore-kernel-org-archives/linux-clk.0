Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9443E6DE7;
	Tue, 25 Aug 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647575; cv=none; b=DQ5UrwXi8XuTCumezLsChHLzWERD/bZinxhCsiJqsvDTP+HFzfT28XtLaVjVXv2qCx+3FBrx8lUIARM7xsQUmkcj+1Cyy9L08+e/NxD4KjOfE7Jtt6Ke4hhLkTq9hhn86FxuociXJfZa9ddozn/ejDRQvjL34vvp2Q47KgiQ5qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647575; c=relaxed/simple;
	bh=8ywHHfmdMJ239c6PHrTrbAWJ2XqsSyinDElIJlqvfm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rmk/DFBQONAMFOXRaXJIHykk7DbDEIWQFkqV8sXmOzeplBOOWrWdUEtTvUfd9idkby2fSPlUtfVoVUFR3Yr220zH1RFIBxTCkjn42AqB8wf2uiFlWZsdrZIGbjUjWxJfjOyrwWBeRKWDzthY6dk4Y/akugjAp58TLUBmRKATlXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q+xCtlpw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="q+xCtlpw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 628EA1A17E8;
	Tue, 25 Aug 2026 08:46:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2EBAC604C4;
	Tue, 25 Aug 2026 08:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A97E711C7A151;
	Tue, 25 Aug 2026 10:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787647569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=igLyui4KrE++QY+Q+/cMeUhr4ggDBdcJ0LhU2V6Vfjk=;
	b=q+xCtlpwowWtdtxnpteKqaQ6Tc+7ZoJpBGpEgaeerAI1wtdi4Zlw6FNJKl2E40ij5kqx45
	h5XUHuvMMd7miKv6oeqGcQ1YjRRl8UpXPDtpC0hxuO0xNxm/yB36bIhTp0ZBE7Y0kfgzuL
	k6KzKS+imiJzgquawWGtjMnplXgFv2NOU3XMRKntLD+4fqW6H1Yg6BFFfrBbxtjEnfZ1YB
	xMAsT+5SCDaP3M+9Y6i8LUxHUMI/FjLfeuz0qJhcz3m6exzXv6ouw4auV863x0Ah+s0SMq
	fY8ht24dWPL6csVTmcvqVXcE+E88CkU0p0Yf9Z31VM/KWlLEDDOR/jIruxUk5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Ben Peled <bpeled@marvell.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: ap806: fix legacy binding failing to probe
In-Reply-To: <20260820214721.11879-1-bbanelli@gmail.com> (Bruno Banelli's
	message of "Thu, 20 Aug 2026 23:47:21 +0200")
References: <20260820214721.11879-1-bbanelli@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 10:46:05 +0200
Message-ID: <87fr02k2pe.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Bruno,

[...]

> Before v5.4, ap806_syscon_common_probe() had no compatible test and went
> straight from reading Sample at Reset to decoding freq_mode, so the
> legacy binding did work.  The commit introducing the test described
> itself as "No functional changes", ap806_syscon_legacy_of_match[] still
> advertises the legacy compatible, and the warnings above state only that
> the binding is deprecated.  The breakage therefore looks unintentional.
>
> Accept the legacy compatible in the AP806 branch so that the legacy
> binding works again as it did before v5.4, keeping the deprecation
> warnings intact.
>
> Fixes: be69e55df9af ("clk: mvebu: ap806: Prepare the introduction of AP80=
7 clock support")
> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>
> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Found while booting mainline Linux with U-Boot's control FDT on a
> SolidRun MACCHIATObin (Armada 8040). U-Boot's arch/arm/dts/armada-ap80x.d=
tsi
> still uses the legacy binding, so any board booting Linux via U-Boot's EFI
> handover with the firmware-supplied FDT hits this.

While I agree with the report, I kind of dislike the fix which
re-instates a clearly unsupported compatible, legacy since 2019. Maybe
we can start by discussing the need: wouldn't it be more sensible to
update your DT? The switch has been operated in 2017, almost 10 years
ago, with a big fat deprecation notice (which you hit).

If we *really* want to fix this situation, I would prefer to avoid using
the long time deprecated compatible. Could we instead have the callers
(ap806_syscon_common_probe() and ap806_clock_probe()) give either an enum
or a *get_sar function pointer? The former would only provide the AP806
one, whereas the latter would still go through the same DT check.

Finally, if we go for a fix, it should be backported, so stable should
probably be Cc'ed.

Thanks,
Miqu=C3=A8l
