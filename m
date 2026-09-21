Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC9448BAB;
	Mon, 21 Sep 2026 20:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023190; cv=none; b=XIh00JdRsLiARCDA16C8ekPwWait3uM3dJ+UOHOAyzYsEjKL8HzLevkTqpKD+N+MD+THJFuJyRap2/6wfMlhA09NjTM64rlHEh5y2LBOaQ4quF6/fl1eFl6kLiwhflaGk/b9V7W2LQr/vCgcDTEFSaTa+Q+A4aDAhoS7PXgX3g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023190; c=relaxed/simple;
	bh=EhBZhbYrQK6Cu1Th1gCXCHDCDkF6SJh+T4Sxzy0WVl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cbEvWRkaa+eEQS2eXYoeKTWwO2CZSLgH/j8qBWDO9uxmFqGq6IrSxn0pYPzn6KiW8R6FSsKkzVXAZhXRFOlPy7XoIzRP6uzu+O96m8AVWBpJ32bkRFZSdEPiIaTgu0YrDirQO2JQC5y1WmN5lBREfvEaPstAGvf59KiaHg7C6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMCpr7Iz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMCpr7Iz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68D71F000FF;
	Mon, 21 Sep 2026 20:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790023189;
	bh=iw+NWOUfNMrDKuOac/YKhbZLDke4f9kSIya86Za6rvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMCpr7IzkosziEgK2Yy2SgiBXvxPQV2tpB2zHA9Vlj7JrdRC78mqyFXo7D7EZSfH7
	 mf+uEVJUi7QxwfKCYxzBxtkxX4yh5cIBFVkRtgfjUpDTSxXg7TLGtmCu1zuvIM1rvC
	 QTlyLMfTkf5iRE8DVm0nGlG5mUcGhC0Jz0wz6mz28H9vxgstSy7BrcaP7DWy2cnlTc
	 zNJ2RyXzkqpW4Pph4IWt7GdSRit/rUPhq08ix1z9qLSaTOO7vm9Yn/gqvnJ3lao9Yi
	 si/bzTnqCg4+a8gjUid6oZmpUhAKt5ufkd9BSi57h37J5aNS6af94sNBkrXGs6DDir
	 2aDM0NcIjl2XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT
 perf capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 20:39:48 +0000
Message-Id: <20260921203948.C68D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] perf: logic inversion in commit message regarding sampling support
--

commit 568c8dc55a298020ff3044a68b97809f490ba7e0
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability

This commit adds the PERF_PMU_CAP_NO_INTERRUPT capability flag to the
rockchip-dfi PMU. This informs the perf core that the PMU does not support
sampling.

Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programmin=
g.kicks-ass.net/ [1]

>     The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
>     misnomer.[1] Instead of meaning that the PMU has no interrupt, it
>     actually means that the PMU does support sampling. On CPU PMUs, this =
is

[Severity: Low]
Is there a missing "not" in this sentence?

In kernel/events/core.c, if a sampling event is requested for a PMU with th=
is
flag, the allocation fails with -EOPNOTSUPP. Thus, the flag means the PMU d=
oes
not support sampling.

The code in drivers/devfreq/event/rockchip-dfi.c:rockchip_ddr_perf_init()
correctly applies the flag, so there is no functional issue, but the commit
message contains a logic inversion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-rockchip-d=
fi-cleanup-v2-0-43ff34ac8599@collabora.com?part=3D4
