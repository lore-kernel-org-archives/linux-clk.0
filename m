Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792669;
	b=OfeJ69yFWmNulDfLYFHWr6EW+A0/L1heC+fPAiNR/z5sW4J/C8wwvyTdiUEv5KjRWu84
	 LGrQwHF/0D5m5HnSBuqsXNfmeUE8OfkAVBEJfM/NvUU0zb5BPQQe1TLNqAzXxJG0NGpDr
	 Zl6r5Pam4p/pmRJpk76aPjxS7Fq3u4zp+MvSHe8oHCBdTmU4KO53ArqIIqPCgqAOKcZ7q
	 MJm1jHCARYheDuOne2NoL/x+C6Egj39SKqSE2Ijc0ONh5oYqjpCx+4XJLHTfbPBe0rGtI
	 iIg2vicLVIO63EHT5LSkPFUUwRl0A3oHlvLopZJu9cN/gxWz12dLWHuFCwCPexfAFuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
	b=3uvNsUIWwmuIMnKSWAQXra/ETUOZRCvi2jpzGK9Qxt4/b17LmzJTHMAdYcVBaTdn/Trs
	 HE+dCkhUjmctIyRWmvrb6xpqBRgB11mk5urJZ9C060SdkMn5CWtnyl6a83ID/ahMPNvO0
	 N1rT/lMMUFApaKDLDWXuP+HEm3UpY1ouFL89x4Qd16hBeO096kacdV7z23aKvFtJj0aE0
	 KDQYGfvlAqakCia0Nu6ORbJx+miiME6RKxh0o69F45cfN0bx/g6Nj6KBwKFtQAMb7+PLr
	 H/DwBVWhvu1JipDRjdy3pR0Zi45b0HjX7boLLEWssDQCA3zD6Zfp16qLmTfTlhzJpzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PHYJ9Vh+;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574F606A321
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 15:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8574F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PHYJ9Vh+
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1484300466b.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792667; x=1796397467; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=PHYJ9Vh+E9bdwFIdCTWltq0NjvcDaQzBDSWySkN/Lq59JJ0zzLrJfQU2pScFDfc3Do
         8kCebPE2r7w/ZpYu6IisAR5Bs5+ncnSnHqFwDK0qQGVI6VhqOeN4ivDGNBqYiPho4/hp
         7Mym/cbqRsusu2NFg9FBqnFHt4860A5erqb1uV8sGtBLHgeLTABxFpLBPl66nhTOZXK/
         iiimPy8BOMPpOkuZ3Qvfd4L9iMGxIvNfsTrNDN5GEt7dgIei3fs8pOuQtsN+CKlbOKDj
         7TCQksKSG9hhoyNSYJQfN1Wfer79+Bj9nSoQwVUhsbfl5Zkv0q5jesDi39r2GEASdSc3
         CjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792667; x=1796397467;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLbQvYUrjzEDTt2mCUe1XfDKZ160von+CQ6nnPe3W3A=;
        b=eXzsDQZ0BSiBo/RuuUCIni5rv6Bmi36vujiGYyQV30pWyUvqgIVMq3qZTd24JjlJ30
         uWBKrdF0xNmbYErX8Pols9HvIB0khCdXSOD6ul2Dqbc1XpBkfhHetAzrJiYIt6JdpEfv
         e/Ph4INRBdC6oeZSLDMJqJGkcTk23/Vd2C7kDfL9CvYodNXLwofjlfQSIwJqvmJcg0YR
         vnHzO4aR7ulHlQwdShk85rEB9BmJRJMB6f8/hAp0/S8FWqFJg52+yVq8+tqGhS1Veo1Y
         OS4J3VUjxK9WMziSvXf/V6xs1KXliwC5JiDyx/+CtmO7YUWHDQs2my/xv/SQvxeFfsQu
         NUqQ==
X-Forwarded-Encrypted: i=1; AL+hErGxQ28FVdedbq81DJjgryNyo4Tt3sN+k9hc+AW5sL/o1zdY22HKcH3GGl4OkEtim8j12a/yYXUIgyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HFmBU8qKI3OD1jnWwYN8mvUNsNOlGOUMyHT/ZTw6+wyBlmd12
	w34kDBn6l/dNmmA110nLsjj5b1yVKFt7bPPfjHPeuSBjE/a+DyovjbqL0zbtp/0c7zk=
X-Gm-Gg: AZFdTZfjWAGfYXeOjuDQkMaNDYIvO3LtcgeuTT4RAIOOj0Aje52MlMr6HX18eyk1XU3
	YZ9spYbEadRyzruzVE4oHy8qvVHphNsE6/GAZ4hfrtr4E3SeOtFbZnR7ExBpKIdi6hk9AfJC0+2
	NNYmJVFMpG1JslAuladZVVCuiXWT334F42oKNNoWmdJQKf4HqTLbKlaQA2iHvRmraYWMzHpNK2S
	E1cJpDZqzEK46IOgW47cWt0qqrUG63hhmNSqiJKceWIa+ABh9Szt8OR72ho2/8e+BwivX3M+2FI
	REpnINwwKMOcluf8uo+I5pKc+6VbY25x/uu2XfAiBR2sixCOWaHotoME6XK3GBer6h4avOUrS5X
	O5TmB1JUre4CKSX9tM5vL2EINC6yeBEu1fN67p/0YZBTPtKpKx4GdWv+s7Xcm4+yvpd36FliSCM
	9Viocw1rmVrrl3tpzI3e6TFSU/Hvjf/Ov6ITKIvFCp+wODWOEf3O5N1VL8FxIr+nQg/UBHcxR4I
	6PaLQDFwt+T0reaRIQ8sGVR4rCbaPrfLdZ0tj25nezQKXBi4G9ZxJaj9laVkj2gUoa/7B2myeRW
	+nKpQBLvZcWBocYkQ4AZQY0Mu0gHRRQH8A+HjOGksuIaeduz
X-Received: by 2002:a17:906:1911:b0:c41:b94c:4538 with SMTP id a640c23a62f3a-c513acd297fmr1475999466b.47.1795792666943;
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm868490666b.57.2026.11.27.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:46 -0800 (PST)
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
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
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
In-Reply-To: <20261123112053.20400-2-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.15729395589845750540.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KwT62dMsS+rp93AZIY4GYCZTTc4JdLTdUPR1lLaOY8Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXD9nyo/DD900IziTDfXyfsLwu37F9nXxx7YY/2A
 VUHu7X7O0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRVjlGhr1bD0n4ZtZ9XRD1
 esH1TWtt5gitnBJw6NZEf/MKE2/rOZcYGf6+WDtb/Rz7gfqPZrfEcs3jP72QE/RYveZa6D7/e2b
 X+3gA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")

sashiko is right about this tag, this needs fixing
I'll do it while applying the change

-- 
Jerome

