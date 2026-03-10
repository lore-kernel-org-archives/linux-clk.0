Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6513815DE
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140196; cv=pass; b=OLeT/A+yvxFhUVNr6v9IGbBEeyOfBkHK8rZQjZJHkPm6EYR1SxTIxAlrcjxO5LxWl8r478if4Ei3RTUHie439FHLLaNNpydV+n27fJiPCIf0+Oa5g+TgmDAJeukWQrDmX/d9LrWg8f4SsB4Fj/b8D6yyzoRhHf6jM+etBj5h8ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140196; c=relaxed/simple;
	bh=nL8Tve9qxXBojU4CG3EUAlYMJTfM1E+ZMJp6NeH7Zns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzGjjgJttBBQMYUFotb8oqAIzUqRmn7FtaUCJ3bF8EEgLqswXqro7qzdf8X2arrzSQaT2x+6q+UTU7+AYryRoSLJncqtDYHMmP33FEra2Ot3IWPoBUaZN6XhUKjIR2rL6YhmGtn1Btf1QMrhBwCGDSR1JRtKACGED0+W8pNcf38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBbGtEBR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBbGtEBR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b8095668ebso829449eec.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773140194; cv=none;
        d=google.com; s=arc-20240605;
        b=LZ87qwXDii530T2+oCLqoS3t9fSsX7v3QbBNH+/WJXyS12A8NduZBMn9EvQzXoNFUp
         NT/HGD+T7VblmiPEZNQtwLsCmJD8/8tPRXvNXUqTZGo30V1h7YXmJs5hpXaGEp3ET4d6
         XhrJVnV3P6Zp31J7idyEYIUKXpc7IIm5uN7OSJGL7yXpG0iJ3z3xslBJih6Noc5lVvOS
         EYWgFF10gaNYUyOgiRnUb+DC29Y2FF//Ljqw7xXnprtlXlJF4yoXssQhmC0AHZL1R5LE
         8j/j9t96c3X5R116VxJ+qBqAAwLwu6hB/3Jqc9mjzHCoami+ecX/iv4+8q9U5AieVlXS
         UVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        fh=NEIQumAEoenm8Zg0NSll9+jHjdtqNFXHXfRm/tsKMaU=;
        b=MMAc6XlBsbL3lLaT6a1t4Qt3ssXB8nXIoKX68nvAX8TxPAlV7NefYNxu40lGRovXj3
         /52uikX7+zR/PvOtHZVdst9BELzu3eNW3u4X2z3nvm0i8R0/SKkFL9gvQJm9zsArwkib
         ZsbrNLfmxchn7/NTLtRGNMRzcaUn4dkvLhSP4jv1C7a/MZ4ZGZMMkpvNVre4oBwofaWd
         20i0lD1/Lq9uy5UAg8d/YrPoUYd704pfjX5+9RcGgBvU5rX+jGOui67mrkF9VwF+0+Tx
         giUl/CLYtFA6FuT0F5nipHjJpnHNsinPKZW809oUGMF/7O/miPXPeAvTVWPRseWrmKG3
         652w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773140194; x=1773744994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        b=MBbGtEBRBoxPubDO7aR6dBNxnj1NeX5HfI/2iP8Lzp9seSiN+tybz+fCRUtGLW5x5H
         Dk4DqYa2NIr6W29OV7/5WrHN0FEJ0+ScFhbkZQJ4OBIDWeIUWzj5869zWBkvAx1laXES
         Udu4UtFP+aCcp5tqTGuMUR8kxmr0FTGzsSlplMqaY0hCenwPTPwkdVVfNjLo+2nmkSeb
         ZLZA0ovPwmjNnfImTXGvS4gMKe4x5tYPKrZqYjvhXgCHtOZOaqyl0J7nwehmYLSwCQiN
         4RvcjhTehRXfc9XMyLghddQw5UZF09s2CvUvSITa7ja7/9lOwh6jaZeNRFPG6ODik9Ho
         PR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140194; x=1773744994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4qBpWaqAk74juZmeca9VRmKlmVoYIHqDYNOH37dt7g0=;
        b=ZWZhWUTLo/clqIPh7YEXyLBQmjazko47YHAHlHq2lv8urLTnoYWrvZ1hS8IOqUO+4k
         TfK625Dih8I32v98cxQf+U0vTYMYeSZf8G/XtwyKigdTO5HMIY3CXuUFS2HfLpPTAE33
         rPrh4wx7FPQMYXIuO9/Yvdj+p2rgEpgN8F3NRDICxLpsjp+pjllQCJNSitgGzy35FxoH
         Mbn7pzDaIPDfHZP68ifRE8FxmsXjc6UylwjSs+wyb6WHW7Y40WYYrixK5qP2gaZknkEG
         C+X7hvuQS4P081HPO6si+KNoOBqZRigguicveK/q8zmgk9iH6xPaaU/cqC7w1g8uuOpA
         zKcw==
X-Forwarded-Encrypted: i=1; AJvYcCUs/P/hqQ7aB3Ch/AeNWu0/rFIzdZE3euwCPkfqXkedZn07Wq/oq4IgDIZ2jwTkrwn4ERIOlUIltrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVpSgnObAGTatvRD/cNCg2ioZbuZP97ZvNM5qi/rdBnweFZFR
	J1dUUASyvasub63eGrDRclrAadtw12M5kyj4fcbPbkIlMD/ox/5jMiqsDYxF4bMA/tLlgRHyorJ
	wSH6jI19lT38CCtJDaK+vyyuCOcc5ss8=
X-Gm-Gg: ATEYQzwXx+pmQGHV1W2mr/uU7KbudHYtCAMZ/FRIeeH9Ap63AnO7qxxb8U67zXT7ZvY
	IwbOSs0bybp4MjWfS8l3pJPYco8gFsQnv7PcuYfSK28bh6eFo9xW7trIpMZVS4woCFaTao+3ZSj
	pGad0ukPJkpDnl2FTVO/bpg0sxG4WtDt0eTHvUYLP+T48dtsUDve38JVCT5RBRy2QdeaVfcpv0a
	jvCdTfexsi+2tgbPAQSEm8CH8yDWErvpcXe3/eTquCMSQAQAnaBkuwl2JmU99jmFR4B96yymSVL
	Lh5S8rWtuyZ56UQcrj512mcXDptI11ptw0HKyYtBMctm0bP878TIgmzPKZr4S6p+xqW5HKBVkhp
	6o/4cQCqCLYm5eEZnNO8Cr44=
X-Received: by 2002:a05:7300:ef97:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2be4e09ebfdmr2731651eec.4.1773140194353; Tue, 10 Mar 2026
 03:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 11:56:22 +0100
X-Gm-Features: AaiRm523FMnYeZ1Cbp2n7uyCKjNSK8gDXCio5_BkegPeyUfSKYibfT47XJIo0_0
Message-ID: <CANiq72mT2-8m71NtnodVXVBRkhUSiK3Byq5OkBntEQpW9hbU6w@mail.gmail.com>
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
>       rust: clk: add __rust_helper to helpers
>       rust: jump_label: add __rust_helper to helpers

Applied these to `rust-next` -- thanks everyone!

With these, the series is complete.

Cheers,
Miguel
