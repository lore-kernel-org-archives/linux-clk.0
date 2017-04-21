Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:50400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1041567AbdDURlO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Apr 2017 13:41:14 -0400
MIME-Version: 1.0
In-Reply-To: <E1d1cLy-0001qc-PC@debutante>
References: <1492795191-31298-6-git-send-email-s.nawrocki@samsung.com> <E1d1cLy-0001qc-PC@debutante>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 21 Apr 2017 19:31:42 +0200
Message-ID: <CAJKOXPebDt030tcdBGya4Wpm8HCvMqyM7qJzDvibmvnMttH-FA@mail.gmail.com>
Subject: Re: Applied "ASoC: Add Odroid sound DT bindings documentation" to the
 asoc tree
To: Mark Brown <broonie@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, jy0922.shim@samsung.com,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>, robh+dt@kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 21, 2017 at 7:28 PM, Mark Brown <broonie@kernel.org> wrote:
> The patch
>
>    ASoC: Add Odroid sound DT bindings documentation
>
> has been applied to the asoc tree at
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
> From 92c9f05ebc7290e638c7b1b85288918c4fc65d4e Mon Sep 17 00:00:00 2001
> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Date: Fri, 21 Apr 2017 19:19:49 +0200
> Subject: [PATCH] ASoC: Add Odroid sound DT bindings documentation
>
> This patch adds DT binding documentation for Odroid XU3/4
> sound subsystem.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  .../devicetree/bindings/sound/samsung,odroid.txt   | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt


Hi Mark,

Although Sylwester is known of writing good quality code and can be
trusted but he posted it just 9 minutes ago. Isn't it a little bit too
fast to apply? I just finished reading cover letter but didn't manage
to start looking at the rest. :)

Best regards,
Krzysztof
