Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D071F7916
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 05:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769404101; cv=pass; b=Tl7dltNP+tuqv7MSXO4zxolMEZjSVHQniw1P84Jhfge07nlmxIXvxG7D+I+g/8mxaB4gwJsyjN/RyPa4fA7ad5u4Ettb+8DWJ34/jdv76C1ut+cVKxnoBufVvzhUnowPaQPYSDDYFnFuU0QHTLYz0LNSKEsG4v1yMf3VsfCSLEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769404101; c=relaxed/simple;
	bh=ZBsVD6kxKzurT7H7DtCLfcoGufza6/gI7cdcVlj4q0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCMcHDxUuHya2oRNvS3gWURscMwGHN7+Zq7lHo8RNBwZotIKGSxq0LkC3zbEZblwZW90vkhQd3pUd1lQzUA9OCh1cQp1dRJUI1qydovtOIaxiskmwbrAiNGP3ZxYWq11mYbWClx6aaVIjYSI6lHMf2RYWqwlMnBf2yAhZW7pqAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9kfJBC+; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9kfJBC+"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6a868ad45so434184eec.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Jan 2026 21:08:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769404098; cv=none;
        d=google.com; s=arc-20240605;
        b=bhDJookufCAAEDdGBADBCovSDh23ZMU0svz6BCk1xbcvtQq3FW+trTqzNW+AT42Jba
         REf6Nw/F7M0hhT/kdh4AgwrMz/N2d/2NK20L0kz53WUJXRko+eY5hl7flG/iCqNXybi3
         dtjGlGW3o7DhrA9j4BG0gJcQvdsAKGYCMw7B5MY/Bux4vUOgYIyXDmoHeaa+hZGftced
         G7RAu0grOT4hf/K7bbdkmIMCI4oEOC84NZOqcYeRV89tyBO8WEnxYa3/TgrXJAECKuvY
         qQSAGi+tP3rOXq3TnCURQnT3SVjZFJwn2b3Za01c2A8gOwNLPKtCf0NIuthy3QfCUFPL
         Rt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        fh=cy0ewcXLOXb3pQ3/zdlKXJFlf3igfv3+ez2sXebjQR8=;
        b=Wh75IMkZ84DECy0d3V0OraXG58e6LxvVIU8wlPB+oQ22gt0QH5xITLgPbfXT7/49dX
         FFmMoV8T+wPtwlg1svsmM07ORJskPc7ldJ0gc8wVlSpMMVRS+6LYC3hkIu5lbR6hz8+5
         tAZ5fxANAuAt02P7jk0YTLKoAOM9gxSFN7Mdxaylb2WsKNSVtmNPDFcll0u3c+OfyAQB
         JZ/GQQeLcyXf5QMZ0a6zJkeGcyu5aJUz/ZbfQBsVmksGNyV15Dzabfu8dAXjI+Klz4V9
         Ywi5luWGSZyOz/0nV7XJxxnGviZPpWbP/VWSU70ejtC7K+zwFljDxf25jDqbw8TTtDOD
         iA9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769404098; x=1770008898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        b=k9kfJBC+ldCHGEir2hpwOAhElO6egoRCIxzj0IKfTEqmro2/yY4nV/+ZWVpPnASaL2
         +mKMYxEvPEWQ3mA0MifDdWsjJxAV9WDFd60bga1tQmEuwjCMbcYXGnmdKnOy0gkl2ch2
         Mwj8Ks7ue/Tv0fi0t1I2FGHTzLLGzLT7EpWkOR1/bqd5u34W9Lgxxo6NypTHOKYsnB2Z
         KCh6L7ducVKh/8PXfUb+iHCyyPnIdAB5ON83DnVEVnBfpqvtvEurIJrSHBLvIkSub/iU
         dCIDy2cliqsDj+61/J2ss/bUZVs3zCGOy2Q26lc2sW5MOSWlOjMrzV8iWQUqiUi0YrGB
         4lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769404098; x=1770008898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsbA3S4vvXnWg6PVwhDAv4/t5NunrqZ0yk7Z9wsyNZU=;
        b=Zf0GF1oilXYEUabmbusrrsv7lwr6+T+crjkRM5y0KSBnuY5BSIDYI8/Ic/7m0yvMWE
         rlIE+CDE/e5vdLbe04Zv/79lrD123FVtD3ciskZzQcb95nl2MwECiRPfe5DiEgix3jKP
         XyZSePZ59bP+XXhUa67saz6MUMq87A0525JPaoIEa18M+9I8coTlKkxDzQXPuhEDDBUN
         KeHoO2KXTfSiz86GJn8xegKjs5pRcs69HhEOQouYo1A22vGAgFp60M4V8gOu5rjk1PWq
         wUsqod9fg+HHJhUzNdg2E0zU3loLgs8lLh9OU/kn7CctYqx7Dp/gy7mzpdvJCnXoZjyv
         lLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtRGiiEFsgbvxZWxiMX43N1S7j4u3bj7SGghdny4rZ1ZpNz2jTh7BLxSQT7KUy4rCCWqj9pTFoR8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybo2o+tgQiQyuMHc23//fZyBlnwNDJutjYxzM5/R0jIzXx+M95
	kacvLv8GstH/2c+NU7jrgFftzDeAfRo0akfqmLA1G0Z22H0KX+KWq0ZO0ubZAg0Lp3/4RYQAPb+
	fRmi/X42NZs2iOgs0VYigaaAb6dQqnA8=
