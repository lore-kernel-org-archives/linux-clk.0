Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6A53CA62;
	Wed, 23 Sep 2026 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188695; cv=none; b=TY1DRHjLXtZufGkoW3l2bvXDLV3KWrVZAlC5nSEX1Ylv9T6F3Gal/BGtu1Fr6awi6L2/agMgnxgY5Oj30PXxdmCKl8x0i86cwlfMggqCdQ4RmFxtTF9za94poWe0Rfc1+istTLp72MirVmpymOEZc0JB3PHC8yvIyk/4k87nXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188695; c=relaxed/simple;
	bh=YGiK61qXotPf1rDMJmlR+tmCh2Dz3TZ0IYf6maDz+6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J71RMpjLh4jeAa1GRDVlQxUB9iEgCV1UPbiLcc4IBOVTI2W5sI97d8bqveNNWtaxh0cDVP2fTOK3h9uhOkdZAOsjxNiQAcfQtY006Gu4zJV8DltRYFOXt7U7tGZ72JYz4xcozaONXTC0MbSd84gCQxhISCOIgVG7RSvR3Yjin2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUPpWEKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUPpWEKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272BE1F000FF;
	Wed, 23 Sep 2026 18:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188686;
	bh=YGiK61qXotPf1rDMJmlR+tmCh2Dz3TZ0IYf6maDz+6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUPpWEKsh+5uxxS65s6ha51IFpV/bYGeO/c95LsAXWAGtrRJ7bDWdZogkrO7OztTw
	 qj6pK2QzvrEk62V9R4HNHXvSW+oQI1+kz7xE/PTy3/1X7lkzaz5ayZI0Pbz2QZMyYc
	 d3Y+3u5+yNi/9xxhZTqUs72stLVOx4fLYPq9VIPkLuGklf/pqRnosibWQiDSYBTmGT
	 KklNO1gE/NnhXSGEfYuBuAadBpl7pNKJs54+uqDTxfuWP+5z4bWUfzrLHTu9k7TujX
	 1b42dNSQg4/2UTZvVRe20Eah9Mh4UVnez/gr2h/k74PZ1Fi1meOQyhMr5jpZ4ayBGZ
	 emmYy2O95qGyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 06/12] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, lee@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260923-zx29clk-v12-6-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-6-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:38:05 +0000
Message-Id: <20260923183806.272BE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D6

