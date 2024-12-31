Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AE79D0;
	Tue, 31 Dec 2024 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735605423; cv=none; b=DY9WL9E7ZTOmk4I55FMJ1GJgMZh6HB31tzdJzC3gjb0smBgDd4p+v7NJSvWVcXMGMP4uV4GKoGB3XZEWt5LfZSpaGD6JPGGtJY/TLyVqud6oi6nGfa3xEMDiJj5F3eBqDzGIzueYbTi5h8SGnTWxzqmMZ/2TjFBmytRsK7PFkgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735605423; c=relaxed/simple;
	bh=dHiL+92MLY20VArQrBRRfiByebHH5+eZfSKhYTwTQbI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ki2ijk2JsrwmJhwiKWahUu3p4mf0ASlq+32lmEBlJ9eBY6NO5c0r/OnPyzv//uMJkl10NgFVTa5W4/5xO0CNw1yW4nkdEHSgiNWas4AZ+68Z7+HmYHsiKs50HnJACxfsXepeJ3sn3faqIvLpcsvTAgU0DtqmWCqZ7eghrw2Ehy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+M8vcOE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+M8vcOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C96C4CED0;
	Tue, 31 Dec 2024 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735605422;
	bh=dHiL+92MLY20VArQrBRRfiByebHH5+eZfSKhYTwTQbI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j+M8vcOEnLRGnRWknp3w+Leo1dOAhWrF/NLcX/E4geoX4bOOsy+5qiP9xO3+yMT6T
	 +XCbaP4d57ZZNL2aRnRpVE2cwKVisQ+RUoBqJ+bixeoKHOzWQaExjab1M+umE/OwKo
	 qP06QW+5lFyK2PfTZYgYZZ56OcC7uHcrALox/T7vJI02ZMIwWi1VEYEFtnuTQLkk8M
	 dkjePgJRLSHrzwM87MoVvJJoWIt36usddXmU+MHaigyzPGAYED9APlLF/Dh19hhfqN
	 SFqwUwdz3AlQlsqpmu/ncbxEQVyF7dAjRtTW26BV8Yc7OA3xjw+t7Fuf39olkW27+b
	 cJdmLC4y6o0QQ==
Message-ID: <c110a740502cda3fafa55828292ce34c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241226122023.3439559-4-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com> <20241226122023.3439559-4-rohit.visavalia@amd.com>
Subject: Re: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if registered correctly
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Mon, 30 Dec 2024 16:37:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Rohit Visavalia (2024-12-26 04:20:23)
> If registration of pll_post is failed, it will be set to NULL or ERR,
> unregistering same will fail with following call trace:
>=20
> Unable to handle kernel NULL pointer dereference at virtual address 008
> pc : clk_hw_unregister+0xc/0x20
> lr : clk_hw_unregister_fixed_factor+0x18/0x30
> sp : ffff800011923850
> ...
> Call trace:
>  clk_hw_unregister+0xc/0x20
>  clk_hw_unregister_fixed_factor+0x18/0x30
>  xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
>  xvcu_probe+0x2bc/0x53c [xlnx_vcu]
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>

Please add a Fixes tag, and put fixes earlier in the series so they can
be applied while other patches go through review.
