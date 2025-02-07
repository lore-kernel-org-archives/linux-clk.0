Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C616C684
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738912543; cv=none; b=VMD6f0YgmveywvfQ040d9Oujv9tFwRnRVAps/PdOmok03K+33DZzpBvvTzKLPNwtWkSPB86bU1zH9PC6tY7Q915sgTwnaF/NnfJxDbye1J/rjxB4LM/+COJ07B4luqws+EoztElWNXPbeoH7hV75kyRo0YKrFxPm7NcoKslU3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738912543; c=relaxed/simple;
	bh=dUnNqw1brKPXE6dDQeYeK/FFGBNMkG1EB3CHxG+wkJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsWzOhAh9jL0GDTCbMfi1+sm0BevXaP+Qu6WxYzAONRqCf3eF+9jFreZUKhWDY1TKY07vXO034gNMka5sFNokTbeBO1dqAPbD9azBN7qJI1DxJC+0XW/Cf3161c2q9A/9i/ZeDzZc7PKLAWSioa4XLCrnvP0ClxUy3WvpYZw7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DL+i4tep; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DL+i4tep"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166f1e589cso44572785ad.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Feb 2025 23:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738912541; x=1739517341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE4R1S1j/M6pE22+nPWcID1WidunmigR9GW3OBmBoT4=;
        b=DL+i4tep+7bgTVKJpktqcmJkyOAk52S1Y4nXzYtMukimi8FFddEiltDD4TC1lzTWEo
         puWLcXl0gmYRYX6biIwq7H11D7cfp/PSUqA+nXVEAqWbojaEuucTTBjPwSKvMuNr2/HE
         lUQGOBHV8WtE2D+29tK+8gmuBAgJOCK+V0S6hPZ0k6NFOTssbVOeokHql47UbDp4SrhD
         fbTfBjfdZWMQaYZNCWKRVAm7rb1/YMv0koObwimFz816Hj8zG4vpE4sEBBn9PAHnlLth
         LrQ+JfBZUxxAQxZvkUyyHoB+a9KyyqgvaYbnfMUVhpyvD0VsEw/hCpP1P2qWWlla+juf
         kVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738912541; x=1739517341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE4R1S1j/M6pE22+nPWcID1WidunmigR9GW3OBmBoT4=;
        b=iHPgaizzL2LH4wqzLW213JFHfh/lWSrL0QBCpD6QkbUFNrw5ALse9+OAPW+kdjRnR6
         3xkNIfWIaWYT/HvSX2bHu5qwewD3lUYQiRk6noCrCaIiUYKccRwk6BMXsEL91kvLrZvG
         VCH+G+YWbhFYyqcJNHcqkj7WLVhG/fleXmSfS4vRgASZOIEjcnQk5Gf4sqFLRj3z2Qtj
         hHPMoTiDMR0p2hL6IG+llPyrpJOn2gH+RLNZ0G2cj8qCPQIq2DfBTy3Q8zqRCVTl9zNx
         KEJeOUosd/YVBPoKqb91RDx0uwpV+bG+iyXvPA8hCkwJozVzMizrNfrtjbCWiAMBluP3
         npxA==
X-Forwarded-Encrypted: i=1; AJvYcCVJH5QZetICViebK9he/1rSaCBegWDXrgvJruSKzdGSSg3qiesnKCMqtD8IlCBjkCoi8DC/gwAPA3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZxpeXTN4DOts8etk4RkbULFkcwnnNl7/EXdrlLlDs7oKEFEW
	lTNmKHH8qHYo+0fVNG9TIZHQj6Vo0R77RvCFUCd/78Fx6Op0xHZ2qBNBvlPg/iI=
X-Gm-Gg: ASbGncvaGRFzIpuGMP6x6YeQ7P84qHt8/SBQsqHqdh8AVMP74INuIGmhLyo1HcBPm7e
	UkrWBH/bWlbDQmkKHG2Ftfso5j+EWtEiybCaQZtquymTBFAiBDc7OXIX8n33r4o/Z1PkIH7/oQI
	hirFVX/8xAu4+lLY0feKbB4tRKArRqeqUWv7k6TUjYjDDk1LCaV9kyVAf/r2U+edM1mrKJ/TNuo
	JjCLzUvzMNiZTQmrs4DIibpjpj8/StbxZDOgROn3iAVQ0E6tPXXuuqQlaxqkqhrjB9qP5iPYvRY
	rDmK8WG1e2PFGjtufA==
X-Google-Smtp-Source: AGHT+IG0HmX1b0ZP7iCDqtRYBLY1OA2uSMSxmzc5p4sdX0Udih5vnsk0XFTryW6rzf65b5fUm+ItCQ==
X-Received: by 2002:a05:6a00:4fc7:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-7305d44a475mr3508897b3a.6.1738912541001;
        Thu, 06 Feb 2025 23:15:41 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf135dsm2358026b3a.113.2025.02.06.23.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:15:40 -0800 (PST)
Date: Fri, 7 Feb 2025 12:45:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Anisse Astier <anisse@astier.eu>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 00/14] Rust bindings for cpufreq and OPP core + sample
 driver
Message-ID: <20250207071538.xjxauatta2jsedz4@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <Z6Sgwbgfp-9SCr8Y@pollux>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Sgwbgfp-9SCr8Y@pollux>

Hi Danilo,

On 06-02-25, 12:45, Danilo Krummrich wrote:
> I gave it a quick shot and it seems there are a few Clippy warnings,

I could find only one (related to core::format_args), are there more ?

(Earlier I had a debug commit on top of the series in my branch and
Clippy didn't give any warnings as format_flags was getting used from
there.)

> plus rustfmtcheck complains.

I am not sure how to solve them.

Diff in rust/kernel/cpufreq.rs at line 628:

         // SAFETY: The C code returns a valid pointer here, which is again passed to the C code in
         // an array.
-        attr[next] = unsafe {
-            addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _
-        };
+        attr[next] =
+            unsafe { addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _ };
         next += 1;

         if boost {

If I move the code as suggested here, then I get warning about not
adding a SAFETY comment for unsafe code (which looks to be a tool
specific bug).

I can move the entire thing into the unsafe block, but the assignment
to attr[next] isn't unsafe.

What do yo suggest here ?

> There are also two minor checkpatch complaints about line length.

Yeah, they came from the first commit (which wasn't written by me and
so I avoided touching it), fixed now.

-- 
viresh
