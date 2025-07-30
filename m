Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D32E0B59
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753900072; cv=none; b=qMienH8ICkCtN7j+KH/U3OnyahXI0U6XGfawRQbhmRuCYGZjBmfH3B2+5+j8WWL1fNdiLpOlnON2adPBfNDcRpDyTGyVvEI652zQ4cGGvzgLFXcn2RVCODENlUgI6IxQnl8xX6XvbszDy7I7sdKfRnUBLRH0ozor9ouBiQ5SMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753900072; c=relaxed/simple;
	bh=fbya6ziaDH/sLgBKG7AReAjVhsTbBpl/73dg3q1ld58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlUUhPLnHkBl3qlksN/4eim43ZEjcMB+Lkw9a09islbP0x1ueQ/MIoUj4SgfS4u0VJw4Zyj/pvx4HLcZaaS1S70LHoRXdPTCZPvm0JQJiQ7gMrwr/Ej6rmgUErSgaWQvVvLcMPbADbA9HLoOc/FHnG8PvvGqvcaC3uSp3rpRQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ktawGwQ1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ktawGwQ1"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6154c7b3ee7so1825a12.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753900069; x=1754504869; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6r4c8nkwybj2LXJUlPp2AEc+KFr7lzVJbq1YiFmFnQ=;
        b=ktawGwQ1WtoTeUeJdGWnpp6Fc28yPbf2RQZNyJSE2f49/eytsVX7bJmlrHoYx4RIbL
         fhxr1r0wnIitTVBqubsT+Edlccm/TD7CvPQFhCNdQfuGJZR9eyzcoCebFF7kc5ie3R51
         QFvG1J7CxNYkpFJAavoIe4nt074t3eju85fHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900069; x=1754504869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6r4c8nkwybj2LXJUlPp2AEc+KFr7lzVJbq1YiFmFnQ=;
        b=dSokKndViIqQ08TKOUev9eZ6cHzxK/Sgl/G0vNiutKK5TELFhw+c+ZMBiEVzV8piRR
         YK0Y2RTgHAe40JFR58LV7rWqM0cm/VlPWLHauXY801bkqvVMclEaV+RiI6PiBfAEZrFR
         1WmTqqokc8dxIGPrCgGTsCvk9OLR/fnnQ7/h2amUaGyIqcZs6Vf9Wm5mMLovL3xAzgCm
         7Gg/0Zsf/WaWDxZnBhQnmUU0TiVldeW4FYLW9AD5nEM947Faisu+hsGRuIxWdNJ9Ypdi
         TpPC9eDzAwkpU1ak97P3YSFnTQOmlYaPFzv/hHNVcF/mSyWKsBfvz+v0VRexnefWKRMK
         s/FA==
X-Forwarded-Encrypted: i=1; AJvYcCUYwKTfND3jRjvKLjGv+dE40Wpk85x5/Uti2vAg5ipKDGZQcGxMMrLD3MvlFAvmAlMMLIF1cTv8aSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQY14zOSaUhl+jRVZJ1A8Yk0/B8lIIBplxMw1j3+CBU99B/3IJ
	GsfIwDwZeGmoaypSG8W2L7AsyD9A6KDb1C1CUmczCf09PCEX6hW8z7S1rRI27ejrLmvGid07y6O
	XieTQhiyIlzet7aFE/i2LIVg3fL3eaEQ8ixLFYqOf
X-Gm-Gg: ASbGncuUckm/8vjo38J00BC4WVXRRx37cy3/KM5Wq9Z3Ild4uhKsaaEERp4sJkVFSgV
	IAvBl4rRk/NVD6O4K6nDVlfFSdXLS+AYDxvW1B8QDNMtO3JFhCflCyuGiUPaPmUYYYudK9LkLMX
	pq6NiIXfxDzEZW1Oc4617eAshe5EXvv0JQL8bfTZK0kxH6F3ebYNyRa1WoCVgBoCSmRs7rgjs2h
	dlqpY0+d+sYTCPFkQ==
X-Google-Smtp-Source: AGHT+IH3UPStIjtEwhYQSCAV6DutX/5ZbdtIndLiNMPcdjaVtjZJm+vQdKhY+hsQZbuxeOMWz/367Av3WxhmS8SMryo=
X-Received: by 2002:a05:6402:2883:b0:60e:2e88:13b4 with SMTP id
 4fb4d7f45d1cf-615a62ab546mr9757a12.3.1753900068649; Wed, 30 Jul 2025 11:27:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com> <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-5-03f1be8ad396@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 30 Jul 2025 11:27:36 -0700
X-Gm-Features: Ac12FXxlAvE9QxWzw-TPizj7qPTosxk0R2iemsaWz7FP_QlsARKGUQ4HcK2OYu8
Message-ID: <CAODwPW-FjCtPGYkNYozo0ybEjz_rVOeDqkvEPiCmQ6M2in0OeQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
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

> +      Compatible strings can be either explicit vendor names and part numbers
> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
> +      lpddrX,YY,ZZZZ or ddrX-YYYY,AAAA...,ZZZZ where X, Y, A and Z are in lower

If the revision ID is only one byte for DDR, there should be only two Zs.

> +      case hexadecimal with leading zeroes.

AAAA is not hexadecimal, it's a verbatim ASCII string (at least that's
how I would define it, for readability).

> +      For LPDDR and DDR SDRAM, X is the SDRAM version (2, 3, 4, etc.).
> +      For LPDDR SDRAM:
> +        - YY is the manufacturer ID (from MR5), 1 byte
> +        - ZZZZ is the revision ID (from MR6 and MR7), 2 bytes
> +      For DDR4 SDRAM with SPD, according to JEDEC SPD4.1.2.L-6 :
> +        - YYYY is the manufacturer ID, 2 bytes, from bytes 320 and 321
> +        - AAAA... is the part number, 20 bytes, from bytes 329 to 348

This should clarify that it is excluding trailing spaces (so only the
significant part of those 20 bytes, since they're supposed to be
padded with spaces at the end).

> +        - Z is the revision ID, 1 byte, from byte 349
> +      The former form is useful when the SDRAM vendor and part number are
> +      known, such as when the SDRAM is soldered on the board.

This inversion of the statement is a bit odd? I think it's more
important to explain why we need the latter form (or just explain
both).

> +      SDRAM revision ID:
> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7, always 2 bytes.
> +        - DDR4 SDRAM, decoded from the SPD from byte 349 according to
> +          JEDEC SPD4.1.2.L-6.

nit: Add "always one byte" for clarity and consistency with the LPDDR
equivalent.
