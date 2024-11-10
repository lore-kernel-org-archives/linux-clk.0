Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76080145323;
	Sun, 10 Nov 2024 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731241401; cv=none; b=Q28q+6LzpyHx9Ujh25jZGbHgGppr8yJFYGceein50wdHKX04HxnenOuiwGRfmcz1oZgid9hqOzTJC7c2/Bw0r+IUpaIj10noRiSaLO+reBaqWAsYrhzQeQXTizW+ldn/IMMkc4jDHjoJY5QjXmcsjoe++H/VwzaY/5/9uIzOsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731241401; c=relaxed/simple;
	bh=50fN6x4fQIVLf4cBCsjBctouvwOHJqCbe6vcJ+JkiXo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BexMABzyBXos0+ZCklSl2wVxjkakfpQjencwursowhGO4BOHgzQ8fhyfbHXAxU1TrP6Qamh5NNPCNJSo11JWtOAFlFvzx+MlcaTyHx5+VBXQKINxMjZAesqbvch2qekDYLWH29iQ9GN1D0u2bAmVWxYRTTw8hbnuBGFUBpdfi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE66DC4CECD;
	Sun, 10 Nov 2024 12:23:20 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 874015FC00;
	Sun, 10 Nov 2024 20:23:18 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank@allwinnertech.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
Message-Id: <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Date: Sun, 10 Nov 2024 20:23:18 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> would fail to initialize, with "mmc: fatal err update clk timeout" in
> the kernel logs. A closer look at the clock definitions showed that the MMC
> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
> adding this flag in the first place, and its original purpose is unknown,
> but it doesn't seem to make sense and results in severe limitations to MMC
> speeds. Thus, remove this flag from the 3 MMC MPs.
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
      commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

