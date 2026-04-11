Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A840214812
	for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775949347; cv=none; b=DwbMkP4BqZvVTn+Bt9TxVhaaQKbK/GghsfsnJobWyNM3GP2muVsiiQWWmU0QXgVIhbfYh/uyWty7P5dzZWbanx1nEE+bZnQOi1cx0FMEDfdvUZ2zrz8lvus5swDCU1bNyjLicNg64P21vnabtaxxpOWqOigUqgQ7d3qP1nW/0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775949347; c=relaxed/simple;
	bh=cauOxnkjRELK8dcA7zmL5inijQj5/tR6tnWWhsiG1Vc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bDx5LPphB2ZZhJPR4d9m5S7rN9o7DhnMX/lw8i6cxYOAFBEgyNvhpjdulmPslrN0Z6hfGj+HDEEiHc3nEF2l1hlhjLEgMOe3c4KfGTWT1U+fZv5y7TzpQAM8AzUPgt1p/8zZU8ERp2HveqBAL3PON4MNwnxgK2v171uXsUqNmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7L/nlyI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7L/nlyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3379C116C6;
	Sat, 11 Apr 2026 23:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949346;
	bh=cauOxnkjRELK8dcA7zmL5inijQj5/tR6tnWWhsiG1Vc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q7L/nlyI+PeG2ah+p7+/TVnD6cg8u42pXtuPtDZD82ipUvvNWhkRITH6/iDNi6oh3
	 qjAw/gSWX+cirbvy8GJNt0ilqWFJKA1oC144dmRkx0ItCLdADJA7IAzX2PT8KwB6gf
	 FwbzdtxJSiAe3i1SW+66Tu0Jd50GYIy2YvwqgLBdGbihp2KxoEBt3Eu9e11eHbbMwG
	 pKRO2M2nkVd8Vwyq4UxaQW7XGQ7MCsLh64dhNzecRirPn4Gp+g27TAn0c7ciEOuGnz
	 iBHVaS9BjSX2EEgFfJdotxYOj/6vxmNIOWejBTiw+mYLqqOunEZ5KOgfblqMqUx8Hm
	 sIzgIPgmFEF/g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3746710.R56niFO833@phil>
References: <3746710.R56niFO833@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 7.1 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Sat, 11 Apr 2026 16:15:44 -0700
Message-ID: <177594934499.5403.15761642378116047555@lazor>
User-Agent: alot/0.12

Quoting Heiko Stuebner (2026-03-30 06:42:00)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with a Rockchip clock change for 7.1
> One new clock driver and sone newly accessible existing clocks.
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v7.1-rockchip-clk1
>=20
> for you to fetch changes up to 41b1a6760959017c4fa1dbc7c3cc318406ab1455:
>=20
>   clk: rockchip: rk3568: Add PCIe pipe clock gates (2026-03-10 09:34:27 +=
0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
