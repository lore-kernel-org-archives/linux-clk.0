Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE06304BDC;
	Wed, 29 Apr 2026 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434400; cv=none; b=bO43TVjyfKeVlS/zSDEmgE6ncC55wtNTZkWUXlKhR1SdBWoyDInDv8IOFsNLeL3PfCR5m5T6fcbN0tUH1mCDyCGwpDTmnRZ/fjwCPChXrfMvTeYe05RgU7TCGOZEsMcc6LDE9ffX0kXyMl9igB6ZM/j8fVuRg6SKTC+E650Osss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434400; c=relaxed/simple;
	bh=KBZvCwTRiYRriqDSX8WHDLD0lflhDm8xLKP9n/sfuyY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jCK/ShmN3zlcYGTXlTC808EC4IS0X/tr4+k5/8XxxEj406fxRfb641jNUBR15W1mXj7CXrlBIpjT/F97r1jo/diZ11ToigbHghayhD2H6bs2qVGr8KxxlyC5fI44SxRMjMRAjDrj/KxWx42wROzVJnwtUTNFZDlVTmiXJScEnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXCi7Qcx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXCi7Qcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359E6C19425;
	Wed, 29 Apr 2026 03:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434400;
	bh=KBZvCwTRiYRriqDSX8WHDLD0lflhDm8xLKP9n/sfuyY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mXCi7Qcxn7WoOaGtW6wDL+Qur9ZiQjahqditXqpadDo0kQs70ZhVPnOzE3OVb3Zgg
	 c2DtBWWliRgcpnDqBG0d5OGrxekYzL3eT+SUX2YZEv9MXhc6t79Ur2lPfO0WtELTzK
	 6kewE0qSh8tenW3XbEhBom2ktoBl46o5KsBIlTaY3slN3jnxZr4XyxBKMQ4gpBKvE9
	 QAxhXkV7Flhvo+VBNHvWJjNCtsDQu5/S4OHoMvU9yuf2LnyaTGlHhnFpN6eqMRHlby
	 sGz7BWQjZENI/r88yWwqjqrx9BbN8Iv4LRxWaa64fiTQS6anJra+mGnwHgF4mE0Mpu
	 QA+l+QvZuvAig==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260401023551.27978-1-rosenp@gmail.com>
References: <20260401023551.27978-1-rosenp@gmail.com>
Subject: Re: [PATCHv3] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 28 Apr 2026 18:43:25 -0700
Message-ID: <177742700575.5403.18064985596130508212@localhost.localdomain>
User-Agent: alot/0.12

Quoting Rosen Penev (2026-03-31 19:35:51)
> Combine allocations using kzalloc_flex and a flexible array member.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to clk-next
