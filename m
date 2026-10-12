Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B444156E8
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800535; cv=none; b=mGwjwQar//RAFVrxC2ZmfI0cJxkkGN61NXCRv2c6mLacj4ibyu7MmX1zGRCQeOm1RYKtBuP1Bdv6U8Q0IEzVNYgd2kdOfpHMMhoL3v5h8EWDKDY/NQqEZQ47UPfC1TBTGfFo6bn9VBdLHxbICEamH1xzdEFZPFmSCv75wcabHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800535; c=relaxed/simple;
	bh=zFD2E/SM8xRGAjKxc/G95StFEui4tWc89ptGvsdyWy0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Gq3RXix2kkR9vhe5RD8+OSxUHs5opQol/2ywe3IbLsbi+3FMO8JRBpByMfJkzKvMpmo1oAY4t1qVLe0hjPFU39/YkOdzntPNRmkFaOa5RaIAAox/A1M7aA7uRBWcn0KSFYxh4ME4Gj/Q3kRGo1vP6+ONJnhpyP9euKBOzfNQB38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XNE4zjmV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XNE4zjmV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so12866095e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800516; x=1792405316; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=XNE4zjmVhgYVrzicQeZh8sPDbTFxv0axmN2vhvEje85z1++AaWJbSrK9+xpGRknwLu
         81PQyax3rdRu9FlMOLLn4WlbxVZzMXqizXZLYUXeC0Dl3vR8h+UL39H2VEjq7CY3KAah
         G/Gdd5cjUjWKu9ijmbWT+617WQK/OOaI58yrtvf193cOTqCvGqI5cmtmtSjF9SJITG8X
         hYa99OQWC/kanMzsPqNwkz0gQqVKRavmcO8gDXp0J4y2XmjX57yccZFn0CvbMIos/MT3
         iPxHYXQ94rZQ3hnZ3mdoRK8kshjlIIjUMHQwSI093vwXGNzStkb9VuUtYNlNLxFB7TLw
         wwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800516; x=1792405316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=xR/LO9JAO1/Z509Ydgu3omlfvU5sKE/afdBTLwjtF4uBRyuoJ1sC8Hxy8UgoEOBX7F
         Htv1ZncsWm3F5wBQPwQkJAe/TDENadNgwxLlZXuDR0SJCq750DBhzCveMi0tZUwIREjQ
         sxpOgSQOrAzQGkHoWS9A/R3ZFLUXQxrgJgsXq86gsLLk76LqkRh7Mu15LXRZ8Tw3IFgZ
         1g8H/EUKb6GgjLSpcRV+AfCmRr8Suw2nC0WL3j/4zQPO5fKc4dFnP7unJE7SdKDcDDZ8
         Wk2DG0LLKfzYckqnxo6lpg0/Uq9F5e2la4hdUqNNLc5Y1ZzZ7Di7k0iBpESAM+8wi1Eh
         h9Mg==
X-Forwarded-Encrypted: i=1; AKwUvBxFejqUkKa4g/rwycAvqRkDirwjhX4UEXSlzuT5/tjwRYgblJ7YdMcSvuPXtTrU9Rx5q8/UhhYlRSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPjdAYyNi6dbShGiXxDZsnHOinwocnFVrVtSIOCjv0f1ZQBuTg
	lJVH51iRsGk7nC2YuFIPuvdWEfgjdB8MBQAAXN07GMEjOXAn6dTeLQzZhrz2Bc4/JwU=
X-Gm-Gg: AYBFou1mG0l7//9bmWYNIccNJtUaQ076jSfaNDTpxJ5N6aYtTMc1gkmMRSO/0bingWU
	R0gSxYyaVp/rVrCz0ori7jSro+FaOg/vlZIKIUydIJl0zMWne8dr6deoic4DsOWufCicf0fBIr2
	yD4/GskSe4qj2pYjZt8lMyaozYCGoAmWzRBKjIeLUH8q2RLRQzsg+Avg4RTdOtVpH4tEoeTw9NE
	Ox3htHvr7Kjq5k4hmpIglyEYQF38s2qlTGEmgH5gqRFRXo7DxchiITSdA4u2Sa2KKLLB5qsa/Ri
	tyKkIxyeG8HVsbbK/mdcpRI1pK6xnZ+Ejiq2Pc61lg/l6j/vyzFZ0F5rbncUlAhNAq/7Z9yQGri
	2xdIytvhHvg18ts411iU5EEYm6myD1JkN4DdQGNxYEQePiMsnyQ51JMje1OSUkkiOIHr5ho6SfN
	Kzo4TDD+W2JJ3Y+WZuD80ZomdNr8ajm3M8iqrFtHO1o28ifcPZ+I+ShHmAaZwYOQhvY5cMj+21Q
	PWBrJtddiI5GQM2kw==
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr165061225e9.24.1791800516029;
        Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm18110592f8f.37.2026.10.12.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 03/15] reset: starfive: jh7110: Match auxiliary
 device names to jh71x0 clk driver
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
In-Reply-To: <20261008123338.11081-4-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-4-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.17520660789962324320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zFD2E/SM8xRGAjKxc/G95StFEui4tWc89ptGvsdyWy0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuw307BpVwiqmXA7fLsjw7rJaS3+juyrmlwn6uW1/
 FnptmJvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbiFMjwv+LMKi+tDwy7fm+/
 EMf+TJu3Nrzvr4D3bFPT+WnFWVMXrWP4zZ4+r0d/HZefj1FolGucvvxHbl2NjM7gLf+ezDHcUcr
 EDwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The JH7110 reset driver binds to auxiliary devices created by the
> StarFive clock driver. As part of moving the reset controller registration
> helper into clk-starfive-jh71x0.c so that it can be shared by other
> StarFive SoCs, the auxiliary device names are now prefixed with
> "clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".
> 
> Update the auxiliary_device_id table accordingly, otherwise the reset
> driver fails to probe.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 29a43f0f2ad6..c936e61156a2 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
>  
>  static const struct auxiliary_device_id jh7110_reset_ids[] = {
>  	{
> -		.name = "clk_starfive_jh7110_sys.rst-sys",
> +		.name = "clk_starfive_jh71x0.rst-sys",

Does this break bisect between the previous change and this one ?

-- 
Jerome

