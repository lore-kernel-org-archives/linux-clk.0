Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E174913C67E;
	Sat,  2 Nov 2024 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730546590; cv=none; b=YQ9Vsyt6QkV7NfFoPM8yhIV78nPWw8/0r6TOHqxqyFD1iwb7NKAYnujQJn6JRYCGDw2IuWkuzAZEmlaPuyxTfObG565vZBrc+dkROBkaGLCaF65lofPgEbLr7GkFylSoMvAgqYe+z6X+u7s2vn2hugd/tCKNzIPaSBgr3Na/LiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730546590; c=relaxed/simple;
	bh=VsskwiQ44m+v98pm7bNmTV7sTyCUCp4XbNHynUs/v5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cYbs69gp22f84t3/N8k5UvumdpwW3PV6WqdcPc1u+QmCJosq8MT2MekApWJ+EU1iCyMEvgsuhwfVME+IkfhgvdsVXQO2jmsnAaCzto8YXy9R5lDMb1NEm1ugQVfQFmJtezdCoet77vRlwcCakbeBAKumITW2rac965F49FeT1Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E0FC4CEC3;
	Sat,  2 Nov 2024 11:23:10 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 588075F9F2;
	Sat,  2 Nov 2024 19:23:07 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20241001105016.1068558-1-andre.przywara@arm.com>
References: <20241001105016.1068558-1-andre.przywara@arm.com>
Subject: Re: [PATCH] clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
Message-Id: <173054658731.55569.4149254473608981743.b4-ty@csie.org>
Date: Sat, 02 Nov 2024 19:23:07 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Oct 2024 11:50:16 +0100, Andre Przywara wrote:
> To work around a limitation in our clock modelling, we try to force two
> bits in the AUDIO0 PLL to 0, in the CCU probe routine.
> However the ~ operator only applies to the first expression, and does
> not cover the second bit, so we end up clearing only bit 1.
> 
> Group the bit-ORing with parentheses, to make it both clearer to read
> and actually correct.
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
      commit: e0f253a52ccee3cf3eb987e99756e20c68a1aac9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

