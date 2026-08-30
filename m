Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5049B212;
	Tue,  1 Sep 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286829; cv=none; b=HToZfpXE40nFw3/GF9tseUZCRcsvohs0TLTp/YfxncWKKfuQn6GMGBxq4pCoVeaIMc8B6do+jUHWQpSgaw7plbWfh2y7bMLljnaTJ01UN+uuJDSjYpYvDFJizZldo0PxBWZs1eCSWfNwjugXEdZm/MCsfmAKKz1wYpIlK663Iv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286829; c=relaxed/simple;
	bh=DKgfyVbofqDzA/MOsM4DBxeNKSOEExGEVqcGPbIy//w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XYqfUNcFlXTTAff0iMz42O6RtW3gYaOcYnG1hbYI641tROiGCe5O0CsJwvDcqIPG+TllwgJVYPc3BC1g0kCalGsM8aKwhqtuBiioCnlJrvVmkbfe8yW78j+33ud8GChCWVJPu5BZzar0Kd7pS5JxIMy1SZoJMyRI0i4HFXFj3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmMODAd7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmMODAd7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3066F1F000E9;
	Tue,  1 Sep 2026 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286828;
	bh=EloQfZ2mL/lXfqlR6ymHVzXiIi84Uaj0B75ZbDX4aQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CmMODAd7w9+mHLAH5offUIqUAeOpWfJbnUsZTGkIrggUnGxVCyqYG1czkio+K1aVo
	 eLGg2kSqRBD4da5zaKlSUBMz7Q+b2T5r1ym3FwmSXz1salDyvhIy19l0+rXmWuY05C
	 yNHuWVzQ51Ki7QX9tRCj7t+luIsI7551AWE+6FIWsT+HThc/GGdNDFgpUUXz+lB6X9
	 b6Iwl/oeFCPIXClT3/TQLs3DIr73Q+bWZUpOEU6CnyvwxlIMNmqtOf/+2H8Bm0cLEY
	 soSMhVKpwJL/g4EpLwiEaPO7zmRf5E3uA2jShxCR+RKKZnjfeqa2xb5W+xZA2ejtlg
	 S907OC0XEGqvQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <cover.1787239902.git.geert+renesas@glider.be>
References: <cover.1787239902.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/3] ASoC: Make sure clk_init_data is fully initialized
Message-Id: <178813056998.13461.16219353923059804507.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DKgfyVbofqDzA/MOsM4DBxeNKSOEExGEVqcGPbIy//w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxdndR4NJry+vIrGpBTF6GDpEqEC7fFg19o2B
 CMFuwVTD3uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXZwAKCRAk1otyXVSH
 0KIAB/4oT/wIau+4AIhcu4yLr06yLsb/FtYEed7GoXPvG12sNcWNkowVM3yPYrS16vTF/PVVky6
 i0hqhFMG2KJBPxWIohjes9jJdVaTYLQ6AXzySrdknEoe6/12ozq+AmmwZ5k61JN/riXbqX84Yjw
 4mtub2w51nW1AQjrOPgT6ep7pTFMTaiOp0r6k+4mgAoFR1JMvABm/Q6yIFpGoulFrGd5ED7TCQk
 vTFE3LPihQIm4ZRFXXyuVLun06EvJyDzqB+pdHPZxTzeGThFKeyMYu9fiXZaLMGgLtZz2mYjhs6
 VzaR4jQHPd20wl+ZFCSpnKRRRF40XA1LZITfC022t0IJo4Bc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 21 Aug 2026 10:52:54 +0200, Geert Uytterhoeven wrote:
> ASoC: Make sure clk_init_data is fully initialized
> 
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/3] ASoC: codecs: lpass: Make sure clk_init_data is fully initialized
      https://git.kernel.org/broonie/sound/c/2cf55c64e64e
[2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is fully initialized
      https://git.kernel.org/broonie/sound/c/738a163b7ad5
[3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is fully initialized
      https://git.kernel.org/broonie/sound/c/f1b2a0434b5b

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

