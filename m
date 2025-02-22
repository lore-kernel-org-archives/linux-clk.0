Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FF78F4A;
	Sat, 22 Feb 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231368; cv=none; b=ocGGIq6A0IassQ7nQ5l2pPU9IcaMkHk0S6iYh6BMBWqnPGoZGbJRU1tcR30OhXcQg8FOLVJgWMElfVFMdzQ35WHeXYcVnbU9eyrrlko6p0Wq97qzi3QD/xR2MFF1iIEXGk1BahpdpqOG6OwD9/u4EZPKX/3wa7zyUDLZVIPg+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231368; c=relaxed/simple;
	bh=/gXc0SkpbcqjdFEW1sUVpPIbLYC86EH6P7VZH8G9vII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z9TbvDd4lmhDvPiSH19EvJp1vbSrixp0KDOu4UWkcXRzcRlOui5tevKu+YHqlM0fsDdRnYbaY7O61wmESmbmXG1615ORrS4y59ee72/c2p457AcdEnVNj6DEeSdJQ2bG6FYyWecNsgN/5g6/53WnAv2JN/kcFmiIeN4wxHWMG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C62C4CED1;
	Sat, 22 Feb 2025 13:36:07 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 0E24D5FB4D;
	Sat, 22 Feb 2025 21:36:05 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 p.zabel@pengutronix.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, jernej.skrabec@gmail.com, 
 sboyd@kernel.org, mturquette@baylibre.com, ryan@testtoast.com, 
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20250213172248.158447-1-macroalpha82@gmail.com>
References: <20250213172248.158447-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V2 0/2] Add Clock and Reset for TCON LCD
Message-Id: <174023136503.2749343.5726687557898237585.b4-ty@csie.org>
Date: Sat, 22 Feb 2025 21:36:05 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 13 Feb 2025 11:22:46 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the required resets and clocks used by the display engine TCON for
> LCD output. This is required for LCD output for the DE33 which is
> currently pending acceptance into mainline.
> 
> Note that while the clock is exposed on the T507, H616, and H700 the
> H616 does not expose the LCD controller that requires these clocks.
> 
> [...]

Applied to clk-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
      commit: 730feeaea72f1260548e57d35dd49603cd86a7e4

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

