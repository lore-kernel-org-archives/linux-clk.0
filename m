Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA513CAB7
	for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354411; cv=none; b=UiJ+onvNIcXlFkxXVlA8W8wYs2TiXFpZ6sJjRwCzEH/SfaUbUAwwFN6XIszXsbq85klMQ4XhJNbi8DCqRsUwhPf6404pWHB7EfhM1cPx8uMv9NVKe9EDfj94ksJIdJFCRSHdnImxoAhFCjoEvF1LOPAbuviIAzXOfzQ+7K3pqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354411; c=relaxed/simple;
	bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euac6mPtBlPFmWWWDXFIQ6oKqt6GsvCBbv3zcWx2pHACRAE7kY1IHXeBRSqpwyptqIOctWh/qjlD4yIvF4DaUUr+iEyplm58poHgHrjJ7Ser87AgLbt5iPrGVdTOu4+bP1P/GuPHRaHkPPeokHTh4ISjgV6Q7AsPr+0M4g3zIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCpzGYZR; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCpzGYZR"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-618769020bcso58468137b3.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Apr 2024 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713354407; x=1713959207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
        b=mCpzGYZR/46ZQuAau0bSRhR0FD5k7fh4SSEz3Nq7zi0S4UDs+2+/mgG8hbZ2TOEfFa
         VnuEAxEfiUW5dW8ztwTzgs7fezgt4SmjroWhsc5KCg2ILZ7XrFDUkqJj/kWhLJR9n3cX
         OAaASPVPTX8pPR4V3iIxqTyRES8TonOBKKbj8Ia9JgBKr6Qo2O9mnQjtJiGDMZl/CoIE
         l5+oqhw1O3ZLVLkibs1r73NVAeJmC+6UJmoA72qmo1LGEIGNvEbMA71jIQSfnMCbN4Q7
         Knym4rLCB+h0yYobOKyFaTbBeAhFXbW32Fkuc43l3jarw91MdMvjaNsXaBDxbbL2vQLm
         KYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354407; x=1713959207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvmf65/P9szpFK2qdaU9n3rF1YNMb7cvoUstdIgrV3o=;
        b=djR66qbVeIZOLMaCyiQEnkARXgVE0bpeOvxn10wFSmIZG8bhgQwhdpldCkTxzkGHbt
         hp+lsHxqqhcI4jv9YkntiyNaXMnfpHJTKA6Y8pwbFdOVHxyHxbaTeDNFDldWPSGG0NUy
         GqRE0ULl4zVC2VflD//Aop66Y6zrgwNDgwTEN9bN9V+MFg2R50GFsg8aIcTDmAgJ5nNi
         Djbd4LM6RgpLiUsI07slKwJIQMECF7dfaJt+vfD+pk0HnIk2XQXXGeWh8c87BnJ2GAAG
         gWB3zn20SGExnwYTcyahdNvyTAkq2GyPKwDPGmKfnWFId0amcmr2eeZXXDLz9cg3I1fy
         4ybw==
X-Forwarded-Encrypted: i=1; AJvYcCX+nHJc+AmpGmqrxzhF0ntiiKpJdnLT3AKLSegI5zypTk/4dVzz2rOTYVC1DCd3JEBN+Icxa4ZixER5TmYwj8CsOlwKvaqshILN
X-Gm-Message-State: AOJu0YzyTnVRSkV2J4Ti8cvcBNQyv7lOK0cEMfJj5ihvY5KCt7Ku5WqC
	1yp6DHJxEYfWexUo/Zneph3+uP/Ob5W3gBY04p0vz7K387OSLWpBrCwlqk2R+dgaoaiTqZyEPpy
	EIcZ2A+nmfb79gnavq5sK5qP3pfMenJkaRRhbs3EE5BxU6qiw
X-Google-Smtp-Source: AGHT+IHaD+oBtxsxurR2xr7+C5Dc/H+UHa4V1Pxg4C+1i8P8lLpLApH2p8YLciARVFNYj0rwHnv7aiDYHF6DmqUMe9U=
X-Received: by 2002:a0d:cc4d:0:b0:61a:e856:85f1 with SMTP id
 o74-20020a0dcc4d000000b0061ae85685f1mr6294364ywd.13.1713354407196; Wed, 17
 Apr 2024 04:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
In-Reply-To: <20240417-msm8660-mmcc-v1-1-efc9e455268c@herrie.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 13:46:36 +0200
Message-ID: <CACRpkdZYujAGZc04Zk0CdzMvFi9KJB+8z8ADN6+VBgahxxPwUg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Add qcom MSM8660 MMCC defines
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 1:19=E2=80=AFPM Herman van Hazendonk
<github.com@herrie.org> wrote:

> From: Linus Walleij <linus.walleij@linaro.org>
>
> The compatible binding for the MSM8660 MMCC already exist
> but the enumerator defines are missing. Add them.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Same question as the other patch here:
do you have it working on real hardware?

I didn't submit it because I could never test it, and
for me something was missing (like SAW regulators,
interconnect or something like that).

Yours,
Linus Walleij
