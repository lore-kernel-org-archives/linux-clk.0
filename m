Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005046;
	b=PiFwmM+WK7gzcPv8o7a0igZX/zTDyIHK8HrknketprSLJB7FEgmWd8uJqEGXn+r+7ZUh
	 Sbad0iJAgg+O3x8Sr7mCyYUeUzjNwk+myHCgvMxzSpBX20s6UT7WOju2at+0RTBxiJw5W
	 9LISNoDzFvf2eoIlrqufu4ttyJaHUbTKTk+ZingrAddE+gDO9ze5iOmfRp6tMaxbnNcYd
	 NQfigWfkBqsuUc+HqA1nZeBXRx3Tz6GgLKPYygYHtranyup1GDVFjjIgsqE3E24ntAztY
	 4TmXB4HJXPwglJ1CmIZrsWZhsDNjbU+r/TfCCV9j/wH39NqMLRcG/wf7qV54SjKwIDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
	b=p7tG3nKsUaKe8pvjwlnjnT5KTFr6b0iIM8dVWMo5rjSVwSWcBrTImofKWx6nDw3vaIaG
	 GuHf8/2uNmx/0p05wg6bOqb+GZLvwc6Zmbm/J4qM+jL6Q/GZdKdvWtLDwwrt+qGKqjmKT
	 u5Bicap7U0gfuOILfC7V6RQcPownlQuylroKx4+JfN1vyS2giPQo7J03JOHFxWt8uMXP9
	 uRZXvIZQy85DC4Awl/HTTLWKLmSpAoQrrq1JlaAxKBZP0t91ruZ+nUlBAzN0N2eXZMCuf
	 BazLd5m/IwHNe3XijvT45BSSzt9eUfaBgtPcg7t6gP9WKBL9QacRcgWwAJp2YteL51A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D07606A31A
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nBILM34N
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22288585e9.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793005043; x=1793609843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=nBILM34N+DQmcQaiOwhhjAIBvLE1X8GiwMvy8mC6GThNPWRS1nnLAFrtY3hnyPSVNE
         Iw1wUC/FrAKhdk2E9Rv+/IZ3Uc/lKsrmo5Mo8o81Pcp3wYgTBWsY/iK1KyOY8+ku68Gr
         tlMyY4cGuHGGSdUUxuJ7RZ3eZanC3KZDVNtmShz+O6nzvpD7y+1eqGYHNXl0RPRK9FO5
         U1h5UehATB6b4SpLQbkpIAIfNmrGn2Y81XswDvMZerQClesyMtP3EptTEVYYe/0a2oLo
         PM/pYmxmaKVN2IGHCumdecvCMaF1hsrQQpghaWKBGPX5Aozb9IqHi1j1Ihl8WKCh6LDx
         cEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005043; x=1793609843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=e3fRr1GdcIOT1HkZTw6+kiv4l9w/1MAW2G9fj+p6sut0MzVh1iYqWRvVpBjbXP/w0W
         kmflF5xXOLsN2cTPEUN26js1V0IM0fYN6Lq7zHz41pbrFPTZW3xK3PHHOHh+kVwkhLHA
         M91OG26OJS+Ys5WgfJv7VKhANMNzzuuxv3ZIm3ggXQq5A8gzr/17Rm1Ku9UF3Zs/QYxU
         TSR0nUSn/Ffj3S6BRfjpWDCfvHVoO6tx4iyWmZVMrVzzZABn5578ayOPpZ9YccH6extF
         0jjRryhdpWT9xc0IPWcYMPBkxUvLda7ULNSigAKSWLMtgweKNgSama6V9WPsh59+jBzd
         dYhw==
X-Forwarded-Encrypted: i=1; AKwUvBwjSi2Xu8vzBadJNeXI+WlPa/GFcJAv0h9m3fExjtDbts8Q9t+hmZgj+2UpmWPghK9xay0ChjxR5ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjS94ZiWmx3lRPLcfOrZVADdHTFlWKY9LLHJCI/ktSMJXD6o52
	bnypggIs3HSWRPMaUv6BAc4f3IQuTVcNClVP+o+b1A8oiskj66wTI9yadoM+9pXkGrI=
X-Gm-Gg: AYBFou2S34UTwcivpOr09A+t8nVGV0OnS5vfbxE2o8Z5cJNDddi7Mn2an6t8HbGDMWQ
	WNrdjqRfUljTahx9iX/qZ1FhDaRYx8xkRE2ICRBjNk4OcvcubmeEV+5r9FBpTqg7G7MlZ9QJV4m
	FZSz7mmgaK2lmykX6Lg/tCqaCsuyVW1IcdkaMWFM8/5HIGdpE7RwPxwra0d6DU/BdAJFiQUwfds
	c7MoTW2XFvlMILYL+2hdkKTcNvtc3fr/I/DZlKUmtbUiYFrSPta9XbPaid4N8ZliR7/xiNiQDQK
	2BT9yiOzsSEjVmxkyCyoJCl20Z79wELpxBu5VNM60cIeZG2AfTEiftvYzlQBj3IzxuLM/Aa9Ouv
	bo+VWkUsTb3bvepOqsnxvqDWa3+l2P/Qj1fcBUIAEaH24B8IfBWT5jLL2UT+/pfxE21E7hRrYqu
	2VRHJ0gPd6kfXSQKxF9tRnjOK+tCg+7MsLdf9VbYAPCYkXCsYecd1e9UyGym667YL+G7ZT/7Up+
	j9FB5c1qhA59no60niXb6B2k4PCQD5GCROPdT4QIwwDyP7OzXp0umOy8m8fzUrD8ffs3l4BF5Q=
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr118305925e9.19.1793005043279;
        Mon, 26 Oct 2026 01:57:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm187484365e9.15.2026.10.26.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:57:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4?=
 =?utf-8?B?bA==?=
 <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
Date: Mon, 26 Oct 2026 09:57:22 +0100
Message-ID: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>=20
>> Every S4 speed bin runs the same CPU frequencies but needs its own
>> voltage curve, and the bin can only be read through the secure monitor.
>>=20
>> Read the bin from the firmware, select the matching
>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
>> on the SoC compatible and needs no node of its own, and S4 is added to
>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
>> the bin has been applied.
>>=20
>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.d=
e>
>> ---
>>  MAINTAINERS                          |   1 +
>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>  drivers/cpufreq/Makefile             |   1 +
>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>  5 files changed, 202 insertions(+)
>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>
> Is it safe to apply just this one ? I can take this via the PM tree then.

I would advise to wait a little for Amlogic to chime in.

Patch 2 is something I already rejected back when S4 support was
initially introduced. I suppose AI just unearthed it and did not bother
to mention it.

Amlogic was supposed to migrate to SCMI at that point, and possibly
handle CPU frequency scaling through the secure fw entirely.

They did on later SoCs, I don't know where their FW stands on the S4.

>
> --=20
> viresh

--=20
Jerome
