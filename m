Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43F18FDD0;
	Wed,  6 Nov 2024 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730932959; cv=none; b=tVkPHy4jqhmvix6Ei5Xb3srPDXE+nTorlN+njNLHGIxvnglg5p22HuR06T5YqLaYC55LsfTZ4i8dlXWxdC006l2HgZ0kGXb46fzKv5HOaBEPlAHRlC4C7AxuPWx0bQOoUGOdweN4mMeLw4CGLMzIOXtifAzwDbzhF7n1qE80A8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730932959; c=relaxed/simple;
	bh=hqvWk93sjdi7wdA88WOGQyv1JrcwbIAC9eGmz7dOPsM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=cI84jZm+Nk3T7fkC5wySnBcnh//SA7si5ZZjdFTbViTOxn8oFx4sV0eOdKmocpEUwxS3tJDR6aSbyXaa6j6kjXu/WJdomJ12aSts3Z542YrvSXpEqom2sn1lLj4f79haDrdPrjCATnwyCL8YYrrlNVw+6AYwYQvmzLKzPJEhDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+rtjS3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+rtjS3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D8C4CEC6;
	Wed,  6 Nov 2024 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730932958;
	bh=hqvWk93sjdi7wdA88WOGQyv1JrcwbIAC9eGmz7dOPsM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k+rtjS3gVjKBkkyTbmxnk8hA4hp+FzUw0IoT9h656hS35pS/fzvErrSH9WoqMvpef
	 /3Nv6LZaOIwvOYfAi4X4qohmwlh1nqDHBjqFcONNim2wejk//zO9u9INiHGSL928xs
	 AjX8Khn2Hhhiphu8NB9XISQYrSbGyVaA5JLQKqnONCLsWpYTDYrAntf+mRmylZkTs4
	 hIO3VzRAc6O6bffa8Ir5hcuwyVmBVgtEWkSzrodZ5vvOue8VmbP6em9lpe5XtwTgKv
	 AZizoSM1TbQPd79Zu/2o1yzjWjfu4nHSYfKjLGLofQqjvdc7pfuf8RPFcAowcBGh62
	 D8yQEFNj8WCgw==
Message-ID: <5bda9461067e8d42dbea17310123c0d4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZyuYd50i-oPSDXZ4@wens.tw>
References: <ZyuYd50i-oPSDXZ4@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 06 Nov 2024 14:42:36 -0800
User-Agent: alot/0.10

Quoting Chen-Yu Tsai (2024-11-06 08:25:27)
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.13
>=20
> for you to fetch changes up to 1054861bc258fb5798b7132453593cc3eb0639ba:
>=20
>   clk: sunxi-ng: Use of_property_present() for non-boolean properties (20=
24-11-05 23:40:49 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
