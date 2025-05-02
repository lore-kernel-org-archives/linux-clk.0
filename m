Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183019E966
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169274; cv=none; b=OuuWmoZ7aTpfsFcBae8tBwiZ9TJ9tkCXYm0LBU0IQft7AoFcqgQvU8TVbFtN/pSR30WBPqIy1/dFaINgE0raVN/JfT2hXjUPehC0IsG8dW7Xc6z4KZHdAHbbWGUHhKROIkEa1ZUhB4xhoW9dIEEYzvoNl0sV0aLInej12zB00bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169274; c=relaxed/simple;
	bh=PNbWGAMKm9s3NrC346LUCC25A0/fVZrSTFIV1+54+pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0+jC+ywgy4mVTYW0vBxSgLmdfG3mGw6eR8UplEYHRPrWQPf+eahgYidj14ZktnHPWujCHYW2ZnFFADE2phNltBDH5HgIWsWPWkHMhpUMQTkBSjNp5C6LlBzioEqBkbyL6auLvMLtwLoSq0Nu5hbgP52Fv/509ATqMXfn46iIzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtc55u2V; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtc55u2V"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1609167b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169272; x=1746774072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=mtc55u2VznFCXMNRTV4Zu01W8hFrh2CE2zmsfKK2qj5WoZbR7GchyDKsEeodQCMyXb
         hkU9f591btkRXO0oooukUntSuaxpPXFngZ5iu4KgD7247e0v8JRymyEfn6gMio7FqDL+
         S9ose1UQNILS2DRqQkhoOD0cHOF+pIkQ6n6TOnGd0FGIAh9A/IpFPI1goYs6JW+S5sGJ
         mbYzO4mmFMcD3kQCf7oTnZKfxu5s1wtUC7xZbxxEswRqI9i2mn+ayFGmXvDRSnQqt0BJ
         l9C0XdatadJKLOkrG077ueXz27Cduq0PpEBCYv2Llw/jM/HqK6FeIHhal9BbXx2SLD+3
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169272; x=1746774072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=cVWb4DBcDOzsQvnZzp1WNnM0mlm7VefGT3OSLMohU8bWAgrn1y7H7inyqxZ2FJPEms
         UJkVcTgOQ6aWdhZxuo34waCNHpU1U0qHPdfP295e1+TdJD8ZuZ2JGEJ+nprhINynZowl
         HdNmMSxDZGhTcsIqIqq3z9Eg6Flnj7fTKuencuOQUnqfdn+sAtv8DFRZcy3clUwrj7vU
         ADXXXpdbyqsYC0BrQgqg8fCC1Xu3daCN1MpZ5kGy7yZ96AHF9rz8qRW0ynbEITReYa4J
         BUNYDfFktFw9I67YV54oIX+BLk8cMDirnQweNy+bBaaO8TWk3Hmtkb16V6JE7GWBgrOf
         2XHw==
X-Forwarded-Encrypted: i=1; AJvYcCUiXpXA1GeBa/9FfZezgyXKODrL5q1nLbPkTh0p6DcFZ78k9CHDYuvhYoLAoJErobOsLhSZIuPsTY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO0mLhIWrU7FYleqh1EKWymfkiQC9pbQX/5T4xNxIEKa/mqEiU
	GnE+UXfPjTpGoDVn6K6Qr1cA2l/x17cWHmJM/FZeLw/56v3UPp/qvUZ8EFGdRU4=
X-Gm-Gg: ASbGncsJCutLK3uaWVD1lKnybl5HXVCdjCiNulmXy7i8UNNcexeZJVw8omC4C4T+c2M
	OtRl3ZFnjTFwdYQ3nFW3vUPTPqt/6hOHmYsMppvHUvMzfvw/ttFI0pDl3ln1NjOH4CR/hGH67WL
	mEkmcjeGUEEKrrBXXQEZlHzty/S4dO2MU+SIfRk6dFExL9H/KTNzE58TLeP2MYPsEfsASwf6exx
	F9lP4XYxXzFOA/YW15K1O3ifhpU7ahFaT7eb6ByfbJLyKeJ0iWZDTYuI/ny0UFmWCdsSPhnDYhK
	AsICpV6DaOMMNWbu1LCS7idbczKW2uZSRn6feyI21A==
X-Google-Smtp-Source: AGHT+IFSx+VRtOySROI7ANgNGVBaqHJbD9bAJPiju2pU+HGgAlpdoEmLB1WKijWr1JimZfsA5Unkjw==
X-Received: by 2002:a05:6a20:3d90:b0:20a:53e7:4a44 with SMTP id adf61e73a8af0-20cdec4b676mr2533309637.19.1746169271726;
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6a59bsm49529a12.67.2025.05.02.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Date: Fri, 2 May 2025 12:31:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>

On 21-04-25, 12:52, Viresh Kumar wrote:
> This series introduces initial Rust abstractions for a few subsystems: clk,
> cpumask, cpufreq and Operating Performance Points (OPP).
> 
> The abstractions cover most of the interfaces exposed by cpufreq and OPP
> subsystems. It also includes minimal abstractions for the clk and cpumask
> frameworks, which are required by the cpufreq / OPP abstractions.
> 
> Additionally, a sample `rcpufreq-dt` driver is included. This is a
> duplicate of the existing `cpufreq-dt` driver, which is a
> platform-agnostic, device-tree based cpufreq driver commonly used on ARM
> platforms.

Applied to the cpufreq tree few days back and is now included in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq/arm/linux-next

Will send it for v6.16-rc1 (unless there are any objections).

-- 
viresh
