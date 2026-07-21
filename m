Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838632F76D
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651774; cv=none; b=E4MKAfbhfOC+RJRUbhU3GRszNb73s6LjY5ZLo4e2UHBAfPCtdOUOpQ8kVsFTTpebkDwc9ehN/z5u7ZlPeKaAuzn7u28hjsoq1u//tRa+sXSgnTNuKSHlsKQIcG+inMX89A4VwIATMDtQBUQ4vpimPLXM5aM/E0ag1+43NdspYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651774; c=relaxed/simple;
	bh=CFYgfkkDESJFwClmB0HCTSrxMkT45WT5ZMfjkAUj4Yw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LYjwlCgH/kqN04xZjPPRu42F1CW9acDznZrgy5KAzHUnIFizwOsg+PlUu4IH/YeILD1CH6Xqx0evhUIwEANO2fJ3GniZe9s7VeXgkxUqUHB7f4Yow6DJz4jg3awTlpwmVa1B8GBJQtyeajFQwj50K9/20ejZkL0ScvcUKv44BIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=it6d1mgT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="it6d1mgT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso39242025e9.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651769; x=1785256569; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rkIYTQEQ27vhdTHvUzqbaw98nz3PhZSvg+ClrrD28Z4=;
        b=it6d1mgTi5OZVaeNpBd9SPhdZl+Apsy7Jf6xCmhajjuBtUmzxj73Bw87R4eEmSvN1P
         fuHgtlctR3ctNwsv16PWlr0tCz13u+x5OYiP1otHBxAtcFnMw8MVrbWByQSgmtcui6IR
         dfm30NuIcEVIyjWbzYK5ZkU91bpnOV36ryQ9wbt2Mr6FwHmJgu43nZF3CIEFHogx//LQ
         pDzK3Dzl/9jQH096pkd6ibqWgLiQkfb4224kV/B4sz7rZbKLk7ZCPYWhbi+rEpFzkrRG
         VGiEOvbgFc5giEGOv7UGwmobxe7UsPnxhaVtViuq1NnA+SBL5QHSIojlL95FC9v5aSCp
         f2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651769; x=1785256569;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkIYTQEQ27vhdTHvUzqbaw98nz3PhZSvg+ClrrD28Z4=;
        b=kt1Si7mhl/oSSVXodU/zUj+TmS/UZ0R50O+Vfxuxi2/ExQojiGjoDIVGnROSj11ag5
         8kOAPiCue+/DtQUPR3oHnMDaO4fcFc4IA5GP1BHW2r+U6W+B2PIx8zD4p4Hq8jejeVIL
         jv2YRmnJ7a9DuQ1StfBl6hQXX7rehj/Ni0zijDbQhubVqIttmBxa49DSI7syjukzi1Vj
         N65QamQWhNASPGXcWCKCzTRqz0Y1T27rUf8Lkn315s8Oq0/Va9fjQq5eFjh7/zNm7MLX
         j+YQkk38a5vKxNRJ3t+NIQJXUTb46jFjPwZAoHztxtab02x45p2xAPZrDxgfD8wAzmXU
         AEBg==
X-Forwarded-Encrypted: i=1; AHgh+RrCgA6CNJgmi9/H8ApTCRm24ggOJ/J+vLOgQUZTkhRLA1Fq8ANuVvymFP2LSJuLG3vwDmgWJFHTwo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3wBBdnljivHia4yzEjHBhDarN2sdCIZB6rKPPYMtHdZnDg5Y
	rfz1W2+MS8O87HcbqeRsVBZMaMq04L5PGvPMN6Ba0Rcq4NZanNvv3oWorMMHUkgAJmI=
X-Gm-Gg: AR+sD13x/WLmED3N9Lfnu9bxQgr5mCZjBVd54Ap/ZgDYqrIbbBM0A0VGOCBDRc0ZOuR
	j69zt6F0nUl3xX1oZ/OhbMQ1J6ZIb+7+qlrBu8Q42BDZX0pyRnxAaNI+sbXsA2EG1aQVUWJgUWZ
	DrapLPoQRwXoNRYpz3lB5+Ofo/e/quqBZeP8HtNplf5FWcnHnpHVLaBiof83wDQnu4vwz7dQ0CR
	cbQPPj72TN2G9hzBHOb/XWL6N0kkOtkh3puv/+rQ2VzXMd+jPPNAM9OKIGdc3vd3c9iD/ApU6q6
	mzZJEatw5YvyCs0hplRp8bJvQHnIAtQFyHTiWrYxk7DhzlvYbYGtH/ml4yzrbd5FNxJ6cUfAVPh
	ExgvloPLWwZVzGdp86jYTThf/BVSOBxceujs+TiaJlLodmA7j4iu9Ue6NSQawvMzcigr3PWzVSm
	DhjVnsFszhnKinGOxWxlj4yC8gx56kAN3nV1M2bD5hkZ/HVTJ70+Ff
X-Received: by 2002:a05:6000:230c:b0:47f:5289:5606 with SMTP id ffacd0b85a97d-47f622f2a76mr24142270f8f.12.1784651769351;
        Tue, 21 Jul 2026 09:36:09 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63ed244bsm4321698f8f.20.2026.07.21.09.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit
 field width and fractional calc
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260721021356.288506-3-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-3-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:35:55 +0200
Message-Id: <178465175574.2337945.7396666795379567940.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=701; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=CFYgfkkDESJFwClmB0HCTSrxMkT45WT5ZMfjkAUj4Yw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX5/2atjFY4a51+2LLPJxW2xNLMFjP8rGP8zV+
 d3aD2ZOxHqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+f9gAKCRArRkmdfjHU
 RQikD/9KR5YoOwkAizi/b9Mr9lsmmE+PI7aYgaW8ZGWa6f6qyz8waYEjOdwJsKQ7O+6mRWNM0mP
 K73EefIBMpLzBWH0pia2yn8Kxez8Nbhu0VOzxEjGfsWwXbp4cWYHaafMwTNFUFF144/J+wF3d9n
 vBbz+vGK8wJrw8fKq5zv9/myTALwBCIPHnHWxT6jySYywviCgh+0tl+7bh/oxR7lBxjeVrSrnLs
 1MH/N7o8X7kBXtNz0E1cu3ecmBRlS4DPL748hguEaT3nzVjoKJxGTMCm1yK9FAp5OutkOfMIoHf
 VjTw9XqZOFfoSSuxSLbgke80sZBKKZr9ezbopcICj2+igvAerBfHGK+5IEPogHO3EQ8oklRxAPh
 OMU57aoIZIeOX+bVuIkPe7QoLgBRUQNq5NBdtJj+n2lt3kwro8nAHsQrnDZbPIG0YDJWAtrSxEU
 X6P54/2i7dtLX07vd/fXHYgPz8KxxZwAVTBdKhhqN37Py4eLWVapukB2g81t7Qp+1wMCg33or9z
 Jw1sI7hGF1JoQ0/2cmUwu4lTFRS8NOqPWr5cA1HoBVTZbYVZCBb+WeIjVBqjLHztiSJPh2zvSS8
 XluW2ShErwZm/LTDfIoe/JZ5gFEy228kvVAriAaMEUU8//qqIJXSAWH3Su6/jLuCFgdYYV04ddQ
 6BXN3OjtoIIPjsw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 10:13:55 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places using the kernel's
> DIV_ROUND_CLOSEST_ULL helper:
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
