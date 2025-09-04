Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3D2DC334
	for <linux-clk@vger.kernel.org>; Thu,  4 Sep 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756976934; cv=none; b=MH1uvJIuzuPrrQB5HCSC3t2kCVcgZKpPS5sVxTAk2Je+dOkA2LjvB2UnOMqM92WcbILM6WlLRWsCBF3p42XWt+wci+xU+UrDd078lL87aHkGhzmHZ9etLFQ2drHRP4ug1AR6U+m/w0Had0i6uNWgXC+QabhhvRd2fsR+Afpep14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756976934; c=relaxed/simple;
	bh=9OuwB/mKcO6haey57JJkqXea6iJb0zgcty8aAKBWe5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGrBvoJWKF8NHU052niFib/6tcClJ92F71+x7Gr7r7ehdq9putjg7AvphHdg2e5RyE/jmU6o9xROm/EnF+Z43LbGuGJukCH/p8ZI0uv5kuODxZLVGx+XQvziUb2N6kR1iZ848ws5oDFS9fRNHuEdqwx8vnpdUfbDk0xijfFjXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ceca3pwi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ceca3pwi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77250e45d36so736267b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Sep 2025 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756976932; x=1757581732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBbjONRTs6bzm6TRjxemHxdhBeOSzGNBuBX1gDxW0c=;
        b=Ceca3pwiSSggVuowWec1JaLEyCaRIHEEeuEXh/Pg2vqE4eeee5PYsZ+7FpTWtLbdhj
         b4fSSdlxnHgsOgH0tE4QoRCkkGqnV8SE5M0FsiiPVT59UJZ1++fNuZk20zJPCpBdGnsR
         bpoIUhJsiAOj7N0+5yRiIsQOKPKmMd/wVrADJu5SOAWagOrdk6vbjacvbxuc3sXT4oVw
         zFBGDbt0SKUAyXznewucg5kpr1wGY5ascZUvXoNkaSBuaeaPLSDfGckGKi+g9W59H+W2
         Xcn+nidUd00WcL37TCqzcWFEEUFK96Pv2bIHPNTXA0qI0c0dkaHNtr8W9gP24zxFye5r
         2veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976932; x=1757581732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBbjONRTs6bzm6TRjxemHxdhBeOSzGNBuBX1gDxW0c=;
        b=SPpRcjDZW9TenDUqI2fyrVMF6z/y4qa3ErLKo6ZwDwas5r4R9C12+1IxxdFOt+NHJo
         g7wSJ3mCtCVc45GO67nkqzb2XHtpFA5Kx7HdIryKP3Vspe7CD76lVGmNDR7nDfMFwtS4
         aN0TOwuY07DCB06OOR125UwGOOGpJAja/4Xj1sIiDWmzLRJTB9J7eu3dGSe1zWEAoRTg
         LUY1w+HJM0M/kd7qW9FCp4vTkleEIqLtuqbrH9GWjGzhcWW4HjotlO7Taoj5EtpNCVHb
         jrKG/IsPNUcNeF99X0DXadWuNhDlMK2cVBM4sGMv/gCLj39WogOohSGYoamTGM7CBLvs
         qpbg==
X-Forwarded-Encrypted: i=1; AJvYcCUKuThHDmICMpZGil6IB1iF0RkQEwfsYfYDtEyhLDds8g2rG4xBjKtCrXU0mU8Jwy6bbfOSr3wHPuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUCvZQ9rGkUWamYzU4r5tKL1QaYe2rZmom9cwL6pI15cwE5zJ
	KxKIm34LesDbxzJ7zxpvJql4EhH3iwyMWTJj7+vuJc0lidDleLjRfYsy5LzemG3KT2M=
X-Gm-Gg: ASbGncvEQ8HixBYYFWDp9un2EkGugfthkFs5beHXL2K+BcERFQxIVGs1h430JPxpAlU
	h7xoztGbOEOouaPmBXlCA0U77jTzynAhS3w04+o3+a/Pp072DLNiJkwcXZKq9FbX0ifviBzGQlm
	VC6pXrQ1Dc8iEVJW3TEw66S0NjEGr/xUnGJ79SvESxyBRPIY8TBn1V3wzK/fgocoKvPLn/rA4JH
	vDLMg0Lja3K9w8zyWPEx4zSTSRv2zTBdXkVTBMaNGydk6oxfWKU1MdTA1jUU/oC9IiCXdXip58M
	wSahwTpksKReejFMXiOvtZtxbfW6pmgHe/6lJBaxRRvuiBPhYJsF72er40jT7QHT5YN5ahomOju
	9dZppqOxm7cyUNnUy0y8cK58FubzS8jyjw/Q=
X-Google-Smtp-Source: AGHT+IHI7lc2wZNpnK6c7bml3S96KONYzvjvTqV1qrfL3bzvd/FiM6GZPsewH6KTBQYgX9g7o654HA==
X-Received: by 2002:a05:6a20:3d86:b0:243:a189:f1f8 with SMTP id adf61e73a8af0-243d6ddb3bdmr27908154637.8.1756976931899;
        Thu, 04 Sep 2025 02:08:51 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0736ba7sm16257509a12.12.2025.09.04.02.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:08:51 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:38:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: clk: implement Send and Sync
Message-ID: <20250904090849.7uiroafxk5juml6b@vireshk-i7>
References: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-clk-send-sync-v1-1-48d023320eb8@google.com>

On 04-09-25, 09:03, Alice Ryhl wrote:
> These traits are required for drivers to embed the Clk type in their own
> data structures because driver data structures are usually required to
> be Send. See e.g. [1] for the kind of workaround that drivers currently
> need due to lacking this annotation.
> 
> Link: https://lore.kernel.org/rust-for-linux/20250812-tyr-v2-1-9e0f3dc9da95@collabora.com/ [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> I'm not sure if there was already sent a patch for this. I recall
> being told that one had been sent, but I could not find it. Maybe I
> mixed it up with the regulator change, so now I'm sending a change for
> clk.
> ---
>  rust/kernel/clk.rs | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
