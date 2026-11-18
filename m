Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996081;
	b=Eq2otAtHzVwnTNk5nG/s6Nd0clcbd2Onr+s0ENyQCzbkEmCoPttCA14B7TEsg6en91WP
	 xdZQWSOKq4K3kfVtbF3grkzUO3KPIvqZLSlxrsxcEOKkG9dAhit7RNRFqwE78EZHAd5Cv
	 30cK9t++1qJQr5ykMc0goSnLr2GvtwW+r3ytDmUtZMLCKeXPgE2MfSf8qPUuNUs74ly76
	 TIOuStl8YeSqJ3r6ry0rfzWcsV4SMu/vq0rf6FlV57PBFGvTyF8HaRPsKgggDRI6RIQRB
	 4JxyC1hMKCRUHIr81G/HO00ivJyg4vrvqXjXzvavbytNg7Nv6BbNXwAepsB6SuBWHOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
	b=33yniR48AoOqob1qB2QdaZgjifY+PT+ovpkfRbsSDjE+ZKr4oGnOmKM1E95GNceF/Ush
	 kqotdFsDehBbNaqAAkEjAwWLyOfjDS/6BfdKJgRL7pKCbX1/qGdQql2soJ/biRhigtFwg
	 GT4s8/82JW0rYV/oVsHCU8AZ+8w8CfO8zcPs+DeIeihvEyzLi+bNwECK3E75DhL2jGp+D
	 LHT0A8+6UMPiYqIIMK3skq1f4gPvJW03n8g0zs8HMN6ckXc0OwDa3HdW2VTyU/qX8kfVi
	 l1I4C8yXxUmoBDlCYHid/XWESuintQr9Al781wv5agihHzpZD4EFtl/uVgJo//DgUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE66606A325
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 10:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE66606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Cu3dNoaO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so539026f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996079; x=1795600879; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=Cu3dNoaOROvw8Z0X0aYoedt9cHmkWdIUCopqCk0FznPH6BTlJS6lkNA5ZuolQQzRSb
         gCwWmWglTBjy6D6Pxzb/dZTR9iLgq5ASnYmnjk8HWJC+tUEfuDP03qA4rvAP/DpNhUpD
         /4tEe5bgC/rVib/o/SX57mVsJyjT0HV0BEETlS+S57j9owY7Hb1Sp0YFtVDIJw+UYIIh
         cg9BzaDbSTpeVCd5czphc7fz+/NX6M1qNvsdIQxNqXI81QMAU8EHCTfuDnKk5damCqFL
         wAbdceW4r/L7L/lcrENwsNPAqS9wpiq1Y1G2FQp7h80V11fI8vBuE0mK09MzshIcFNj0
         Iozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996079; x=1795600879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=FdBR5P847sjUXWEk7/BHoacJWO6gyTx6ArNib5p4lfriO2uoCERRuh5SU/kk/ygyr8
         Llp6rR+sBQBe5hiBpzfifRzfZQaQGYSydE2xMJyjc5n0h+xcUQUmOi5jEmozSshjoy1H
         6EMFGS+OFCwOSG284wbz3ShlP0oxBBHc15SwbjByWqvr31NCyc4hiKaw8qZ2BJQunjvG
         ZSYBmPEgGL2uqaJD0PcRo7LiV1gilw561rQg4x8pNcSR6OsUSJ6u4wQOFKN8QJi7Jn1q
         TrYL6Mt5G74JNS2292w+FlbjaVWqMARFY1iNbTNcuOaRQ3+LznGSsexxoIIg5kmL4Gyj
         OtbQ==
X-Forwarded-Encrypted: i=1; AL+hErG9E3dRUzxx3nGD8qB13n9ANXDJAAZ1uUrtINvWD1pVknSDRxpViYhYIOWysT0PJEQRLz6DDWrQUGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z86TAQ5AY6AuCK1RCHpHUy66CISU8INnlDEQX+QOPUWoMSLf/We
	rWW1qGya9h4crPQpp8mC8+vJ4H3GtbZdklQD7jN3XuqH6p3/h41VSEQ+NXmPQocmVArTbu1bN7J
	Uf3q2
X-Gm-Gg: AZFdTZdPR97o1zpTnplN6Rjo6iefObStUSusaEZ7aVXAMM/jxTcqfujYegaIEyMhES6
	9cw4+iKXv377gAYhMn2urUrTJBCBWj4bz5HIzlhA42eeHRXUHsM9d+E79dkJzRnVE/cBaxnWxYl
	0LqrLDJhXfPBDlpQpBUdqBGhaVQEeEf7r5ja+lRWr/RCpLOoQguvVsFMq92W+/3jppLjm7SExPm
	VGZS9lHsWKGuHY+NvexnRzFb89moZFYEpblA1J3WMGCr0UFnd516eS4rbZXR2hMRYtbLFZSv6xh
	XXe6uBtDshPdVlyz6j2ng3Lh+orwm4MOFpW3bSqcNFG2x5z8C0+khpCysbvTC+5CC58kIvaTcve
	J9GuRTCICJkANgTmThW8MgDwy1nWtbaOGd9dFo53UiC2vX87IwPPTn899qVAWI5BXeBOVfptzq1
	/j3v5KXDSVDk6rEkVVV+AWNGmm/7OA41xwSY07hPvA4twlgdWIu8nw+uamTMd2HZbk4JYzjPKHD
	Zj4CQ8rxqOkS/hXcwlxggXB922PfnNYiCQNusFcg74CMtoH5LAQCcqSr6WNgQotN5zj9gAtaUzS
	RYThoDYXSIBYXLs07ST7scviwTA89wkIAQj6sNsEqgWECjxA
X-Received: by 2002:a05:6000:4812:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4a63c0938c4mr4292105f8f.39.1794996078453;
        Wed, 18 Nov 2026 02:01:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm3712254f8f.2.2026.11.18.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:17 -0800 (PST)
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
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a
 pre-divider
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.2562080050432015678.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5EHyC5MxoGvHsCcV/VC2od4aT2B3tCgL0d4UTk1LaZY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3OMtyjNXN+x6DPTga27pnxbX7qy1DfK8qqpoZ13x
 EfpYP64jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRivDP5ujDMWqq/wiOi8w
 7dgxUSuhNjf2xpWV3VtVUp2rknN+XWdkeCgxYdb+ymrWX4mWglrTe08XrHBQCr18n71wQbN1tIY
 PKwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The common PLL code assumes that every PLL has a pre-divider. This
> does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
> meant to run with theirs set to 1.
> 
> Make the pre-divider optional so these PLLs can use the common
> implementation.
>

This change looks like the intermediate step Jian needed for its rework.
It leaves some problems open, like a PLL without a predivider could still
pass a prediv in its table which would lead to inconsistencies.

If I take it for the S7, I still expect Jian's to rework to be finalized
for the other SoCs. Note that I will not accept more SoC drivers using this
intermediate step until the rework is complete.

Regarding sashiko pre-existing issues, You are free to ignore those in the
context of this series but you are welcome to have a look at them, if you
want to.

-- 
Jerome

