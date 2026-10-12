Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FED41F5C7
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800530; cv=none; b=KhiEgZJWHi2fiHLctz2UGy3hdPi4LHtrt+coqZTYK9FP/xjAr9tRdIMZInkOfy/yP4BnkoE/mb24msDuX1LEP57jtvODR61CD03JeBBnspBsjDtPAb9nxEKURoHA6EeI9pJ5Hhx2oTAYZsnfKdHetp1MlVwXj9P0iN9fj+6RoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800530; c=relaxed/simple;
	bh=KTzcEEIV8+14IdfGz+5QCVuiMenTgSz2gLNd0nToSAs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Dixt3ibCLj+TP1QNpK+HA5Qo77WhKycEKugESm7RbUnZBefAMJ74kV/9uOGfU98sEhCzgiFMzD2G/fHt2fWKebgc6S09pq6CGIwC3iFmByaD93OBDSQZGQ1fTOMBWIKg0Wtum1J3dMDf77JNQ4mPiMjD0I/36s9pl6m0SEJzRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nX9givu6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nX9givu6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a020e65269so10212345e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800515; x=1792405315; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=nX9givu6ac6FoFgoWGJH91a/ZycQICyRPn3wCQtNndEAYxvS+jBuRwiu07OKg+0XG0
         xWZOeFEGms5UMp11JpIy2SeZMchu4zJpLQt1Cpiqnl5UVxyPGGFeru9LpN/nJ4Dxi0MZ
         uzy2rv3Wx+CcnS1t5g6EQA26a9YNe1PGVEEpOurVrHiFoR8Nd8Yft/S0noBnYVS8Hw+m
         sWkDWoQUW6ZL3/8duwcseX2nDBeueSCqNTSBVAOGTW5hPsNfTRMHSVlZ7eZkDVaqkZy7
         B4JWLzsJ5enuLK5V0zTS4cpl1/ElgpIKQNt2iX5Pdvocrq8BW+FKSj488PTrEprdtn+p
         e5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800515; x=1792405315;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDRpy4zSY6i+1qqmwnCcDGBbpmjqBT66Voxyn6YTRCo=;
        b=lRBWuQqeFjQotVXEt7rymC4jvTrW5VcJhRmKZd19hhi52XStj0UaguNmI0b2Jz+sU6
         xkkumVKVWz/dMYQNUYJ7sONU+VwhaE11MC6RGvuDYkSo5Kl5JafMZ1jJ077QldC+qdxZ
         xQoFfYIx7FZLaI40/msTr1kp0ftMkc2gifZ31FpAypg8CxSBDyKF3Oi97iH0uIKf0z2m
         AekkJM7UNk766Zw9EMymkBAXcHElOHKYv/7CrbMO66CHmoz1wIS5zWr08/Ct5l7byiW7
         /RF7fti88Ehm3tw+bcYbzmnjBDLml0VGE5gcerOeeNE50H8UfgKwI1TXlI0T+hMSczD+
         Ip7w==
X-Forwarded-Encrypted: i=1; AKwUvBxWjEa8PFfpcYivw/znc7pGjJQgwli8yIILm2OWXHMFV6MwW8/idjK5URu0iwu90/COMs8/64IGDoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxzuLZTYj9Q00Sk5oIf/vzBze91cK1yVC8MzUKfQu09SUlZCFI
	4e8zEn+04q7/tqy3aJ7KX9sVJFjmYKaZ0Vs6+SgqeQSWPhX6qC0HltQMSR5n9/kQKtAzRsNsMuD
	8FREsiA8=
X-Gm-Gg: AYBFou3czpN9m8JfreQGlbhEnnoNqdRrx9IvAegtjBxOSyM25oOgnhZm2rQAKcbSr2X
	/3v7ixsYetCZX4QhObSk3Q7sNhZp9/A7/gVKrx7ql1HrI6/XeoJFfLq/HafSHa93Qyb68ds3kK1
	lIfVvTf2dyWExQgq7PJN71618I/O7kbQ1KzxkqQFO89NtdKqxVaeALMcRRumsMMpTN7UXICfr2R
	e6cEla7xkoK1F9QDaemQ1CHVdDXgZUnVHWk9AO8gZdTTGiB7SMItFmzUXsrrrVSqvqYUSNA+V9R
	+PQ+2IjzRwO5UmwIJGH4wmqYr+qaxiPgbQq/HYJwDa0hTtWiwbNFSMxaR5IyNY4vzH+wK+z/wXe
	T1dv/DrK3N1xXlCEi9Yw6Iz8L+4Vf401gembIHiVcgDwL35xRSabSBgdd0MY8L28RDysnPjAkWM
	ZkZqeTiptge14cccnumgAVjfqd4joOOQK41BoIOgV0DGUuWr8WlXoNWvKcn30/KGejcoIf147jp
	QdLy0gtoqX8LPqC3A==
X-Received: by 2002:a05:600d:82e4:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a1a45a08f7mr10336415e9.20.1791800514835;
        Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm217256615e9.1.2026.10.12.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 02/15] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-3-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-3-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.12503537219212348990.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KTzcEEIV8+14IdfGz+5QCVuiMenTgSz2gLNd0nToSAs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuzPP8dXy6Hr7ZO152eGBWOgUS/bpau8T2csOdxxT
 Sj8zfWojlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzkbTDD/7pj0c87FNevWHG1
 a452YO0SH3a59MS5FbdNrxdybVry8ykjw6bjd1TtJc8WC+b4f46K0zzHpCwlInF3m4bNw+ir6Vl
 irAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> [ ... 238 lines skipped ... ]

> +
> +int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
> +				     const char *adev_name)
> +{
> +	struct jh71x0_reset_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev = kzalloc_obj(*rdev);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->base = priv->base;
> +
> +	adev = &rdev->adev;
> +	adev->name = adev_name;
> +	adev->dev.parent = priv->dev;
> +	adev->dev.release = jh71x0_reset_adev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(rdev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(priv->dev,
> +					jh71x0_reset_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);

Could you use the helpers provided by the auxiliary bus instead ?
such as auxiliary_device_create() or its devm_ variant ?

A lot (if not everything) of the auxiliary related code here seems to
implement what auxiliary already provides

-- 
Jerome

