Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E52C0F89
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987598; cv=none; b=Uhw8QGObyvZiqkuGuRmwee9hFy3/q7mMdiXQK97dCfQq3S7Ihk1XDuZ+CYjgBM3wb1HYTXDJyMG+8f0E1qpDc5quy/CCEb5J0eeZZbrvAcB1JLw3327CDNv8MyVEHNg8d1z9EgzSU32Juak4U9vW2xoz7J4Nnrs3aRpGJlXtdrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987598; c=relaxed/simple;
	bh=TmbBKgx0r4SprYQMKJE3Nc7QoAEOdBCYKwJuyxhY/NE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKKKFP4nCLCFfMNCk71xoNNy02JkuUp+PSx+gSKX6FatDk8rN3O7fkkVRRHgeSRCIPIu/PC3fDeGKHqrMtaQsgF44fmpfBOX/3chmIySAy7ohTa/v9IUi9miAF69oaJ5uBL+0GPuufS4JHzrR6BpbwKbTP2JgPLD+4MRDM0JCMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TQvWVhO4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TQvWVhO4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so5187232a12.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987595; x=1761592395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/1IqfcCUA9YLagYCycxbsY/fycVFokt9Tw0XGGRWeE=;
        b=TQvWVhO4EwIlU4EKPwzhTlm42XIpRxtsmMZmssZ7K1JD3NuSbnd5l2IWAYazegRsMp
         Y7//yZiWPsNngw1rMlCdFw5d6bh3zVEzmJ2B6VQOVZ5DsOJ5i/zoh3SjWs8lDs2vXA4f
         5aUzMDrfeN8MJKlMQDNs+xNtNHvXxNuHHbl5NsT0BqYxYG9DFginp3lNhnltGqRTx63J
         SMXWOm+eP5eI77xyXBSLDoGPIVMeIh41Jd7wgAHlQDX1N2BIdLoQlaoR3Q/USpdkajcn
         /ZPprn4wQgc4LRAbe0fhND9G42GXvYY2jO0YIshmjiiY+laVu2e4FcTi2sEtXhplC5hq
         eTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987595; x=1761592395;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/1IqfcCUA9YLagYCycxbsY/fycVFokt9Tw0XGGRWeE=;
        b=BoZxX5twEGDSJIoNIdblHGJr5mnEfa2DZwmTJudjoz0FSc33kMsupWpKGSz57VjJul
         sBlJqrQe+Ki8EDiKBGVr5OtljV66t/Evz93TemyVCDTc2xRa2syCSicl6/ftDZ3hLi9F
         vxRmr5UqD87eFn7nDLtl8PA1vPst0S6SDAd8ImQv8AkrgzfZlxhIam02ysQlXSAZAEh9
         DZSMNeqcAjM7+WdwonA0zGpi/LFG45wpI5RyldMYae8Zg5br5kYOZ/r582EW7/FTl3mu
         hYsBTG6Nfdngw+bP3PgOy0krYRTypNMXt6zmtv5kWKsIKaUktr6T+AZ7XEi+oDZYVAZG
         eRUg==
X-Gm-Message-State: AOJu0YxQ6LpcCjGp4BYyEzYsWw6uKS4T+ek4kWvyYjMqERp/WpNBXEbk
	VEjS4d+BZhpGLAVdkvCyq2QsX+DqvFaHP98LBC+g/VtCPCKeCXdlT/bWnWgndQAxZfk=
X-Gm-Gg: ASbGncvC6E5/teo08EIIE4xSzhvyeXsSHc39gzow1y2af5pEotjCSvnSO2HqQFgiU0d
	Nw3gSJ73iVwBnBNDw//nY0aqbTe+IsQPSYDoOes7Q4qbOli4i66/6XZDeJ2Q5D7ZP26Jm6uwnGH
	NYjKO0nabFBmIIk/q4me9/m1gTpq+HBxDHQpt7lgFW9lOZlVd4k9rqWez6OHTp55lTQSmxrRHSG
	tuRFBuoVJB9pEKF8T3KxI+5apAbV1jA03o3Bfb5ctkSa3Nx75Z6RbB5AKdKiljsmQy311yYmy/0
	JsQ4Y1Ga/LHwykirn6eC5hkbyO1XNb7XtOCelqfiCl4a38hn8D+lEdVei0LctzCMyAqOQLuiVsl
	gRtRdNlKfq0x3fYvw+3D4086huFx7Yiur3PJf+e98r2TMb+Qkh0j+B5bAMfn7lRhToyp+wq1zLk
	kw6ibJuDRe
X-Google-Smtp-Source: AGHT+IFegYM0qEO5npRuzThv182Pha2riR+uFui+GrzI4KaHnCKvwdQOowJPKiLUY+i2Ba0SSvxXbA==
X-Received: by 2002:a05:6402:354f:b0:63c:6537:43d2 with SMTP id 4fb4d7f45d1cf-63c65374608mr6780582a12.38.1760987594661;
        Mon, 20 Oct 2025 12:13:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a93998sm7234434a12.4.2025.10.20.12.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:13:14 -0700 (PDT)
Message-ID: <1b33d759-be0e-4bd7-b7ca-586d35b1c1e6@tuxon.dev>
Date: Mon, 20 Oct 2025 22:13:12 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/31] clk: at91: clk-i2s-mux: add support for
 parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <276cf23db4b81668bedbcb7b2dd310b62c2ad025.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <276cf23db4b81668bedbcb7b2dd310b62c2ad025.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in i2s mux clock driver.

s/parent_hw/parent_data. Same for the patch title.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-i2s-mux were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
