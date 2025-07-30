Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623061F12F4
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753860571; cv=none; b=nYHg4XL0EN1y5uH9FD6OfmHvONbHO+VjHCsyXBWPrAyFOnX8MrXSTg45bBC+dKdo3Z1kJmJ00vrCbc7oDnbv9RcCGCGN7InpOHmYrgLFAnTD7NpZXSpmroIh7MouCqJC7bZXX0G7bg88w9M+tpyuQWzvPBKoMwebmpJ8jcozhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753860571; c=relaxed/simple;
	bh=FqJ/O1UbZAXmNa+fmKfqPN5k81phRkofhogPxnTCOus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgBWsFT9cpSIl/cxHJJooPnbHPHrK26oOA26FuXj/OiI6OOLSLqbHeF1+uX+PEV1x4VJQj1U0xUcZ9b7IeABtvp+A3boVBC0rMaEISNDIUQFMbUdw7h6eEti8BHWI++g8gKymKECYa3uhH5Psn00OnVsDE8A9FmeVM8aNZT5Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=k0SofNqq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="k0SofNqq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae9be1697easo116557766b.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1753860567; x=1754465367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YfSyL1J/1nGbrIfH2f1hr6gi59w/PAjg9s3k0fTksYk=;
        b=k0SofNqqbErflSZx+iv4t4+Vhtd4hhhJQ+i2cVmnf6HNf5GviDEDcm4RYOhuIJhYOg
         IfXTH8sam+8850EIO8t7GlBxPdwlH698oVSFn0wpd7DxExAKFMDyZXK6wnoPz8vtlCvf
         X2NaqpFErt3WGSTSLt9cXwA1GzXhIRjkRzyduBnPRc/xPbGpP2dgxcHU3aWREtkDWeLU
         fj8AZTYx3xafg/X4f4rJn1EQspegneJAFISxeUZuSb4i/aNk6z703Qk1FjgSehT4HRNQ
         +Dao4VyJrDEc0WuQ47GOwWA9dkrPBWdpJsjW2Z7fwrW9kVVPA/ACKP0dl4UtZk2z9Ktd
         iXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753860567; x=1754465367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfSyL1J/1nGbrIfH2f1hr6gi59w/PAjg9s3k0fTksYk=;
        b=bFkeeV37gS2PIR4u5plcSBAoZ44/s91YfdeLR1AhqFLboZITDDr2L83E2pDrIA8BOI
         /vRVAxDJ5k3oZtedRWyJ+rfauUHsrgb9JdCBn/SSC1vAxQZ0gjfUAGctIlTN82cZ8LIw
         xJ5C4FgoheTV3qJRJ41/jmdvPWB1Fm8T1GW51BrlG7jtrUg32vGeO7G6/DVXmuuafueN
         P6BdoYrjJY/d6qIa+exRkxQptw30Xlzd5WKzMYNWJcSo553MZQ3G9CknHB109xxf7odR
         +k3KmQRpScYqP8g9Gt8iqsNrzH7az/6KMDkMEG6fXE+/qLwfuWCnjZgf93gc+odXNm5u
         kTmw==
X-Forwarded-Encrypted: i=1; AJvYcCVUbWbmKdviMDOV7O/BN6s0XI1uNBmHJCo5SAqFTqkkAjvQt5jnt1aIberECGfWz3Zlq5ItAIxZ+T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBDFq8EHP2ywRSGUrGyTCSmZ7QbDY6Sq3D+LCDC+uYDegX/AG
	UFOqIohKwKoqc6GN9ao23bEDsn2Jmf6LE+BYR95TvgkHZpc2F0BewRNlDqg1eSdbPlg=
