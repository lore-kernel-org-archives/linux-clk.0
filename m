Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCAB263F40
	for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646894; cv=none; b=DAJ0IwW4QRroEG0r/ZWLP2c1r5Wra1bMYr2IXBZArvjZ55pvfwt/dwF91Gbv3iSIridEbu/Dz3aqkfhFuO2aK0c5ohZ/H/w9lT0F486IIJz2POlP00Empr90bg9hzcIRaM2zyus0vJj3VIZeT97xpCiP1D5ZVTmz2LabOe3sUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646894; c=relaxed/simple;
	bh=MEVeAxVhndT/7Ap1qgmz1gUcPCdJBlzqawgLrzkMB+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nl+6cE9NcrqMFXcbu7sqytmAh0QWrqSTYiFP67pshHZoXV2OXrMvLczUzAXBqrrfiJNAiqLVrLoRvAt3RV/8ouSjy0PUBEXu0zq+IB+WZh5Rg2j0anMtmhhS8Ab6EMhzUBzAM8qFH9WtkgdAk+VxV54rGdLNrxgL0sBpNoGKYFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3t+JERb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3t+JERb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3d323be1617so118381f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646891; x=1757251691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=N3t+JERbTGuRAAyVCqxfce6CgTvhdneUFodRUq2lDvdaQwJRwKYIFujw4LOuBqFgQk
         fVKtgr+WVqXsbv/47c9Q8HxfY8JLcJiKtT22VbLiKHqoaRjXpgLA/5umHaW0E0bO3GA9
         hQYnMtbvyFpv1AsF1akwcDcsBWTW9BL4P/9/sAxFYgGE2zed5LVTUIO6n9d6wCqlnUq5
         rfKBaZD1j3OzJtqFtdkDk0e1vkMKbjdT9R5oQSYALmvP8CQyaxyQkeeUqU8l0+nA+8H1
         y1X5nbVqU9dKQHWV4K7uVuZ5sM0bY8KXf0DK7vPq/uvfOPwNsvn+jtXxgD0Ls7a/E6wL
         +8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646891; x=1757251691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C174R2YaizzIOWtPzR0PtYRjLpsIdj5ksrAYTRWCGTw=;
        b=rRSDulugfadfhu2R3yltfoHgeUrxfDU3uj+kUYWkCdu3Uj4294PUGHvRjIirMVNsnI
         G28uPRJLQVRTU0INZ7U9FINQRX6t3nnA1r/9md5cWphH4YG6StFwmuoabYKUISHPUn9E
         W7LyCdx8OV2PVB59M1aKlumnYFntRqP3yvkZDA7P4rH6NcRjR113B1Sr5nkOgTU7wTIl
         a8nai1KeBtMOfqKW2vBFmQP/6cHDQXiXsA9sRjlA6GMbGmRFX0P+NqUgb69B4+LKuD+b
         NHXqBaUP5xBdsfE3qC9xbZ82b1yBs2tdIihc4mSvf9qyaHqc52L8mZh6ydRBh6cpydRe
         D2og==
X-Forwarded-Encrypted: i=1; AJvYcCUjd75sJpOKsgE9zOAgad/iN6Zf9sKoKLtisCQ4pDt89upMtap7rD05uklrf/vn1uQq+GiApgy2uJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6ZwrT9uPDPs8tOebeEX5eZErzvnIvngpR+VRAZ9EZCqZRWFm
	jlkJ0rmFRnNNBBtDIxG13aqJk1oyrVjokfUAkpPOIwg3dN40L/PQlPe8M/K23lvfwGs=
X-Gm-Gg: ASbGncvagxIVF7zWhRZphjoxU7RZ8Q9rC79EOoiD/HJYg+I60cv0Bupm3z9U8DWodXY
	Q6CiNfjKaWRDyYdhhie4xaYRXRWM3xSvPVcaHQdqT7Szp32vE9KJartXnE8fKwQFbug7v4H0oFs
	Ef02YBBml2gj21SSghhuD/Rqu0AFrtt0ngkVszwwec8bOQBk8uy4MBHIPDiDU8782kJChX0slec
	9toSyyQHC4r3ie4QSasvSA5smTyi0aROsnekwVjFmQptOHwG6E5CNn8b+QEj1hMEd5YSPt3vZyb
	oUhESYAASuupH9qkvGLOaSIfyFslUHIAuvTww6Nnf30C1afWpJO84OfY3C7x+ZWyxwChYtvFDDQ
	RkFlVN72/A+wNUXnv1gjPGec0Nbyj9VXSOuq9odk=
X-Google-Smtp-Source: AGHT+IHkPBdwt6L3VH7t04bp7Le2oXr0tHCapltVXb93QgdyVU4QJ8bZvFGna7E4/zYnUQGrTwhkug==
X-Received: by 2002:a05:600c:19c7:b0:456:1a00:c745 with SMTP id 5b1f17b1804b1-45b802c57dbmr32352025e9.3.1756646891177;
        Sun, 31 Aug 2025 06:28:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:10 -0700 (PDT)
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
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-2-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120659epcas5p47ea3377840efb9ce3d5901a27c85e4ed@epcas5p4.samsung.com>
 <20250825114436.46882-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: clock: Add ARTPEC-8
 clock controller
Message-Id: <175664688891.195158.13270877080433356384.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:27 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-8 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: Add ARTPEC-8 clock controller
        https://git.kernel.org/krzk/linux/c/91f98de42310c70f9a23595b3b20aa305717d955

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

