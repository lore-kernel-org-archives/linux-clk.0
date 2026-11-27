Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789988;
	b=3DfOMDsyLduZGXyGNXcMPxoDyJzTIZ3hliCPhYR42cE7C78vDpu1do+LIHOn+t52jV96
	 GZaHil5QVvvC6NpjrYv8I1tMQhYp6yekHbiR4qVxsZ0GKs8iGVoscEVRO4KWvuJLb4lDz
	 CHp4A/eqcP1FmAohqncYYVbSCpUKRWtWl+jado5j4toELWFrVkPdtc1+FT3XFZc5Tof4r
	 PK7ThT07Q4EAHX3hTzVfJqN6Q3TgbmZJi/j8HwvTRATz2czXkO6P+5W/JBFhMySIAmXJB
	 DiGxNWnAZX9QmlgobNZSUr6C+ZAWEC1o55c4cVFqyna1dZVcJkgrk6ALDOR8j36DKpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=;
	b=cIPHUzE7ybFWt3sHc4R4PNgxp+8Ae38lxjubtXI8UeFyyFniKZnWp8Ng6AKTrCh6va5e
	 pVzYW3JCslG1UdKeVFujz0DUK4L0XWzzZ4eGC8/GbEexPiHY0h0ONSfNB/6JTDRftWKLo
	 0dWlHy32tr/UhMPOZcba8t2De2yAugwu2p8WaKy5KioCDZU9tEO45P88EkoS/8DL2BEFJ
	 tBPcGzrU8QNYPex/AOshieRsOTG8Dev8AzwIfmlQFQaTM4QDBAdkjiPw+GqlCVgnrYJzF
	 E4HyB7g1smr4NvwvK1QY5bv9ivGYbCw+5FNSBncgbG5fDCVszh8IaztdkbBgruLBJ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GvDTR7Ne;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13765606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13765606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GvDTR7Ne
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5198302d38so629192366b.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795789985; x=1796394785; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=;
        b=GvDTR7NeoznAqgsSLnmw/eeg+hz/iMh9ZtGgW0zfV1MN7dRos6ZdlTiDgTcV9Y+SGy
         Bzc0f8s0YL748BLUHIrG7C7hYIWKzEngQVhxsFvhzMAH8qu0FVKVH6uQxeXqO5/CcP0v
         +/Gh4ryhl1HIX21ooOEsi64MbbNOEQzk/O/HN1Ami3DBTnfK7Ri97u74i7F7RgewkUcb
         WWFnEbX39Ogdg0V798+xQTZFAbJ2lIL//8+w6ZPoZxyKAhSIzOqtY5ZzVF/i7qep4Fsc
         L2os8ordgGY9qJ4eFEbwQW3i3w+Yw1hJzDyKeXO59tsJawkoafTV/1qz3cjM1TOaA/yx
         M57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789985; x=1796394785;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=;
        b=alXgIOReMzcmyGdWIrHZxgCZj79H6Xjes3gySQ0NwNFLPaDAxHXBPv+GGhAlq1xfr9
         d4VbjfCH6X6aN1Y3RoQwr+fHEzuC6dx6t/C0pSVxgUP8sqM0e+u4fJulkXXF6LNI7bJP
         Nj0xZZ4DKhL/vh/EObk9sFaL3iQHUhR9dn9G8nCnIrz23Fz55AyVELW0MrQPV9w1XpBn
         +dyLM0bqDaAO0k4dJx6jkqTamb+3G5XYI7csN0/uVyWswNDxZeKBPNXNjcXmo0AGBGQb
         MlN5MIq3jqCIUV9X9xhiQ+LzIVUHFcRAUsRtHESiiWbJE0/wS5/UupnmAFCV/Fp2ktzu
         BWYg==
X-Forwarded-Encrypted: i=1; AL+hErFTjki2+39D+Xba7QDhIkaAyARWfKQP0szd6SfOegR6BFXKgmDS/UHupBuwI7DVfxEE4VEs8rYd8jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WbQY0PJkaJYIpv6XTh9j9UrUopj38GeY0oKXSvlobMvHjwmkQ
	f8AiIjKeO8FMu/mhhTzjrBi9yjq3gCOFKZALp5iF+1V0jgyd2zfMyhyQBcjvivcVjdw=
X-Gm-Gg: AZFdTZeLCqhlJsFP+ldv/QJhneNKasyYNVksWpNofbmg5DM+AJETbVDBg8sydwHq3Tk
	Q/Na6wub1uCeC8+5+1qmhUORfUyyPH7xPtplQA4OFgxc3H6pgWiBMgGc+OJ9O+3aHDRs+M/6T+r
	vH3cmJkcSeEl5+SY80sga3Upahs36PyzNAY5Q85SaHTiZOUnr2ozWY5vPD2jtfs9XanNtLNgJpj
	bFySnipPr4ztN1fs/gTd3UtuI6HzbzjtNb1VGmHiswFIa4tCU57Bdd8W18CN0ZAbhaW39gQo3d9
	wVui3OZo8a134AeC0doqU78r6nwFjyk6iQUMPM5arxg8neTzvV9F6HWfULB5N3KnUraqdQjWgfU
	SPOXila/+GdS1JI7Zcasw590CHc5bXMjMhRVEJ9lufn51mFPyIruRDgy3s6dgkbTP394WjuSh3O
	+jmMPxsZQLBs4ckFZvk1NLW31d3nsDa/fMzsPINi++b4LrisFkPTBFrQ5R4XynRSYSYYXN4IAAG
	WDeIX4xJXJ2u9jqI1p8V5kSomOMj3f2tLeetkyXBTmM8jSTzUlaHM63mT0t0NYDn5k8qo2Jt3BB
	WChYoapxbvvLVe8Lc5z2Z9pg/RZP7S/sYymouDmbtz6203yy
X-Received: by 2002:a17:906:4fc7:b0:c51:37ec:380f with SMTP id a640c23a62f3a-c513a1df6e5mr2037268466b.0.1795789985506;
        Fri, 27 Nov 2026 06:33:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm897225466b.25.2026.11.27.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:04 -0800 (PST)
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
Subject: Re: [PATCH] clk: nuvoton: Manage MA35D1 mux clocks with the
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, arnd@arndb.de, 
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
Date: Fri, 27 Nov 2026 15:33:02 +0100
Message-Id: <179578998230.3130490.7646408699296668212.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=576; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yEJ5axVOhIe7TSERqWwFegn8KRpdTXframG86k/ZPzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcU+b7JprGfZRm2i36dFnfb99zzCWRhzqFTLyLtvUGn
 VmdKOzTUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgImweTMyTA2Sv/DCe8I15qDA
 Va/XKMw7EqwYUPpg2frZGsz2vgv/VDD8jzD5/EzcvjwuM6zjydsDVl0N63jPcPeJczn/2vVH7cF
 fHgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The MA35D1 muxes remain registered after the platform device releases
> their register mapping. Use managed registration so both mux helpers
> unregister their clocks before the registers are unmapped.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

This does not apply on top Miquel's work, see clk-nuvoton branch.
If the problem is still present, please rebase re-submit.

-- 
Jerome

