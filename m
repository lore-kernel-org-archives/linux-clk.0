Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C3203710
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317318; cv=none; b=qUNZ6RiYSVys3YGnHzpzolIxQRCyCtOjEVPLwZQsJUmoevQ+3PsqLLYFt3Hf/QgP1nrxXLG6bGWOuXxidf47WFWNqiWY2/AdbhFwMX7VMKpGKffm1pmQ/H18o+pvcr1Mw32izwaI7gcJDLN3vEHWFBI4NCR/lIa5Ydp5WacZjo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317318; c=relaxed/simple;
	bh=PslsRqEzoLUH7pRkVHXqIh8BJWHmrAu7uexd7fti8CM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=up02wgIrB1R7pEAGe7640zyy0WQ+RIyVK554K/3ayJV8qLuTxHMN20JtyhBjB8ZYSLfpRNLV6ZY8jx/4xk/E/7DBM6tBC/5cTuOdLDSnG6HbdHL8u+N9DPkoiHYmxItNEl7/yBRLxzm0L+Jvbng4GhD8jKkor9Sy7Db/KDBewoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7xiXVKY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7xiXVKY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78283098d7dso118853b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317316; x=1760922116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=J7xiXVKYs9he+Fv7oGxRmRoyc/hOYnP7tWPI7wTXMJJfBkZz6dF6e0j01Bb6PLsXNf
         m81QIZbrfn1THHBfPQpdOFM/hwPu1Khk+s518reatYGOTVzTOHo/f8wXGoEXyz8+Wxhu
         2EVgUoqQ1GqQH/SaOITSWe0T+p0XxhJFqpoIFQFVT+FmIKDwTOLjik7OzrSHSkPYNh/3
         pgzHAMkJclFMR3ud6KzxTIHrEcPxZFwuH0uCEuj0cLoJuhYT2PnVUyXlZF/ROhx+XNDg
         Wd78oj/VKL05bC0l3FGciKrotulNmmO+G1nm4tWaDz3fgbPJ7YwOgE7BuGjKT7O7NmwS
         NSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317316; x=1760922116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=nD9BoehUMY4ZLqE3xuGObQYEdZwYLA1sZ/hp/GVZGgswgaNsPBfr7T9V86KMpPt2H7
         6FEBAFRXCUx+GmQiuszXAr1yBF0vVnsaKTN7plF1fHkkkIuLhBqY6VF+o/+QRB8Zf9rk
         hLTDPY4GUlm8nayG7ZLI8vFRp8ZQHK9EAx9NkZxUKMqxpXRqxa2z/L4VkGLj2Nf0nOZV
         aaZioouu51Jy1mSsF9nj93sMUDoJi6xItK13mUMZ6TYbIv5NvbqmOsStT2d1DrERENdl
         RDt5RIvkmSTEvbTHK7emQv99YWFKt/1CuCI79GCv2jHY7pEhSCEQUlhxV3/jENV8rWs6
         +XdA==
X-Forwarded-Encrypted: i=1; AJvYcCXlG0Vrax2kfWiFZAVWa9vorEdhAwI48ZT5LMcZMnZRY+6p4GuBNsiebjYusAukmttYZ3A6c/cIQl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Y7az1LYtoiEXA80Nlnz55DLyNiBSJjNeIayrkscaqtvxsUy6
	ofBK8ZpZUtufE6pJZO/BBqsFUG9cdH9r6E4F+gBkVQ71hWyWvaNm5RNgchzy5rIJiYw=
X-Gm-Gg: ASbGncvBpuIyUHEr0Dni6k5Zx5oYTRq+QQvC7b8maEKGZSJUuj0Lg+uBaGK7PWs0EeK
	elQDkmGGujo6HRbXkll3r+Ru6xC90UA4TFvZZLgTPQU/cqBOov56t9yCURkhFsgq+hS+bQJq9qq
	poyNALCnYoxvErGSl3/uppBeANetjn7x57GNUVj8Kbr4KBHoLNVYf4xyg/6qsE6eqQXi7OS6DfQ
	WS14T5MSqMMQm9bQM2p9jbIP2TwsNKdcr16xMkq31nFEnb2xvfb6D2Xwx6zl+mhIZ6FM6HnKzkt
	M8XwttSTUm3ck00A4bwJ5dwOZJftFuaKvvwfrQ8pGoD/UCygdiu/1TRbRSbT/z6BLEzzRCq5Hay
	ZKBS3RTcJO3OEk8SZih0mm759cGeTBuv/18xiockOAvR6IlVyZSRZTT5QqSS+czbLGUIjRZY=
X-Google-Smtp-Source: AGHT+IE0pV2SdSy2BtqzzreV56Z2CBh5fAGnmk9U/0caCiZx4MMe4ASrcDCjjfJh9mw5C6vsUpzf3w==
X-Received: by 2002:a05:6a00:2295:b0:781:220c:d2c8 with SMTP id d2e1a72fcca58-79387146ba5mr12386110b3a.3.1760317316323;
        Sun, 12 Oct 2025 18:01:56 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-4-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
 <20250915095401.3699849-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov920: add
 CMU_M2M clock DT nodes
Message-Id: <176031731074.32330.13412044019926403871.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Sep 2025 15:24:01 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_M2M block, which provides
> clocks for M2M IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      https://git.kernel.org/krzk/linux/c/7b0ccabb873de4b4dec3214b2a0ee3c32c326101

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

