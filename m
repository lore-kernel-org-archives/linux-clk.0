Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EAB67A;
	Tue, 24 Feb 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953376; cv=none; b=rjyJpcWnledjjvHYq0gO3YqS95/B/frhw3wqi61HmkU45XRJo4PxDXmR3KmRTUvJoLh1Lhl0lx5WUQaijwLcvDl2xISIUh2W0FqTtpgrvkG6PGwv60aJ02tLsxbRKxO60z5Vd+v34BLxfCwKphDvNTVd5Fyt3FsHRyUlpwNLhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953376; c=relaxed/simple;
	bh=nXGV5CVF9KwRvJ83Nkm9Y6yySQlR6qshXE/F7dMkN1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NpQjas923K8Usl5B2RXR1bidrcnCgToQN+6L1fxV0Mc2EFMCs9t8mblJfzkdTVxjslo+CZC+lDxcM2YNkkLI9eO6qrfug2I127zgHj1BquLZRe/S+bZQ8HdIUwbuEsnB7iM7hL4kKSV2peBQl0NyKStpnQcDiIO962bONU5pCyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLrpN21X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLrpN21X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39645C116D0;
	Tue, 24 Feb 2026 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771953376;
	bh=nXGV5CVF9KwRvJ83Nkm9Y6yySQlR6qshXE/F7dMkN1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tLrpN21XxX2O3kigPFKRqgkCBRyN1tW5nh0Po1xdRfmHoWPM6r+2h4/QHKh/z4/Rj
	 YbhWf6JM7pSoHlZNuloEJ66DCszoTwCnMRNJQf24K8fFPSYiRxu+xQPFX2Ea/NaYNd
	 3phab1yhSV6gS6BOLc3x0N9zSummIwFLDzOEAa64HMc7gPOhXm+FC+BkN5TK0EKYxp
	 AHRlX8msfMGVkPEZQEiDnKBGVcnaNYGNgY30h3V8K2SqIRL8pjmk2TUcF2l39K5TlU
	 VuSMyKBysbZzNWoXtFvHifyBizynKnBFj0YZJ2Q2xMDph1v2urNKVtEqJ5Akl5nX6i
	 Ci7uF3JnOKU8Q==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module
 clock
Message-Id: <177195337394.94628.14115585329669405806.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:16:13 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 17 Feb 2026 17:30:03 +0800, Chen-Yu Tsai wrote:
> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
> 
> Add it so that r-spi can actually work.
> 
> 

Applied to sunxi/clk-for-7.1 in local tree, thanks!

[1/1] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
      commit: fb20ccf70cf695f178d7c32e2d33b376560df0ff

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

