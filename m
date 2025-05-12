Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA32550AE
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031908; cv=none; b=AnEmQRKRqD+b4IkPfyjqgyJ7ynZwC9F18srnbuspQM7bULE2wuhrM4HEBSDQ8UN65pVGUMT3NSws2RBU7eE3pwjNNUmecHkp5iGu8kapKmzv/9ZLXG70q6XNz/nJnRyDSAFVZg+VOtW9bAHAXnk0RX3ImRAeoaUczGKSx34ut2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031908; c=relaxed/simple;
	bh=k6nyCIyilz7zfov4OFEUENE2DGQbjDDdPx3tbpfgW8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gO5NfFXMR+WY+d5uZ1J4u/CXUmMeWMj3LIkbOOPXEbv5cCOyMCje4fB1in5MJA8wCLFrp15iAchzTl63JH4BX33Acj5jDgztKJ8+8GFTKmNXjuavNEpGGL33JLdWTy1qb0QURjkj9tYNUqR/kg6eCHBo8tJqSiSzQ9apFvts4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vi1ZC6bg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vi1ZC6bg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad22ac7cdc4so44585266b.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031904; x=1747636704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=Vi1ZC6bga6JNi66kFjfQkulQJxezhF7ZoHiOllcNF8kI/aKLTyf87pw59iwMXXbKQw
         RcRc8OXBu5LN8u29i8PxqRI0TETmyvxJ1HinuDAYXAcGmN1qx0pl+BzKevgqtT0DOOJw
         crU8uyi5/+67Gqzk9edMcwvsBO2P5SR48n0PVJsB37mgFgn+Fr5t0mLuS2CRrH102vra
         Fj2u7+2/HVxkfFV1Ejaw7+KTKFvbZEVsSIb7DlKGai2rziERt/UNwKzxXAUElcULa4GT
         6Bwj3BxeYC5GcnknKU17LpSwyvX2+tJnU8BnYH6s64LpemCKNGdN8qiahykoexxXLWA/
         BzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031904; x=1747636704;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gs9qjJWfXtPIqCNTFhtaejIkA6pnbjDMF0lYDQwceAc=;
        b=HQjMUdCAQu6rhvobiEPqfhZPOZvIqdTWY1XybPjTaHs5rTwjvKlksOKzYrjzDmigBw
         A8+d3wQNuxJkwmGxjJBlfcZaBWlvkk45s88UksNZIy5S//5/VXw++nGb6h5FWQpY2dz/
         ReeXXuGoIupCsdI/Re9zn/1B8IqipKsIjzOzE/B/ReGla56/at60g3WEwbIgwvHl9po1
         36YbEt0ua+ZgvhWOAhmw/bZGg5/c5gkxvCPkO4rKTJ743corz2iZiLr15MJp6u2o1lbK
         X3E3zVa18aA+jce9OXZjt9OC6EGqb3FjMSy+CeTvzZ97krrfjxIoKvqZnLO8v9S86JKn
         NZEw==
X-Forwarded-Encrypted: i=1; AJvYcCV3FEUsGIMX4JNCDWAnyMDE16CIImDO6BU2PLrIoZV14z+KLlTCdvJ1F4eHK13aYkVuIpRfdEGHF9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp9DUi+Zd/g3a59ueKI6fElZnWRworWhaR1Odr24tYXQkXK3Wg
	t3pOs2pnB5wozuMssDb4efo/fQPjsuiUI28wgAoErxGJTNh/NOZolg0Or7K/lK0=
X-Gm-Gg: ASbGncv2K26d3ikxbcDhrOCgS9R5alw1DKu9fnPsVHsb1OtLflZe/oiJmKArEzpkKTn
	P+NIrtDpa07+ikUudh2Y3yrYeTG3t1pZ62JGCy+TJr18+S3mcYJMAKSik346dvFQ0W2O8Wvt+vX
	fga9PpqyuzIiR4GTWU42aOwX76CcOC0gPLgb5DnBLrGmt42AwQAiuMdYZC5k5su9CPFOaCPMc+5
	Nx7UqV1iPdC7mnUfr71pw2u6q+lg9F0fg+v/SzkrxYmibHTqm1uORbJIUswlpXkWHWB4PPIS1OI
	ZE9DWDif0sS93cZJ5hhbcCp80iWNCxppjn2M/C53aVSqded67EABEiKxdDqlk+IxrheDkSW35Re
	E48DHdw==
X-Google-Smtp-Source: AGHT+IHvnruoQf/zsWKz811qCbdXO6vDPHDtBmgtxIKDoHCWYrcOhWQOhDK0kiHkWvqsK39CY/vV6A==
X-Received: by 2002:a17:906:81c5:b0:ad2:20bb:1cf4 with SMTP id a640c23a62f3a-ad220bb20abmr329227966b.15.1747031903658;
        Sun, 11 May 2025 23:38:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985342dsm560597966b.169.2025.05.11.23.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 sunyeal.hong@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com, 
 stable <stable@kernel.org>
In-Reply-To: <20250506080154.3995512-1-pritam.sutar@samsung.com>
References: <CGME20250506075413epcas5p2ce0db6da9f359e9c3bb16b03c1a5eb4f@epcas5p2.samsung.com>
 <20250506080154.3995512-1-pritam.sutar@samsung.com>
Subject: Re: [PATCH v2] clk: samsung: correct clock summary for hsi1 block
Message-Id: <174703190180.30824.7869810440516124016.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 06 May 2025 13:31:54 +0530, Pritam Manohar Sutar wrote:
> clk_summary shows wrong value for "mout_hsi1_usbdrd_user".
> It shows 400Mhz instead of 40Mhz as below.
> 
> dout_shared2_div4           1 1 0 400000000 0 0 50000 Y ...
>   mout_hsi1_usbdrd_user     0 0 0 400000000 0 0 50000 Y ...
>     dout_clkcmu_hsi1_usbdrd 0 0 0 40000000  0 0 50000 Y ...
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: correct clock summary for hsi1 block
      https://git.kernel.org/krzk/linux/c/81214185e7e1fc6dfc8661a574c457accaf9a5a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