X-Gm-Gg: ASbGncshjsgyy8KuXwQ1nzS+myJtXgxDiRywIeUb9CU79TvsOK4qO6nMEGHp7FtW9x4
	zfPi9MCPr14+0BVCDdEH7fAJjg9HKcemhDb9NtPk3PDVnBA2TpYC95s2obhQsYtiBMpE3PbucXU
	7CSiE0NqLStAjauX7nHapaPULsnkUMyt2DIc3WTFQ6mJrwoD2JaVINMLLFK2h2WTVy3iwiVknRC
	m7mfV2IQ4YYJbM01X9PhuyOJE5MOKhsnL8ZVo7cfaso3LXTgI2vYCbMgbM+bv/gNAYfZ234mdUN
	6qQmhEB2EZaENUlQBdWEPsrXscV4zOR9KmS/QABDrOkdqyEW+UsUT/pqruGZsyeFJDMw6ysS1Et
	SMRHSMMH+XbeJnwUFkv3P0AgLhA/BlwkDaq+eM5x2GDSW7cPz5L2U882C6hwNfw==
X-Google-Smtp-Source: AGHT+IFArK5yJ0y1FvOGBm8xzNPjYC+xuZmYpGZnVw+SljX1j9nVPSGdupVHpYG06Yu+78RjXTjllg==
X-Received: by 2002:a17:907:9406:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-af8fcea9917mr340301266b.3.1753860567359;
        Wed, 30 Jul 2025 00:29:27 -0700 (PDT)
Received: from ?IPV6:2a01:6400:11a:26:d163:a794:aa16:5e2d? ([2a01:6400:11a:26:d163:a794:aa16:5e2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a610e2sm699912466b.68.2025.07.30.00.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:29:26 -0700 (PDT)
Message-ID: <fc26c393-5c4b-48a8-a7ac-12558f79b140@sedlak.dev>
Date: Wed, 30 Jul 2025 09:29:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: clk: use the type-state pattern
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 7/29/25 11:38 PM, Daniel Almeida wrote:
> +    mod private {
> +        pub trait Sealed {}
> +
> +        impl Sealed for super::Unprepared {}
> +        impl Sealed for super::Prepared {}
> +        impl Sealed for super::Enabled {}
> +    }

I just noticed we have plenty of Sealed traits scattered across rust/ 
folder. Do you think we would benefit from unifying it to a single 
location to prevent duplication?

> +
> +    /// A trait representing the different states that a [`Clk`] can be in.
> +    pub trait ClkState: private::Sealed {
> +        /// Whether the clock should be disabled when dropped.
> +        const DISABLE_ON_DROP: bool;
> +
> +        /// Whether the clock should be unprepared when dropped.
> +        const UNPREPARE_ON_DROP: bool;
> +    }
> +
> +    /// A state where the [`Clk`] is not prepared and not enabled.
> +    pub struct Unprepared;
> +
> +    /// A state where the [`Clk`] is prepared but not enabled.
> +    pub struct Prepared;
> +
> +    /// A state where the [`Clk`] is both prepared and enabled.
> +    pub struct Enabled;

I would put a private member into the structs so the user of this API 
cannot construct it themself without using your abstractions.

	pub struct Unprepared(());
	pub struct Prepared(());
	pub struct Enabled(());

> +
> +    impl ClkState for Unprepared {
> +        const DISABLE_ON_DROP: bool = false;
> +        const UNPREPARE_ON_DROP: bool = false;
> +    }
> +
> +    impl ClkState for Prepared {
> +        const DISABLE_ON_DROP: bool = false;
> +        const UNPREPARE_ON_DROP: bool = true;
> +    }
> +
> +    impl ClkState for Enabled {
> +        const DISABLE_ON_DROP: bool = true;
> +        const UNPREPARE_ON_DROP: bool = true;
> +    }
> +
> +    /// An error that can occur when trying to convert a [`Clk`] between states.
> +    pub struct Error<State: ClkState> {

Nit: IMO we mostly use the `where` variant instead of the colon.

	pub struct Error<State>
	where State: ClkState

But does it make sense to put the bounds on the structs? Shouldn't be 
enough but but the bounds on the impl block?

> +        /// The error that occurred.
> +        pub error: kernel::error::Error,
> +
> +        /// The [`Clk`] that caused the error, so that the operation may be
> +        /// retried.
> +        pub clk: Clk<State>,
> +    }
>   

Thanks!
Daniel
