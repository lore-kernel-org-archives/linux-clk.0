Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789C8C15
	for <linux-clk@vger.kernel.org>; Sat, 13 Apr 2024 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712998049; cv=none; b=ZjEbNHaBoPfePjeac8BlLUeJnu5mSdjzt+8rEO1YwSjlxMa1en6Odp9w0zp4BBYx81s0rYVtzaAORULPSRa7agwHBYYgn+ns7npHU8raFEygZKclYP2Z3uQjdQ/tmMOa0gZoRG0gb7g8tFPnM2Dan9HtW12bR2CC+qyk9W3FHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712998049; c=relaxed/simple;
	bh=guMeNbCqf8Bf7dLBBZ03qR5b/wAPVhCuSkwUDiHkreo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nu7DPOblfo09AywbrZViaK114thQok+slyt7qWJKyfhjUDr1Ezp0ZRfiFXHwB/AelBrSIV4fcIVzIYvur/5N1mtJ5A5egOhhgc6aWGHFfmrdEDbP2RSM18nzPYzIHq9eYDAFaGDu7V8FLxidWfnmmDZjZpER7o7FJqmWeiCTp5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMRLCK57; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMRLCK57"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so2124080a12.3
        for <linux-clk@vger.kernel.org>; Sat, 13 Apr 2024 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712998047; x=1713602847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rII/pQt/MW1EBrzDYRD3z/sRc7Tary/0+K7B68syeNY=;
        b=OMRLCK57a41t37uwapCRplFClEO+pxTlffutfB2VDznar1RD/9ezkEEQrHVl/CEEVt
         0hTWs5eP2n1h6rbi85IxNf0zHPjUJmd6RZoKCzV847E6LXSJvzzTY/BSNNBfuqq4DOxA
         BvaVbNfgTJnDDIU1nwfx65reuB9V1DWp9Yxyp3T9o1FH3CaRWKamjPrhXUKBNU005DUt
         JgX6LsEw3XUclEjk0fP5jQYTyQtfE7FBBC0a54Qo31HMHtctDOWKLCnFWtlx57cbP2xH
         9WTHbX/W6bAo5EjsUhlGIT6QRgN0OTE808nx0r4Mndcqn8s1WXBzfCkECSb55ri6ElR+
         xclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712998047; x=1713602847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rII/pQt/MW1EBrzDYRD3z/sRc7Tary/0+K7B68syeNY=;
        b=l98soPT4GHsneZaMmtyPYjXEouY98R5gomR18UeC4AJetD9OTfT1Rg8OpEUWXXIPfh
         OsP8j7SWB3gD2nT/IGXjci3BUO8ogj+3Iv1sT6ZnSK+jcOh7d8f7E/jUCROHRaMmUh8Y
         nOyue0zGL3g2rrOnl3+e9OHGaBUNFutkxrVHeDVdwgOOE92Xg5/knFDLfr9CJpNVoGy5
         L6BqjUxZroFjklnKse9t1KzK6Qef9UJIyu2WQ2dBXRWg5d4aBsoMIAk0rtFSytS5V+zF
         eGAnzYx3k/H4lUzu+BIsYQb4jgMquo339hihSQEBA3HJWUsbyduGsragpvScxwXXst/R
         ovpg==
X-Forwarded-Encrypted: i=1; AJvYcCVHyxJukeic6zrWp+sPOXJcVB5Gc8LFTJ/TQrXtUuGRGgBvgTdQzQfLQxmitkafZ+mTgu7FdTajANof9Antr/2yXK7FldhlaIba
X-Gm-Message-State: AOJu0YyWZdtQSCKnorS7uptkb8CplunRkeuzwHLRhP3dm6A215EI1U1U
	bgyOUlQseHH2KBk+ZN36zvjWKQp3iDqeDi8ZuXz4kMkJ0rTPICi4xh5RLMhE02U=
X-Google-Smtp-Source: AGHT+IGHF+5m3Vbg3WQcgDLVBuRhXBmb/Mh6KEGMPJznnhUA3UPiXlgXiDdzEwh6Fj5RkgHrzFtlTw==
X-Received: by 2002:a17:907:9448:b0:a52:5296:cd94 with SMTP id dl8-20020a170907944800b00a525296cd94mr270923ejc.60.1712998046792;
        Sat, 13 Apr 2024 01:47:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id go36-20020a1709070da400b00a51fea47897sm2722435ejc.214.2024.04.13.01.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Apr 2024 01:47:26 -0700 (PDT)
Message-ID: <ab700927-d7b6-44c6-bbe0-8c52e4a0f907@linaro.org>
Date: Sat, 13 Apr 2024 10:47:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: samsung: introduce nMUX to reparent MUX
 clocks
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com,
 s.nawrocki@samsung.com, cw00.choi@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
References: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328123440.1387823-1-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 13:34, Tudor Ambarus wrote:
> v3:
> - update first patch:
>   - remove __nMUX() as it duplicated __MUX() with an exception on flags.
>   - update commit message
>   - update comment and say that nMUX() shall be used where MUX reparenting
>     on clock rate chage is allowed
> - collect R-b, A-b tags
> 

Sorry for late response, somehow this end up deep in inbox. You
reference some non existing commits, so I think you do not work on
mainline trees.

Also Fixes must come before other patches, so probably first patch
should be squashed with second. Otherwise second patch is not a complete
fix.

Best regards,
Krzysztof

