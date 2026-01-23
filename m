Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB591D61B7;
	Fri, 23 Jan 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193640; cv=none; b=nlTb6td+Ktyc4SvcaHuhyKmGjdta6JK5y4rHVqFviMNiMNWY1fHEVIOCqii1qrpJf/dDu66jvNNkQrHmHzsLmWpHxfT1FTxkoeBb2UQdU2XYgZ40z8B5eSqdjI9d+Akq5YIOELjvgehtoS+/adSW+OtzzRzqxt4EGoiVm/kNl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193640; c=relaxed/simple;
	bh=MfnkscPoldSN/uzFpQGYQc6yhUKN7oIG2n/5wBxf6kA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ddfdngArvSGGByHBO7KmR+gIwT5e2iPODQfMpO/SYBFE09wZHNoIoFqnUl7r1gyXL462u53pvTbvSBc3F764wWRyxly/a1nUI+jxa8+AivKRjTNZqqW6Yu4zy9dNI5uHcTeP56KcbfefVYP8fOgawMZLvOKX8W8BZnhcFY+emqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLxvaglp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLxvaglp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEF5C4CEF1;
	Fri, 23 Jan 2026 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769193640;
	bh=MfnkscPoldSN/uzFpQGYQc6yhUKN7oIG2n/5wBxf6kA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bLxvaglpjlBIhdM0YAJd7TxtKFvNJXNC8nPzQ3vqhpve3IaWPFg7kjocvH1l4U/He
	 O8ElIRyg5pojZW1oLAQ4LRvGhHhGYqcTI4QGXzakZyIOb9Wqj+hX8i/3pWfrLGy9V4
	 NPYJWhwWC21QLDfr8Gv3f1I+8vT0+NlavrVYehWUt+OOUzIFDpQRSzpmbPfsGLl8S4
	 6cUVSRI1ZEYm+MtKGK9sTAquLfd/uzJE4sr1Y+IKSMiK+G/fujGe9H0ZNx62hFaUu/
	 kZKGXt5jue2L+4Dbf5jkX3Tjo0QQueuLi10BUYDiUfHp0+/MUM+N9MaoVpg2fp7TnW
	 ze4euZMmRuOzQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260123121443.4011649-1-abel.vesa@oss.qualcomm.com>
References: <20260123121443.4011649-1-abel.vesa@oss.qualcomm.com>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 23 Jan 2026 11:40:38 -0700
Message-ID: <176919363874.4027.4570850616767932692@lazor>
User-Agent: alot/0.11

Quoting Abel Vesa (2026-01-23 05:14:43)
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.20
>=20
> for you to fetch changes up to 3e6b0227b93c708e93e33f6c3485bad077650766:
>=20
>   clk: imx: fracn-gppll: Add 241.90 MHz Support (2026-01-17 22:17:10 +020=
0)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
