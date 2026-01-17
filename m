Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC442DE703;
	Sat, 17 Jan 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646423; cv=none; b=lWKdvEFugLUnJCCnL2UIXpLmtkyvMHfVy6G9X6Z42l7w3/ovpM2F6W88B6SvyZLb3wVudcIKtVyQRCAGbNaQR6Meo+Fn50obSIbEUc9NEhBUR1/TeK4rPDjTELBgauSzTpTFkb7ydxzBdKAzUJL4qdWo9g05yem7QoygZs0PWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646423; c=relaxed/simple;
	bh=kf9avB/lhw73mPXfr34GUiIIOkMsvl/VIP3bJHLRYyo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=OaRn528aQgYk7fY2XlRmrGGJto58zy+WEX6KRE/Dk071u8UYpgi5xJCs0KUkuUYCLaluf0bSN9ycswYMK8sTvdx5eY1QMV/Sm2FqiCsZrPPxyEUUzaG7LPgZloPz9TxwjNv0X4UR3QKH19ZLtI/R/z691yCWEcCLWN+g4CIv38I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KIIxwLUY; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KIIxwLUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768646419; x=1769251219; i=markus.elfring@web.de;
	bh=DMaW+KN5Sx2t2n31lU1i9+6bQFMxr+o1OpqLuDe9FwI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KIIxwLUYUcpmZI3PYvK9jsXfcSGYdDJpTek1W5xQ0WAK8vHa4qq/KB+pC0ub19Xq
	 vs1MiHQCfNR0WGfI0oOg7Vkg5fd4ZwBIK4uByKmfoI52aK/8qqOHuBhAwpFXOr4Gp
	 2ZYb6CukIcwb0/VUwrOMaBd9WnPnINm9s9IvVjnxkIdTBBj6AFs/jyBOX9MEZdHQE
	 gFbFoObbFsaKqjhb1T/CFjsCqoPb2tcNewzT8/a1OMgNElyJ+xHD8tSy0644j2Umi
	 QXPKy9xhdwYMFWTKCRR0FoebUhX9nqGo0VWUvbVxOV2DrYtYqPH3/3uH9CkLIylHH
	 hZjLuaMX4Or16+tXtg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.177]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7Nig-1vkNe30Mqi-007ibJ; Sat, 17
 Jan 2026 11:40:19 +0100
Message-ID: <d50f9bba-e487-44bf-adc9-5a08b6e224c3@web.de>
Date: Sat, 17 Jan 2026 11:40:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, linux-clk@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260116113847.1827694-3-lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH 2/7] clk: st: clkgen-pll: Rename some variables in
 clkgen_c32_pll_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260116113847.1827694-3-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+Epq10jTPrt21QmKbPZEj1Cx+QGQFSqKslBAYxG2sOuwtO21KQZ
 YgX443wMp4ooS1NTaufuEbwtIFbL4NlsD5rCITYG5CMCd+vNHjOs5Mm4W0p3pc/Ny1Ab747
 tXL66e9Lls+Mfu6EGI1JxJC89kShxClGcIuUo3bZzCY+QGq++fCB9p0HO54w75gx2hy4wpy
 nJfdU16zhXSsMg/Oxh11w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FpryArB26/Y=;GM7yV3yg1KPk62GURn4xI9Xcv7W
 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
 v9H1iWfg=

> In clkgen_c32_pll_setup(), `clk` is used for two distint variables' name=
.

                                                   distinct variable names=
?


> This patch rename =E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc5#n94

Regards,
Markus
