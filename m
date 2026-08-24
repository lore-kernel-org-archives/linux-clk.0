Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500B394785;
	Mon, 24 Aug 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571042; cv=none; b=Eb5VOl4Fn6l2u47Ix5KLNrCzJzHrC5SxbGW2S+Dr5cejVzsyBiMvrSGImdbJGFy2ftf6oWJSbKLP6YDRhqSuZDg48Z/KScPT83Hjephsx6h27xYQOwic2Ss0liF/ab4QqCCHWJuLr0TEaPbaFEZWxCT9vPIpj6W1g+VPGkowgDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571042; c=relaxed/simple;
	bh=DpZaxolkHv41UpgAlVlIGdJaJcfXz0Xm2mzbIAXfV/w=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=VmRo4IQHahHDjU8wxkBQTjZZPew65RlNAeREKtZJogHdtsbv/cbEob1ogu8+hQjT3zQ5v0MlCZLw+1BmXe+z4JPKVpMh9mYdryBTnV3k3WHKEHk4nLVQlugyttWp2ZMJOk+EklWpoGY4Z8vMLNAFchnitZdmCsr4xkwzgVpfT2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=r+cSb96j; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="r+cSb96j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787571037; x=1788175837; i=markus.elfring@web.de;
	bh=nggYN4YsAILJHqEe+Y+5eqJL6l8WcmodsLHHWpPYWnY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r+cSb96jhzTj7V4aaAIgfLKCDuuuE5YAihFxvAcyFqY2za2xlLaj+bwf/x/xyDae
	 LMuJxiUPltx4uIDI0nrpGlN2UXfuR98YtTZaAjq3i5qdresgSJeIfIxoRHawxKm95
	 Q3L1DndYtbicc6ICx2u1A9asF7/dG+WC+3DKdbEuEK4yp6O/YNHJhlIkzkM/Ztn2y
	 lkcvM9V8wluuRMMDLP0vVASFIVL42Ym1QW3h+TWejgyalqkAq3IidxUZpGbstEEFg
	 mzMplTY+3KYv3tOz5Yg12OeX61mm7s1DK7GoU+Q/YRj+3flFPYxeUlFAtCZSs8aWW
	 g3hwDIKUFt+2HNVZ4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MVJNT-1xOcig0NKp-00LSxt; Mon, 24
 Aug 2026 13:30:37 +0200
Message-ID: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
Date: Mon, 24 Aug 2026 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanzhijian1991@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Daniel Palmer <daniel@thingy.jp>,
 Michael Turquette <mturquette@baylibre.com>,
 Romain Perier <romain.perier@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Brian Masney <bmasney@redhat.com>
References: <20260821235837.2341179-1-hanzhijian1991@gmail.com>
Subject: Re: [PATCH] clk: mstar: msc313-mpll: fix off-by-one in clock array
 allocation
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260821235837.2341179-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nVimkJhDjN8s1XIzdkA4RZj5UcOKDSZtKv0TbY4dd2tkLhllAaQ
 0rbauhL5JdJcp07gPVfGMxtu3RRJmtMBUuZmtjqju+aaYmcVc9gICsTGWCxouXIo+HLQqtG
 EoH5PijUEZ/WDgbKVdlTL0C86n5ToZJXiqEkB+QAz668kr31OYEL98vT7UW1GHuKi5moubC
 LNBRWLke7LYA/xwm9Fw4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/CDZVxTcTs4=;OAgtX+lU7RPExsnWSgeUSnLyrR2
 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
 wO4JlfFllLA8vQSN+/9KcTaiEUENvOYb

=E2=80=A6
> Use NUMOUTPUTS as the element count so the allocation matches the
> number of clocks actually stored and exposed.
>=20
> Found by smatch:
>   drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
>   error: buffer overflow 'mpll->clk_data->hws' 7 <=3D 7

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2#n34


Regards,
Markus
