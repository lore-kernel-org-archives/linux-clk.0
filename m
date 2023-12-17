Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D21845
	for <linux-clk@vger.kernel.org>; Sun, 17 Dec 2023 00:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW2eHwxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF14BC433C8;
	Sun, 17 Dec 2023 00:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702772971;
	bh=kC6GR00udyVW29are37Ujeon3BqneaW9y+Kj6W4+K6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FW2eHwxl7on7116oYqRff8MRnFdL3wqWk+RPr9pZvj59ZbWc0EGi0SnLl4YACWb8H
	 BpgNrDiMSjp6YpleSfbmqRgqmpcBvkBE+IuT50OQO2SUYOZLtzZm/PLyVD2amUGCrG
	 h6X0TJnl+p9BOF+pAbb+5fvBMrvjIO9HTS1leDT6K+Softn1pq45wx1G08VBqvq3gK
	 sOZrk2gMevojpInPs9TUnkZSB4eBrSJs6gNp35/b39vo69XCc09Nf/5FKHvc1/5M/v
	 5mj4ORydJ7/A4TMof9m2zG7ysIOarn2s8F9NcFk1Tmj/jAV71dmaqW6ZuGAQfN7HtP
	 Prry11yUbfHgQ==
Message-ID: <efe5adf3b5ced447c8f5f09b8b845e32.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2913962.e9J7NaK4W3@phil>
References: <2913962.e9J7NaK4W3@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.8 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Sat, 16 Dec 2023 16:29:28 -0800
User-Agent: alot/0.10

Quoting Heiko Stuebner (2023-12-12 13:04:58)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some small Rockchip stuff.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.8-rockchip-clk1
>=20
> for you to fetch changes up to 721bf080f249ab2adcc4337abe164230bfb8594f:
>=20
>   clk: rockchip: rk3568: Mark pclk_usb as critical (2023-12-05 10:45:55 +=
0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
