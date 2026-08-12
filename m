Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB98189F43
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514714; cv=none; b=YU2uobn/mQC6QDlbf85tWEXSX28/2fJYEGnRBARgvskJ3Z5rOzE3TPi/Xhdyl+n502xZXFV9/MeIzZZ6gJqOwyZ8CD0fFwAM//8zvFsOv6du0As/7Mh0wSm0A19RaeiiuXacN29HFDhataWOPA0zkiWkNdOJ9vxQtdx3brP3DFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514714; c=relaxed/simple;
	bh=tF8q2KGxIGEqAnL/94A4FYgAzE0IggmPIlI4rDmqALY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SoygqwtKl2kBmdhIIQpav79NxJVQw7RetrA49MGUyZ5Hq87Ga/DvClxwhuuJho6aGQVcKjTBurDv6xrIpfHnkk12Ok5klknvUfCuzn8WfFScgm765AhY45P7MOi2iycWw+1S6y2tLqh9eimld6+hEjKcHwQx3WQWqsK3dUA0TWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmfxuqD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmfxuqD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09991F000E9;
	Wed, 12 Aug 2026 06:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786514712;
	bh=Z5kwtcLai9cqB9k96HC7xug55Ee5HhObcrKVWtvYDQk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=fmfxuqD0N2DIMWW2+XmDXhm5U0sj0eKCKTpYTArDp9qm3F2SGYiUHO216zL9HdZ/i
	 Ay3z2aA8Jj5VCGehLnIFzRWjb47pwDdubyGGZ9JkZs5fZi4lM6c7RpX6ze7++hqnsk
	 N1xCBKVzPhN6e/hpJhNuhLOnlQo8C3vTwKgle+EGn5ZSZDBcyBvxsaUuNMHNziJnrU
	 tAsXkWW0q85jU8FNCzwumS0F+vUT3dIh60U7OUew5DjhVoY8Z8ziHVt5se3rqnfTW8
	 BKr+zfe0VU2bshkdu4Oj8w9xz9WT9dyGCId7XWBi+QQPM87YdXs25yAF2Lkdem2p0+
	 MXpxIeupZkI6w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5218537.CQOukoFCf9@diego>
References: <5218537.CQOukoFCf9@diego>
Subject: Re: [GIT PULL] Rockchip clock changes for 7.3 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Tue, 11 Aug 2026 23:05:10 -0700
Message-ID: <178651471066.5862.7206595209942698705@lazor>
User-Agent: alot/0.12

Quoting Heiko Stuebner (2026-08-05 14:23:57)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with Rockchip clock changes for 7.3
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v7.3-rockchip-clk1
>=20
> for you to fetch changes up to 586ff159ec02533c17dd928641529cb0b52e9c62:
>=20
>   clk: rockchip: rk3576: fix source muxes for SPI0..SPI4 (2026-08-05 22:4=
5:22 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
