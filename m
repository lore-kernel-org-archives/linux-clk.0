Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6192D6E44
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 05:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786511221; cv=none; b=bdfPnGg6qVYry0UIdRduu/X2GrM7XPDhsKhIZjXBg17detwb4B+kbernncTR2KVU7ocNGWccuiJpZW1TjR+BOJFBtO2pHaORx8qKC3w9lr0FkhbeEtnntjpsOEQeawejVuADfkciaV7wOLpp0sVKPdPjShbrudda+q/07uivIMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786511221; c=relaxed/simple;
	bh=VUZIVoN/9aMr574MDKj4Rgi7kY4YGweNyrHS3NGPgtA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gt662NXiEG6Hs/DKBTxvHBjkTPTTGE474bJd0oogVlV2w6NjdsMLPikFcS6g9SuNQ9OBs4lVMA2kg4KFhdb4LbkW/1Jyo6Mzx2NNOm6RbmPjJXGqqsOJZVBeocxArWqNgFxCiCjADgj2bLebfRoUzoSbfSi5BTuR2n9QblfZuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKbS0+Qi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKbS0+Qi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EDC1F000E9;
	Wed, 12 Aug 2026 05:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786511220;
	bh=utHsm6FG+U4VgEp01NBzjQkdxSyUSz3OrQhJ8WjPFcg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=LKbS0+QiHJlMhTXBXBqGyysX9+L1Ish/0Rj+hd5zxzsf9dJSvqVi5EQjAlIfQU3Rf
	 cPyrSika0j6jachHkyZRk5NgSex8RZCNh8qXbvDKHSJ9+PbRnrJkdV5DH6J3CO+UEu
	 TZWYIqjOS0XxIRp4ldUQZFLNGWZzuKOYbOSDxWn/5zl+uG94sD/LM+BK8IoUG/OCUz
	 dU3wV8ia0l0H6q4OcGbupita3Wq/8ufOGN8q9/r/NI/R8pyVUoSSWIqUVQnIfm1+GN
	 xLflqCynNi2aVGS5Z3ktyw3gNSsp8K/bfIiHoHygSurtHhdPgykNeCNW4tutem9+4f
	 i/wy8nxe+GIjg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
References: <1jmrv7xlyk.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: Amlogic clock changes for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 11 Aug 2026 22:06:58 -0700
Message-ID: <178651121874.5862.15074147400142820342@lazor>
User-Agent: alot/0.12

Quoting Jerome Brunet (2026-07-31 07:39:15)
> Hi Stephen,
>=20
> Here are the Amlogic clock changes for v7.3
> Nothing out of the ordinary, 1 fix for an old chip and 2 new controllers
> for a new chip.
>=20
> Please Pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.3-1
>=20
> for you to fetch changes up to 6f809ca8104b01dff31a20e91fa748b49fe2971f:
>=20
>   clk: amlogic: Add A9 peripherals clock controller driver (2026-07-24 18=
:09:37 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
