Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7415821A4DE;
	Fri, 25 Oct 2024 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869678; cv=none; b=Mi7fxdVK8lRcljSRyYFpsBQl5awwQqV6C8NXzCrKoYcAxMDsHDRaVuVdM7DFxEk9ucq9KM9Ly/1eIkOpmMUstgGhTc8XlMCaNackVClgR7Hpq48r3J/VzW85dei50euelwYS3nqmXjxEIbWIFE8JRAs5K7JbbJVBoFAMHZNeU+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869678; c=relaxed/simple;
	bh=e5U0U0Jx+3rxRT0k6XN01ajEY0mjjd9cbDBSKldKw5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JKHyN/9aWVntYMilvb4S8Hc2qc92JT6rsWWJ9/E24MjH4Wu6Eu+6hg4NKS44yDu2epvu0J3U43ZPhza5YqLJIDY2el3mogAuZXrzMYvlFGdAUNrG1Tq3BgjlMa05byZHj51m9CAKw86u5Dj1CmTvNrjG3rFiewd2MQQgngDiCqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B83C4CEC3;
	Fri, 25 Oct 2024 15:21:17 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 466CB5F870;
	Fri, 25 Oct 2024 23:21:15 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20241023075917.186835-1-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v3 0/7] ASoC: add Allwinner H616 audio codec
 support
Message-Id: <172986967525.723095.17341687251793477251.b4-ty@csie.org>
Date: Fri, 25 Oct 2024 23:21:15 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 23 Oct 2024 20:56:56 +1300, Ryan Walklin wrote:
> V3 of this patch adding support for the Allwinner H616 (and variant)'s audio codec. Some clarification of comments, particularly regarding the clock driver changes, and a small fix for the device tree binding (apologies I forgot to re-run dt_binding_check on V2). Review comments otherwise addressed and reviews noted.
> 
> Changelog v1..v2:
> - Reordered patches to group ASoC changes
> - Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
> - Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
> - Restrict TX-only DMA changes to the H616.
> - Change the codec name to fit into the 16 char limit.
> - Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
> - Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).
> 
> [...]

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/7] clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
      commit: d0c322b6e4bff8cc0e40ee4983bf2ab1f7f680f0

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

