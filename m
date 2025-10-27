Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119832D948A
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602399; cv=none; b=E1UNPhvlZMV4d1F5ABscGHqGnf/fzWJjfdHQwHerYLaiYu3sN7k+BEqf1ZFIJE/DXtYA6zdOPsEDtGOHHB34GhKAoOJE0eZjf9TEruAMd4hX65saJMPZFPp2GkX+rvE6XwwzXilKw3y4oektwcJvGiVw1ysQma9WzxSxUBhDh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602399; c=relaxed/simple;
	bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ0KLok/JunHebgU2lctxQ4SI9dNoFxC6H4TLSKsyn45VTaf2YRxiSwdVKGuI+0G9vBAX5ukMqHTYlwLDOSr1sjWLdyOy6FvslqHVlHOzBzo5Bqkh56zBzGV/ju2eL6rZotEa6yo64KRE/rX7kPKC8I3LXX6wZTM9jVPDEIOq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUdk19iD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUdk19iD"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so6186921e87.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602396; x=1762207196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=yUdk19iDG9Y2oATyh5vf/Mmf4yZ82QWmJm65k014Sv5n4gZ8Jtr0PsS5yh2WnlL727
         26VKoJSi5DrBOoGeDw9v8PxxQWMFkJJMHss6M5DN36/u+QfNLKMX6UIKEtfzdCnQJyB1
         omitV7vv3YE9C2JmssdREvA/qWTSyJ0wxcA4Pvdr3N88ARUDIXuCwK/rqCLDId3/Vjsa
         929jRE9R23gfqJkrxyfp/fg+UDzET+oxRndmGiqh5qBVjukKWllLYLKN9vfCqZpz/iKu
         b/X4GAuASQ5wAm4EMolhPc8MpOCyI4voUbQBKrrXb5ZkDCPZb4ZABjj26VPoI5w31BmZ
         qrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602396; x=1762207196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s9wJrUVnAiARoihgzYhQW4ZH/+T9QovHaBTy4YJrjc=;
        b=tGoykyJBHpDV+gsekmwAbqbacY7FxBlm9UNdzgE2rKKU2orMzgdUL3vCt4QH1SrDeM
         LcgdR/lfci9LUSAoxCcjEC3LXabQQDw051EJNVVtifWPHVQC1jbz6bTohMKXCKIDAW8Q
         mskdm9hh4yqybXEOVd8b/QWVGd2MgEtbP+mzimPn4iWK0s5RsTj3p7D2LefgeMOdR8+o
         XwYECH8q1w7DvBlgD21QqmO6B1rEXlm2cGDesXQez4ihpdFXsu27Lx14DQxZtx9SroY1
         IAUgHutkhA3WDmBmOqTG65Wm7iv8MgnIhlWbQyMkKjpic/kv4SKPdyTQKSE0vGtGEaoL
         B1+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyTGhfLsox6gd+ZKAViTPW4hXkVfWzmVYo5fC3+tyv1lkXwMlIIWC+TUZRhAvurrpeSzkm7RaWf6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcQ1tKejxkkSACQItN2lLIVavdmfthpz0ZGs8P7U6pLam02LM
	XRnFAkVl+u8qWLTa1V5X6eb/GVF/rWslUdnJzky7FCfXAs+UxHTQBM1QyYh0tAN12TQZrH7BVkI
	vv2YAo1zvxXsJ9xqfdB/QBXkt0QMD/6RKmxdCzlOtW4giqSp455f2
X-Gm-Gg: ASbGncuCuPxg3aYsIyu/8ffigm3G1EYIy+c1lZjRSlP8nZ7qs3+uNmn4A2ksVcsJdaz
	jhZWOhOXOdtiTxNo35QrUsKB3/uQjV+KziENod8K+KyMrSVKjoqXqufG8zLckr5tYZdeJXdf+x2
	xnEW/kCzzda9c09q16Ohl9Iryfw+bsiDG+ZbWVwyUM2MXWZMptkQCXrHf9xkngrTGX2+iCe4CWL
	p0vV2uAFNXL1FaWE5Izt0dyxRW2rLIygozjWCCknsMA+O6TBXT7y1v3MVYppOX2Uacn8yI=
X-Google-Smtp-Source: AGHT+IGENMuTPrZutUQ46wuswD5BGa1TjRpeG2e88psXFvOk1H1653TvwH72RHt6gkUrwbtJPBtV0+X773X1GDUqzwQ=
X-Received: by 2002:a05:6512:2349:b0:591:ca21:e985 with SMTP id
 2adb3069b0e04-5930e9dc52bmr571986e87.43.1761602396255; Mon, 27 Oct 2025
 14:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014153040.3783896-1-robh@kernel.org>
In-Reply-To: <20251014153040.3783896-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:59:45 +0100
X-Gm-Features: AWmQ_bnaFR_aOmEFaodrc7AgItv72GvXAJNlQaZ0Wjyw4FDq1FooRjnsolDKmfs
Message-ID: <CACRpkdbiJKy2KrCO2wETQzLAkFate4miWNJ2Ed=a=jzS07wqsQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell AP80x System Controller
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:30=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell AP80x System Controller binding to DT schema format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
