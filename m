Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA54B48876E
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913076; cv=none; b=ubkAF7RuCIaBe4H+EK4tDaANT/CBoe1QSRDebw0RxV/71Fak9wBZno3lqg37x5cSCZ+WNZTOjabah55IFqwOzg8EpjKuB3OciTJgJy4zqtnS3GLiQ6myVOO4SAIkZfjVLU/Jvln4mGsef4huFhJZq5ZJjP+pzZc6+rSnSV3KTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913076; c=relaxed/simple;
	bh=IBWm8OoDuOOoK6QNsoCkV6oJjvsDZlll7v/MDvILjss=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=alC0+IgmaH9X2t60/IgKrEOSsRTG+SAL1jW27+aR0KNBHtGtFqpcGnrsIKSHw/c9MCamuiBEXJP4c+n4aT/gqEoCmL1ZD2Y2iN8UufaAgDRw7I2znFx8r+iZ2lCTuihBSb+bIrQoxwYlGiiApGgC780tMJ+wBnFMnk02a6qqpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gTaswrx6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gTaswrx6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso23570465e9.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791913073; x=1792517873; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=gTaswrx6nfFaToncTJW6YJ6RXiySzqFT8IgmtReTR7IMiVGHPNunAOk6R2+cfxyAIj
         N78NmnvjK1MH0Kp/w7YqCihQSONA8XkB/hs+ZNvpOGrRsBPfXP58OlfETCwi9POaeir5
         LSzfXtke0WVjEKkCyMZx2CuXFs16h4ee/cl33s29arv9go5FUmG9q8JVjMZZzbohUU0E
         OwoVkva6gCILEwcvtH31kr0wtyq6e7BC9WdU5zacHhWEDp6u819vSodAdmOdFu1tOmtT
         T0jJ495Nrl/8wK5AW/9MKyzD78g050lfwSW8SkbkGAT7OCUJ13/dNPUToZnEbkZIYLMx
         joLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913073; x=1792517873;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=sZkJWhCID/24VNPCOovVgTUTVZvZerLECOacIeX/d9yXeJy2aK2+Lm8zTE11bNTEex
         x2nDEWCErLcLEEDF9OizkW10WsUTAYHCpmwYoWULLQDCcf5z8i8lCQs90PeJs9oNhRhy
         knNPTpv+aZgONE+tW0cHmTaXF0HS+OEjxoueSP1us53nx7lOob1fjNSTXhLbQvbbFakd
         lMMJXPuH687/c1vGqViuuobQpqZDY8hqcoXjFpaU8F5gvjuvNZiS1njl7Wi7+0a9Y1El
         S7q326G1s2jjAO66lDNVzqvPys72cBHK/n956tbkOPgej2LWD5qcJj6Xt3EEjFYx9/YO
         /NZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVH4caaL6M1OTnTQSAB4B8C0rV6HlV0Hi4cUuM1BpnPWYTQohAcoQheCufSZ1aEIiaeNyaIBllh+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn2pE8Ahmr8nuQHN0mvgTx0pfzD0efVL89STSRAq+4wYN2PrAW
	ZVLYayhwcDtXs6hsXasDUj1cbejM5i+qllifZx08VunQCoavoertd35n4z7P+mZM0cY=
X-Gm-Gg: AYBFou1iB6nN5z9mjRJjt8bABRMOU7lhB42lUTS0qymSTliPDaNvq185F8y7LSU1nqk
	RqQ/O4pUhY52oZB12KaOpuOEMjX/hlNqgq6YAUo42PlXalq+tLV5AsmAm31hJDpvhSAIMiDU2NZ
	Lu3iGg6mcRJ77uXoe3GHHpolkrWUPaO0Laq5d1cBzc88RTKAxmVeudnucpf4xNUMOa+qo3OSNdP
	D40xBWWKulHUybNRtikk0MsYygyUfVhXJIl9bup11srhP4EtO5YWKG75nYZC8lowqe+vmv0EZUw
	tH0ok74MxG7I2se65H+Zwbv5S4XM46yStq3EGi2pe3hRNChLdI+6dMTE6sZI3YyvNZFRbZb7VXV
	0+uXtVjPorVsD9Vgww5eLocTxpYxmO3KAW2pZ2NMRVamYYdBvykwn9SssRlqdc4tMe32zk2ZOaP
	6unCjNt6yT56ZLKYamN6GqbP2yHZTP/hDm5mDOeX7iL+I6UKSo0an0cuQYMJ2NOXDAzBGweMzjZ
	emuVVYLPi+fF9ofzyFzsxgimX7T
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr260249025e9.33.1791913073155;
        Tue, 13 Oct 2026 10:37:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d518sm350899745e9.0.2026.10.13.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <87ld81v8y1.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
 <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
 <87cxtni7m6.fsf@bootlin.com>
 <179181904945.33566.17882786294681341398.b4-reply@b4>
 <87ld81v8y1.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:37:51 +0200
Message-Id: <179191307176.266355.13493126045902473311.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vwYzSJnJvZdAYWxZfVM9vG2ExZs8LLQUp+M4wnaHYLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnncvKjl3suKowPOtp5+qSoXF5T18EXvDv/W8V/7Xjrt
 14gsle3o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJN2Nk2GKoapzC1Ly2w+Wu
 5vXmWObm6B65iODHAm93OqTnlmlPZfhnuvOiacDxqbXP1Tl0pFKOX85fd7Vr7bZFM57m5izU5nr
 OCgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9


> > So 2 possibilities:
> > * You just need the .hw then I don't really get why you are doing it differently
> >   for this clock ?
> 
> True.
> 
> > * OR, this is one of the those clock where you want to check DT first then
> 
> It is not.
> 
> >   fallback to a fixed clock, then yes you need parent_data. don't forget
> >   the fw_name (which I did not see here) and use a local variable for that,
> >   not a global
> >
> > Did I miss something ?
> 
> You got it absolutely right, and while implementing the change I
> remember why I used the name instead of the hw pointer:
> 
>      clk_hw_register_fixed_rate_parent_hw() exists, but
> devm_clk_hw_register_fixed_rate_parent_hw() did not.
> 
> So since it looks like most of these helpers have their devm_
> counterpart, I will add this new helper in clk-provider.h. I plan on
> doing that addition in this commit because I think that is what Boyd
> used to prefer, but I can add it in a preparation patch that is your own
> preference, I don't mind.

Separate patch for the new helper please. Same series is fine.

-- 
Jerome

