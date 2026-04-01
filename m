Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D437E2E9
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046616; cv=none; b=Y+CvIdU1/GAkKWYWUhT1L9q1AmO4c1rtdJAmCaE7JoS1KSpD+BwKNVz9kM73Ij4CHtE/xc3Cn74Tga50yZREDh9cLw81caNhIaEnhRzR7RIlyHAEV8T04P++kjd8LvF+34EVksOvbV1fH3WkcHMh7Q88YNZYC2oe8SNQn4Qmdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046616; c=relaxed/simple;
	bh=CJwMURgcqVdYm+JPirWJSROYcBO43Vz4rw2j1eWJIqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdBaCqXdsh5QXDelMbsrGxVVzw5zspeQ+HQW3YDeY6F3WULjqS3WH3yao3BZihFSLLtCGeQZilOlOzXZiNrwefdf891W2+AHL+Nz3wJW/u6PjpA08fTmZC0boGMe/atZ+ZMUSROoP4lXENCucwfAWq69jY1GNKjbOyqBjqSTVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sAugnzV2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sAugnzV2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62BD31A3126;
	Wed,  1 Apr 2026 12:30:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5AE602BF;
	Wed,  1 Apr 2026 12:30:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 313FB1045027B;
	Wed,  1 Apr 2026 14:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775046610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CJwMURgcqVdYm+JPirWJSROYcBO43Vz4rw2j1eWJIqs=;
	b=sAugnzV238mBDnlm0LxyxZZnieo/toWjI/pnbuCHoWEx9x2/2q3yF1lq/LzXCo+1Q0d83w
	EsxxM0+OWVxFkbviKuDM9z8c6DQ+J7dhWIN/PGdPiqLBwTm0tXHoe5yuwNpPgEomgstLvY
	UHI7qjmaXUTWD8ED2ZkoBiexGyhPZ+Kh4u0XFvnGk9aU2ysegdB/lLMEq8zi5Xj4YBo0QM
	tXSoyhKwU9cPZ/oH3bzPFvqAwGpBtUvk1aRAFK3VQ+UYW6A5HCQcxmEIh5Mqo6e3sURI8n
	cpO9tNGiM0SuzV5dUiP8NInZ1XXBw8tqHI5osoNgCUWPPPhS5lLtvkTWYeTDnA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Rosen Penev <rosenp@gmail.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
Date: Wed, 01 Apr 2026 14:30:06 +0200
Message-ID: <2787121.vuYhMxLoTh@benoit.monin>
In-Reply-To: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
References: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Monday, 30 March 2026 at 16:32:37 CEST, Brian Masney wrote:
> Sashiko reported the following:
>=20
> > The struct clk_init_data init is declared on the stack without being
> > fully zero-initialized. While fields like name, flags, parent_names,
> > num_parents, and ops are explicitly assigned, the parent_data and
> > parent_hws fields are left containing stack garbage.
>=20
> clk_core_populate_parent_map() currently prefers the parent names over
> the parent data and hws, so this isn't a problem at the moment. If that
> ordering ever changed in the future, then this could lead to some
> unexpected crashes. Let's just go ahead and make sure that the struct
> clk_init_data is initialized to zero as a good practice.
>=20
> Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and=
 reset driver")
> Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gma=
il.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



