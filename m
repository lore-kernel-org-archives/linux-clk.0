Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902D47CA6E
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905693; cv=none; b=KCrGC+WhrnzKqAf5NAfe1FYCTXAh5/ttkHT+zF/x4tHMuX3/c8RYt81QJFM04sZ9P0jNRuxnS3T5hmTKSX4DjLLdz4jDYt+8eVxxNt0IjTOcP8RGXTR5qpf+rGKGkrJghFeItN4xO/XeiHZzCrfn6aQqmV+GSr3sZAU+3txhA10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905693; c=relaxed/simple;
	bh=9YkribFOyXbMCiyj7msIj1rIVMg7oFHEc52XOLM71H8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=vBZ5NgG45oNwqaGn7wwC1rhN98rFz5Yt42Ts9ZPojDWVuVPXMCJ3rBmAuowgQr4/jDxmHAFd3GFB65A9Z4XsgBmQb7tfg5GGoPQ2t2m9tuqT5Z/sXIurxCObUMYuU6XLld7Eg2rP1zZj3bPCvPFDjvKjRUFYl6jBCpGuYB64gjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uwuirv7v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uwuirv7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CFB1F000FF;
	Tue, 13 Oct 2026 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905691;
	bh=z/5+cYKkSbbVxTmp8uwdBMzbKr5/BK/vd5mCakVyuC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uwuirv7v1YZTrPW5TqVEIPChJuwM9muUGO6pJxgG3/7atutj2kZY5rsHTmvcE+SnQ
	 zvadRbieHFtXJY2zBE9U6F4w39Gx9dGJOBbEQylDXgLnkCiITebFuOZYNByD9CSOFu
	 p/2jui9vjErTfm1iK0r3Voa137uOunpd5GrmlZeRMdcESMiDHOIbDMB4Nvh0gOLovU
	 NcBmjsNo+v32ta28bc0qU2O/laOhQn4+wXuGQ830xGmYZOllIsT250693G/D2ZXf2t
	 iIDhbQvUqamyYWZ3U+oiDTCOD+ubdiUkZLPCjtB63RobNLFso1gNGcXPAuzqBAQZdH
	 hYRJueIOJqMBQ==
Message-ID: <sashiko-outbox-170019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/35] clk: mediatek: mt7622: Fix memory leak on
 module removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OkNPTU1PTiBDTEsgRlJBTUVXT1JL?= <linux-clk@vger.kernel.org>
In-Reply-To: <20261013151734.3177690-4-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
 <20261013151734.3177690-4-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:34:51 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] misc: commit message inaccuracy regarding apmixedsys memory leak
--

commit d007de80a8548f3cad6c0b96d9c2662f93cc4b64
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

    clk: mediatek: mt7622: Fix memory leak on module removal

This commit fixes module removal issues in mt7622-apmixedsys and mt7622-inf=
racfg
by calling platform_set_drvdata() in probe to ensure drvdata is available.

>     clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
>     platform_set_drvdata() during their driver probe callback,
>     but their remove callback calls platform_get_drvdata().
>     This results in platform_get_drvdata() returning NULL,
>     which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
>     This leaves clk_data unreleased, causing a memory leak.

[Severity: Medium]
Is this description completely accurate for clk-mt7622-apmixedsys.c?

While this is true for clk-mt7622-infracfg.c, clk-mt7622-apmixedsys.c uses
mtk_devm_alloc_clk_data() to allocate its clk_data, which means the memory
is automatically freed by the devres framework on unbind regardless of
drvdata. It never calls mtk_free_clk_data().

The actual consequence in clk_mt7622_apmixed_remove() is not a memory leak
of the clk_data structure itself, but rather a resource leak of the clocks
in the Common Clock Framework because the unregister functions return early
when passed a NULL clk_data pointer:

	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);

Could the commit message be updated to clarify that for apmixedsys, the
issue is a CCF resource leak rather than a memory leak from a missing kfree=
()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013151734.3177=
690-1-akkun11.open@gmail.com?part=3D3
