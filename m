Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8A286D7C
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221484; cv=none; b=gxH9qiFuVD2Fi7OOFbu0LibcVz15IozytMzeLXKEVnboy8lC/B1sv2EgA24+b6MNSetxT2gAq6ntAVbVMsQEOohU7t0L3NP9O0zVEnLiUVxpFOY0AfbNK0UmIGcpmrdwgedc2zBkh0vNmvsqCf3CU6Z8+7ZH3FiyRbbsi984lmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221484; c=relaxed/simple;
	bh=lYiKyYXdjjhyUxtYTcfFpjzBCFZEpw5hRFn/BBVvuuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L22vkyrWYP9n5Zp3DDEOLwhwEIkujT2qgJSwuhxmuHEd4kvWNHN8Hzy48TXCb1pGP++hb9OMTeq/to/9NdjRyiCj4rYX0BE5jc1GYbtJjZ9qxLdJ8gn+9IiTkl7kYdSlI4ulOpYbe75NI7xbq7G4xE7WVP1MnnfR6GLXzkDoSdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PgQxFV3x; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PgQxFV3x"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso4721a12.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 14:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221481; x=1753826281; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=PgQxFV3xVIYVzvqWxGeXB8OHIHNRoHKHmCv76q4RO7nQqdxZQcLB1ty5/mVtzmWnwG
         CYrnztOoFpxdfzJbLKQ+RtauRKd5aUt8LmxexpNafhIWydzVe1oLnNWOnH7bcJc5Plae
         Phwml768EXjZoAvaIxiXDoeC4RIPomr8tMQlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221481; x=1753826281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8hcD+fzN/rLyW2ntnhyBmLcEi4uK+H7gUEsQ2j7Juc=;
        b=XCIrex1azmky9r3P278O9x5ZDjrRBKSo/XaZ1+JPp5uRWx2CrVnfe6f2hZTCYhjnTk
         qcbz57dxVgvEDpiJdBu6YXJsi8zQTuxKk5R+19GjoI8BnArA1rZYFXO8/TOZg1RU0NCM
         +wJ95lBKNuqH/owFiFbqdP89HCJ7/Ekaje+Hl7whzoEc02h3Bi/CK9yrLZ0ycMXQq9e+
         pnSKtvsDiXvDOBgvysaY/GuIV68Efa71v60yFmAY6dF9Dgx9ESN+pQEByYQaBgU2PpUn
         qEcEmSCKcLokDIUMSl0RN/1e20zOZY0pbY7moETDmRQ0MKv9YAA6qqGEJXd3fEuW9+4v
         Lqmw==
X-Forwarded-Encrypted: i=1; AJvYcCWkWmViP4mdCVvVHihS9YpkqMvXVr3G3eeNNMX4wX4MFRGycQMCBWRb/7oNon2u9C4m7CXTMHBZcdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVv893phnfiI1qcGb/IcNW+MtzaXvZu7Dv4jcZwMSI5UD05Gp1
	oJ3vnFvfq9JItwd1uvCwoyUXLKBOMTQn4bROpLbDTgw4TShu+DoBHITi7UvGdRefkxQ5ETKS5Ee
	tT1GkR/vm6Ax9sBh5/ydPx2VNwB62L63kBqiM8Mmg
X-Gm-Gg: ASbGnctT+LWpK2jPTEA91KfpuR+6UGcfJ9KId8QbpBFumI/5QSFeoJWj1OEQleCuSaQ
	qPlF9a3zz+1w8H5yLQpBJ/OoR1wy5SayntaycGUJHwzLppClqQr3JtaclosMgn17zyK4rvjOZ92
	kKaXTtSgPPyGwjHGrkZd1DWg2OBjhfAD7TWcZSQ4K3tIwc0TsbbABj5bRezAXrFsvrlKitSMs/Z
	8AjeFwzABwvFaQlE+VQCuDBBoGAvNb9Tw==
X-Google-Smtp-Source: AGHT+IFuRyHVLlTc9+mvjyXn9nDzKUxgSkHkWINR1NMMOVHEBiRhg+HBPAtm00VgI63bbY4a+rdh39BgoHymQ+H8ciM=
X-Received: by 2002:a50:cd42:0:b0:612:ce4f:39c with SMTP id
 4fb4d7f45d1cf-6149a332acamr34752a12.0.1753221481275; Tue, 22 Jul 2025
 14:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-6-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:57:48 -0700
X-Gm-Features: Ac12FXzhD62MTJBHmWXOCNn35YJ884MYdMc4gPYhqJDJjbLE29Cjc-kRxryta0g
Message-ID: <CAODwPW_7aYdEzdUJ7b2nT4-zS9bu_hbNqjc7+_wSHbedXZXJ=Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] dt-bindings: memory: introduce DDR4
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

> +      - pattern: "^ddr4-[0-9a-f]{2},[0-9a-f]{4}$"

This pattern doesn't really make sense when DDR4 doesn't have the same
manufacturer ID / revision ID format as LPDDR. You could either only
leave the fallback constant for now, or define a new auto-generated
format that matches what DDR4 SPD provides (which I believe, if I read
Wikipedia right, is a two byte manufacturer ID and then an up to 20
character ASCII part number string -- so it could be
`^ddr4-[0-9a-f{2},[0-9A-Za-z]{1,20}$`).
