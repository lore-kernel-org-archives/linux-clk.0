Received: from mx1.bren.win (mx1.bren.win [51.81.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB58C3E172F;
	Sat, 17 Oct 2026 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.56.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265300; cv=none; b=rUDH69V+kX4kzQOOWP6UJQQyM1B+lvp9Y3R1dAVvvR0+r61aI5liTWRnRUIYOM9hx6V0RdGfAYGHrFiZ8J57PV+9YD/g/di327PLXZRIJJHo29Hjsolbh1v0lDuiXjL5txhEBSXorOjNJESOhkSfTMcUgnpluCIh3E+je4pKRLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265300; c=relaxed/simple;
	bh=XYGsXWG9SDMV67QAf1tz6nrdfNEYE/8zYbwRK9nJnn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7JVH0X6dLkIzmPy98068rNStEdwdfXlJCjOO7yT/dF1FNoNPB5wiZX9CBILzZWR9GdVhB31Pa+WhBMeSxNeKgsjfbUgKtz7r5xGDoPwz40okkfg1UIv9Dsi6n4PQCYsdo6d+tjbSCas4n9r32cD1yxmL6Huou1UFD3Z867QnU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bren.win; spf=pass smtp.mailfrom=bren.win; dkim=permerror (0-bit key) header.d=bren.win header.i=@bren.win header.b=Bc9PpG/G; dkim=pass (2048-bit key) header.d=bren.win header.i=@bren.win header.b=U2nms9Y6; arc=none smtp.client-ip=51.81.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bren.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bren.win
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=bren.win header.i=@bren.win header.b="Bc9PpG/G";
	dkim=pass (2048-bit key) header.d=bren.win header.i=@bren.win header.b="U2nms9Y6"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792265288; bh=XYGsXWG9SDMV67QAf1tz6nr
	dfNEYE/8zYbwRK9nJnn4=; b=Bc9PpG/GzYM2QmKjQ5SpzU15RbbZOvKl3FIpV2CvmJgaOk68MI
	xgwZuGLb34w1+w51I+A5bf1aIefq3YTLXzBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792265288; bh=XYGsXWG9SDMV67QAf1tz6nr
	dfNEYE/8zYbwRK9nJnn4=; b=U2nms9Y69+2ltth1F0svRq3QaxJ61tVeB8EqANhoOshtIqAtkQ
	7fY+DVxzZnZZjbQBk7ckBTt7T/rRzn6HprEHWhAwvcHz1SVrWEHRJ69Gl2ZS4f8dVw9/n0a+ANp
	HYMNYV4To0r2sQ9v15SgNW8Cm0V1JeJuDVcL/0QVtlFMyAPNBxyHHP98kGUgdyKDLYDLLH4mW8t
	Q2yaPEw7LTHqiyHOAJsYYgiVR7pdw3XWz4ddXe9kabLmEy3KZwWNptg4u7Dr/rxf4T1fxYyzgpQ
	j7LrSalQUJdK3vQzmhjIYq1AO9qrNZjytQCZVI5ZvvLBivg2l+OcNmG8CL07LkJj3yA==;
From: "Brendon C." <bren@bren.win>
To: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7981: feed MSDC from emmc_208m, not emmc_400m
Date: Sat, 17 Oct 2026 14:27:53 -0500
Message-ID: <20261017192753.1464632-1-bren@bren.win>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017190729.1369302-1-bren@bren.win>
References: <20261017190729.1369302-1-bren@bren.win>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a GL.iNet GL-X3000 only. The change is not board-specific:
every MT7981 board with eMMC or SD currently runs its bus at half the
rate its device tree requests and will get the requested rate with this
patch, matching MediaTek's SDK kernel and U-Boot. I do not have a
GL-XE3000, CMCC RAX3000M or Cudy TR3000 to confirm on; the test scripts
are in https://github.com/openwrt/openwrt/issues/25960 for anyone who
does.

