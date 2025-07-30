Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3200B1E571B
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856641; cv=none; b=u5VW0MpKxAQz06z2qerAC1eq2lxL2fk4W3MigXRwy6Kim0Hz+GGv2rm6jEA3MQU94xGbYY13TAhwmGiE6IgwWZjr1fMzTPJ9olioLke8st6/ykcaNV4Rzvr8+4yXnu0LriRdsRNSxqIIg0zDv1MkSd6rbTivazrcGKXMAcsE5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856641; c=relaxed/simple;
	bh=dGxjiNGntEIpDeEM5UuFmfE0zBkCHQ41vYKGFK5F1UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUxe0wlwVFPv07crJPPXeFkbyl+Fx5mRt1l4mbgZKD6AwUOzGfzDBbDSwY/4rvMJnznT3kAKbdfcps2CsIMz5no+Y7gL8luLTiipq8lCo37BPlXUVfbFgQnRJhzMhc3y25cFGfYffwgxKVzEDeaSou4K3YxuZBxDFYP9aFyVD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glC7O/9/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glC7O/9/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7698e914cd2so2129537b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 23:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753856639; x=1754461439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CidS/GccUuP6Xpj1XQrTjZ3SEq5HS8jiXMJq8sMBjg=;
        b=glC7O/9/yWsxnYal0JEbxhj9n1fopOLNO+udRVRQ1C6QtBWifvxAUS2j+EtDpSElG6
         Mz31rEo1/8Qon7KT4m3PvzRPrOywX5YXSa+RuA7tfv9m502YSWZ0FXiZWlT7/dKOp2gQ
         /aFabtAw47jpaZdGgILKxrz1TrLE03R7pSAH2JZh7XlcZn6d2SNgalMQFXi0TT9wb6oD
         Ea0zxP0PO7VzdD04kE+N7Rvidk60MdgiBZBIv+gZPbt15qdgvH8bUtVR6bH8LTPY72Ge
         2YMrCKtgQzL3ORXxJNaLOMSZdjVMOPkvbfi4e8qnPr7OOK4JMFoDe3V/2Bx61ZvIvkIo
         tf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856639; x=1754461439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CidS/GccUuP6Xpj1XQrTjZ3SEq5HS8jiXMJq8sMBjg=;
        b=HNooGxD++dPbRFvWlYaFIIdGbJ+/FNLcFn+VoxQRExzX//kauCP3PR0LwzksIpCtx5
         hv3gmBFsSw+QIEGSjy3+1CdknPnfgjGDtKTy3M0FfpRdgQArbhx8abXIk2yElGc1VTJg
         EtaLBlNpiq+rqvQXnzIFqgtKAeSt69NrOG41FvFtykiLO8EvuAtZrHQ730L3DFzEGq2/
         xcRi+gFuvIOnoljg+1IQhJRy2uTyFGqAzB/6mX/VqlNU+ECzE/yR1xFbiuO9HGZ/wpsK
         tjX7rg7grudgyMMrNG16nWzctUP1uwwbgVcO4Wx5ep0NIQtNApa6Eh08FJwVqcG08BZ5
         CC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQmGcJLkO9m+SeqCuTOHDPpE7JhpQshV/DOZMAQBI3BmF6T8oIkcK8cMyFX9PFio6rxtn3pPgBy3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4coGsnGP9lM7r+P5f++3Vy8N3TnWnsMqnA3AAq9xn6PxA207
	7itbK89UY9FKXS1v+oZY0Cudpjxj7K9MRAKRg5IuG1HgFJLkF2FUXcQxNpTzbOeRvMg=
X-Gm-Gg: ASbGncvED4PCNi7k52q2G5c8eTHPczhlLIqzpXbUpnjeRRKB4xwZzgNRnKWgMPsSK0n
	LD4C8jIWhm9Fn5PSfSndThdkUau1vA6zHytYPCvTS3cOUErqUrSmkMPjnTbORp3bRmBf8N00HO8
	jhCV48fJxn5Ae5XZgZoeoyk1HTWw6ZIo8YVc7x0ZLOeM5uTpbYvY6QLqISxfPbtIvk0s1ikNgu5
	+LQDEqKZPjkflf+xEq74bn7l+7ts5LLzgqjRvJotSV1a0TnvCRBSl9+kJGJq6XeJFYQIqLdJJKv
	t0yeuo+8/BWvtex231OHp70u3AIKEJKMMbKFtw3FY4k842OLOT/uytvAgBTL204xBEVKg/LvnBL
	sonDCntN5EoA6SeuaG/ikeeQ=
X-Google-Smtp-Source: AGHT+IFRAuObLQYS4Oy55+Xz2guxb/KTSj4E0KIUP/TcZUmzaODEEpLK7Md4GtPX+Txxpk521QOfKQ==
X-Received: by 2002:a05:6a20:7489:b0:233:bbcf:749e with SMTP id adf61e73a8af0-23dc0d595d3mr3912159637.8.1753856639378;
        Tue, 29 Jul 2025 23:23:59 -0700 (PDT)
Received: from localhost ([122.172.85.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881f595sm9045271b3a.27.2025.07.29.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:23:58 -0700 (PDT)
Date: Wed, 30 Jul 2025 11:53:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] rust: clk: use the type-state pattern
Message-ID: <20250730062355.bqifrzvxfmaaugnk@vireshk-i7>
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>

On 29-07-25, 18:38, Daniel Almeida wrote:
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
>      /// A reference-counted clock.
>      ///
>      /// Rust abstraction for the C [`struct clk`].
>      ///
> +    /// A [`Clk`] instance represents a clock that can be in one of several
> +    /// states: [`Unprepared`], [`Prepared`], or [`Enabled`].
> +    ///
> +    /// No action needs to be taken when a [`Clk`] is dropped. The calls to
> +    /// `clk_unprepare()` and `clk_disable()` will be placed as applicable.
> +    ///
> +    /// An optional [`Clk`] is treated just like a regular [`Clk`], but its
> +    /// inner `struct clk` pointer is `NULL`. This interfaces correctly with the
> +    /// C API and also exposes all the methods of a regular [`Clk`] to users.
> +    ///
>      /// # Invariants
>      ///
>      /// A [`Clk`] instance holds either a pointer to a valid [`struct clk`] created by the C
> @@ -99,20 +160,39 @@ mod common_clk {
>      /// Instances of this type are reference-counted. Calling [`Clk::get`] ensures that the
>      /// allocation remains valid for the lifetime of the [`Clk`].
>      ///
> -    /// ## Examples
> +    /// The [`Prepared`] state is associated with a single count of
> +    /// `clk_prepare()`, and the [`Enabled`] state is associated with a single
> +    /// count of `clk_enable()`, and the [`Enabled`] state is associated with a
> +    /// single count of `clk_prepare` and `clk_enable()`.

You have mentioned the `Enabled` state twice. Also clk_prepare() ?

No objections from my side. Thanks.

-- 
viresh
