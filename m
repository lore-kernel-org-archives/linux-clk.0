Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823032;
	b=MXE+yGh93PnJQOUlCPFOrn+T+4P91dLZR96tkuuGNBvnqh4HLET1VEPPCLOJTZQyV+WL
	 62egwo72igczWYqDWoZSJoafImNVpGC8QoBjR1hZMZyFEosMBtdUs7rRQT1hCBI7IG10R
	 g/2e6UdHHEIXiUNz0Z5ZRuPDIb9YbSukeZxXhxu5hoCQn4ACCf2eu76z2babf8vK4TXDb
	 /CsifhfITrPdqek4JB/5iiPxqpO1PpA3/FqiDPJFg4z/466rJNeaBkLNVi50eSb3X/SgA
	 RHUtWK4PX0TrgciHLWSJMdMKAOXqDMAF9pusLbJssKZLET9vDJb8cZgGdIJDAfsEMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823032;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
	b=AyfJ3OVeCZFyEiUjBlqRXH8JtI3umcL7qufKKIO5973yBtdWa4R6MimPe/L2YKQyXxjs
	 AnLiUkRxg4FLxi0WBiKmlEPjsD1kU78QXKPrkOa2Hhf8JGTKTzn9k6JG2ShJMtdmmQE77
	 yTl9x78F3AL33BCQB3PkxstWyA/KTv6JvHZMGz71fGYy3PoS6BxxupqFfoeyEh7D1A0IV
	 Rm8bLyP65QhbxP7tsgDE97W4pKvvGJ1XTni27BSIyCAwVpewEWaaYq4Gu0bV6IuCqJszU
	 B+KCLs2Q1NqcntkwKcvsxYQxYeHi74eRKi3AgvIBR/llz2u1XBvzM8m23PgI0dMTT+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EE06070F2A
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 20:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13EE06070F2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so95011a91.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 12:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823031; x=1794427831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jAzcbpxGxlJz+yxpkYcjDqzUxEzlIqSdDP9I0n3QAvE=;
        b=quTyZOXNL/8vsf+X5hqhywX89CtIMxg6bUFfazVkyQYiCR/4PxjhGjlIB3SYOiT06O
         nifgCN0CYB7ic1bjgJcrugSrog0eyb8ShhpitwjrxLlRdB5yu+nc49cRreT9Ofo6YUun
         SZqDVfssBELrPawFpuHRZoqJSLiABBPeUniXdWVU5T6vzP2qNIi9v4cVq9YzdQNJBPYz
         SNoStxwAzexdKNSxQKxv+GDojoxtAqWuk9zvhPv2WbesBql072w94TBkTBFT9wbBLvc2
         NGncOxqz0yJE1VENY3PVGV4KZN+SWKM7FgdNS30ahFOFFCQjceDwJqW0h/LxEt5CjBAB
         DHTw==
X-Forwarded-Encrypted: i=1; AKwUvBzTLTgPz02YPhO+qT15226rbfAUg6Gg193Rnr1wl/ICRQ0gVgc2ZuaJd2oRIFI7UCrOxDU17s+KOYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ktxp9RqXb5lBirL/WoTqT5EXL0cKuqClgwxX7+iR5pDyoERqH
	Zj25HGHX2h+C97H0Or/+ZCRE+QoucKB5OCtsHpsPcIOZNZ44j8RnbXMMm3Ihk6C+
X-Gm-Gg: AYBFou0AAOgbORy0KSVeBwsyA+yMYQeSqDbkR2OigriYNVN0bq5vCI/z+qSxXLL/zpI
	qJqr9TeOG1+pFOx3XeabugtxYWACYoKZdW9mGPQAFG92aZV7RvpbUIp86yA+Oz3MosUtXuRcqrS
	2ThaOJ2QO7JGWugN4OT2i6KRLkFneRxpkTLmdl+/NDPTy+Ga+KYBI2ZKlCMEgLIQnn8CbnxJpM2
	FPEl1WYUwchRj1ji0enCdg9QWS244OzsCCUqXVKD1UAKRu0P8S8YZknVb/FBuA6wWNdc5EXtTM1
	Eq+IiWA0gbIOkgArQkih9r23LkQe4RrySeBW3KbsJTK5sMtq+O2bp4nEHsweMqtt6RLu0M/FD8e
	adigIfivfwf8o+2n2ZBazbbtSKIF5iHpmKvgI2Yq61XUP1pNfGxAK+0CslB4X3Rleqwe3majwcB
	YtT4QS1hljiABORQZSqmtjup2n+j2FXlWNA5VT03ZWP7UVKDdlAghvexMX+WMFqCttnzom+haLJ
	BIXkeEVe08y/oxcN9q1kc4G4saVR+8beXlJh9ABknML0GBYUDnl3G/L1vCS4IzaWKvkg9+5LGVs
	jeX/Mef6uJWjcxNxxkAHgRIyR5aQdA1AHC3mxkJHUvPXMl25okfRcIKAbUfCTSSbfmWZr5Xv8wz
	XrstHdSTKyRKS/PQMJ1JNrGDWV9xNNqObGXMxc2bcxSk=
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr13387582a91.12.1793823031474;
        Wed, 04 Nov 2026 12:10:31 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com. [74.125.82.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm380788a91.11.2026.11.04.12.10.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:31 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2504341eec.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 12:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx1gYH3jCibU9YATD+2wMdV4OPBqqAPgt/4gVVUt/KQ2OOSS4LcYIYYsmdF55OTMHWcCKexD0vjVyQ=@vger.kernel.org
X-Received: by 2002:a05:693c:88ce:20b0:36a:1f8:a5a4 with SMTP id
 5a478bee46e88-36a4241f808mr25514235eec.38.1793823029345; Wed, 04 Nov 2026
 12:10:29 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
 <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
In-Reply-To: <CAJsYDV+PSoAU9qNyRoEKuFoc4oeBkw8b=vdcCap4Mx3dCA1kAw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:10:18 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
X-Gm-Features: AclHuK9y6rKZ3LjTVpypr_d_uuxBPp6tSISF5kZ9UZgLTLqFDDhVhOAbPmN46Wo
Message-ID: <CAPY4CJ4zbB2P1qSihNYJ0j9Z8qL_21S+bQZKAKt6W5Baqzg6jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> These are reset lines from the same IP block for different clock domains.
> They have to be asserted together even though there are two lines.
> [...]
> The gmac lines are for two sides of the same async axi bridge.
> Asserting them separately causes a bus lockup.

Thanks. v2 will explain it in the commit
message and keep one reset per group.
