Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B3F202C56;
	Wed,  8 Jan 2025 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736366217; cv=none; b=C2TuYclmaEAKlml+b4MDGpYlKI7D4ypdxIHJ2T63SL91/8DUzuMLhblf7I8LsJFbmCMb2GU+BvnxBz36TPJEBME+Bi2w/9+czgXtQAIFooASUt4TsfPvJkLfi0bNJKjJZdf2a1jvSvvfA1NRLTGywVyVAWWOWQj3K7r6I8oQj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736366217; c=relaxed/simple;
	bh=uJCC/53VkKDfC7zFbX7bDmqLBquYvg9lKYFHaH9GXJA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rLdt0JEBSmnHYuQCccLOJj6CuM7CN3HY/56XwvwizPGjPyzDSe0+e7YALcn7CzHEnJTWM2IKn3nYT1QPADXPK63An+SDOKB0DLbTjyX+stgvBEJeP87KqHOHoQlqWZU/guujb+8L7NPG6SNwLYa0Y05hu1yGoDAWWN5RM0ITpmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+0FFoDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+0FFoDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2304C4CED3;
	Wed,  8 Jan 2025 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736366217;
	bh=uJCC/53VkKDfC7zFbX7bDmqLBquYvg9lKYFHaH9GXJA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=h+0FFoDkJB138erJQSZkrN1rteLqjloxqlidJxT4s5wYgAvMoXV7q9F0RsF6f/vOR
	 HFY2uWUOMpmbeQQ2x7vpNynHwpfUQRH1M8aFG1Ky6gjKbvZpNS4Nm9c6cLEKgT8E0u
	 AOPrFXQuw0A6kslnU0RzqNLfyexk4Vl9L14waTNqZs+5f2PHOxuHcM9iqOiZbSvrqy
	 CwnZn5rVle7NTeJzXslU+ILeV4gf6MF3et9EvYQ3IwnyWkXIIm2Yxhr67GjwZ0Ugg/
	 FrmxvXkA6eyg7V4Bq4sg3z3QMEBEsnQWnl2ysStXuDQpURcAioT85ZdYRHrabyU0R6
	 cPQjRw+9Vtl/A==
Message-ID: <83f4ec535945006dfef25afe39085879.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z36iFxlCUHhLcdP-@wens.tw>
References: <Z36iFxlCUHhLcdP-@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock fixes for 6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 08 Jan 2025 11:56:54 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Chen-Yu Tsai (2025-01-08 08:04:39)
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>=20
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-fixes-for-6.13
>=20
> for you to fetch changes up to 16414720045de30945b8d14b7907e0cbf81a4b49:
>=20
>   clk: sunxi-ng: a100: enable MMC clock reparenting (2024-12-27 22:43:29 =
+0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
