Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980314;
	b=dOPO3GFUWq8yMZUGwkEmoP7XGKSn6EvoJbeZcBHPmdhjSUVpFW/2b5obp5INaW7sl8hT
	 j/dTYTCEQqqjESHaBKc5FbSh2coR+/p9iFbmEtHDXZ4d/38FJRaG2j7j2GI4gkGKtKovJ
	 59z7IqFKsddb9tumtjdKREmGC+uwp8pMreVFAWfNONo1s7Tn9XcXuaFpZDIEdQ5LrweXO
	 84NQEBVlWD5CBT7jHP7wM11licCJhVP34vjgXXhAH8clUoslNS8zSfj28nr2ZJvHnqi3y
	 1rx5QgdLhqbKRs63Qo5tsKU4pTxkXOOefunYlsP0CNIUzwnpBXb6YbPA83HU23x7JKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
	b=QV8g06ZZEC9mUA3VNVw5bejxRgw9uBlYpWjdpkCtPj7Nvcb3vRLLEThwgPV0BbgW9Qme
	 Ybc9pIQV27THnGezOAqYj3OXQkFKH2kcntD1P1B0yf66X2vSXE+r2gCyM67bfjRtpbKjp
	 8znhZrMli3yRBcBQoPD5iACDKICTgsGf3lFGeCjv3A18vf3UxirrhZXWx/7VFdCqLCWYB
	 FZzyNpV3YaHd6Zhm/W23T/AQHZD3MeVqxQLUYqEW83laQR6JnLaq9IYHNbYz4+y6KSUuY
	 NiwlrPNz1IBU0pea8eRsD04MgjVWlWlAVNXmw812o7KKOHEI3yZGa/qVPArz86xMImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cCim9Nrp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0A7606A32C
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 15:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0A7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cCim9Nrp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so6592375e9.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793980312; x=1794585112; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
        b=cCim9NrpgtZ0UMW1+22EDqlkGoHoeNlE+SAqAWEXwQ11zGfEZEQhQ5q94udT6+Rb3H
         i35iCQ8hJp5skTJsGARR/UO8yEv03kNmSxawU+8VKwGAYlEsO3RQ691naC/BS4666M5z
         zMYRnWR5dm8fLK5PAg4I9CgHkN1sAJL0HWdI3OO/Iw+gZSBzficMQ83ev2hVhpgKrHkD
         fca9v7hFdDV/hXFx/ZS+sR4PhjfhOYxigoOwJryiyhXJo6wrf8HGWq2AmR5yaVBTv3OX
         i6ZQ9fEmgN5wPtM2x/LRCHDiyqE8JGWmFB1wWpc4Bcdo1p8ju/IKnYkZ54YBbJPwIhxc
         hAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980312; x=1794585112;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
        b=R+y0CjnEuUyKKLSMtZD3FNP/Bx3SeOv+M+IPxtfr7Xfv33BaKdJvZAzzYzhs7rvTx5
         gLxAT9sN6wJNlO7ryaeP6CfPKbSts+u6/ce8Wv+e/mKoWSsyVHjWDnveeDouJ1GZyZIJ
         AKk8vh6hCDkReHlftXJLpvcsaaLYbRM+s3HKXyiTVllAt4JRRqUFwYNeQF2yi+Z+t/D/
         /+0KRLAsuvIzHnWLY2IESvHl480dIQ8zX/vgMcUleKyYuyfA4EZUJ6KLopNBKBCJz3HV
         m/pHRpCpJVO2laYXadw52i6ok4fP7+thxV1Aj+nalAKQRQFXQBoRTtyCSz9RbLNNYAOK
         Qttw==
