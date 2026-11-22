Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362241;
	b=OYwqJFIqjB0aek50tTuPzSOWlg2KIU+144PFxT9Qp+jBbCuJ3s6nAALlBTP+HjW/L8NB
	 yA9/i8nhyLQuvlRZqGnN65LNhXbnbfzhtQ6OkIPZl3paWd1MQCSD8O/Bls8e5h3yGPUKo
	 SfdJ8MhhYIs4PUK7TGi7I5yu12zEt/GdvJJp7K4QHkhGFQIo6S5N2mMrrpCVlU0l0KRYp
	 M2ArAt+y153acZ6bQRbVtvfXQd2yLTEhTCieq4Fs17SqkIlmDfgyc/cyS+bYZ6P4eUQB7
	 SLCUzW/XDb2jU7EZ9F/vJuozvPuw8ZGagzt0UzEtwORznAXLwx72w7F/LvUc8tGWqDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
	b=qiAsaaGvQ8POpt/AQBZelNHPQkRb1TiRQ0/PJxah7c3FIt0+uK6d9ax4H1VvHkk2+kTD
	 Sij09dTMHEJf8gjWcQxvFiD+5T9oKnY1DU5w2BKM100FczOTorJ2O2KHWm3k8kUCWQEAW
	 OhjHTOSBk1UlHaxaS11tjVO+zdaCsLc2jWvcoxHw+yIFG/ZB3AEmD4kij1+D2NcvR8t55
	 HH3Dyu1bjCgHjYWOXzd0FS+OeFZS5SWvqSkDV9YkAS1kdDJ34NB5qj0StmVNUIer5+uKz
	 5wXdk26LPevN6/DCB91SkB4NCWy0MNkpttZIEN0QibeDLkxldP92+7WMsIxhEkayfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QB1NahZi;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B0606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 15:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QB1NahZi
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso17177125e9.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362239; x=1795967039; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=QB1NahZiK6TorK5WMu/AnSDAFcm8/vwmmHq90ZmqMPzL/O+gilg8DS+BIDsYcPwVDK
         ZaAfr5L7MTW2v2aeFIz12nf6mWQsz+ep7qDGd9PDQNuoJG4rEiAuvkh5ndtg8Gx404cm
         ifN/vnIfqb2xlPYSY5W/nGj4BqV+3Y5DLJNJ2pKRqOlPiI0qy/v16GVyiH7uaV73DXPC
         dWIdT2A3gRxBh9llKhWX9O9PhgxhkU3R9p6Ct8uDIusoAlnRaMcxayYdO2CyywIgCn28
         5UW9OXCT/EEhopJS2VSC/dyIdbWB7RMgVmT85eQbwkma2l97Xac+Q4ncDnPEcw7XhOKQ
         QWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362239; x=1795967039;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=UURSWMWAH3vfskBBgWajNkiWEpZ6pHYBGAl2lQY/3tr4rpyAp23h8ahFSyqBF2axfe
         1d2yUksMuzRsQoApqYpYXG+fB8UV4vpGGVehPmcmJ8+I6CpQWzY38u1J8FDaJ2iqEtUd
         ntNDrcrR1Drb5Ch6GT/Ip+zUbICY5fxkkQ+EkpfffbYd4HdajtI8zMAHEjxbE+TdxIUw
         8U+AkAX7nXqjpjeTkyxOS5S1I0k0FMtN4R77Kf8CEgMwYzsmuSvxp1PkODsP+1lXF2ZN
         TJCKmb6TqcYp1tOKzwJJ+ZWPCoq7xY3uOW3XnKMp580R17nqChqgRJ+Zp5Ym7tCQHLis
         jb/w==
X-Forwarded-Encrypted: i=1; AL+hErHZm+G9vURCts6JRo3jCxiffIgFi78Ini/skL6j1ZztGDApQ2n+U85Ir56gYcHXtv2UnJZsypJn4fI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9v1FjcXj/u1r9XqHxuTz262jYl1W6kNfjyNqNVXhhT/jGYs2D
	+M/WHJLKn71/BBSIbr7UzFhwNbAaZiHE6TTgRKvrkGj7PlBWJiGV4UjdISA9ipVbI3A=
X-Gm-Gg: AZFdTZde69mcSdJnvMKxCOvF85UWya0UtN2ZsyZoRlr0ehVqCmZLqfiPL+ZdEiqdHzb
	Ep+c48uAkjnaMW2mw/EszrWJjscQCbfcXfkyRa+NPYVo++CAn90Ch/oFmzAvK9uExdGQaZ7UY+g
	TTN+ZBlv+u3YBLdxWT3O1hhXwoC4iOEGeKJ85F/tFgNmj5+ViAOhW9bO1QEr669GmbhA7pi5U9E
	LvJeIZ9kMeEmngHApmcl+BYGSKu8NXrgg0iJJ1oiiIOBOCvndzeCgepbuoskjCY8PY81asytJPK
	l6Hl3nknyKr1xi/DpnSgWXLRGSxQ3+WyZm4ML9WaCdaETSQGAACr34CCs6IwUm2WM6zfqnvIBGR
	4kdez0Sgar/XYXn1GsV4isw8GQjNtA6Uz7eAQBltg886aaJiIhJpQ/CXbEldiIM4w92RRwiaurU
	GXlVoVsg8HzTq7j9jHwAjpvKZhPxiGZMfDqQzRJFhDo7irlPei3/+H4cW6M2oLu0KMY2QnTAAoH
	sYlS6ifC7Ld9ij7VMt2PyGp+rWrN33j0o/cDJOWqC4AspYJZtxNRvQkRObxiDaulyi/+xxesN/7
	0rEiLwwDQZtEjRp/U+V5R+hUOzhbXhf24n2iKuLS1r0TqqvXaQ==
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr179650485e9.30.1795362239768;
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm124899915e9.1.2026.11.22.07.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:59 -0800 (PST)
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
Subject: Re: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
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
In-Reply-To: <20261118100523.11395-4-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-4-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.4581137443338131034.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHv2TjpSZauWVl+5civr/YNXd327fkT28oZp9925r
 55bIreqvKOUhUGMi0FWTJGlhrta/J2k1pdZ03Vuw8xhZQIZwsDFKQATObCW4Z9CxquCpZGC21aL
 Nnb/ULh3MGJ1xL3LTCLMsf2bf3tLXzFnZJh+JWddZY5f3cmoAvMfRhNWZsfl89S8vsdicKVzk/h
 XXn4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome

