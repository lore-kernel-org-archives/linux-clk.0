Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306232FA18
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633103; cv=pass; b=M8J69kWBkyOST2mP7wegpPvbmoR804F14Fr4lzHKdruz8sKt7VKzcWXmTnt3AogaPo72wKsaj5UHAFgriBCy/v2SdfkZOXAOy3Hw86ykQrEbQrSNFfWP9hRxlZ0hH+E67I3o7dauiJbsIRc3g2h5rlMwfXnNH5aVNVkRAKr1FHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633103; c=relaxed/simple;
	bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF+jaLrQj7tGJtdDBDDVfWXp3UZDn/c6yb4eQrMXVEvbmWNR6EHzq0fv4E8deu1uGXhc0v9OFoLz5lKbNZrAQTWvzu40+BOYUQyBU7MH/0fL8cvSeEqczJm108AwZzbyYiV/toKcJSD6nvarki9U3QP00K4ALDirA5PjKmWKiPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alhZHxPV; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alhZHxPV"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-124a7216c9cso168433c88.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 10:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633101; cv=none;
        d=google.com; s=arc-20240605;
        b=B99JCcvvPxpdCSyjUpO2K3jZNh87AJC8X+hEz0mVwKe60e30AE6CgxN5PUXmVEpCC2
         aD9tGk9sdFS7K9m2aP1RTSfqpg6f75j8nLoByQ6W7d3a+eAMBQVIEQY8GtoM/vMPrtUg
         XC8WBJ9g/xpv92Rte1VFTE76k8swdBOqDGtCl5fhJ9iDsfy9AnrygioIP8LaD18oY+02
         QTxjs5d3A6EyKgM+DjcJsnMM7sK6S2hYMKRWE3DLbz/NK2SNmCJeMfwBLTScInHearg/
         sq+u685gUyZ68RePK7jkrAcSRxnktbX7GFj9pZaPvr6w8HD641iL7mGkOFnoNELzP2PV
         J81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        fh=leY8I+5eJfbBapzkrYBpgLhrF59RhJxVOP1yTTQprs8=;
        b=b2C0UAFDdRRKEnev0UCoow1LsP5l90A1tMak4xlMXwz/kB7QM6k+cEyhD5hUf0hSwR
         seEtJSdOQLBX4YYE9VQsTklTJspmj1fizfNXnF+YLmVfsV/l4GjQf/ICAyAmcSyakPyf
         /CybW9vui0hbBjpm95ZoQbFm4SvjaJxFlXQL46ONkY2EXb8xrx0+gu2XdWoaMRe81p83
         fNzLuYLDWJifI7Y2gkzq2T07JiBl7cTOpAFQGxHLarN1z51rmjUVh2grxwpJQ6F9WNsa
         aerRWivTf59jdq1vRleUqgDGKtJeocKC4S2i/Cvl8hAH7L56JOA8sCTyK7eqsy1z/d3b
         C/jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633101; x=1775237901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        b=alhZHxPV5T2fdatBwpj2qJAAxeRtPXJ0uDb7XsmPQMzRbOzf+FNggxXK/9ERofYKaK
         68wzUJeKMl2RQ3BFEWKdUeH5Wzxgn/AMCrYJxQ3WewbtyGNUN6dTgeyBHJz82XDf88xo
         tN8KKG+YkbO4pzVfiYFVJun/q5bwLGB4Xuhil81lq6s2QFGIXhlAVlbtRf4Yl2Jjibsa
         wHQKG6rSWGHIa/QrmPtAxDliATjiQ1K2nYH1s8wwMcZpFUFM3pQ1xyd1P3j5WvRikizy
         FOTR1/VE5V/jBwFY2NFUReT80NMyp9z/BNlvmscnh5SG2UmAtukhAaLB2orski9ATdtA
         SfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633101; x=1775237901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        b=MbYnaJlegLfNOzprgOHRcKP5uXcctmn7zV0M7a50Uvl/DFGi5yyD9boAKXp9HqhLiN
         pABGyaETMyVU3MM/b4nVWWmkQCUUhkX8OIYrVihkdwbGrezkB1/LZTaunwq1WmKxwUXw
         Rv01be7fLz7mLQCs60byMkUbjX6cjDKcVpgDHRKwOXNeVIUzy+Fw/Eh586+Qj8O8MgN5
         0fCPRCGtT11r9v3Vtq43uGi0TF8TypdPW+wKobBPTuGHGm9WfGVupOcfCHFEVRptKgaO
         IVGVRi8BweZGU8DnARIj5wtPus2EknNA4AqiEpvu4rN+ybcXqQLI6lkB1PiX9QxUKNwa
         JKTw==
