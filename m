Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE62690D1
	for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646900; cv=none; b=iRKzVwVvTzP5v3Hum/TqXUuxtgCSNicTSIbv5C85qqVFhWjtDJfq2dXBRp5s4tKvojwMH0p/8IKttLc0UdNqP/SS7IFz716AE/2kvOftaEC8S33RHieEIkW6aUcjW7HVzlzezgaBnFGtrasIC6UP1/7PQ3nX26ust4f8ZY/CnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646900; c=relaxed/simple;
	bh=ST8wHdef2LgPonMkQdZRXjWtFBeRH6dlNAeB4eL/Hmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l7GfWcTqpGO4eX31bzLTal1k+wZ256NZWgh9O3pWj/K1I1Pj93fGTkGDWOclZ/eGyqSXhSRHJwA1CXCH+SsauHIzK/Ko+EowHBiyKylQN/fcg5JEtQXE4i1HNSsBpHyza9MfqjIOKuLKuZBuBuD7FN2p/HDCmyCoz8Eahzsf5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWnTr8fa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWnTr8fa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b51bafcc1so1218755e9.0
        for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646896; x=1757251696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=FWnTr8faMjnNB12zUdraVl3FGqwHH7oQQBg/HvIOi2vusa0cjXY5fuooqPXTj4dFli
         VtgDnoa+ZaTHrrYUSDBCChpWQVNqrtrpiQUyD48qbtzGkRnXPq1KmiAvpvTYKRs+qGv9
         mfgVIhNJ1fmsNlxtfZExJ82+ItcrK0KDzfFE9iKrVGxQ0YxY7aBsONFOTYsUjFfO3Q1S
         /UKViy098h4uWO3VcDgyRLLuQy2q2RZPORi6ox2NrOtbxwFxLUZaopOv3r4CRfSZ4xsU
         tWyfbou35YmlbpGkbJgCcDlQ0CMtoMn//8sb99G2Qh8AJGEnvQYAV89LGJXJkle11gq4
         7Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646896; x=1757251696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=AxXp0kcp3MOOWiMvdDE/kRchmD0+XXsKoq17uA+bKokje+bLjS4NgkRpF/IxkJVJrY
         Or0M8H2dbL9JWI18RTwQJQBSgPyGDPjH+hky1bWCrq2hOdxG+r7UdQgWpHALzYnjUbPA
         8bGfcbkDnBhfcQiEFrT9u38znMkD1NXmHd9VLaK/79edIcXa9tihiurMGT1ArBaND4GL
         Q53pZDXvsoDyd6yyPW3d2jth6ODYkvPLAHxlvv0sUWeEvL0IInBegFBDYOpqc0prHM+t
         FfXUfqXw/atN5ZS091DrDn/cwIbH4TbJQwS2bL2gTpYeqQMdzts8ADhtKRGdQXxGDyEf
         B0eg==
X-Forwarded-Encrypted: i=1; AJvYcCWYQRFoQ23oP80OB4bULO4mVOWuCgi2E2XSPA3d6lPE6QM6eOYziM3Apt9LHDTLG1lp+lfPFfIsEmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZH6JyrNKgeJjwBv5lbnr018FHr2X+tQqxMRUN8cmTyoj5QBs2
	u2WKsG8xS92As5JT7ccafYc2/lDiUSaMYVIBgAehuT8zNDrIcUTDhinJ/OkvyE39p+c=
X-Gm-Gg: ASbGncvt3idmF+I2vTq1Ep1qNrPHtSxn1TVNdpbeqFAfE+VslkzJFeHcXJ4t+bkelfI
	goJhnxze839oMd3bdfijUESlr4k84aAkHz3AcTE30t48inANEo9Nyj8PSqnjtaETW+Mv8rana0O
	uyxeso1RPkBk+N48ZGaNqnOKmz916rolDwZJAaPP4w7Pl15OOqQYW7oc4O5aD3Go2Yuk3oovYRj
	/SRLc0Jrh9ASqlGvJ1R8t/O4t0y4aDb2g+2OGURayGFvT6z4nNejGvicKcLDTX672JUi6Tf+hu3
	/2PwD+vHQcEI5vUffkCv0Xwyd7mqHwN3maHeMKHuainG+BbYkN73DBeLJWWJwJPSjo/5wOEAAt3
	vXwT8Tnk+45laMasIl92E5Ofvd4mmlIfloIeK7Xv0Cus7seiiZQ==
X-Google-Smtp-Source: AGHT+IHuGuVHHk5pZhTIqaJ6T0pRMpVLKOi+qYDhard/uCHRhDaK8a/HDroJFFPgp6qQQ0xTGeYLmw==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr32007925e9.0.1756646895694;
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
 Varada Pavani <v.pavani@samsung.com>
In-Reply-To: <20250825114436.46882-4-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120710epcas5p421c3c8169019599e76f782bb7086e0e1@epcas5p4.samsung.com>
 <20250825114436.46882-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 03/10] clk: samsung: artpec-8: Add initial
 clock support for ARTPEC-8 SoC
Message-Id: <175664689350.195158.6648344469963977673.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:29 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-8 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-8 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[03/10] clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/bd5336e3f7040f300b01702215b45e6267a400cc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

