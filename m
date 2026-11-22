Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362241;
	b=dy40m2ekYm/zxln/cYbK+u1RKVcyuVv+SdfL8fs26SZ3gWl5t85EMxDa1fJfsa/24KFj
	 fKopLSXgKqM8vCrH+MY6AJdl3d2GTH6HbPGW4/+lGByTodX4xSeWhR/14p1SPwLykjd1L
	 SskPD6sPYanEJQ6FEZ3emTVOv097nNF/q3J/2Q47ZQtoLLqBuHB1gGG5os5WOeczUCpxN
	 +cK3DW0K+UpPYEWiwCMKavasNqj1vKk8ao0Hl83e0f8VKZbTg+O7tWUtE12fXb9dD4ilK
	 yvxC4ktv/Uw62CKzeufy6uPfqYZ/a2bxRLvevLa28+q9C8ZbS/pRuDeTOl3JqAOPFCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
	b=hlG5RMfChTcX2luHJVbb1+8Ffq4/Ow+S6v/jzVXNjnBCepHL7NbrVLYgWiX4PnmMxALM
	 G9bJnYx1Tf8GEPPN3De0SgtOAMz7RihIziFYAGdLbrTGkziMiQngF/v/HdEC9JXZudI6W
	 Lh/CURp89iLanoa4nqxOcnhPMGLAAtK+iMLBOGPaHNx7+oyn+zN2E+yKcETrLvz4Ii9ie
	 ZAD47rnFrZTqBY3IEklKjW1paR3JCHfJg3YNc46CiilJFutmkicbZKgcYAlarpVkIuMPI
	 CYl9LDa8jtOh2DbHwjCo3ziwm4WBq4yECHJ3fVcmGVHjKX3gnFSArU7QZ5uQlMfjk9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aZXM4oS9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29565606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29565606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aZXM4oS9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so1740510f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362238; x=1795967038; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=aZXM4oS918gG+eUP05Y1qLbGllYfPqBjYyT9x6LIH5yay0JrLpnkpGK9KckLhxkHtC
         1bsAhDtYfv4T55SvQ1e7FwEBzZBg7ABHX5uRZFhAfiFsM7Exr/RhOgPQTmQzSju5aD4G
         UDRPONiDsHybe2H3/zRgtsHE9H7AleRGGsYYajwkDMtf28T2yr3a2Ni6JqDFIXiqa+Ws
         0rAhzAzl4Wgiw4+rh6Aja5/tq+3VO0sRqsxG6xsWQ4uq0xG6cH18dH555BfFawxT4BhP
         MB5Z1GyO5is330qD5bRHpTQEbEQyPIGsk/6d/weZnfNLLTbR2k/0gyeUqkDaZoxJDgQ3
         EcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362238; x=1795967038;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=aKbZEMCEod/q0NYxJQ15o1GUKXG0z6MAtB71bDAX68Dyqmw5AzPZrLpjye6fDqrEQ0
         FX/xLIYiWpF7sXC6a1OT+wH0S/vhXlZleG9N6UuqRQt0eM09kAZsW0wfb9y4mudqxUnC
         hPfcPwTwEPN4ikIoU854YhZD4hfk77tEMmLcKKBKGR4uWGlOrQuO+iF/NndbwUUm59+N
         8rLm1pOeKwvxyiVEhnWOu/cQIrLxu6RvpN3/dor055zcwvO27SSWjb/78Zaa9I06vA6n
         9SnZPScufZ30r1VsqiRcZ5q4r0tidHPu0xvaJiLr9vlo+xvn/+BDOvLRwVwzSF9YBM6o
         NYJQ==
X-Forwarded-Encrypted: i=1; AL+hErFL4YTlnT6Gszd/UpjA40fsKxUTP3SUwARQc8UF6/AMTSGxrYlysBCz38FqpDf981isb6NvA3Lrk8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iE0m6ntVA6RITtV69VnCXRIZ7iLoHLNYrCQY0ig+dmqkjL+gN
	5mT4qzexyVs0tOntoXEjSqsh9lCFBLQLa1rXmnUeIPKNN7VA2bRuVdKtL4p6aPuEj30=
X-Gm-Gg: AZFdTZdHRA+ZjAHWU+XIGYjKcukFBS8Tw1urcsOWVqJmYHo0TF8TUbhd1aamQBA5MzL
	zp9qnJgfhqTVri0U0TnDhbaQDqmTWkzlMVKQALe73RIN7s1kvR7fJah/TTHjkYpUC3BGjNVy4gq
	4xHwjIL4NzLblbQTdDORmVlWyRKmjQHlPkxB5hZUHJc08kASTHDCCOOST1xlNkzAMaBc8fW1sWN
	8BoPvl2Ne6vqkkBUCrrdQR28sfMod6H+5LPjOReotlE6a3nKV99w8ldtWvJUqmtEd6IYFGq+xwW
	+R9EAU4mdh/XYCKRwQoCY5KJoSZrzI1U0IzyEHSE5PT/kSsuP74y+ctdV/FtwoLMpXJn/4RTtmt
	hazH5N5ktYEj5NBTY43DMw5ZiMEyixm5gUq4lloRb5UPN/3Yfk3JkuLt/7x0RxtD8fKoXgEqym0
	XcOFL4KzDFuglx6lJsgmnSqH/BtTp2Nqvmf33sPnkD5NYAyC54dkf/LMOG1O5uzwmEl+0oRTTAX
	nXXRTW3uWJVEQ/UKt5lSsKUmA7zeLW0wtsWCF6rmK+CjeZrQVpV6Xgra+SPmPeoHS/2eUE321Om
	P/xALguJFu5n8cFCXoddYEg+A8BtT7olIaxlCeDFxq8dRq8u
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr182572615e9.22.1795362238621;
        Sun, 22 Nov 2026 07:43:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm129786485e9.3.2026.11.22.07.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:57 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-2-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.2551074975231928125.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=416; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qf7fKlC7xQ5OvM7XPpMsjo0fjKrbdU4orK1COOHrhak=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHsqQm4XN/ZYbtt4xPoXk4RTR6/I4nABFSO7pWpPE
 1c9Us7vKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWH2b4H6i5IWbTi+a+3ocn
 UzdoicyytWfgM/3r4Gcps1W75b8tB8P/mub8vdGWJkIF8dJHN+wU7023DPlsHnpU/aLS1X9Zgi/
 4AQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")

sashiko is right about this tag, this needs fixing

-- 
Jerome