X-Gm-Gg: AZuq6aKZauDPdn9fr4Pv+y9sU/1NSyai8i1VOHQcxOSTg+diH57CD0puQltK7SBJPcv
	FwP4zhQQHJA9UJudTxgSa+dDtJiJedS+hYgUKbN9X2TlRGgY4z/SScdxFpOopi/sCZCcxB3DcjU
	7WTM3w0AzoRAcnoFayQuLPnvWoMOjKqNm9SvkGrHparJ93x/HFxmRk32LOFWZdX6CK/j1UWqg7E
	jxg6AjdD9nvBWik14w8u5qZ24UYqtsaMzdMku67qt4CHw55K0udbzFnxmrvjckGqCPnot6/Ga0B
	c7UwuWey1TilAq5p41JDCLww5UYFpQHPyNQrtRvjZcnnnATdC+L14lee2t2pgKSFupD0vdDk2B5
	/ONebyHdTCawP
X-Received: by 2002:a05:7301:3d10:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b7644f41dbmr855051eec.4.1769404098278; Sun, 25 Jan 2026
 21:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 06:08:03 +0100
X-Gm-Features: AZwV_QjC45jcqbNpvCzRgWaUDtcYZvulw1uksmCYv_NCU9WJD69mYzMDZ_yhpJo
Message-ID: <CANiq72m4hBinKM4jRrkpZ5nM_wraQ8FMsYtjgKRkNDmK5sS8dw@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] Allow inlining C helpers into Rust when using LTO
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-block@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Vitaly Wool <vitaly.wool@konsulko.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	linux-pwm@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org, 
	Will Deacon <will@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, linux-usb@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@gmail.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 1:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
>       rust: bug: add __rust_helper to helpers
>       rust: err: add __rust_helper to helpers
>       rust: maple_tree: add __rust_helper to helpers
>       rust: mm: add __rust_helper to helpers
>       rust: of: add __rust_helper to helpers
>       rust: rbtree: add __rust_helper to helpers
>       rust: slab: add __rust_helper to helpers
>       rust: uaccess: add __rust_helper to helpers
>       rust: workqueue: add __rust_helper to helpers

Applied these to `rust-next` -- thanks everyone!

If someone did not intend for me to take it even if the Acked-by is
there (e.g. perhaps Andrew wanted to pick those nevertheless?), then
please shout.

With this, and if I didn't miss any message (plus looking at
linux-next where I see Greg picked usb), then only clk and jump_label
remain (plus any new incoming one).

Let's see if we can get them done next cycle then.

Cheers,
Miguel
