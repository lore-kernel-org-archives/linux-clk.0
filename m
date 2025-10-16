Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6A245005
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760594174; cv=none; b=AJNPLp7upeIJdPLzAaNYKE9gHbwTZVdJhnjKRCnNqLSwPbe4Q1q3ALDvGG0XurtV2ATiFSfNxjf5Fif9rmGgd8Do8KNSqjJHoK+d1MB/c6SsQy9xgoLBuSWvWVFABzqLS6ATXbu9Rlg/KGYWJrVjp83H6Mg2GGZ5f2JkayC2Hg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760594174; c=relaxed/simple;
	bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OWtZbP/9HaStYV8PhMaN8XYmNDovHc50ojP6PuSs9quW/qixCl00Hf6OWSHZh+ggOLKHg2eF021ciNgbmxrU4+tlDpjnQ2Vdjhgcu0fJKl8jZIGxEYcKC0ojmWdk77cAf+fnPMcBKitRy8ps8184iH+L59cOruJweiWxLHYoDHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tAo2SJwE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tAo2SJwE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so60286566b.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760594171; x=1761198971; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=;
        b=tAo2SJwE9rpak8Mebz2GFYOXRsqg0Kq2i/y66sKssWolUVkV9CIztX8YztPD9Emt32
         XldkFvb09so7lXyzGB9nxKHBkREzD3ELC0PuwM1l+vZY/4OipY3aOWuLAT2VvkgQi0VB
         nsPrf6lmLMoG3kQm19zG4/lELk3W/6l0k4mW+xCRU5n6GgfBHz8tyBjhpF/8qZfxbYD7
         SHQi1bueqjmwosezRUMMwjH7qDKfOwL29tAlaPagOUi6HPdxINwLAMUz1PbKoVphWsK3
         GJtxP+fozZgho6HodUeDnboktHpi6RM4AV9tnj/QBjQD6QWB9FpoHKGSNB69hHaRTDFg
         tTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594171; x=1761198971;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=;
        b=OHmsmsIWJAPAFnleeTGP2+vuDjLNUOAeLGdP5NTg9oQtzrvmlQozOpE6JRpV4uT58h
         P0t2uGQTx1jDOR26S5+/kugTh39n1jX58iQEsM0XHwUjPn/l/426fDStNbyR6XOErDRo
         KAjHW4nf406uJcr6xkiVruZC1wVVmlCEkqMw386C6pXJ7kwXxlDp9MMCFJbPABl8KQH5
         M1RYbXAxO5Ten4zt2NCtUNrJBpxc3Fvr50BNSFAN4c2/Gqf4nAbfe9A0hjoNM7ipbVJV
         1y0C74ENEUI7+rB0yb+dtY8MPfrQEHIJuMewHAmHxxabLHfuFm8azmKgPpsCQJ7thdBW
         oaxw==
X-Forwarded-Encrypted: i=1; AJvYcCWV4Vvb0EgaidB13amIo2fHIhNF+yHaDUv6gPcQvn0OFCNoOh0mRdNBYHKwmD5eFf003PZ47Pf3KsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfItl5d5jf1jOU2SkIWFdpNwX7OASGr5ESn1JGTGC6bug8Ughs
	QyHjRP91EOTf4GPKYuqyS6dJIlY/g7dy6ruxWHpAzRc2m9PEDfJLixQBCY3izGeBQW0G6pE0BQ9
	bn+3mV8k=
X-Gm-Gg: ASbGncubMt2jsRh/Et+j6WWc9FuRnQi7bxcB28wFFAiblutiQfJu82+bR1eNAHNo2Bs
	iuUHX+lxpHYpsecG29+wWm2lE7J6cLMUwWqBkePHjCvmolpd2fLM1VUqxQHehADMw9hOggnZUTr
	RoAIHujCDzGw58py4pvQYg9XvVWXM93TYdyONvEls6l+b0Mpi7w5aHy402HSSwdmVCOTZIhXt1U
	lREX0onOGOduGT0VJVhA1/YTeNV6SkeTAdGPbZN9M8jD24TNhnMmmgTZyuGbWGId/H86qyXD3Ha
	3q9qerWy2l4MulEYGhNn6DyaImMSwD4JDBxC+HD9OlpaBfeDoEdbEfSP+758yiiyEtjKt/YydaN
	ODsaMSUEw3xIV5aUMi6cUWWYRFjqYlDQbb2idb/CTC/TWkj/yHe4eyWP/5ty14J3cVYA81lg+sK
	YJZs2p8yLRCWKtO3PryQ==
X-Google-Smtp-Source: AGHT+IHRn6DJcub987XbIaCnD213XxBVwA1OkaUrOOTFR+bbpHbUgS+RyDdcriH37dmE0TK4LGPTbQ==
X-Received: by 2002:a17:906:c149:b0:b41:2209:d35d with SMTP id a640c23a62f3a-b50a9d701b3mr3125674866b.1.1760594170719;
        Wed, 15 Oct 2025 22:56:10 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccaab18sm419863266b.48.2025.10.15.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:56:10 -0700 (PDT)
Message-ID: <30a0c50b682b990820d486e536f320c7ea31eabc.camel@linaro.org>
Subject: Re: [PATCH 3/9] arm64: dts: exynos: gs101: add sysreg_misc and
 sysreg_hsi0 nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:56:09 +0100
In-Reply-To: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Add syscon DT node for the hsi0 and misc sysreg controllers. These will b=
e
> referenced by their respective CMU nodes in future patchs.

s/patchs/patches :-)

>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
