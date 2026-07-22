Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CCC416867
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741840; cv=none; b=P51135AGPuL2HcnIsi9oOWUDP2dpy8Ca+n6cgiOMF8g2gIheyR8CpyPNv473iGUOQMXcaIbGuF0sXPLBGyl7YLt4pXRDQgGddIX5dCujxLacVPpGtVZgUyjTyURvx1GQ0KgGOpP73+GuJ28lf+118XE1nCI1fhxCGagcCPPL/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741840; c=relaxed/simple;
	bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQNOm3p7RKKjzVwUP095dTH5C1VPZf1PJwF9pgXJXmiS7vURhaJgqbKqXw2l99axvBOSUG2tw6QYv5wDUrjBeqQP1jDzhFG4a5z4WrGW2Q863g9DauPk+Cbc9E24zS4Wy5Ha4QeJbzCfIg5Ko9go89TLCxDgq5Pwk3dn76952y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9B12N3p; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9B12N3p"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so62641646d6.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741837; x=1785346637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=N9B12N3pJnUIAUVIinvl1A/0ltrJKMqkVtPAsysC1P+9oFMI4hhZGhdeXcGmNqdMWc
         GlFoD5fA7pPEIiZnTfVBMbfOv/P39btQ5kmtjnT50hBGK8RSnsigOIZd34Bbr+nRVBqr
         JpRti3pzd9swe8hf+/b2+r06TqEPsYkxmrm8PFl9qDtLAdNTWKnSbTyQic+NsBn6VJ0V
         5IuBrdOEEfZwlEHgl+mMkE1Uev6/eYw7PL3iiAdkFR6NpalfCO0ZLeyWB0AAFsbPr3uX
         2VoN9jPqP78ZaC+V7i0Rbr/TLhKBIk3xWZw6Mdd8hWlG9GTlKPhn8MaeM4a9ntdoscFd
         T3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741837; x=1785346637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKDkWaghcNpmaNxqhAmOaHAKvqFX2oI6UORlFQsEgEA=;
        b=Pfb0Lh93+uLINO78i2e500oV/6l3+ZBm66PzyiavgJ3gV4RX2PDehvR5SXdjwd8VNu
         0be4j1kESoaCSKiD9GVI/SAshazyqvj37sWpC1uawa0pT12R6SRRSMescW4aRCZAFjHd
         tblEatcPQU+/j98u7EutCoKpIwkPBDP2+Qyv7WmXCaocfrBMGDS4OFKa1Cb/XgtYwwom
         6HeEOOSFNpMy/27THG6MBEHTuhIl3OBYJ25/+t64evJz0oW8OavAf80rvtHHXcGZuED1
         gkuXRrUQ76OgfVMbYFpDzTmmfki2eZ6oR5y2kvlpqyzj5Yura/MPrScoeE12u0g7xpVL
         RNPg==
X-Forwarded-Encrypted: i=1; AHgh+RoHDM8KbygAN9bUsxS6A+uOUY10svW4J5G2Rxt3WPObWgWkX+UPk3z+GJfbtbnPZboiUcv2XE/LDSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnhxqEdHns5BaKcJlkwMvBli7wqJFaNzCU3S/IzP4OIp9bW8lO
	8Nu8ZTvZpztBFraY9+ZXv+iQU2sGCabAkyY1y7Noco79gRnLvAT6XLwK
X-Gm-Gg: AR+sD12k1nFYs+3Qe1UUh3xAR7l2w9ybkcotvCOiFoOju2dkfwHWw72E7oSl9lFRB5X
	fyYMBGlxvNQgZ4NC1wfc9dx0o8nvFTfynngN4RuaHfN/9yR7PBdDm7GWTBXb4LlqnzWj3bBYZfQ
	MbXCsRzzzM1KqPDUPO7OqCoLXxh2VYDRlLskixBrXjkt3+3TZSivqtpgsJP3fgfCnrUsEYV/iB/
	Ki7WizCUy1GVOWydA2AxV639zlY3oDxYofNiDnQoc3n3U0SNfREFc5SYr6nnTHGsPWDhmytch3S
	La5oIa1rVs4KTVasgFLuQgp2KN44s0Qqn8lsTzC0ZLoimUTCl1POkaDr9r1Zc2v+8KouNpdab8X
	Mzknhs5WDImq7CPegtu/JazRYq3VP9pYgvho/031o4okXjRHx5bc7nQM538afWxBT/Q8nx3XOQu
	5aGbid6/sO0ELG2QuVkqSeWtGpy3OUwonsHU6ZYX+SoyNaxdOTG+8/KA==
X-Received: by 2002:a05:6214:e81:b0:8f0:275e:8b3a with SMTP id 6a1803df08f44-907783cdb5fmr251226006d6.48.1784741836919;
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b3e96sm26521476d6.1.2026.07.22.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:37:16 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Date: Wed, 22 Jul 2026 13:37:14 -0400
Message-ID: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com> <CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre, Chen-Yu,

Correct, this was not tested on hardware; it was build-tested only.

Thanks for the review. Chen-Yu's point is right: these one-divider clocks
should use the single-divider clock class, which already supports
CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will be
no v2.

This analysis was done with AI assistance and each finding was checked
against the cited sources.

Regards,
Enzo