X-Forwarded-Encrypted: i=1; AKwUvBy9fOIjeRpn0bmxNAMINcm3p32MhWhyiVs8T/IdoCSuld6l691UCkrrAWR0uJNO6xpSBA+nVSWm9WU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gq9lJKj3sTXiA43M44sjwXWU5g5ntd7Tjg/LwuNIDGwiR0g/F
	rEOF5T0AFEyzzpDrZ3FvV1ezIwAqNFjAcKq7mNpW+PdiQSeAP0iPISAWToMYwq0CvNw=
X-Gm-Gg: AYBFou0biKtym3OrcSjrMFcMsmy/v0AKY4DMix04GSbzNYzg7NIVTH4aLHhcV5XIYWM
	AmqadKzHK5KizYLswvoWzIECW2XtxhpLCq2Qyd7On+Y4OZ5Ays53wbQSjNDERJ7jFYGlsv7Jwyp
	LtfBiI0u2TJE4ybAdBSZCDI9nwCfqay2nzUABjJ9yios+XbP5eejn4zJWuUlGtXlaO91PnM5qDs
	kvxg0zzoScXxXt0T5uQeCu87OUfkSdE6VAd9AGfYCqteDzfSF+oJ6bltZHWh2ylpspVUg4LoyNj
	zCl5a2EqcL6+P1XPO0LLjGFVLUhrub+12UeN/ju0oL4PpVURN9sHJ614HeYcUcSJywaQFK4h6rC
	4PowLdBPLBlRM4T/s3dJ3bc1VFZYp7FmOEsWsoaonNoTillMwb/jgzopfK9jrIbk1gXkHvxXSOz
	1z351e/KbtMFbH7dGj9GO1xGUrEcJcOPmDllIFtu3tEBvVUR2AH8Y1SsI/iUrhq472ZvB+7z3Iy
	eqA6/BgDWUrU4+6+nrg/PPgwTOXPalOUtn9tEIFBWcpqfu5+QjvVR6Iw1KQymMaGCLZaNF8xxMN
	C0HvSSIkR1bbI8IGU8TO5CaDg9SvWQY2ucaeJzXlzvYoOUWF
X-Received: by 2002:a05:600c:1391:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4b6dfd97b6cmr50243775e9.29.1793980312099;
        Fri, 06 Nov 2026 07:51:52 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d745sm62876215e9.6.2026.11.06.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:51:51 -0800 (PST)
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
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Carlo Caione <ccaione@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
In-Reply-To: <179382912410.620422.14715602424648962218.b4-review@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
 <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
 <179382912410.620422.14715602424648962218.b4-review@b4>
Date: Fri, 06 Nov 2026 16:51:50 +0100
Message-Id: <179398031041.2573818.13317727784501684521.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0DalZ75GCJ/Y2wzvrEds89TdSXOwZePw1AI9YnwLQBc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvv09Terx73ppqrvAZSmWa81euZd/jNaPhw9aX59bN6
 XR6bnttQUcpC4MYF4OsmCJLDXe1+DtJrS+zpuvchpnDygQyhIGLUwAmYp7P8L806Ue9pfPPB28P
 GW5ROua9w9ha0rbki/rbJY5ejV9KywQZGc4tK1v6OupqOj+XzLPqtO8lay/yiMrEpXO9k1liL8N
 wgwcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-04 16:52:04-05:00, Brian Masney wrote:
> > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > 
> > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > 
> > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> 
> Reviewed-by: Brian Masney <masneyb@kernel.org>
> 
> Since this is a core change to the framework, I'd also like to see what
> Jerome thinks before we merge this.

I've had not problem with the change initially but then the AI told me that
it brings back the overflow problem fixed by 9556f9dad8f5.

At first I thought it was crazy because it would mean parent_rate + rate is
more than 18 billion GHz ... BUT, a common way to ask for the maximum rate a
clock supports is clk_round_rate(clk, ULONG_MAX). This could trigger the overflow
and there are instance of this in the kernel right now.

A way to make the calculation without the overflow could be:
parent_rate / rate + (parent_rate % rate ? 1 : 0)

-- 
Jerome

