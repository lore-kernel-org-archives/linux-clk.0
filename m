Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D611A298CD7
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882071; cv=none; b=JXlxzNxku2X2QNlndDA2BGAxq+2yewsjg0Mc99a6mr9Fq/FQ+9EjY2periBuRF+XOdfA++fIHt0iXfpzDpBAoWWytKvOWG5dh6tqbzSqeKbKNscZ5cwgHiuskwBJnefFJd9n2noeLwcKCr4rz+sTYmVo6/07W+n1++K94ySdSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882071; c=relaxed/simple;
	bh=3KhlsfxD1afiXVUFTv0MDo+p5dzoiP4SrD8Q5oUNi40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mroM8NWvVmZv2zW8tXPOsk+T2H80BULk3f5FmyEfAdZ7TRyEeFKBO8JiKwEslX/thlh9CCBsZv05cHVm8y1/zXT0iWVRcXEQMX7AwGD9gZ1p4wHaeJEmlpBKyl9MBaNOKwwEnS7eBK3jXRFqlDgwkomRHET1Mt1hx9twX9v5fh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=KpHOo62P; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="KpHOo62P"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae708b0e83eso1250039866b.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1753882068; x=1754486868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75YOp4HxyEEORrkg+J0iH+aQiJlUPUOSbZs0eZIgZFI=;
        b=KpHOo62PCC2rNJXNQJNxRK6voenzjlPx4XXUxi62BXzAVuincYa3c2Wwofe2WciXrO
         AjlPvA068vIU5mH2deS3dBwN4ZKeOnjrDkDUPwB2hdOrv4nqeYFi/8u8YkmC+VMfEw5i
         kBQR+DdqUpKX/lFZc5wfcbhgtGMm316eiyw5b1/B3gE9rpDTJ2j3vBx6GhOhq+ltcMr1
         0UXxp1gewF3iKUpmhhmP+1ebb1pmxMPUckwwWZoFkFc0wmls3b8kONMjcyuHB04s7wxD
         nygtGvpgaOlFFNnMAQAamq2iZh5+b+FpfRHVK85weXlleWoouAo6l/G6f9EYHyHxnlvl
         lalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882068; x=1754486868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75YOp4HxyEEORrkg+J0iH+aQiJlUPUOSbZs0eZIgZFI=;
        b=CYMihQvsoRnI9zZNIc/8BlOd8d81ghZtoAeM3z803BHEgQIv5IiGlz2N+YUTx2v3go
         FlIbs+p5f0MVsePEDQ/0SbTKGRvR+9oaDJe8Z4v6LrsWMSRgnO7zTC4hLqtMgjie1T/D
         h9mGHs5SuN+TdQb2N4tQepRDxWE+zIAIdQMqWInQl931RbqW7X6VM/4vK6jg8fq48eo5
         yoQF43cceTFExWfuxqSf+s3exSjdrnvqqQtU/dV5ZEpgdlfcHGBKD4C4UUOSYnEhKvTI
         rCzjsqR3F25NjtsSX1ANmunYVJ3grliHzp2XmCIDR6VwgKlDZJTpub+Q6vQCwZ4GAWGp
         2+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHppsBmV4Smm8QPnsXnU+0/KrGU48io9bF3HNhyP73uoo9YJ8+DBWZni4YTKP8+D3qjYt8tzYSP1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLa7c0UbUp6hePlzmAt1jlGQpEXri+vKSH3zAPyb5pUUy0v76y
	Mk9i0+kQVQU3HREVqgheffWi+MdhMUZkZAoV0wZ/jtjcg9JvFG0TpTDH5fr3zXlFz4o=
X-Gm-Gg: ASbGncuGev+r3ztxXkrjBkG/sJ9j3CpNUa4o8uGJN9V4bZZGza7DnMYaH5R8r7AdYc9
	pG6vuV392JZIzacxNmQDzcNASnwsYK8NI31gujRtP8VsboBgQCDzBSjJ77203L52BNv2y9n+RIo
	JVetNvdbpUs7xgKQ7iB/M2ebe6FY5XiEtQkECcoavcIFdBUa3aTpclCcHuRKR9Fxb9mL6EmlFkk
	0307pKx2HRwd2nn4tFvCiqWDfXz+520rqK0yJiXKUui7jpqWaIxizBiua1kaPot1im3Kq7Xnv8+
	sa4sKVJIvzsPgtMwlbVLv8q/MeupjjZR9jsGaS8VDGpo3rn6VtQW7agi986LFA/pIYvkJFEatzt
	NEFow4/8vWN2QmvM00DL/qxpcMc9F4jHTW8xzMn3wtPJzZX/byCr4jHEcwn1K5fXrCP19C9lQ
X-Google-Smtp-Source: AGHT+IHyHy7GapLEq74VfzWCjhi43qnvQ0e9vbEsRdz+rw2buMQvVQfT6+EDh1DMqSayb4erGZDneQ==
X-Received: by 2002:a17:907:e98b:b0:ae9:c86f:c778 with SMTP id a640c23a62f3a-af8fd96e1c9mr429180766b.30.1753882067956;
        Wed, 30 Jul 2025 06:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:6400:11a:26:d163:a794:aa16:5e2d? ([2a01:6400:11a:26:d163:a794:aa16:5e2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a2743sm752906766b.48.2025.07.30.06.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:27:47 -0700 (PDT)
Message-ID: <20cc8581-0af2-47b3-9fdd-584ff0ef36ab@sedlak.dev>
Date: Wed, 30 Jul 2025 15:27:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: clk: use the type-state pattern
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Benno Lossin <lossin@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
 <fc26c393-5c4b-48a8-a7ac-12558f79b140@sedlak.dev>
 <DBP8RFDV59PF.1OV46P0UYKOGM@kernel.org>
 <07575756-58EA-4245-B837-AEC4DDCD0DB5@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <07575756-58EA-4245-B837-AEC4DDCD0DB5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/30/25 2:59 PM, Daniel Almeida wrote:
> […]
> 
>> We essentially would like to have a `#[sealed]` attribute that we can
>> put on a trait to avoid the `mod private { pub trait Sealed }` dance.
>> (so a trait that cannot be implemented outside of the module declaring
>> it)
>>
>> ---
>> Cheers,
>> Benno
> 
> This is not exactly what you said, but how about a declarative macro? e.g.:
> 
> macro_rules! sealed {
>      ($($ty:ident),* $(,)?) => {
>          mod private {
>              pub trait Sealed {}
>              $(impl Sealed for super::$ty {})*
>          }
>          use private::Sealed;
>      };
> }
> 
> sealed!(Unprepared, Prepared, Enabled)
> 
> Note that I am just brainstorming the general idea here, I did not test it yet.

I think that API-wise it would be better to have a proc-macro #[sealed], 
something similar to [1], as it may provide better error messages, when 
used incorrectly. So the outcome could look like.

	#[sealed]
	pub trait ClkState {
	…
	}

And then

	#[sealed]
	impl ClkState for XXX {
	…
	}

If you are interested, I can try to look into that.

Link: https://crates.io/crates/sealed [1]

Thanks!
Daniel

