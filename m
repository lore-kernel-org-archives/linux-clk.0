Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2332622B650;
	Thu, 24 Oct 2024 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729801012; cv=none; b=TPgcxwXZUmZ59jO7K9xdNDyeqVXZokxBe5o5aoQ2CsHb5Uk7djpWMV3Z8myAUYWxZnY10/wNcwCxnBpmtBd8FIfOSlB6Ex2kngXRmC5jZMEaAEJAvs5cvdPUPYcaYoTc1JT7Z1LCCnZzpgYx3IMd5zQlhnKt12lsJmsm3nGFtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729801012; c=relaxed/simple;
	bh=M8Hou7W+/slEq6beBx1BMbstELY0N17vo5D8dtjCwaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CYNw+Wc2UFnzVBQPBSzFSPLQd2+E/lMt7nQ3f6tThI2k0F6DyU1hECFUGeK1g0+bH4zTnKaOFVdecVQ4AQ0RRYbPiNlyQkZbLMrsXx9X30bZp2fwfiGRtlud6zEHdSqrs5y0fCh5KzrCS9NXcXN4vwsdsBAayddnUA1OGx8nlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVlghJjt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVlghJjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B0C4CEC7;
	Thu, 24 Oct 2024 20:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729801011;
	bh=M8Hou7W+/slEq6beBx1BMbstELY0N17vo5D8dtjCwaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uVlghJjtlBAM8RBB0TFYRfF2upDQF6o0IDI3jnzZNQn3qsSu62i4WiMSA0gSD/s0l
	 2/up8sX6KJ6JidEdblO8bvf8drryM0sB78IeFAJz+BPvwXHTGYVav67Pzh6O53PSek
	 l/6dbyNegQAks2AHKlKqRjZuOFZ1gVawYJCHGkwtOvbRfnzVAfdCioXOZxExqIpWp3
	 L7bTdeOYqKrSOcZvW0nEDjRrA6l55aSdbJHzP8syxRBhLHd8ArbcAwaRniUA5iNr2s
	 pVtS5q/mruJa6l6x4Fdsl1xWn5nlmCb0Dz+IXh7JIVoy9YUwvavlL68+N96RQsW0Ou
	 CjOayo9B8dv5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
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
Message-Id: <172980100873.554299.14641282051254983661.b4-ty@kernel.org>
Date: Thu, 24 Oct 2024 21:16:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/7] dt-bindings: allwinner: add H616 sun4i audio codec binding
      commit: 542e19c20506953c03eec57b1cb65355164dfb64
[3/7] ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to quirks
      commit: 5836a9d2ca48bb7473bb10d061c03525d8f4f163
[4/7] ASoC: sun4i-codec: Add playback only flag to quirks
      commit: 9fde21d6c5d1f75c2651442e5aae463545136aad
[5/7] ASoC: sun4i-codec: support allwinner H616 codec
      commit: 9155c321a1d0220a60878f2c99bc79b5a7e34d95

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

