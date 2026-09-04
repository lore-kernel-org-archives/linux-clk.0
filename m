Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F107483807;
	Fri,  4 Sep 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528043; cv=none; b=HGxN08Ok3tRJ+haipuVAzYXTh2LtmTcbB0Njr3ZyiyEZxXIlMhnZQSLqWoHO1AdcXfFPvGx3oy6H5eBcMTqHwnvfiiXn0y2H4xmQ5cZatbvjzfmb+fucO3bK5sdDQMKG4d9RZXvaXnb3gHNU+mIOJiaEUxv9y9W0ELaJK/HwjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528043; c=relaxed/simple;
	bh=JgsVJkkuUNsIQvTAAtDOAZoHx7waSpZu3hYvA5Sl09s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fg0YAqwlR+7fymhhdiXzTKa+dXUamYliqjLIRJUQ7w9DQQb8LCdG4MdNwaQzM2crihvgmFMTKEOlLIM+YoSM4Ww13uPCgJk3mjd7v9bjMc/3a6oa94qv/xOoiJ+EAscc4BsU3CyrnErQIV6SvhpMNfwIM9BkukktRF9tFUIg7cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2PJYSCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2PJYSCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA3E1F00A3D;
	Fri,  4 Sep 2026 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528037;
	bh=hgNMv2NMaBRn192MXktM2p886ZVWCVbNLII+lS9uSEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B2PJYSCXyONed+eHGO8p2FM1WjRzlc0A9jf7Sdl+LEfO8nigoleWGXilcLEERRwXW
	 e1OAmzmGRB4cZ9Jj5Ms6iwBn0o6PgGfJuXZTiWwjRLT7m0tV4w9ucWb9yzsxJvF7rl
	 NLGOJWAOFJyvS/7ndMbJUosJzmflczp3tx4ilzPhfiKRP+Qolb4HqkAZpCgDZaFety
	 KMvJtABYHiv8xJRGv2i+nX3uNlLz7Dv5oDniZ2nM+nkISmG3cAhN19qXoFwJ6HjNbD
	 Mf9h6SXv0CK4alBagmCUg923o1h//pvEWisiD+kE5cMLggBSgPdBshYHbQtEwrJ5v9
	 d42FWG7Nd2iLA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Xixin Liu <liuxixin@kylinos.cn>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Fri,  4 Sep 2026 14:20:31 +0100
Message-ID: <178852798387.330796.10489318614485340307.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
References: <cover.v2.1785200642.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 28 Jul 2026 09:04:02 +0800, Xixin Liu wrote:
> Thanks for reviewing v1.
> 
> This v2 hardens the OF SCPI firmware and clock paths against a few
> real defects found while reviewing linux-next:
> 
>   1) device_node leak in scpi_dev_domain_id() after
>      of_parse_phandle_with_args()
>   2) DVFS OPP count from SCP trusted beyond MAX_DVFS_OPPS (OOB read /
>      bad OPP table size)
>   3) DVFS index used as clock rate without an upper bound check
>   4) scpi-cpufreq registered once only, and cleared on register failure
>      so remove() does not unregister an ERR_PTR
>   5) use PLATFORM_DEVID_NONE instead of bare -1 for the scpi-cpufreq
>      platform device id (readability; Fixes the original registration)
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/5] firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      https://git.kernel.org/sudeep.holla/c/65320b642025
[2/5] firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      https://git.kernel.org/sudeep.holla/c/32471d84a487
[3/5] clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      https://git.kernel.org/sudeep.holla/c/70f4b78d560e
[4/5] clk: scpi: register scpi-cpufreq once and clear on failure
      https://git.kernel.org/sudeep.holla/c/ab06cf8152da
[5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
      https://git.kernel.org/sudeep.holla/c/86d923a882f4
-- 
Regards,
Sudeep

