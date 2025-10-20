Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607D2D8362
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987675; cv=none; b=nG6ToAWmh8Ge4ge/cOB15jMMt2oJi4KvPJP1MI6WsxZWR2rzvPh9GlWB6oNQ7UkdCfSuaCDmnyG5vHZy0E0XTda87vgfniumgOnCDoxnYpiZ2pLWGXSZCbeD3YvzXIEVYJ1YmYbeupHcFHKeHtOhS5aX4wrPpzUDHsKLL95u2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987675; c=relaxed/simple;
	bh=di/LJywwP3YN7hPrdCC/Eq5PJqERkGej3zMMq/HSx9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hecK5LEtavFVQ4661AbuIhk+hVSnvwG2a4xj3QGaYrMZ/aixDidpSGRvHBRvBUyKqt2zGTLKI+x2Q5N6x2Mil0h8UcKEW6ZCKphqiwhzHgaYPGvzsKFj0Zr0/lcVZXw+O/zuDIKCMnatiXxrc/3nAmxql97NyObyZ1vEJ9FYDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GWm1H33L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GWm1H33L"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47103b6058fso33555895e9.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987672; x=1761592472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=;
        b=GWm1H33LHC5HYz4yYjR1Uz30eTN/UgQ/mApuYb6GJTF77xDNDq/KRBOd7g/RiucdAk
         D8tohFE2Js349v4zjkY83xQ+QRpvMJV/eYrslDOy8kIMKYjHBJwo07eSC5LCJCE4oEum
         kasLEGBlQqBSXdI9BmGMiFWmausFD80/KEd5Opu6uvC+zPan8SAuIX2+muPX4EK5DPZt
         zTmDQSW5OERj2Jf6mjTwxtQvIogQjrmC1XDOz10yzI1hUENGxYsfmVJ+1cNJv6unCuV/
         l9Fw/moqrIc+vJPywuML7rVS/I4xKyMfnZjGN/SZ6XcWxjJVHHYk3Jahzvg26AvO6rV3
         oBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987672; x=1761592472;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDlZJRYdimnRIVHlNMRHwg+YJzd0pv9ZGTDqzHt2hqg=;
        b=GloJkfgO1cGu0Dpnn/VbzXisq9BHvf2KDUfRnh6wv6NmzjPxMoN80F+7BEqru40g9X
         CU3X//F1fTGBvQP++5SEe8JtHiaR/Fd3oEEpddmDIyPU3fUnPDVCruNzeOHuIQlODSBE
         qw0t+5Z0JHaxnSCSUY+s2+ZRGY1OxEwweG7Ow+DH5zr4z4nn8E/hNp4liHAtqH6fk3Ta
         cwSqhA1/Pn/zupYLnX31Q0w8MJUy3NqwIarjCzyI5z2jfYfRL9qKGz2QX9ZlHTaJvu47
         fphlgJgzT9YpyrMfZFJ92ojF3rgJJxogoEDrzQaVgg2KBpw8cmKql3MFfTZxoJ5asOBX
         5XWQ==
X-Gm-Message-State: AOJu0YxorZ5uDj2rcJRjKgHNlFoHOccweT6ZR/HQFk25r2CBQpQnuRXb
	gtQv9IWrdVGdZ4kWn4r01DaMpGCisWd1TibhA/PgZkTskRHEiLL/3RlRF3rzkiGtLZE=
X-Gm-Gg: ASbGncs8JgLZR+P42xNd7zubb6+icL3d6x8+DSloxjc8JNITkP6voSYi8z9F/1l25Kg
	Im1Opp6K9o7srhCO3WsK9OIWETKHsal3SPOoOW+bgFKDIjq7ttB83CaEuA09i0RDmG4F/7k/ErU
	oqDi/B8i++7P1dz7Fnpns2DGI9hA1+0gByNjI8MblSni9VOPR8zjHrYhD9Qe2kcd+3w48KtdowY
	uB5tvVd6Et9bhT+9reuV22LhIiHJEeFQJezBk5RilYww7GVfmvS2nxHSI9i+WM+hqCw4TOT70gU
	GDK/dLl1yAbhc+OI5YbiDP172lQy0389y5xQpEN7S6s8k9VdZAnO0sV7eZnAIr7uRhOrfmUk6lT
	8FXZ4/SU1NwU71TbeHe8KiRzNrhaV5H5pwiR3iGeX/JF53JxzXA+RnJPqMN/WYdZnyCXVe3kjmp
	porvmP9XmH
X-Google-Smtp-Source: AGHT+IGmMD0YHvu73+iykCZumpj3yIaAy8xwP+HHCSMQ83VbmXhKKiVZhRtq1rwRrVeYCqqd8gymvA==
X-Received: by 2002:a05:600c:4e49:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-4711721a463mr111865765e9.2.1760987672296;
        Mon, 20 Oct 2025 12:14:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82c9sm243199115e9.14.2025.10.20.12.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:14:31 -0700 (PDT)
Message-ID: <7f478e52-eb82-4cac-a11c-e0e4977b3d33@tuxon.dev>
Date: Mon, 20 Oct 2025 22:14:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/31] clk: at91: clk-smd: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <4e3f834e6901f7fcad0e697b56c85573c8e7ae52.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <4e3f834e6901f7fcad0e697b56c85573c8e7ae52.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in smd clock drivers.

s/parent_hw/parent_data

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-smd were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>
