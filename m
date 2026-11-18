Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009671;
	b=H7JVtC0FT5wpT3rKtzl5xcJLUBrcpHElM7Me7FKK9M0Std504l51e+gRVvMnK6P+TqKV
	 /8NqoC1VcGWatwILotNr7fKt9wOBOpoDC0HaZaf12U6hfoyiOuJSuQg3mMKYV+stzR4x7
	 qz1LQ/Ys+FSA952eJdfQg59fktGM4LHeKlj34Q6dWURi8/gm7rmdSDyUa2ynJUyZxXHwV
	 LmSHH99SwfONVRJEO6Jka/RhlmJQc2Wspr3s57Us85m5SuxYI+HYlFEXciaMM8yBFKqox
	 RMvHzZ1clGDSP5bwe6bD2sQprmTzSEJDKWSKD2xx9iZKRCBKnqs7QOVRsXMmjiRZViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tbHSrCrWbtManjiZm8yvLdlzikeM8PecjfjtsmyrzGk=;
	b=ddHHeXnDbM6M0BVNVJ7CdAkl5QI2WLHzrAc5mfi6jwSrKl7pNxh6z58fTEYqRyiT59Le
	 LtL2PrrBJcXtqiIZo7Ytc7CUFlrry7A8TSibHJkBoMzYN/rd79Gb12xBOtLI3QND18ye8
	 TcLOGqEGw8TWE1pWZtulWSXmOLaEey6MCODDAg2Pqjg0zftR74iCfMbCU+OnA4x7i9bfu
	 aihQAkVKYPLSJ+Nob4o3qzH0RriHCbZCB6XLIRd+Dsio5otadxAiqkxTlFbvoO9Hhdktx
	 X6mmvLJj057Rz2AANvDPQs3UyWKcMwHgRvd85UlIu8Bps2+/U4DeqvvZF3zsKYY9drg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JbPHYrLm;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC88606A32A
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 13:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC88606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JbPHYrLm
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso180251f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 05:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009669; x=1795614469; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbHSrCrWbtManjiZm8yvLdlzikeM8PecjfjtsmyrzGk=;
        b=JbPHYrLmilie8tim6UMjJw3y4D2agEMcgJhzkH6d6H1xauaURr5MM7N+XZPWoQN1V9
         JOVnnVBHfON5uLr4iZ9N29pvVyHIP3Zp2uTXc8nIU26s4mf3KUa3WUwkP2/r7ww570sn
         6eY4B7G0Ar8vsyDOhjyN/mj7Od4s+NY0Z87HQVmNXVvlITGAOSIGyasPji3a5NDM11rc
         S1HC55SFRG1U3OddKseqb2KQCT4uIdFOWnfZFC/dC9kyymV5AZsvwe6mFs8p4YRDGlPs
         7wHZSTU/8Vym+5q/IqfvTVUgOux1W3DtW7lkAeOl9hLxiGo7NaT2G1q78jA4gGWQxwqK
         78nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009669; x=1795614469;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbHSrCrWbtManjiZm8yvLdlzikeM8PecjfjtsmyrzGk=;
        b=bcH5XhKc6jvtN9dsNxZ9oIfnS+K0sQfA466jHXB/pV2QbEvEx7hjqiQXTKX/+qYB1W
         wPoblNIwRAr8LWN26A9fCqfL3yY9XWrIoKvU/FOKAsmf2b06xUtByObPgCrnCDHjENEN
         7+oei3141ql+Z0TOQzzFHia9o5YSF1uEQI0HR7kmgchEZCfj7W9NtIZ8WC8hothibaMX
         XsSkAiQ53wrgMPAjtygXmTSPQugGKEFjW5Cl7udTpAnIbRGqEtdnYBrjwvjsAyGdQk3r
         QmgwapC+80EuamQdD225HRCW0E+bEjoQWw3RzN3PDrztMiiSVcmPNrDSqyiaMT6vFyfw
         sFYQ==
X-Forwarded-Encrypted: i=1; AL+hErGNBcn8sRGKPJTY8OtI8dSm9qiHkRKNB5uaHwDVznjSF2HApnrjszQiMd2CyFHT13uv5v1kb3/hwok=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uecyOtrSfRhqkl/4dhxLVPuJdfPVdodHPo5lhJU2O2RJhdUDq
	AdiimpCogx+VmWw3+7CFeEtka6vQUqpeKMABwyX+6CjZXi8Hs9UiPSIqCSk7fEaOnRSVyY37jTz
	0el7B/iXXOOhJvvgJRQ==
X-Received: from wrop10.prod.google.com ([2002:adf:f20a:0:b0:4a7:5aab:c222])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c9:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-4a63bbc379bmr5187806f8f.26.1795009668616;
 Wed, 18 Nov 2026 05:47:48 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:47 +0000
In-Reply-To: <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-2-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134747.658063-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 2/7] rust: clk: replace `OptionalClk` with `Clk::get_optional()`
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 02:07:41PM -0300, Daniel Almeida wrote:
> +        /// Behaves the same as [`Self::get`], except when there is no clock
> +        /// producer. In this case, instead of returning [`ENOENT`], it returns
> +        /// a dummy [`Clk`].
> +        ///
> +        /// Equivalent to the kernel's [`clk_get_optional`] API.
> +        ///
> +        /// [`clk_get_optional`]:
> +        /// https://docs.kernel.org/core-api/kernel-api.html#c.clk_get_optional
> +        pub fn get_optional(dev: &Device, name: Option<&CStr>) -> Result<Self> {

rustdoc appears broken here (putting the URL on the same line as
`[`clk_get_optional`]:` avoids splitting the link definition).

Otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