X-Forwarded-Encrypted: i=1; AJvYcCVHuLsscfXCgOSgONSSCt3aCGnVAPOSE3lnv6mpz3+yibOf3VyJBQ/JR8NMOvC/v9RgkAt+qvEI2Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzES4aKh3biF3VtAmOFqZ+MEsNZwO1+wXA8Bo/lGnaPpbEmrfOr
	YCaiYv7nJJ5tssajDKGVKVmvgjHgMbkL5p3QlJDT+6eFGpR9kHQnFc3xdn8D1HdxOx08BLrd0aC
	mdaiIHiUgrfB6wUmGPtaG0qnbLQwPMkU=
X-Gm-Gg: ATEYQzxwdvmlswpsfGjLvb8EJIYfjjCYbVLpKScEyxo30hZZHFQeyVfkCHQqLrXASg9
	BcGxqmyxctWR7KyMgVirhhwB5PC3OM1JAtDyGT3MQ8nKqyK2S4tL7hppeHInDHfWr9M9ShSnvRW
	wtDccHtglx//TPuF/isGMHAazLkWzq8MaEArx9+ctYbwQbJtCffDogBzHhoL4i8zYLxf88owdc4
	dyEe2aRE4XEtZZoW1oYDCqipvoCJ0oKzzmDAQohV0feZ5O1JpewsTVKY05GStXvQM2gxlpJKLnz
	wxNrISiSpluEPU60AKRL9CmuITkVYBlsJs7fPIlReMg6SuiGOCMwqWH/WpBs1kOWuF2OmM4mFaZ
	x/vnsmOOW0AncTnUfUQXA6NA=
X-Received: by 2002:a05:7300:3254:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c185f4195cmr868301eec.5.1774633101017; Fri, 27 Mar 2026
 10:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
 <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org> <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
In-Reply-To: <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:38:07 +0100
X-Gm-Features: AQROBzDgjWTAFVxg45-x5LUiec7rwVNiECYCnGtFbz1GIQ6qZ-C218NzMZcOD9c
Message-ID: <CANiq72=E=fyCjr_5zEoiUoSOYnXTzfFjE8KJRGsDeEQN1cFY=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 5:54=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I mentioned to Stephen at the last LPC in Tokyo that I am interested
> in becoming a clk co-maintainer.

Thanks for the context, that sounds great -- more maintainers and
reviewers are needed in the kernel.

But, of course, it is up to Stephen.

Another possibility Stephen could perhaps like if he doesn't want a
co-maintainer for everything is having a sub-maintainer for the Rust
side, possibly in a sub-entry (e.g. "COMMON CLK FRAMEWORK [RUST]",
i.e. with the usual square brackets we use for that), assuming you are
interested in that.

It is an approach that we have seen works well, because it is usually
a win-win for maintainers that cannot commit time to review new Rust
stuff, i.e. they get more people in their subsystem, they can use the
opportunity to learn Rust (assuming they don't know it yet) and they
can assess how often Rust changes are needed, yet they still control
the changes (e.g. in cases a change on both sides needs to happen at
once).

[ In any case, I don't know the context behind all this -- if I can
help with anything, please let me know. ]

Thanks!

Cheers,
Miguel
