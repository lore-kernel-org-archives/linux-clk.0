Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D029A2;
	Wed, 14 Jan 2026 01:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354589; cv=none; b=OlyVGxehB9EPYwTo9NlNEKVPmjztAg+NOM0iHggRHu5NkB8RZAaf3Y1owlN3MjJ/H06dr+jOoow4CwFRGUrIbxMAlTOHnfB52/6pEf4O7ZUM2Y53ShYk4v16Zm98MP7gphyHGhYI6JiFkBa+JfMPJ0aDH5ZBwN0HZs3iAZdTXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354589; c=relaxed/simple;
	bh=ys53rRS9wuVkbHnbVNpZ9ZUTGOV2gZV9hitFfdGOfVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dt/qFikL1TkQbvTjyK2mzsMXm8ZXrE2TN2qTDU/oU4GiLEpmFWtw75QV2RWhVd4BQtnTVYoXXGc8W2ebIi2xiKYDZxeRP/aolyGG0bTZR6HuB5OA4HSmSlYc8FpbXwoqxYW/al21ctoPOEewCyjnDOqorhk3gzM0cj/z6F5KaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 28D2D340E6C;
	Wed, 14 Jan 2026 01:36:23 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v4 0/4] clk: spacemit: refactor common ccu driver
Date: Wed, 14 Jan 2026 09:35:56 +0800
Message-ID: <176835246085.13007.17884535903023346937.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On 21:39 Thu 08 Jan     , Yixun Lan wrote:
> The goal here is to refactor the clock driver to extract common part, and
> reuse it, so in the future, we can maximize the source code usage once
> adding new clock driver (specifically, for the SpacemiT K3 SoC here)
>
> Since reset driver register via auxiliary bus which requires a adjustment
> of the auxiliary device id accordingly.
>
> This patch will depend on Kconfig fix for building modules [1], and the idea
> come from K3 clock's review[2]
>
> [...]


Applied, thanks!

[1/4] clk: spacemit: prepare common ccu header
      https://github.com/spacemit-com/linux/commit/2b7a02c322922a37cc5fc15d055b794cc2193062
[2/4] clk: spacemit: extract common ccu functions
      https://github.com/spacemit-com/linux/commit/99669468d24ce21be12f3751e7381c47ab2c9ecd
[3/4] clk: spacemit: add platform SoC prefix to reset name
      https://github.com/spacemit-com/linux/commit/0664a46f93e2fb2f75fa05b5f08949600cce88f9
[4/4] reset: spacemit: fix auxiliary device id
      https://github.com/spacemit-com/linux/commit/ecff77f7c04141cc18ee2482936c96117060c0f2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>
