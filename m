Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F3346E60
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057801; cv=none; b=e1kl8mgMpCV0465GBBvTKrAkU9fGNKZh2gZ+Q1I/E9PtKoy9VSmpWcbFxHembu5K15BIA+B/j3I+wN+pp85DLwvJZZCvU3aJ7Q8siQUghoHhkjcPTN4tqXCsGgVAGDEcB7MKxbzbC8NSfOv18EyNlYPjJ3U3ipyW54nQj2uVJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057801; c=relaxed/simple;
	bh=veOrw/m8cCXNOzS0YhBEMZHiqb+wrCM+D/j1ZadzRgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjqOnZYGIQy5z43Xp3cusE3bjjjJbZV/xF8PHMCeM678OReEe7FKjbnZ4ODKBN7E4e4VGezxrZdsSLuRPpfqOPrknqKYU6g1Y9iVLX/j9gtlM3OnT5ibdqCTciG8P6WOrZMa2JdNGOIQFP30lZ9yb9HslOXvwHT+riG9rpdjEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UR3LYot3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UR3LYot3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2582871f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=UR3LYot3X99B0iocnSlHLBo6xcEdvqWff5fJcdU9Exm6L/VyIsE1xVQ3sVYgXj7q3/
         AJgsd1EMgirOEF5wAn7H3E2taaHVG0xxbScSmK/eNkl7JVSrD9tlrn9K3U+JEY1JherW
         Qz8doesvUqWD5kfvD+tIrJouA/o6VYr3xVkPxj51Z9B+MKoAfeYgqiPVYyYZKZrNhk/F
         P9bB6TJNL306n/2z4mmOJ83Oy5KeskaYSjMWq2a8PkNrM/SO+irij/BR+IX+izMpqtjd
         cF/nBHWOZQPzwd+sng08PL/DHPEqiDOLBhZ8Qyrf6Ffy1AiCqVfxLza0Qx4ukc3S/Gwv
         Y6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=BmR4827in9lI7M/nOXjfCCQng5/KevXAyQED4veyf+zjVPSGMxOQIN5VsFZb6/y8Ro
         BwVsna8oFhRh6VXwKGyTlwCFdpILG8GJ5KHbj8eCrgRYYb/MR4tHGAngMlLAooeHHe03
         1IP7ab1cpOu4MRM7DM8ZSPHIm5Th03S44CcRQPlQteqcciRc/iwasKpSO9Rf5VNt4yzD
         Cm6G3JSBHJ8UC2vdz/CdDST0Y5KqdGZXHvDYYw0SD3+a5UrkaR7FURpMOJ2AFiCo5btD
         yPPXI5NlqP+Sa0z4X5vP8Q4IzdUsibTDE9myTI/tcXR1gCYC04M4E6Bfd2dPWFriCdBU
         rxMA==
X-Forwarded-Encrypted: i=1; AJvYcCWwLuNItgGS/91QaKw8OAyhGnAslW/m6K+XlESzFWPdiuXfwIYrXFgS2dzRfH+PdUjA1YeevCOBrN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMS3JcvpilNaBeELgqmBkYMtkLvVRHF7EyYIFWT1fdrZhsbWO
	vCmo8+ke23MEHzDksqBzEue4ZGuPY3p7bUIcTTi0Jw5BZ5DOOOLSv/604UR81CvD4/I=
X-Gm-Gg: AY/fxX5GPUCG0TSxOOCyuiLBq86lXzitrEfdx2XwSyGix7CJjDaz8r5bpYxy5MnSbtD
	+cCg8X4D762eJYMXsXPWDZ+MqCLYj7MIm7+LuNIXNX/eXVXbq4fQj/Gzl2XiYA8T5THMLdaBt1w
	WUXzg2Jn+Pph9Z5xO3G0xcD7t0ldetEeyECMHkBjjB+CV7NisXeBEq9tT/8bgCjujp8gt4oSP6G
	YHiwCKlziadB5bMzk9CS6MIe2zFTu5vPxE398049kojTRz5ubkgj+1rA6fSLi3yqFG0zNRKSuMI
	S7YTsIs2l/+dfZJx1k/3aBjQu6J3oiRMfniflpx6y8RmiottzZqWutHswFmVTIfJE58aIcQfCzO
	K1FyOOQROkhCPcR7k9VOBrk+OxZSQ4NyFRXLWPBtW4Y3lma4yAG+Egwxun6nogH2LBx/XQVTLR3
	yBQBDVN0ti5dWiF6oiMAZZ3kEqt92u
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
