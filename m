Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72B3112A5;
	Sat,  7 Feb 2026 02:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770430480; cv=none; b=Tv06Mj+eoCAogOUztQrpt1yoEG5MC4OsHXQ1hV+uc0HvQNEafA0ZLo3JsrV0Fqb/up4UQwEjJL//fZfrzGk/3uvIRi8nDlCkStriAAHPH0mQdiOBUwfHSnN/a2TmwNY26xvGZ8BEkxgHhwE6gUjE8cmOIaeM7s2mGibg02eobmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770430480; c=relaxed/simple;
	bh=OEjT4HxALXPPLTmo+di6DcKpomkocH1iLSu2/u1s81A=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=T7eSIoOpsBJsiuGaA2yfjlA6tRe62UsrpxDqveMVS1L0+YC9O9grsb3mVcO5QKbN93frWLCpBLqhNyKGgZaZuaKNTaRnhQfVxJj2FgqpYiWtZCRO8gFf1eOw7mRoaS8ccRKgPUwm0aQgj2gyWTUkzpm8ZJVxRRNqQvxbPwNDf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpyioGes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpyioGes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A9BC116C6;
	Sat,  7 Feb 2026 02:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770430479;
	bh=OEjT4HxALXPPLTmo+di6DcKpomkocH1iLSu2/u1s81A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hpyioGesrtpQPfejYfpajx6J5u6arwNDd8ObuTLQWn14v8RyLCX8yBknjrWby2/x7
	 +BB1vzXcjM7vyaIWDsmNvPRwKMuk8H54ydKvGzXU3+KCFD1aOA8ITpZK3KVXuiELhr
	 TqvC3IoGJiXoGJ1k07PJaJVOoIz6CjwVJ6MN5i6J3vewg3meah3m2BFWZU78fD48a1
	 zNo/p+aiosj3Ww9F7vHdo6/dTGvzI4tgI+rUOvpa+m8ER/GyQ0KnZTWHEv8/iLsLqL
	 K7q1E3YK4BQh6SHOZUquKizNjPPHBrdDO0cJW3LOe+ZjnHZEFUxelInVWo5YJBIqkS
	 CEXCSwEcxtyRA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260105-define-rust-helper-v2-4-51da5f454a67@google.com>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com> <20260105-define-rust-helper-v2-4-51da5f454a67@google.com>
Subject: Re: [PATCH v2 04/27] rust: clk: add __rust_helper to helpers
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
To: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Date: Fri, 06 Feb 2026 18:14:37 -0800
Message-ID: <177043047727.54237.3425297132138561114@lazor>
User-Agent: alot/0.12

Quoting Alice Ryhl (2026-01-05 04:42:17)
> This is needed to inline these helpers into Rust code.
>=20
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
