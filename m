Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D2239E88
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 04:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748157; cv=pass; b=L+cV+n4m1W4gpHYJAyv33LyXvmRDWRAtFSSvIKCp+Ap0wKbHAzk1ESUaFT5+vlgjegX5j3/GNXxA6vWm266YCBX1wp1GxgTVfxbl6TNPqROmFLeTWApQEoOzlam4ldqwnzZBG8XzFXL861mEI6TwCVKu0pO6ntONJhpB04YIfEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748157; c=relaxed/simple;
	bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIvwHhMDNFgULY+/HABfJ1ic+tUv4QDkIJ7N9T5WTD4/XyIxSiMsCwtqZtxGqtTEg48+lAgZj1bDvyQ9I5Ne2t/zbVd+r+QY7VgmoJ3kd6Vnibxu/sEAzkj+nditQsCYRY7AdPvRrvspu3IPjGyqyoL++TPAkYPBQbKW3sqv4so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrsn8iVk; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrsn8iVk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b71a4fdb86so130709eec.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 20:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748154; cv=none;
        d=google.com; s=arc-20240605;
        b=AxoqyvvcW9HOBDzQr5QIV49M8Kp8hJn4gF+/n2Ad8JBK7fdaFap4pv0w39uPw806WI
         TV0AnNQfyeFf9Yxl5WolmefksLCTE9K+l5QamqCPjZvtdV8ajKEn7MXtMsfE4TtCLfNi
         aP0/SESc1spTrV/4mlAdfUGKxAxew0/8rNG3Dv4yfkaUUyIUOu5YUwG53RKmW+d5M3Pi
         bIXSDLVpeUhDczVhXaiPuvUCyrjecJnvB8xZjkEOsZDml9zj6fUEWHjzqnrd1vM+rakP
         vwwdJKU7NFU4xdxv4R+VgVvG8PhV/ujq3Jo4JBN9X51P005zH8VY3d0J1CZwnhRJn8O9
         7xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        fh=A8lyheCjFbyThF6VL63kC3gI6+Zhj4nabmmVBCn3mOg=;
        b=W/1dXVhYNaeFiv+hmthsUVXPpwqQKYkFq1TbBZfA0zPe8HC9ZiEiSMVpfk5iyZUzrc
         w1k4rvsjrYNXfIpzUM9uyU8cu48IOmCvecglhjWOHQkc3DwOKWnLJYIlynOAHR56C0O8
         bEw/9SgQnymCo5WfXlyeLZkt4eb+6eK/eRynSwcq/qyJqfpG1zqzdGzXsCvCoP1cUOzo
         xAN2Wi53E6qCEJBUGbHlMnId5AZnb2SEKZVtaD7zjt26oHeDyaCwLgMJIt0I3l7jORdS
         4jIZxiy5+fIY+qsn8SSx63BPCp9YaFth47rAqGYWg+ys/z8j0qEtobK9vymKZygwrPFr
         xnng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748154; x=1770352954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        b=Xrsn8iVkRtvwrH02w0ZTh1CS0fSl9daYTZ4vAmk23V/RpEdxonADxhGxZB12j4wqO6
         XpQyGksIRg3q6D1ad+cTIS6TLqHmgF4dDxTQUiIFXrd6rhCIvcyMT1hBtO/YZdsmtG0u
         6XbiQFv7px6PjuIX0IQtIGSe47GwL6jpMkqzZ9u7hFFCQmU79UqtCA9PBOizzlwfOSM/
         0JOOmre9bGS9iCYpE0WKurlw7jgKpCZCzQ72ejKCFiogWmouO9kPUQJpUgmEzhNuiZ3s
         0aWuXyNs8NpxUaPXoVkI8jHqsDwoKmHa5D4qStvJbTXvmKjvDB85oPW8IN2WPnb0NWfI
         LrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748154; x=1770352954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFRjnkpyqQxEyT+M/FMZi4m7BHy2XO3hgVgXrD8nnEA=;
        b=EVs/OxjHs4jv0/fZFJ1DYYubBOk2uxyuqD4Sz/239k6W7OVd00v50I2MH0fvXZ4IC+
         QXSGqHATn/Ldg/AwibstbqQCOkGwC8nKLMZghTDsfF5AnclRK1KDSjE9Y4anc5NRRioe
         /12Uyb8uzj4YFaHIsdv/Uiy/UIh7zDS9cLqSSatVeHGy3z4pkKpgHThHctCwMwC95OME
         AGwXr3GzpeAYX1SAlbtEJGpB8QDcEKg17PQLoVn14ZQs6WZgSHyRqFPsX5nrbZ+oa1xK
         Sdl+jt9ia89KlDgzK2kwZFZOffnX/KGlxqFNZ/Ppq48cSTVS+Y1EW9xPm/Tu8GoqyYxf
         pYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwmSDzjakdYkBVjH9pYtZE8UJV0dw7sISBNGx2Q3Z85z9iEMdTXGoN/grrknzVHHnaM9VHC1Nd/YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVd8v29HtQ46wOD8KEnuY2T3iNWcBS0vgR7rACNTpBl4ZL9GoV
	Ql+DO6ZWXIsJ7bwUgUKSfdlg1MD5y6fs+GU8OVFACOU16bbO57Nz2oZqPeSH737bMZxpcoNOVLY
	/mD+/itBQ+I4vCknT4sgxSNxut8xq2Bw=
X-Gm-Gg: AZuq6aKvzwHz/fR4AbExKxocTcWosliA8m/hxdH7A5iPg1clVWnUQ/BnmKT4h/NTKX7
	wVDQLjG97iRjbrASx38MlEMCzH1YFvAGm104S+rpowbltc/dlLZfhOZuSw7S6IxW4f81RZrx33t
	FugHd3fm3u2TWgrqEFL06AZzF5/DVVJ0cqkyWX+YSZdcXqmsXu/v1ngzVtMOpiyyFGVfQsVkOcn
	2/t6P25IIYDkpPX7FAAf3HrljTHqDhXGPpCFT+1L/puJf2Ipc1GEuY7RX/MDKZ+qLKtMfvwMw82
	+/MEpWIWCN2x6devdWgKWAigAvrgJpl86wNp5MwT4fEaYJ8Nm3EkaNvT1oyXBPxVjjgVSaQZX+v
	E87sXACuKcAu7
X-Received: by 2002:a05:7300:6d21:b0:2b7:121a:99f with SMTP id
 5a478bee46e88-2b7c8523f57mr419251eec.0.1769748153791; Thu, 29 Jan 2026
 20:42:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
In-Reply-To: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:42:21 +0100
X-Gm-Features: AZwV_QhRH6NFawvUkrRDz_yRhStDmwA2TFS4yrZjVaLS2AVjfviiDczKLJZCaOo
Message-ID: <CANiq72=z5czHz1j5+oi2zoovf4a27Pk7amikCGuchmAD+bHfjg@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 1:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
