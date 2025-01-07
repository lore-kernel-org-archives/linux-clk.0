Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFEF7494
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208586; cv=none; b=aH4epXnyq5zRGIgyuhYOI8PA+1SRWrUFOXW11nITxuZip0ExFrUQxuW3MZ3rIv0rzVCZVkwktu9Sap8sXYDlBp8yqscuQctwR7jWvZvQ4ft2mWNgTAbHYXU3g+GZM52uIFvZRst3SknZzonYX0LtMrO0Y4WdEGAzM+LgTT2z+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208586; c=relaxed/simple;
	bh=PsRkeSlKcsOthVE5JSpIYlalrEZgE7zoltJVYwBbOJ4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nrE2+IUsQl0pzlG2kj9091QG6KMUAAibEd66uQm0Vz69Vu+kDYEC8AV32Qt5BSKp9BULPKSZqhf1l49XdaMOdZcDkoLdCWMTFljIu1a0xjt0lDfvqmhyXf+SFUS9XU5fXvHL12w4lIe/deG/OkAvWALUmj1jQaZ+LUKI9MyTiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9CQyfFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9CQyfFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B9CC4CEDD;
	Tue,  7 Jan 2025 00:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736208585;
	bh=PsRkeSlKcsOthVE5JSpIYlalrEZgE7zoltJVYwBbOJ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F9CQyfFpOJDlJyGj2zd360IGGf3cWWzVIQwp/12tvtpzBGzYlFl04jAz2dQNeO/Mz
	 x2ieUo4kRrUcU6NmTpS9FrHCABV7y7+D5IJZ9im8h7LYqditDO6sMrAXoE/U5WHLwR
	 ml0sKtPPnHHFQ5ySJNeckfzaN7X8Y5qPkbcvS+T0rAyJ/qrExZbnW9Vo632c2faqRb
	 HJ7ai0LCrdIxtS29PG7lPTkqkxlPwOG3a66SeST/YWtF5lH6bgdU4kof6+h1Z+0FKW
	 eCBqOKCyWmSJvzMUJXXzFTNjVgU27097z5mU+9wfz63qkc6Sg8rHSAQyQYC7X5XCho
	 A8vqv8OLxlNeg==
Message-ID: <ef8b695bc3026a580ecf150b23e10517.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250103020824.1267484-1-dinguyen@kernel.org>
References: <20250103020824.1267484-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] clk: socfpga: update for v6.14
From: Stephen Boyd <sboyd@kernel.org>
Cc: dinguyen@kernel.org, linux-clk@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, mturquette@baylibre.com
Date: Mon, 06 Jan 2025 16:09:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dinh Nguyen (2025-01-02 18:08:24)
>=20
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/s=
ocfpga_clk_update_for_v6.14
>=20
> for you to fetch changes up to ee46245564a8d74ae96394269f173f8306669c04:
>=20
>   clk: socfpga: arria10: Optimize local variables in clk_pll_recalc_rate(=
) (2024-12-16 18:22:00 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
