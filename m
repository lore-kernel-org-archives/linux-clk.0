Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123875;
	b=GlVTMSdyv3IwVgURYvroXUwbWEEI21+LTMacIs8O0xr3kZVNXTSLZAa0Y/eLddsP5WWN
	 kfGv4Qn+8ebrzVJUpAes4Svj35X0qEFHE3YelOiAToRJnlOq7JFU/94Af43uVz3FSIs0t
	 0QKFNcrkCDD2qkX2Y9Sttkcv4stuBNyv8o8pW1LxbhrIpYhvRVBsGr6hBe3Xv8fzTkbaA
	 VTk91exAYTZWkZM1EUKFYrKYYYaPCzXhiySdQhBNjkYtHL9aWU/owxBEr46yu+fXfXmRi
	 NvBcNS6Qq0imHqUI02kqoL0teuANcLfDeJ8OgR4ApQ8U+Dk86xPzK4YFsQhSe/aEouQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123875;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
	b=amP7cL3rkQAVahmDIAgT2reT8XF9WUKc26qdL7RaNrH+rzEctSKd+qqyH8sCKR1rPImR
	 zjEyWR166s9q9/x8hOwZFb61tgCQ/+C6tHQunCV5/rOZpNL8CQp/L8jC6oY96VJ5ovCkH
	 u4VcolXU7CRhNAIUjZgsjYeEOECqmv/gn8x2OM6Y6hu/6aT/vIxJf3fk8S4HpSCcTuR3s
	 PJGfumdgcT+p//Z0i8gkDQvRkws5W45E7iuqkNSTmpsecczwUeDaCalmjvFhpBtUoD7zP
	 cLKKx3k7A2qMO1FUBYJ5wq4p43CKBkQVyTRhPfqcigTTeycXiijhtinAfO9Ia1pvYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD2606A32A
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 21:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FD2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2893531bso130280a12.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 13:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123875; x=1795728675;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hruHLRUy8gnh1Vnhks0wNz1gcOtf8ACiLDMpD5iWNyE=;
        b=rbGt8TSQd/4+/pAot+4iREeqfMEZ4cFv+KY6iT9oHWPpG5weFfwNQKBMP95k7jo1/0
         zHXcxyUgeUYFLuZj1oAJNWOTUL7ItWioVEiVyCiw9aGDIMDbzUvfV7/tX0JSwzRd6jD7
         hB/ZyM++v0poq/K6F5DD7pcmBQGUOrgvDqM2U080PgOC1+OfoBFkf+EO3NH3cu8zRhPX
         2MKZjrssrt0TGRtoguPUWwk46aMfZ2V6df6K2OGH7FoS6om+TJjvIB7GQspMqzS1Bs6G
         ZiuVLIEmpuhEq/0KwZsSzzNXpbjbTXNnF/F4p6fVpd/Bez81vyGKVMHbIUm3vWJ/bwx2
         fdVg==
X-Forwarded-Encrypted: i=1; AL+hErEnBjMVIV/GrGM21rdbDuRt3Db9J+BtLjjMktK7VFTNAFoYo0yQ51q1W02ZXex3HfgOXOywMMgM/k8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X7IxzOQxDdgP2jH9TpaaDYjeOpykjWWin2eKRWUCakpD0y8J4
	e8+3Az9XtbNyjakFWAcZv/eyxpwkkelTUhBw5yI6bZW4Jq2pMUwKcJpjehaaCrEk
X-Gm-Gg: AZFdTZcVdr9BOZ3LPEtyEtTImrUpllKCSnSc+1egTJk3CRNCtBEuSdCgiqK4FCskMlB
	OvZNRwZdpTyM5iWGbA68kDdCJFgCN6VOvpzkI+JgDdBvsDKez1EZ3kCkYBLoFfrf1qhC+/OeQnz
	UvwkzKqZvYnGK7nJFoOJ9o2gLCnQadeIx04yJhDE+cuBF2o9li10UbKFR2UWK4+Es9v143BAy9p
	HMuhjhbT1XanHUrAlX8qfv9XIldXdnHC0srjCm6PURkaTMmf0TiE6UKnL8LEa6GedK1NQ994VO0
	j8Jr+zG8edgmka1Hpya52G2LNhnjfr0H+aJFrF52j9BErGel54SNoqqzqUSGavW/vVieiXiw4NE
	NBVk9b9tqLBnHwSfly7S2mzPqEvkcCKN+BdJdXDHAWBQgUgcfioGkL5807Fvzy9OPGwB3ukrqZ1
	DnvBYs4XEEu/q+6RT7M3zt1GwHzl6+OQguAKqPioCR+pCMONzLZxijWbz/GqjlkQ9x4kKYeXGlw
	0Z2cSE9B7tvm29s8MtGLb2Qn3wk+kq15UINehXIRAa/UL+U6qeKAmV4QozyFydJzvOTNs9S/pVe
	ki3tKq7BvI5jRWG4e8lWH14nms/Xuqdo/OT5M8aCzABV0/ThX8Yywyy5u4eT9eGRJA4alW9AVrN
	7qRevC3XlzyvQ7PliMshoFXJ4gm0wLaAeZKnGlYuL
X-Received: by 2002:a17:90b:3c06:b0:3b3:c9d1:9b65 with SMTP id 98e67ed59e1d1-3b41c94d32emr603227a91.51.1795123874616;
        Thu, 19 Nov 2026 13:31:14 -0800 (PST)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com. [74.125.82.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm311556a12.19.2026.11.19.13.31.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:31:14 -0800 (PST)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3b4944abeso204475c88.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 13:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGuRYBbY0kdTnfxYjDaOyP+wzuB+QpzATzBbgXm96J05FQZjeYkiaGiRg1cobdC2hL8KtaAlYlni2Q=@vger.kernel.org
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr692433c88.12.1795123873153; Thu, 19 Nov 2026
 13:31:13 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
 <20261116-sf19a2890-sysm-v3-2-b07bc7833a87@telaak.dev> <179511480695.279474.4521829214953240997.b4-review@b4>
In-Reply-To: <179511480695.279474.4521829214953240997.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:31:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
X-Gm-Features: AclHuK9xGZquR5VLNTlBltqHkPsM6MviyjZztqAp_KfvV7PyzlZVlXCSmeqvUUs
Message-ID: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: siflower: Add SF19A2890 clock manager driver
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:00:06PM -0500, Brian Masney wrote:
> Can this declared as a regular platform driver? We are trying to
> minimize the use of CLK_OF_DECLARE.

The MIPS GIC timer runs from CLK_MUXDIV_CPU, and it probes from
TIMER_OF_DECLARE in time_init(), before any platform driver. As a
platform driver, the clock would not exist yet when the timer calls
of_clk_get(), and with no clock-frequency to fall back on, the SoC would
have no clocksource. I'll say that in a comment above CLK_OF_DECLARE in
v4.

Joseph
