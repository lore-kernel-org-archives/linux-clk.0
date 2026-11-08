Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175500;
	b=1l4MpaZY9aoSlTqInpp0jyrShIR5VvcAF1a9+WoLLFeMIWMKEUlwZJnX2aZ66aanCLfG
	 FsY9OvueTbvKyzoUYiE8LsNKZioaqcilOlQ4FXkC5dpRxsMiYKl1u8EdbW4KSEEnf6yr8
	 /PHETiE76dJVByfZgw2byVXH6t6g64GXIPFYiGpjJi+4YHOK4P4krrz0pAjpZhLL9kaMn
	 6VrqmninE4HXM8D7g35PVY7wr3fXlKb72SGViklGoYU4dQ5IMzgqyyFWHEcJoFLHwR2wN
	 vAguKTccVCQp7RDuwvzV2yYrxCDcet54XtX0bOPi60Yi4bfJW1KZznev6cPzffdZ6mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
	b=SUgNxYsdIRLLrklhqNX1N8EhI/pQTMByH5fO+IxYH2JvBwrauZgX7+2JXBWbLIx2naDh
	 3WlvFSGWoNnsu6Fw1dEohtvRM9n8juD885myifmaFfH/S/OekSovjwBsIreeO03MYcmzi
	 QqBsXnTJ42m7OEsIJ+aXmlK28DLl7to7holCei9LftdwnASRjUW8OnT9LDmKUDrnHeFJP
	 /dUDMU/sw7dwWXOhVt+VgwWEIr3oZk5gAfYSbrowhVlYsM3YhD5G5EzELhNQbpls+BSk4
	 Z7cUs6PzscBZwWZEE5kb99radStWeju1H2Dbu8m5yFLnOO1nP8ShNe6bUoRk+dcoOPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7F606A325
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 22:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C7F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb681de50eso59880a12.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 14:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175500; x=1794780300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
        b=1h/78SFiAzFNd21c1rOc3RWMEmFnTc8/W0m75D/gdxf3WmifY9X1OFc5SnrbPuk00e
         4PKgZOiX5ffTuNehYWGqFPOSbjG5d/A1Ubh3PZifN9GQvPJfYXVgrdYDadNMCqsNr4iz
         gBJqkXpdgeBEacDL3vw+bMuqfZ/ircH9YgDKuciW7yB0sX1cF8POB5vPKmO969U5lyqU
         FgN6KvuPuHpgXJwqPHvD4f9VDUSvTdkL0aMMzS4fxN9Vw1d6VKojaZgMyII0gJtfiaKQ
         UaoRcl7+S5XW3BVPlBfXe+Sen4TppuplHAujQJl33dEtxLTk/dMqNX6Y9CbiGBlvEQBm
         c1AA==
X-Forwarded-Encrypted: i=1; AL+hErGSQkHs30eTtl6J87NaDEkjMtnaD9BtOG7glE4JwuCfvjf6+q3WmpUEEgg67V1umXsgztVOjnhMBUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P7/rPwR/sR4CBUTawaaG/yFfCSHoWihmsSmKhTjgBy8r0zj9t
	2z/JryofgHA1Df4jvS/BxFXHasmL3miSyu0+ytM1rKDTj+2ZwjkRSng3KK8D9P6o
X-Gm-Gg: AYBFou1AF5unyDD7byVklczBJv5ARLqrAP9y3zLx3TzUnKEfDr8FCqpmNnMFjZaQTwz
	ouCZFaHcvHxRTn5HWDnAS/WO+eCprYZimEkYPbY4iCsEdylMWbPcOx+TBXOvu5WB3EMtt+ZY+oQ
	lNBPPE2xIciAVbUdin1Wt6VBxD17nkNGoJIFA0QEFiy2h0dzr4iLAZbEmEJitMtqvbfpYYDTdl6
	P7OPCndODXSpyJRucPTyK8EKJKdFK3XH4yhYfsr69vpkngEjWMidYyvax6hPp6JzlalGTho4ji0
	KKGzycljJ/Ww+tj1i6ZwA3siPN0bMpUrmtoUA8czaA8kSgKVdz1SRLiOswtborp2dEOWEBf0WMU
	xhXaoGdkmAi1L06or4mTx3yUACzmrqnageXCIcVixxbdG+jkegMOQUebQ9Mru3wqY3nhWjSkx1Q
	Tj6DZR5S5xD1/OsRMQBPg4VIzCUyIThJYHxMwJX+IcwhK14T07yqRPwKl0PcfJo95/122+Rbtfs
	4sAIsKzGifQJX2jUGoCeDl9vzY32bRgS9ItiBLxA4SgVUgMzNf9njyC/2oWbtzpPueLqxdNxRi3
	IUxWH/OvrcsC7vL37jvrXwPqqhUhVRwBEt64YMOrEsNDFXDZGhXGUE+YB9FKWWdJbYmGvnrUs93
	OElLqD62VuzAlUuilERS2JIKZiPtqKiRkIyEkCQqI5Cq0WhE17fTzsgZYTRuBZohv
X-Received: by 2002:a17:90b:4c08:b0:3b0:da22:db62 with SMTP id 98e67ed59e1d1-3b12d560a27mr2162725a91.61.1794175499562;
        Sun, 08 Nov 2026 14:04:59 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d2faesm8648794a91.14.2026.11.08.14.04.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:04:58 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3720addb068so441597eec.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 14:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3L6sJeaDH5eC2+ts6/Q9s0XuMW2AsM4+jRwCgWeyzpbTtmooO4g9pAAjoijHaHDqC/09sbzljS9g=@vger.kernel.org
X-Received: by 2002:a05:7301:9f03:b0:370:cc56:b61a with SMTP id
 5a478bee46e88-37258c2acefmr5845036eec.39.1794175497365; Sun, 08 Nov 2026
 14:04:57 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <au4Hc7LAXH-ujDPj@monoceros>
In-Reply-To: <au4Hc7LAXH-ujDPj@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:04:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
X-Gm-Features: AclHuK94cu5PMN_CR3MHF5B50stfHn_PtAIMtZ8wHEf1hN8qZJlhM6zrg1Ysdd0
Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 includes <linux/device-id/of.h> instead.

> Please drop the trailing , after the list terminator.

Will do in v2, and in the gpio driver, which has the same.

Thanks for the review.
