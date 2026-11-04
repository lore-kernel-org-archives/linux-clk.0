Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823179;
	b=iUb03SVtJetQO0OJIcotlGUORq3ObGjTjIk5jjTQDVFX7+LKhEsj6YobmoLLYsh+HF/y
	 hcsyofmDkGwn+Bwd/mmsr6AJMnLm+BNSQtIGrD4mvKDtnm4VicZEIUA81VqkK7ubsvgBR
	 GlWD/ppkZ8/B1WxgU1qmLSnb+Kn3AP8GXeQvnxAKYRg3JuxmJgNJQ57yjB43gMZmt2lae
	 b0W+Oo3wZFshWx4rBtoskHRc9ydw6sbPd1oqFRJ3acDYzfNRBNtM+WiQ/BGzNrZjFEmqI
	 CUkbCwBBovQjlYLS5J4pYkDmNAcJFrFkStJ0tGjQ0rIFVcbl3y2FioSJoIncfI2Mmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823179;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
	b=5KW3zMfVfFxRs0fuUZkKU09nTr6FLk5OifzL/97oCzjF5rpLKzNrPa1e3qxR2N0ScKWv
	 2WSXIDDZQ5mb8yi68NLdJkLQYolsSdVq1NT1Hz3yGMjulnO6zYOFoT3ysgoAhpn6cPJTm
	 o4VEk4ADPVkYd8mNxnsusp2r8HPYKD70m2jEewejn+M1+7UKhHCGVTjCwmlab1u1d7CLN
	 EYgUNYZXDv7xnj9obTAPxnIfDhCUgrXsEVXXOuUeI91J7bkCOkoXbqt4iDq69nf0GL96I
	 ORc/R6lOkVwUWWaeL3qydBh2i1u8lfQj0t/eWkjoK4b3Mg5aX9pkfQ6o++NjRItR2Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567476080799
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 20:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 567476080799
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb2893531bso663627a12.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 12:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823179; x=1794427979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxXu9zhPw8w9HM4Z494ZQ0afNqUzJO/nyo7WE4RsLKQ=;
        b=Y64pdKEr6JOea5GOnWtnpr2mneV73aoJVPe7YOd1W4RpZ2iTKzTIT+/hN7D4TLPbHF
         u27m+3QkuzWSqP2+jK0CdA18Kiue1sg39Y8jpCc73U6tuTWUhL3rbSdOQgAxiklxN88a
         icpE3I486zh90NzghPFOLfkEJWgonYC5lhtmzDp5femVY2M1hUTLhHNhBrXeYkhPcsys
         R+xnYAgrr7fZtoMpwjU8vXUWikndNWGvgUW1yvjlJttm00kxOPIDoJO+ibttLQkOJhm6
         rQ8lsGPWk5xMk0nb2YYOrOXpjgCn855TFqgP95Pkvq+12wgIVtPNRhbM9gj6bXwBo/c5
         KVUA==
X-Forwarded-Encrypted: i=1; AKwUvByy+j6dTjwB2Dxp+pnrtI/oGPEBcML7sxJu+O2uf5O3PoC4oFrDmPJee1wDtvLzXYGPkqruw+fJSM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pCJ/aRvfYPjHBdG3PtddEB/TPYNQ8HTDSHYcLKfQKlSiPePh8
	uKfWcsJNrecRx5Akv/eHEnRwCluMvkv7A9oOE0FE1V9Ea5zA6liSepcs4egIMo6j
X-Gm-Gg: AYBFou3hGK9DEY99a5GXJyaOlnyQ1VVimX+NBd8yAHObXivD707lSefUBT1nwWaCoh9
	bop14xWhfOEMORmbsLaFEW2bm2cUjwdUPYZ8sUqLUHj3zTaTObbNFVFtHKbR+//fCodqhOA8dy6
	Nd6vFQ2Iftj/TftVaJAdYvRwpHMmczJslfgc+KWUuYZAd1mZXM7qrzL/hCfXjWmDIk9DmKJVUor
	lkd0v+T+OhJEinouDDi0725YRSD9ExBlZsxITZpgyhsO/i39GjSPl0o7ovZqPZjMgP71XxJWF0d
	fL1BFj3dBrUhzcSbSZnpZe+7p5/eRMTfNcCBn9Ypvwfhvfin08iAyIcxYTS18egdWjNLaucunaq
	gYO1s+4jhHPLAXH/2i8LAyYUCyh+tEX9Gd1ZotATMvjlp2roQZd0nLLOXVN33bwfObcqgtCVx1w
	S7kyifz6aQ8fb1f/CIlmAYvCS/NzI+Uv1HIxyyGZuTG7P0bu6Bnf98QA8mHVsHLrFk0gFj4c85+
	wgdDEmBb8iFcks0kMNFBvoh8GARx5PiWgbR6b6JPvsTf9oMwJqWQBBIyaXscRUr+dD31y2Y9vPk
	JVzgf563C1xTSlFsY/k7iE8sE+mnwPUOTKCr/D7zhPTAmS/OJ50TZ/FZKc3j4AMzDp4LGs5+JeV
	SnNOrj7hpQBwghhPcNPxRxaaedmgoQCqK/bu0iubRQRU=
X-Received: by 2002:a17:90b:28c3:b0:3b0:ae41:2707 with SMTP id 98e67ed59e1d1-3b0ae41298bmr718388a91.45.1793823178724;
        Wed, 04 Nov 2026 12:12:58 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm419795a91.1.2026.11.04.12.12.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:12:58 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1903462eec.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 12:12:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz1zFTWVl3UbFxPCvO7nSi2gXDsEb1Re2hmk/HdrL0/uEbxFrTw9nGCc2UtHrICdLTp2UdQaAwRewQ=@vger.kernel.org
X-Received: by 2002:a05:701b:42c7:20b0:1b0:f0f5:e38f with SMTP id
 a92af1059eb24-1b0f0f5e3b5mr18258532c88.34.1793823176925; Wed, 04 Nov 2026
 12:12:56 -0800 (PST)
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
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
In-Reply-To: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:12:44 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
X-Gm-Features: AclHuK_90z-X_G7lwJns7lB_5N2ZLz7CerbTGbvWSwHLWG_G7heWWc43q7AWu_U
Message-ID: <CAPY4CJ4eJ0Pa1iowGEO9qe4E7zyFoGp8TdjB=O0ws9FKUUGiRw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why? This block is one used repeatedly inside this SoC and SF21,
> I think a generic binding with clock & reset description in dt makes it
> reusable without further changes and also results in a shorter driver
> without a table.

I moved them because writing-bindings.rst asks not to put in properties
what the compatible implies ("DON'T add properties to avoid a specific
compatible"), and each block's gate and reset bits looked like that to
me. SF21 support would then add its compatibles and tables.

Either works for the driver, and I'd like the DT maintainers' view before
v2: a compatible per block with the bits in the driver, or one compatible
with the bits described in DT?
