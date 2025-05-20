Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27D256C60
	for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 04:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747715640; cv=none; b=iLHvKQwLZL2gUUFqMRUVAfTywRtlNRQsSB4KEOBKliN8T56J8iZvLL4b0viY2i3qfUUzHwyqihLYtX17nOeP/5THyGJNAEiBg3g7Pr+Jk0guiecpra8aS+M/1+hK1LBJsfMOUBR+yz5adPRW262t2eU3pebpnjRzZwXc48a5JhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747715640; c=relaxed/simple;
	bh=TM7YWc2HanxUC5uSa/mx8mHwCfO/Qpz2hocXunXzOnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AceYfpA3k1GG7pnAL7DoAxmLV3Ty3u8tupdpFIs48PuCc9+qSPlPIjgIDCqLmnRCsbtu6zGPpiVLzLu5d0dzjZQhlZiAwU+1h64O3GsEV4zeLBqtauN/SYuP0mnzznn4YHsje1s27SHbQPfTpsHEw6l0fc4uuUSQ2h1YQW+QWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTEtPKVx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTEtPKVx"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e8a968b15so3153619a91.3
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747715638; x=1748320438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmXtbFG7YZNNbJEDh1fYDcGa0WLHVZ/52LrX9t09NXg=;
        b=DTEtPKVxPh29thGGyvRwymyu6QWa5HrLLK1TOwWteGJkisDMVF5VfmI9KQDARigvz6
         9eeSDnSsK6REQDVEmaeBX/v2tqPUAKIrEwogrzS4cLIF1kfJaRSyZWRy4GCQbT1uMLIy
         /DzvcOhOzF9KeGmt8fPXmATyQUT5D8htprY8ePsYCksh7rsWjvzaSV/5tzPRL+f8PUki
         NxPoDEPc1rhdESWvJDeFvd/tQZ5vnqhrgR3D01vuP2nkzW9lX3KCqyosAWy//aCqtaIv
         Z2mHGXpbzi8NFMHDX4F+583rdVhQ7C2RjRG3BsOEAVw4CtNTPo/D/+Kqt1zGRsFLZQoB
         bLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747715638; x=1748320438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmXtbFG7YZNNbJEDh1fYDcGa0WLHVZ/52LrX9t09NXg=;
        b=vOKVRBweu3o7NWYKhkHUz8T4Zttv/NtgfFCUFQaYAr9X/YM/K8Ur4EfJ5AyDJEz3G3
         k9DMwB7mN1RgMsttFdSbJAw5WczuUCixwQT3tutkTD6h2a0MqE6Cd5DHFdvvCKczDhFh
         xGQwKvE3FjP/zabkIi/Bys6ruPvJOcNmocWN88f10OS2EQYbSaOc0Myxt+h7rauSVnK+
         hbDJKWkg1KdMccke/10bk0pA56k1kn75EbeWD/njz35Tiw6v4MsMnJQzGLCNJMtVkBje
         XcOCCI3486xuB4sY5xF2levi+oiEjgofWGU3wefunJHCUw5id6aHoaSeUNUsU5BpJGK/
         1Jow==
X-Forwarded-Encrypted: i=1; AJvYcCXLHtjdiEK4ELTgwmaAOSi1PV9j7bMagYB/XHTjjwSSPQ+f2mE01cKmQfhT4FhotE3biSkfThQp25U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsmVFdQNTCgqpaS3Qzfzc3mRx1O9x6XqOpsvMbbcPt1AjYS9Bs
	c4sHzdwd53qxLFkLe7h3Mw2gaxNxylIRthm9ssPGkQKg/oWwGywn8Tx+P4ovA0e4fEo=
X-Gm-Gg: ASbGncswoILpTZUHMziqKZCgrtVunP6IaaqsioS6xioAxjdFrsiq6l2CNmkJIs/n0lT
	BpQud7aTdT1TjA+9veYPRb6f0cTEpWWBTBk0OFu9+WhywWTKd9PrhTLMDuHVjwiAguzJHizGKF+
	joz6R7N6sBBQDFPU28sC2iB82TQTjhix/EeUyQOe/xGcL6DFwYLXWEbvdCxqwxhhQQxKxq22Lvz
	xRuWknlmc9H9L/+cpdsrpI75UeLT9lqQNtH7bDH4SCxv1BKTrHnzQv2PwRnsOhSpB9+VNhs+YxH
	VMsL7qibmKpZOBGv7/U9Wx2NNIPWbmvsovtSM7cOQ2tPbrt50f14
X-Google-Smtp-Source: AGHT+IEv6gz69p3L0tnkjs4WbboIMeCV0Y6PseXGe/lkFOQuL+7jOhnn31ID8Drzpd2DcrW3kToDNw==
X-Received: by 2002:a17:90b:1a91:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-30e830ebc99mr22665162a91.8.1747715638413;
        Mon, 19 May 2025 21:33:58 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36491611sm643232a91.26.2025.05.19.21.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 21:33:57 -0700 (PDT)
Date: Tue, 20 May 2025 10:03:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 06/15] rust: macros: enable use of hyphens in module
 names
Message-ID: <20250520043355.wjkrslnripaqj6mm@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
 <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
 <CANiq72mNHYKXcDm6DiB=69W0w8pZ1KhqeARqqKBK_s01PPRsmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mNHYKXcDm6DiB=69W0w8pZ1KhqeARqqKBK_s01PPRsmQ@mail.gmail.com>

On 19-05-25, 16:15, Miguel Ojeda wrote:
> On Mon, May 19, 2025 at 9:08 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +    /* Rust does not allow hyphens in identifiers, use underscore instead */
> 
> (In case you see this before you apply)
> 
> Nit: `//` for comments, also please end with a period.

Done.

-- 
viresh
