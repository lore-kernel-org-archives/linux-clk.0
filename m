Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF31352FB0
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528647; cv=none; b=fOZgGKIStTtwHW3OHegCeG8pP8R9O5dFF+A15zil8AJ33NNBXPEAHtuhcuIIgKCimBadtC+wf8eyl1DzUVPP+9UJ7dfdUWwB/KIZZLmlMQh5xNZQGcoA48UkGYcTob4EFEWmQ47K1cho7B4jvrAjIvDYMNWn/56nO6/3mbSt1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528647; c=relaxed/simple;
	bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LEmA7eplbJoDSTja3x//HNBnrWkDKc2uVfGHumy53wBS0dfF0BTUq/nz4bMjt2Notq4Fym0OiwtZnEKqvByyRRVLi9EPMKNT0RszhReIh+RfDxeD1jdLaAmx4kteooMidZrTdxpttm7teuegz2Um21S7h9zfjrohGOHiUm7ILhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QMAzyjFG; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QMAzyjFG"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so1310396f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790528644; x=1791133444; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=QMAzyjFGYmH6eBp9DRTy7oT/AGz0zCjmD0Fd7vN5Fj7kyVxUWqiADC+taJnhsnFxke
         i4ZWqwWKbn/JMmmy3yk5EWbnYAJr+hgy71HpWxX2DzRQG76OU5Y5J222/53MyRUioq7p
         S7BtI8WtnBtrL8VSRw0kjpB7RedIEwm/poA5fXgMXGEasPDnLoSFahdXOpNjH28bTfEK
         z33KuvAg5PhLn4QGL00fWijwfbZ6xep4vmygQArOz2uRLy67VBgIE8szc4iEexVGx3zG
         yxEo0v2QSiXkurY2Bgj5FXP3hAyK7yO/WLMEl2ZPcWFY7Yuzi61mjdsNRQKl7F9Mhcp0
         6Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528644; x=1791133444;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPaVvSzw+i2Y34hdJlJohU7NRT9A3+fbf9np6selyaU=;
        b=E/GNOhHaxO1nG58rDNyVCUAcjFpkauuf4PVOCgI+ZzlEH6cfXC8QgNl1QVW8cqxRge
         U1WsU8hu7n/GDTpD8zaoxgBQH67xSSm4pEGzQ4fr4Zp2jZtEXVvgBXIQsMBDGqW/DUPJ
         +rSMMkGQEssXPE+DtUBzqSFYINQmFrNTpnn+pUNEYPcXjoP7LRsI2vgCbzE1rT81ox60
         V1YBN0qVNLPEhGtR2pv8QgkETXziY2zJ2s4sDvQIJk9bZ4z81ag/dko0vGGlkf9gktrj
         9oHmDr0EUhbKfDXIVyf9TZfkXCjshlvJGocPjpkK8vHB5n4Aw9RtuXbvfwKXXPIZ5Gzr
         Qhbw==
X-Forwarded-Encrypted: i=1; AKwUvByDY+YwLjbu/EO1LrtXjX+ExkoGnl/LP3Zol+gG45AL9Xc2IOJHCyMb4r536LPVxSrgEpbC1iHUNSM=@vger.kernel.org
X-Gm-Message-State: AFuF++nxsmIB/eHfejDMI9lTrgNJDZYvXAMcd4y3ynB+P+BnBUQC5lwQ
	FRdf4TPVDMQzlCfgcwczMUma++KnS3waqM3uk4BPHlMR8b9rTY8L/AsfYw2iGT0ukKg=
X-Gm-Gg: AYBFou3xI/jyHsrsGFyt8ZNp66f2GmLVWgHdMttCUoZp+qdiXQCKK+WcMsy3TpoRYu5
	ZcYjha5+oZ5ArHMiH5scca1SIfT1A5qdWxhbsZVc8SbdMkgyVVG4vam2rLMMpkiXmQdgEWTNfuB
	X68WC8iJ7c3LYbVNMbEuPCc4vdRTPcbKhb44Tds7U7gH6qIfobJaYJHbC3A6iDVdMpCUA0lscgh
	s/TCMzhORhOiS0QfKzER5dHFc+uQmSCEmU/iW09x6hwiRY39gUw1wrsEi2He7+OhknG2u2JpuCC
	XLu+uBJA5az200CXi79YO1F24fhk9nekbsMl76ncvtam4F0j/xvBeDRLEWrSsy3jAgkDTwWNX6a
	fmR1giL3+vw0AdK14ndR73ECd2l4mZOpIXU+IG3DpGVfuUYU1pqQlzXtLiU91dLS0Y5VFeiUYI+
	whB58zOlUbt2nysy5DUfTb7Z8Za7M+vd3cEbjuXoRr39VkKOL4S/VuzmAOBu61Cv1R+V6SI8APO
	lauRfs39NMWCCpmEw==
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr23998885e9.34.1790528642770;
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm19992213f8f.5.2026.09.27.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:04:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jacky Huang <ychuang570808@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT
 parent clocks
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
Date: Sun, 27 Sep 2026 19:04:01 +0200
Message-ID: <1jbj9iaany.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 17:10, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
> possible parents, but the driver never registers the corresponding
> clocks, so these parents could never be used.
>
> Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
> and pclk4 and expose them through the clock provider.
>
> Reported-by: Jacky Huang <ychuang570808@gmail.com>
> Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
> Suggested-by: Jacky Huang <ychuang570808@gmail.com>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
