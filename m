Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE12A1BF;
	Fri, 14 Nov 2025 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091369; cv=none; b=MnaoYzJGIxFusiwkN8R7C6+Zm/W0sve5l6tbja3V4yv1yb+YLvblehEEIXJyps3wy8OGngUAI+yGbUGBTUlX0Y0QnRlKxFJINHf7QPVvpcPuj4bIa9bbkIoico6vCWOyuPOBvk1J/8FCTtr3r7rsHPFWyppTkaura/wJZd6AL3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091369; c=relaxed/simple;
	bh=V/uU7DX6EU2lIi4ytJfKjCiE8gDcgmYB/Hmy17WbL7Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=M8b607nNoSemuhoAwqghSKqSPfqi1H/mCQSN6JmEc2z6vVo7DZwWFdh1FxdxlXePLdrOM+bf5WuEjyB37Lm/cVLr36IvLZzftjC1eZDrjh8Duw33sbRnG9lzFoOM9DUei85Bs4eJF6OjcTZjZPbXUPfjUdfqQej86i9BPjHUU3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbe2IChT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbe2IChT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A53AC4CEF1;
	Fri, 14 Nov 2025 03:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763091368;
	bh=V/uU7DX6EU2lIi4ytJfKjCiE8gDcgmYB/Hmy17WbL7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lbe2IChTiqge48WGtL+dveg6rDgNVC0my3zhrP7QwH/WwUEdLgUUqLln0Uiu/NMB7
	 qcZRceJY/7Jny9hsFodVqJhKemgtIWq4gApoArS4VPmXvR7nc+g46yvO+GySNXDwt2
	 wz2ijiZCLA41Z2CB4YXgHYCSP5Ym0XGoyefideW8xs5HaXPvkOLINsCzEZfgl4q40t
	 yy5G8EET7fta+k9Qwqa/W3SMFWG+RyYW+RskKgj+QnwRIw+EfnpUmGeDPwm4VHrOya
	 wwNId5PWB+9dNEtSVoooelqJmvVBzRrKbzbMttVdXmN0lEiYPH/2Mvj+5Hf9mpKGK1
	 3hp5CljL/+Cfw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251028161643.1727046-1-abarnas@google.com>
References: <20251028161643.1727046-1-abarnas@google.com>
Subject: Re: [PATCH] clk: keystone: Fix discarded const qualifiers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Thu, 13 Nov 2025 18:18:08 -0800
Message-ID: <176308668834.11952.12771712972554296598@localhost.localdomain>
User-Agent: alot/0.11

Quoting Adrian Barna=C5=9B (2025-10-28 09:16:42)
> Add const qualifiers to the pointers returned from 'container_of' macro
> to prevent breaking the const promise on const struct pointers from
> parameters.
>=20
> Once you have a mutable container structure pointer, you can change
> structure fields through it, which violates the const guarantee.
>=20
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---

Applied to clk-next
