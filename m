Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB91D63C4;
	Mon, 13 Jan 2025 21:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804309; cv=none; b=C50lKyL5j3Zno399gUxnQoLHtx4dgr7mME5/s6H7gFgfXXX+9mhkilVTkYAeqmWYOYUjZjs7zQnI1l8ibQWyI02S1asbbYzVEiwxo+g2e+CxhkIXvYjoirQmDVlbRrPvWE6yzf036Et6YnvYcZ9MezK2ATRC8qJNZBJg9DYXkyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804309; c=relaxed/simple;
	bh=WPwBkuUAy7vej4Aybc5qbqj6eTPxPZvTuoZYr55TIp0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=AxqjVvLNofVDDpB/QF3xArz4WOuP6xKuCs3R5DnO0HTegV8V4neW7rNpvewr62nMyIKG0MJ5CHLsslUIikS9J5l/U1RYeNaYGDTIDPJ7KFKlHaz0ebEOTcKhVRDe4fS4lerJmnYyf873FgAVwyFZeA07kfWfr6L31GOmS+WEwE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfYHYc8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfYHYc8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EAC4CED6;
	Mon, 13 Jan 2025 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804309;
	bh=WPwBkuUAy7vej4Aybc5qbqj6eTPxPZvTuoZYr55TIp0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IfYHYc8ou1//6MsF3b2w1c49FtVk9M67MD4c929eHhZ+eX33qd2JP0nCV9S8ZFS6e
	 3ntIgZtSsm4vdnXyyhzpyJcfyjpYXnS9R/EvYBSURVvxKUG7fs6YfbxuUFCfjb9AA1
	 jDl5QtruEBMXxECI24c82mgHzmBpXUwXXjroFV1geTQWTR1GzePw55bbaNxWGX0LJl
	 m92I/VjxCGkHBg7I6wf+WXvEER9Zt45ttHqLN4/1IKA6Lzg+KGTjHkhFdEscogQR3R
	 ScDFAzyMDxLOrSNbj1k5gxE9tMBQZWqLRb4JQP2Rd0d7R/YuExFe47FZsOUasZ0GQ5
	 6QifcaH72X3Vg==
Message-ID: <10445320f7431956d6cb9fc3cd8437d5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241228034802.1573554-1-dfustini@tenstorrent.com>
References: <20241228034802.1573554-1-dfustini@tenstorrent.com>
Subject: Re: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 13 Jan 2025 13:38:27 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Drew Fustini (2024-12-27 19:48:04)
> cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
> of th1520_gate_clks[].
>=20
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS=
 clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next
