Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F9280A5A
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765031468; cv=none; b=i2/v0s23GNLN2UXk+i+kEmniKoHomv+dQ0nvVomS3yM5ipvQAlLpy1PvYGH4B1EmRyxiEprZHDZaS9cEIv34TGekesdurFa5SJNAW9tjIupUrILPTen+uFriPNaJLP+8gSqiugNIrfZLjkEXL0Gm5Yju+lShYLx3Oj0pvfj3k1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765031468; c=relaxed/simple;
	bh=Na6D7E4kSS7DZJ4XuQYO7vDIvKg3c+obHsbqi5zx/hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVQO6Aoyvfl7O7S5tkhoCO2q7G6eRZsnw4iLbZ2Hjn/Ey7shlSg444Sr9DMpcNaBQ7B+cKpMPaYn9951RlaUSgj/U7U/6YyM959OyaNR0Oc6brRIbRmcPyzoGEC4VXy01sa3kRBkIB3hFCmI1II6ovruNS3zz8RYr/KQQSoy1iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dRNNNSQQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dRNNNSQQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b727f452fffso527692866b.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 06:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765031465; x=1765636265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRIfQPoEDFmFqm2DpO4522h9Id16dk4sZVB/evXjzE0=;
        b=dRNNNSQQ0clSVGl1ScpX45IvJaO+QPBP73LOL+HnM5SF3KWXYM4/a1j4cS6tZlcJO5
         dtpUjHq7lJTFVOd946oLwPNAFuznlNWUBxA9XNbdTcqQNq92UjZpKq3BN2rdIHqgw6Uj
         DuRJQ9E02PWGZ0MbwMEQtsEEPZyL0swixezfES3tpMOgV4tGpPYdpexjc8h33ZDmwI9Y
         0udXj+inE4/3J9x06885VnMWSrHXkipie+L/AWedqgA5EEI3huNaS0XKLULVi6tvroCW
         vCBtbPOGGjlA5Binp5ZK0o2N7dUqkxaqX4kuyS8cPVZxxcXd6zgKZkciPUtBsW3TlNzo
         M3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765031465; x=1765636265;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRIfQPoEDFmFqm2DpO4522h9Id16dk4sZVB/evXjzE0=;
        b=dhIezoCvn6ofG4a27h0bhKDVZwkEnQKr1MbtcGs41i6HQmAQ3c6CTZkKpkH3+CZBC1
         5xZGdBBw5s8QIRkGMu1g/163Iw20vIJq4AKYwXxoyo2Ag+8QP196u8JQef2UvFr/WXTx
         P/KybRNgmxLP0eas3Qr3iMg+5EyGqd+CVd3160szeBsDMtSEhyOWs9/2nCMYy6hr0zGp
         sna3rGNWRYZW33NbZyVqUojm6Ibe3Ft9eUTKMkrxx26YfsX8JrBDtd3vbMVNPp9wDri4
         blBrEq93MXXumLa/NJGtdCyVIS1k/y2kvAsNu2UKROieevMlD0sqW1RXdH+tuldKCcdM
         9fKA==
X-Gm-Message-State: AOJu0Yz3uxtTx5zfazZ0XEJ2oahqLOuHDI4bHc008B1An+URSXtfKC3s
	evq+hO0sa/eQZhkLpQCEiHgFfiDFgGiTViOoXtBoL/GHpasJO6T6QihK3GIMdB2wuDQ=
X-Gm-Gg: ASbGnctPUTRxJzbeOlQdzcCP5iOEz1nlKHPxpFSj9ovKhQlZLVyludQ8HXhbchyX0qx
	GBLZ+N2FXdMJLzGqpyyVMkvzk/gUr61g0782WsPbCZyCwikWFuO5IeX9J9XJMZ2AdM/LssNbV59
	1X2PaLgoKWZqgy73SJebdQvTZhHAFznFiZ/k2w5e7+O42ja5320yJhSjDIuch640/jQj/H9wb+j
	WrwrVr45mCubK7TU/FAj0KR50gVEetW2J+CYjJQ0QaS0OV+uDhVHFO5PK15e8n0R9fgl6npgBtE
	89crzfjvQ4SZmSpqIG1QyjjAJNib/lrWMvu1z4rlzUghiuC01kFMKAsr35rLXXYAgGxpeY1zXmx
	5mbN47NuVUQHeDVQGsR7qBwZini7JT0xPnkyyDZueeey45eVVVMEec+/EcW2ziwdx6FwRHViTIp
	EK5hiDxGVqKzrH/auzPn8=
X-Google-Smtp-Source: AGHT+IE8HnS86RZ2RRuX68coTBZlUOIBKtLFGaYMG3o3vx+kzbYCbEFgmp+n33XmwZVSgRz3VL6TJw==
X-Received: by 2002:a17:907:9723:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b7a23b808camr290395666b.30.1765031464792;
        Sat, 06 Dec 2025 06:31:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c56sm620545866b.33.2025.12.06.06.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 06:31:04 -0800 (PST)
Message-ID: <f2d88272-2465-4fcf-b89d-b515a1fbee7f@tuxon.dev>
Date: Sat, 6 Dec 2025 16:31:03 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: microchip: core: correct return value on
 *_get_parent()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-2-a02190705e47@redhat.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251205-clk-microchip-fixes-v3-2-a02190705e47@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/25 21:46, Brian Masney wrote:
> roclk_get_parent() and sclk_get_parent() has the possibility of
> returning -EINVAL, however the framework expects this call to always
> succeed since the return value is unsigned.
> 
> If there is no parent map defined, then the current value programmed in
> the hardware is used. Let's use that same value in the case where
> -EINVAL is currently returned.
> 
> This index is only used by clk_core_get_parent_by_index(), and it
> validates that it doesn't overflow the number of available parents.
> 
> Reported-by: kernel test robot <lkp@intel.com>

I'm getting this from checkpatch:

Applying: clk: microchip: core: correct return value on *_get_parent()
[Checking commit] 910546c58dc2 clk: microchip: core: correct return value
on *_get_parent()
[Checkpatch]      WARNING: Reported-by: should be immediately followed by
Closes: with a URL to the report
#17:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>


> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202512050233.R9hAWsJN-lkp@intel.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Other than the above:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
