Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849810;
	b=BXIJ4p5bf7CbnrqDRJw85yrhgX1e4ahDlhE/y9OsAMy4ZmBk8Rfyewg2y1raLHgbOxsB
	 pBJBoi4a5VAIaBC0TKuozmTDNb42GOFo6rAdjhrYKAGGRAQ0eX6UlMExdLk603whrho2Q
	 dMnmBgM8sUXkMEZIaMlr+iInWd2TY1Z/poNtEElv8gixmsfnrKtnE67pMO2FRhG9/De0g
	 fldEOzfPivQFWsCRsOabTvwGicPmSUau9J7Ieqk9foWDMmnIS7fu5Vs3qZcj+R1+YBi+o
	 30n2Ft6CGXnoQD6ApXpxhmn683R/GjHORZIiTntAG6mw+pLQJnYKWbDwr/TmozmjeUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
	b=IC0pC4LcHIbtHfSyAj2q8DZmr5pdHNrGJ2j2VsjUe7s/oLaQSDF4balp4euM0FRsSOt6
	 QgQGaKdkFEtyoVOrO295z9A+MBsppYXNLxUOLkxCmY1WGCdq9SXL3iCe09dJc+dkDuPjP
	 46k9pp++3kl7gd5ddMG/TfUpz/AWAyZtTMSaEITrRWucXfpt+j9GroCvmQfPEaoFecQJz
	 TmpIA52/bUgY0gM2DsHi0GBgfVAn4inEbu2PXzbue9/u7IVSpEm1lus2P1gkha70Y+wYH
	 aIokjtgXbbgxZ4icwYT/jghN2hCt3Lt31PtCzEGCphMC1bVqpC0fQ0Qg67ihyQ0+DcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37242606A326
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 03:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37242606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8437645ad.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 19:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793849809; x=1794454609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KEYl2+ZqCMxiysnAC3YpcFAk3SWbJokq1H+MOmHhqxg=;
        b=iPatHfLXh3Rnrwq93PTUUqrRG7y+n2ZS5/3Kmvm+eSCmKkEPT6htGaMIMkwNKBM46G
         exVR42v4AyVV8GwFpCvUSgQqoS1IcziJ3n+PHoD1oPVz7Kavlgo3pEDWNDPiKAAyNChb
         rymeqSS3DfLLOHtgB+Las+FOXU0useTwZVPY6MRhWzt4Utbvx86V9vOs7R5FHSNpvrIr
         JG2i0XS2V4Z94CfL5R2V4uaG/kUPOhyxtLDyarA6vG4F2gMjOQMF6t2ehKofc3D8zlQX
         kpF3/kyHYoEUQM3a80WeRT+khgHdeczSOChG+fipx/jz2S9sHW8ShbGG+8h2rEabAKsJ
         vn4w==
X-Forwarded-Encrypted: i=1; AKwUvBwL9uz+S1dXSvxbghWl75BYa2mWMFrTHJw0V2Eq1dG9qpUlLJ+qzD26cRjUvgMbN5jPt+grkPXKU4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3WqJ8gcKBqSmJ22vc31dbMqPYHOAke+T4Tg2YV26b3c51ZG5M
	eNZzLgGffohbkfdVKiOnuaSziERpYGpSpFICdDLszDn9cJ7TizbnhKL2yYUAZaJH
X-Gm-Gg: AYBFou3k4mh/GjXI2L6lZC2+664kdo7d7hVGVSPcsD5TERJ354QV1S172+EpcPeYKkU
	JbqjGmcRyaPqdjbedP8BDz+FmiCZk/1KLEYbCHnaoHvlQXoAApPOTTYDqmF/f4aQTQa6tM69BIp
	EqxNMUkXAIb1HXVXpuv1VOhs8gp3NND9lwPQAksTGGtjA/Wi0bqCi8Gf3+fdHwnSN1QE1eDWdUC
	DpRZ2qat0/WPaLUYitnK57lt0h5xJ6sQOf7jjNCAALzfzn9+c2l6a7Rwyww/KFcwdgVnIMKzReW
	/qF3nuzybJDo5dKxjoXc+OZlFTNr5CqUaBaIl4WitPmKPrbwKvSk8PEn1sDjRpFsvJnoqJWNzE7
	lKjiDU4WYZ6db+zLNVv09wkorLMr6/y1kXfek+UCeJTn009YcC2dVM++0UqguMJyHb0COPiHYFb
	E7UNyk9M1e78rf5G87nPX1RGkoROMywPLGEpP6NsBcv9KwG2B15TkiHa0ClCWnAvEnvcbYo7zoR
	JwQYoKCw62hUwWtGDMdmmInYv/BLJgL3tOFd4IfR/9c90V1JAyLW9q91//7t9aTdATggKidH6sD
	Iz5vHf3qXY0AfvMZRqLaOtdWc7sJ/knZV4QtKSXzkGKYw8GLL5S02ofKFxGj8QrTzrPK6mtUrAW
	uNvscGpluSoBML/b/G5+W9KgHEvjf/633AbdvHqc=
X-Received: by 2002:a17:90b:4f84:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3ae897ccd23mr13800971a91.20.1793849809553;
        Wed, 04 Nov 2026 19:36:49 -0800 (PST)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d4bf1sm1490765a91.16.2026.11.04.19.36.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:36:48 -0800 (PST)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso1433410c88.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 19:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx7sidnnDXUjtd8BayiGZbMrMI1gP1stYde1HE8RBCVWEZ3gh3QITfbiN7SxbUKuoAuTOrQGvxq3Gk=@vger.kernel.org
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id
 a92af1059eb24-1ac5d1d058amr26264865c88.22.1793849807402; Wed, 04 Nov 2026
 19:36:47 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
 <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com> <20261105-dreamily-quicken-31e2b446a942@spud>
In-Reply-To: <20261105-dreamily-quicken-31e2b446a942@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 22:36:35 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
X-Gm-Features: AclHuK-3idFUv5nBVANz40sgPgySfpizpIMP20bnEM1ST-bN7ItPz_5x2_r8WXs
Message-ID: <CAPY4CJ4Kb57AJK1mOxiv+z1qAbOiAD2e3srf7Q1knd3-11nLhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Just link me a tree somewhere with the dts, I;m sure one exists ;)

Here it is, on v7.4-rc1:

https://github.com/The1TrueJoe/linux/tree/sf19a2890-dts-v2

and the SoC dtsi with the twelve managers:

https://github.com/The1TrueJoe/linux/blob/5aca36c1b028fde1794eacda4cb6c1a5f8e9b96c/arch/mips/boot/dts/siflower/sf19a2890.dtsi

The branch has this series and the dts series, with the v2 changes from
the reviews so far; v2 is not posted yet.

> > If that should be one syscon node per block, providing the clocks and
>
> No probably not.

Thanks. Unless the dts changes that, v2 will keep one clock and reset
manager per block.
