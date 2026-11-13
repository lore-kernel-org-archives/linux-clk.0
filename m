Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530294;
	b=Dc9Ny4TUtygIpeh1xrbImAaZAiel505+oZK738MXzxvx2iX2Fe52LQveihqhCSN1cND5
	 +KgBJNTZDeS4suhokZbmGBtZBHoRI5W+/HBkjfZLLdJ8P441OhgVA7Pyplot7YXH3Oynx
	 pAUQyosC7MNYyEmvcNbe4rBml7nQdvkLkcc8ainzXYLJm9didjmEBt43Nu3Fy5u2zMavC
	 EH/mphJuqqBjvLJI2BW4oOHQy/ly6WgoOLmVGrvZrk2k+4a0cABTafygqBMW9SX2R4WQF
	 LraUxjKlsuXwQUrDV37G1Zkrwk+owWq6mRrdq0DTciufw0Yf83Dr9AkHer6XDg/xV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
	b=KsOFq9WR2GmJLHdAYB1lhIqzMG/DfRwGG8il8tIzxCUEZC7cPoDT2y0zh3LSXvw1QzFH
	 yaddGDaMk31pr0mN37Nx8Kw5bYfy1SnC/3gOoGpuRlYFTPYjz8bU5lKDB9BzxRMIphLZ4
	 Qygw2bS77sTV6qSpp4xPY5AvmPzz70FKi81AK3DvljHpPSoJGj2C0a4mDi7HraYGR3qcS
	 6aXehN52gnGNkQrU4k2UCmX9OXH34/yjIb1pUZttWUtAxR9ej9Ii7548h5Y7J1kyKd/Xh
	 rNRPkmg0thvFqZnry1NdhIcwe2z31D0ZO5EUqohW/WdYQEds1zH45zhJs7MSFfZJHkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hx8WV6GI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BB606A895
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 00:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712BB606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hx8WV6GI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6271245e9.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530293; x=1795135093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=Hx8WV6GI7COrYTUITlY83lA3f62jv3xrBMYJO3vPpozhkrFj4asH14WDng6QIkPr9A
         FRfwe07ZcGtuqaVBq56nrdgYiz5KiwN98vqSzWMPTOpq59lmQxTxwN3C8RacbNafNh6J
         Cu90jUZ0sdUl/LeTbo+RhMK9/mvOq/2a/fx/Y2hw7dcWBfyudhpSsFj51SFRG2f69XFs
         C+Rq2GaSED0uVYoq1LII/tm3O4YxvNLULJom7zFGbmq4qnR0LchSOlAKdeUBpRAXsDtD
         uZUxYec3QGwEIZ42VCSKGe1hlDYgw5H6G3P7hgKKMHSVU7LYg1meVBBXARarfVZmVxNp
         L1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530293; x=1795135093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=duoDFkSq7fe9og5fEiEDZZmXvPbbqJk+mbywRo7M0do=;
        b=zJwwuHs+lVPWdnganHhdiWc0asco1ZEbZz12xSfSJluVL6fEZ6OzcfITPIRaIzYLs+
         HrKmLk4e5nFbmyc2jPfi2QSpNz4bYPSStFhrJN0nN1QKYfGcItl1LAHLO7XNaeILtnJe
         yT6RpwZtRE71/AkpNi7cg/UI5DsUbllrEEl8Btcz4Kz1KMz8cwxNzCMpE76dsFSA1ukA
         GjJdmAgE47xueqOHb81YtHAQtcWySeK8S8l7Ml5I0zMG1JjQkOfVzo+VeRgE6YT86SHn
         xF8sWaiLOYYSK/qLlEe/pbfRPVTvCDzZJzoLn0he0qNRVxQoERhVSTwFXafXyozfkCsp
         6TUA==
X-Forwarded-Encrypted: i=1; AL+hErH4Li4VHeJrsTx+zHOdDkvixEU71SDbVrfd9UI0ZYy6GTy8fixWSqM7+2BgOCdEJ/4NOMbmVJ3/AsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nLcOf5Ur2hvLp6PDzO0V6cNy362BiXjo3lfcCOfRglBK+czgj
	3LpXJPLtfsMFyLubV2r6PxPZB3zJ5WO1nFKNrck6W6KBiQ+dOVjJY0LQ
X-Gm-Gg: AYBFou3rXh1bmTgj2hgaJ7ZK6reNHdkj3DMHvbdAY+uvG/BzGdL6VzStInC0abDtFp5
	z54iZkPxTaTaLdhuBZxaCBd1lQ+WT0uUN16v23O1rz2eBrIQrIxgBjOE4QeoZ2R4wAigNwmmNyA
	sOOw/fim8gEoXsMeopyVcNLnWvk71i6xbPFAzw2isL83G4QQ3xrqzuRRSRIDi9Z3OPLYx6Ozxw2
	hAnMGl9StZwwpUr8WHjeJIPPHKgI9qE26WIOL/ohN1z1jntnWdZW+RYbCuGo1QDlJrdvoVCSSna
	E1lCa2JVj/TNkmnar1uj/W39WLpm7effSlh3b5zsy5465pUxwnb2rnY/Z8zqRYl1lAkvsn7Eob6
	P2b6kCmQbiHOCpHLXr/Mn41jYz79obyMOU5trRD07g50hh5EcQiOfyI2pWkDxrj/1nFneIMctSX
	BSP9Z+sDMr/fdv32QoQRilUucmAI1mV6bKjEbxs+bnDxm8vHmMQLmIuNcIPcK+YVlo4kVzj+89/
	+5F9x2NZtasEi++2EI0B91+wy9LLTUfc+ZdMaOAMC/aBFh4wKD1q2hTmL+PuIXLCNfEe5YHPx17
	ioylS6RkvyDgR7Vh/QPiGm6wf4tbEB5jtpDVuyxkOffKvvSqOxPkg6oDRWCkkfK52+brKALJC8s
	qdIXu1lTiAu7dKkr1pY128j6r4eYMOmA1RQYOz1VUE4pj6UvPlegf06+C9rv3y19+ZWYkj7mgqx
	z0HIEHf8d40C38U7Fut47K5X0Du1bu5ew8znf462U=
X-Received: by 2002:a05:6000:611:b0:48d:f02e:f7cc with SMTP id ffacd0b85a97d-49c7044c3f5mr2386582f8f.24.1794530292921;
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60116323sm1975267f8f.32.2026.11.12.16.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:12 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:38:11 +0000
Message-ID: <20261113003811.3670011-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <95690313aa006369e994b6c4a7af69b809a84337.camel@pengutronix.de>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Philipp,

Thanks for the review. The next version splits this up like Stefan
asked. The resets move out of drivers/clk into a reset driver in
drivers/reset that uses the CRM regmap and is probed from an MFD
parent, like Stefan's zx297520v3 reset driver that you reviewed. Your
points apply to that driver.

Philipp Zabel wrote:
> Don't select RESET_SIMPLE without using it.

The new driver won't select it.

> Why share the lock? Each reset controller has its own register.

The new driver doesn't share a lock, the regmap has its own.

> This check is unnecessary, fwnode_reset_simple_xlate() already checked
> this before the reset control was created.

That check is gone in the new driver.

> Why is this initialized from CLK_OF_DECLARE_DRIVER()?
> Surely USB resets are not required early?

Only because the reset code was part of the early clock driver. Nothing
needs these resets early, and the new driver is a normal platform
driver.

> This is exactly the same as zx_reset_data, why duplicate it?

The two controllers will share one data structure and one set of ops.

Best regards,
Navid
