Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DE20C489
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 07:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998122; cv=none; b=Hi7Rq2ji3PZ/cDZS6g/NtxhjmbYs5XJfCv/byc2grSE1mmEKQpEHFUxgs0erfZuBC2GOew67JeMvIGih4a7Gg0HbxFkRJef0UyxPCf3tQ21eUpflw++aCQ06OzaJQDq4JZABzTy7UUTTOdt5Od2+ySi7dvSZwcgYrd1OinvL65Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998122; c=relaxed/simple;
	bh=7vr2hgAjqIcePt/DLjBlSH67TMuNgRgGiFvKpvSxERs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=evXpNKykXJi03thaRrcd3h48B/4Ol7oXoT5MhNWr3kLQJFwWF/LmiFNigtHr2mxUcLkmwp6bZp/p7gdTS9VZ52aPYIFRZ6sNSYAjEv+oMNCyEIE8r1g2FQJKSgrxTcaWWNDTx2ctdLM0/BXMXLMHTnRJJsgtJFneT4ssD+6+lDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZHfTqHE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZHfTqHE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso4946815e9.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998118; x=1746602918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=wZHfTqHESIc8AHv5SUx4roAyAm25oZDGe2SLusxguuDsRHddd9i+ur7ea2D/pNYYBH
         xyRmOya/wlzW8peAAgRWSbQmOVWS6bJqNRtagcCEyVFv5BpQVRES4vQ0w8jWIldaq1hM
         6utM0tO3B/00QbOiVD+L09poQ3gD3M7ecW0LlPqZKdGijN8P59kujViMvRBE+FKoadtT
         60hq8Nay3UmmCssLxi3RQyXYnb2h1Y+qst0QIswiGVqtk97wiHSWpm1kmAoRQn+k0bs3
         KRoQBSmQurQhVfjBhXsJRn8Yde7T+ynqjO5AXv8DNhnQf8Hf2Kg/umI9Tb3h5qBYywI9
         Ddng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998118; x=1746602918;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=CLCQQ/OcupBBiWpGEK+i42l4OIzDGPjxHTF/LpyjQykyTIlV2V+MXmeuRAZIlT05tG
         O27yNrUHUsg0aB+JptqnKXSk8UHyDG8TG/poWNrdxgklxpIHVJaMDCQkMB6eEZ4ILRTQ
         dJSQNACiYnWF4/U1ixn1ZQC+uvBc/anLLNyMduIkeDmZ5F/98YC0LAVx9qnGa7y5QBHM
         I4DKBgv/MntslE1hqD+gc/R/tYp3v43gN4xCuOqMINPHeUDyqwPx97EvEhdmRv64sV/i
         2PePp5P1oo1yXp3qIuoEYbE9rmu1PoB4QzNpKa56nCONqKZ5WSYEva3MyGr6HkfWSXhG
         bAwA==
X-Forwarded-Encrypted: i=1; AJvYcCWM2RWjPhmn0Ty9W+MtnTJMIQaa9w/ZgNyE4p6ZaBMmWixe2/IKN553uwqPPFj5k1prscbkrmXLNok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDu3M5+Vj98ZGDEGZsu/2d+6uEazeVLp4HmWOwPabMdsDvlNIl
	jRkwTwm79Co4LKYIpuLJ8CemnvMIfGkNN0DLxd2g0Wq3FJulUeDfoKPoXN4uzxM=
X-Gm-Gg: ASbGncvrYqZK1W+fcjAGOvNhz8CoIU7VwihnCZHNM1S54NBjoQ4X4ugZliqBVtzxwXc
	fJcka/YVnSmMS2pkMLj+mhRAhGJE6pk4nSoMCur+Ig8cfTZ73RlUwrWYuoO9+hv/EMIP9pH6htp
	XG3yiYaVfsEultmv+5tidsBF17D0aZZJhz5vET8wMOmOrfU7bKYBsglJOybUmVJA/Q2lQ5XbnF6
	Q/FjavyakoV0WXT1og44WqQnFzbLrY6f07Tha8RKyP417PqSEgjgHmOrofrXhbjKZKPkEOlDiD7
	g60R8eHPXAsJsJj24aXN4LbEft5EWzdZmXlcA/89gu6an/8NZgsVJjsNJDVpbNKNK4G8DA==
X-Google-Smtp-Source: AGHT+IF7Gh4vjC7xC4WSD1iD2VzffiZ5t8WLUUmff1SqKYA61CCGorcuPW7hl/AFgfoE9CQrmxQ9aQ==
X-Received: by 2002:a05:600c:4f8f:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-441b2bff6aamr3696935e9.0.1745998117810;
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-2-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3@epcas2p4.samsung.com>
 <20250428113517.426987-2-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: clock: exynosautov920:
 add cpucl1/2 clock definitions
Message-Id: <174599811635.45412.13637965232179255508.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:14 +0900, Shin Son wrote:
> Add cpucl1 and cpucl2 clock definitions.
> 
> CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2,
> which provide clock support for the CPUs on Exynosauto V920 SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      https://git.kernel.org/krzk/linux/c/3c50137aa4c80c532cfcd7444a36b21710189ebf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

