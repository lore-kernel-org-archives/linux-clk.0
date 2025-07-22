Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C32281370
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221466; cv=none; b=BofCHN1lV6dBzlCzv6PI5R/fWill+tiGgOQmd8SXrXUrhEAvoacD1xqskURPl6RC7frmKEAhiR2Z/Auo11Ik+DjdIDbOVEsYlknV23OYaObGibXREWCNYIw661a8/mEcb5Fuz9dZbzP1GIydDEU6fdnJixM8PCi88dMntbZ+mpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221466; c=relaxed/simple;
	bh=hWtdbECSOx65U0/2471YPriOi+gPt8KDy8AE8lUQLhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh1wy9u4k7eV0nkFQlwITVl656qXTcoyJI+zZxMpEcIzFbqxCzClMvNF0KT8OwQx0K1MvfQIhe6oovBaJ+EivBZCeq4lC0fByJ5x9oCy+yJfu1OytjmbieYFO8JKl4DKzxSMbT8skMunpOhKBNyHFiROry7IIapCLMTazKRuATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4G4LDxz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4G4LDxz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1993a12.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221463; x=1753826263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=U4G4LDxzVrpUkJ8xMrld7i3geG0B9tnnVrNUp44IB9vWu9qcCzXYnI/1M4BH9AFpKC
         vDskffH4E+EIl/t5HPUfktmgVp/5bcHnZAqM5hWSg7tTzG44168wEaM/G9HFpZ+Zihb+
         o+iVT+i/z7pMgJ8062M6dE/DaLOhVVisab/88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221463; x=1753826263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwvuUXqMXjlcbclmWLcZY6jJ7xmd1w9ykxymttXedcE=;
        b=ZE8dqoM79fDEh78VGtduP4x915Nz/WVOIAwlytg95VDTDsoZG+Pv8c9uNB99bSbgs7
         GASSTaGoYTg9Dzk5EKZIJi2OYWqtJq8rR+9kkzBgPioL2B2yd7mu8flB0Kk8RQ5Jm9Rb
         CGzGEvRzOvkCAGMNXjV2GW0juuMrnmv7Wqn4gKbr8qBSRGNdLANNVvNCNrPpfw18Niij
         TZeL27a14P4+ZDwDgwKiTxlg4eoNTafmPTcBf9e0byqXkxePUP653J2hqjVbRoFWWPVt
         RgxOTIMyjeiBnkRsLZgE7YVV3e8LROhyCCmyo4hgq2XdOQQABPyBzXX0knuosE0x4LLc
         fmhw==
X-Forwarded-Encrypted: i=1; AJvYcCVDqMlwAr91UatfspyHA8ejz31QxLFvF+idm6BiyZLjQWnidsvJFaQ9AVj2vcuoOJ0V/S88qyAzARk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFnhcRkl3gZ3sH8+L9ZIotlGL/5aLqVbTvHca3nHWzTEOQMxu
	70FcbIXyu0hisg/a5gcAOVUCihBZYII1h6TYpzoTdiP1J9UCPPqxn8zlzGbRTywe0YhH7NWwCdZ
	4YPqs0QgyI4twZHYLFG5VWJ4FJg061IdmNM6rr2gJ
X-Gm-Gg: ASbGncsSMHAvV1ToTxRcKKiKCcTE7tDfY+7kB93lgFM/iOy+NJqtDHx5Gf7KDQv9pGy
	VPtUbyaha97xlprQnbalmY8C4NCUHq1z74wQbOoF0KMBnXPOlbhwAPmjV4kkp18BwGDrzN4rfnv
	qljLDw0IkANTjk72CJfevPG3AcpqtKtkMCKn34gQY48/dNAYoSpeC+12ZzYdCHlp7e3o+3M09dE
	B9EKMnDNf3/2SPGQh9wTFr9tSZuVBKxfHk6DcJBg+/V
X-Google-Smtp-Source: AGHT+IHkklfoV2jGZf2D1jPpYNy6n0EzpENuUlCVLYxgOK9YU79IkYyUGg7ZPnpy5rOLdzOyNuNgg4SRmVW6s9CMDc0=
X-Received: by 2002:a50:aa87:0:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-6149a3beea3mr33693a12.2.1753221462404; Tue, 22 Jul 2025
 14:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-5-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:28 -0700
X-Gm-Features: Ac12FXxqqdXiBOsL8hY8DFhm2tyZoxR-txMizljLW540w1cjvBjPCidmbvKnAZQ
Message-ID: <CAODwPW_fDPY78bmwvLmLkt1yWpVdG=VC8h2NSdWtoiEknajhNw@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: memory: factorise LPDDR props into
 memory props
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>        Compatible strings can be either explicit vendor names and part numbers
>        (e.g. elpida,ECB240ABACN), or generated strings of the form
>        lpddrX-YY,ZZZZ where X is the LPDDR version, YY is the manufacturer ID

When you say "in case of LPDDR" below, you should also change this
line to take other cases into account. Maybe the best way to write
this would be something like:

...or generated strings of a memory type dependent form. For LPDDR
types, that form is lpddrX-YY,ZZZZ where X is [...same text...]. For
DDR types, that form is ddrX-YY,ZZZZZ... where X is [...new definition
for DDR types, based on what's available in SPD...].

>    revision-id:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description:
> -      Revision IDs read from Mode Register 6 and 7. One byte per uint32 cell (i.e. <MR6 MR7>).
> +      Revision IDs read from Mode Register 6 and 7 in case of LPDDR.
> +      One byte per uint32 cell (i.e. <MR6 MR7>).

If this doesn't exist for DDR, then rather than "in case of LPDDR"
this should probably say something like "LPDDR only"?

>    density:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Density in megabits of SDRAM chip. Decoded from Mode Register 8.
> +      Density in megabits of SDRAM chip. Decoded from Mode Register 8 in case of
> +      LPDDR.

Can you list here where in SPD density and I/O width are stored for
the various DDR types?
