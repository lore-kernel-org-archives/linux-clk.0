Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33913 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763529AbdDSNIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2017 09:08:12 -0400
Received: by mail-lf0-f65.google.com with SMTP id x72so2360483lfb.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2017 06:08:12 -0700 (PDT)
Date: Wed, 19 Apr 2017 05:29:56 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Amlogic 64-bit DT updates for v4.12 (redo)
Message-ID: <20170419122956.GK17004@localhost>
References: <m24ly37kzk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m24ly37kzk.fsf@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 04, 2017 at 05:31:59PM -0700, Kevin Hilman wrote:
> Hi Arnd, Olof,
> 
> Here's a redo of the Amlogic 64-bit DT updates for v4.12.
> 
> This DT branch includes all our DT updates, plus merges in a clock
> branch that includes only clock header and binding updates which are
> dependencies.  This shared branch/tag is immutable and shared with the
> clock tree.
> 
> I hope this iteration passes muster,
> 
> Kevin
> 
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-redo
> 
> for you to fetch changes up to b2121170143bf4708c657461740c922ce24bc94e:
> 
>   Merge tag 'amlogic-clk-headers' into v4.12/dt64 (2017-04-04 16:16:52 -0700)
> 
> ----------------------------------------------------------------
> Amlogic 64-bit DT updates for v4.12
> - pinctrl: new pins for audio
> - clocks: more clocks exposed for GFX, audio
> - new board: Khadas Vim (S905X)
> - new board: HwaCom AmazeTV (S905X)
> - ethernet phy: add GPIO resets

Merged, thanks.


-Olof
