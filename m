Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBEC2E8B79
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351092; cv=none; b=mL1B3EYWBy0BpCpzAF2BYqAovxn918G5ChsYOnv3M4W88dhlqp3DX++r4Ztvb4UBIrAR89AFD8jtObKBVDG8SLhgsgxjlhCqZD669dQFidb/U6oUexmDz78F3gptZdaDNkhOc8UyXUuowGfs2X7ms+wGNnyOxmet7BcV2OkvVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351092; c=relaxed/simple;
	bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1yMD2zolfJKgwZO4x6oDnb96dgxJ4+w7Blc2QbsN3jrMxGq9DsWthexvDbLKnStoNMkuHZgZf8R0WCbdn7879UBxWt3eePsUs+MGjduC8oM0ayuABP4wtgY6tvWTpaAtTtKvaLMKhCAG+QLG8wxG9ENH+hTAx6xMVl0TJtr00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnycrD9Q; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnycrD9Q"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-579d7104c37so4952527e87.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760351088; x=1760955888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
        b=PnycrD9Qad1YKFd8X1Fdi+B+dQb2/88AAJMxqSdOEyAn89o5Vkb6zBKx4rZK8+SYA7
         l2s5oHfjefOqLMnW41TWJdDaS8KtoTVXqwZUFsi0Ih+x6jXCizfsM3njjDTzrf8Hn4xm
         +zFcy+h2NDXA/DNnvMNVpkZqB3gp0511kfa3K/+iDC6UTCF35SoIscW5voCfrJXOsaW5
         UHhH3ttD2YsQPKHIkOJIRRvJ5V+QnZbK3GEE0VJhm9HtdGTqJ0uX5CMQ3rKMT/QCDT/f
         DhtdIIRbTgImcyvRWPvPL+StstNq3dbIOaFbxqe5/Bh7LsjGEklpQSG5n+ZuTJNTDMND
         vZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351088; x=1760955888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+unRYycP97fv008huF8n6bo0ikkvJYI2Zc7wQSeA3nU=;
        b=Dre6ABjiwrArLLyW+RTYWGKnlFYUyxlQu4iFF1VNNuRRk7gdYu2dP966Q44nPU/My5
         xyfPB8AxMl/vx4gZepkQnAXdFJSGBvUeU0dIP89XgXpiNW5gxpA4MEuJP+56sRfFHaWI
         LHbYnSTeD95p5iDbXOkN382U1iw1hg2VEgnY5QTe7/pr7zCUsD+JqhJ5xOcSoIUqSSjV
         ngZsKiaa0ZTIZK07lQJhUq2EvxU/c77F+jM3Zhg3FrOnLeBbLgLXEy9+5ADO128qlOlo
         mRoBhXaZeiAfx/YfuDYQTC9SAo7ZKyL3vze2keGTMhcksKVVeH1mBRo8UMZhJK8T56Gd
         /cNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX/yec6KpYrCG0AcEIwzYo8pfaE+wPp/RiV8xw4Bv4z6Q4Ml8Td2EscaJaiYCUpkyQsWz5e3QqX/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCy3MUHsY+8Ctk8YKIS0St7EfqgGRFRE0nubZCq9/ECb8m4fF
	1K+WmHTJRK1dB8ZYuFN5PMgkemvDYt2zw6MmYgsYTj54GRUxhTxyVMYDb/PEPbNdLIxXUCuNlmp
	9fu5pt46LMUkJMdhVhe14SO9Dj3SP+WHVzI5B8BmbBA==
X-Gm-Gg: ASbGncvtJPPeFJHM0n18O5dOB5wW7BczP0B59XX+EEeHn4vRCJMQ9DyYFKLqxvYJ8vd
	cYuH0qSA2vVpQOhXAzfsmWY7AO+0WLZz1DRXpixqsDrIa+/+yvy1bn45yH6bb9wqiO8XNS11RNy
	iB0et0Mu8EP1orhpZSfl2h3cz2I6LUgQc1Pbsm/97uUW0a7oUPmDBzQmtMz4YvYqmWuXRzfwN6G
	0F1L/69hQ2AMYPi57ol0cUvnElSMQ==
X-Google-Smtp-Source: AGHT+IGvGHloV1limtQ0fx79bfGJXQow2XXzmDst8EglcpB9EbNJ8pFYHIXf92/sCJscA5Ld0pw8fuj+myOX2Y7yQHE=
X-Received: by 2002:a05:651c:1ca:b0:36b:8361:15c7 with SMTP id
 38308e7fff4ca-37609ee797dmr50886881fa.42.1760351087667; Mon, 13 Oct 2025
 03:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925221927.2610760-1-robh@kernel.org>
In-Reply-To: <20250925221927.2610760-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:24:36 +0200
X-Gm-Features: AS18NWDB8GoBtqV-UtGzBfY0pqqIxdxK6aWLKDGgXTJxVPFOQb277q1e2UR2gHY
Message-ID: <CACRpkdZH_Q18CHnT9rjhOGUx53L3pKrP6BrPkB0hSV7JB1N44g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert marvell,armada-3710-(sb|nb)-pinctrl
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 12:19=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the marvell,armada3710-(sb|nb)-pinctrl binding to DT schema
> format. The binding includes the "marvell,armada-3700-xtal-clock"
> subnode which is simple enough to include here.
>
> Mark interrupt-controller/#interrupt-cells as required as the users have
> them and the h/w is either capable of interrupts or not.
>
> As this syscon has 2 register ranges, syscon-common.yaml needs to be
> updated to drop the restriction of 1 register entry.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
