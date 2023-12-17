Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B34AF92;
	Sun, 17 Dec 2023 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTbpL+6K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B37C433C8;
	Sun, 17 Dec 2023 23:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702857487;
	bh=bTdI3xmfe/y7O1rTxr0zqRGKBMR96olPlKF16mf8aP0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tTbpL+6KFGYwUBskREnPn2XQk4iUlPIXfqr8i3vzRqRLds78L6B2dCgwWYNCpkQce
	 nYnZmMxX7GxIyzcJb2Dqg1ifL2wppZhhAaGbalWld1oBGwjlF6YJtID6q08QW8F/LH
	 x48bpP8G0i7jbMDULXe6ep0o7/HP4JnetlEuIq7fE9OgLT4b79alwEvbJksDg8clgK
	 eRJFNWaiNFupLhEICjx6G4XuvnlciltVHIvrOUbV72H5jT85eTjsBKP9VXUXBeaIDh
	 /F3KOSuAHuNBWCCvdpkhXNP+RHkexgzg7KTwH9dXtj35YBi6Bwwljko4c5KqfSJ3Rj
	 fjq+NN8jPFUDw==
Message-ID: <d02c847d6ba0692a14c882051130e914.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231122142310.203169-3-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com> <20231122142310.203169-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/5] clk: versaclock3: Avoid unnecessary padding
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette <mturquette@baylibre.com>
Date: Sun, 17 Dec 2023 15:58:04 -0800
User-Agent: alot/0.10

Quoting Biju Das (2023-11-22 06:23:07)
> Move long/pointer variables at the beginning of struct to avoid
> unnecessary padding.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Applied to clk-next
