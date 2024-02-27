Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAD714EFDB;
	Tue, 27 Feb 2024 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709072173; cv=none; b=pYmr2p61rtQ5901T4n/GhlAdH03S5usoW2EpexVKd55LiO82JRfSWRJOGN8ih6PXznqCbCxvHN7fZFaXr8IT18Tux805bwUwlNWYLHHIftI5tKBQmLAX3oPP1YvnXxys4SMnhWNtA+nsBTp1rNqtSauxk0mjs4mjvB1N6yK2ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709072173; c=relaxed/simple;
	bh=uyYLVulc78GDNb1a68pf6zhpTwp2AsJBaMEVtZDyGDY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Ylw0raLbpQAYeqdiISdNconCtGJS9sngg1RQyWXAFuqfEievMghIOHQMpLymKd/T2bLHTuLHVbbxMwmlHaiOcrQaZcAp7YB4SAzHkR+bRcDTMwk8Rs25VeM5xjT3s2S3v/flHBijPDa2I3MTXFGEE7KFn1HKKM2pb5ixDoPX1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jln/qEpc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jln/qEpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D412AC433F1;
	Tue, 27 Feb 2024 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709072173;
	bh=uyYLVulc78GDNb1a68pf6zhpTwp2AsJBaMEVtZDyGDY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jln/qEpcGSjgfOU/P+1yc3MZ5avDx4GWqhzTSvTaKjK/CYMvlaa04LAok1XBoNg37
	 +CoozH2H703gMrmBh/9HBMdLPweskWTQsYf1tLNcQdGzoaT6WU7xK8Ymv5HGKyDsEL
	 0Z/V8qOFWcPKapuOLHNdBn/nmPQ9XHobHPiOhJdw7ZfMaFaSgRbdIuUJptaQ/Qg6AE
	 1gGZXg4jv8ODaP1UwYnlQe03Goans7K8SdH9S34AMjATsGOA/3NZLTLYwBsZaZf95Z
	 m/WPLxxMWL7nWeh+k6Jg7YnCsAqlkMuwlVWMNj3wGB7Lri3JeM32yMXxscIMYHLSin
	 vVVcYLjSJmKlg==
Message-ID: <a6340294903b32bf48416b4b6396d9c1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240223205605.GA8950@jernej-laptop>
References: <20240223205605.GA8950@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.9
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
To: Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date: Tue, 27 Feb 2024 14:16:10 -0800
User-Agent: alot/0.10

Quoting Jernej Skrabec (2024-02-23 12:56:05)
> Hi!
>=20
> Please pull following clock changes for 6.9.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.9-1
>=20
> for you to fetch changes up to aed6d713187b8c47af40c0b39462e21e2737e307:
>=20
>   clk: sunxi: usb: fix kernel-doc warnings (2024-01-23 21:47:54 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
