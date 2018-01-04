Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1515049684-23481-2-git-send-email-zhang.chunyan@linaro.org>
References: <20171207125715.16160-1-chunyan.zhang@spreadtrum.com>
 <1515049684-23481-1-git-send-email-zhang.chunyan@linaro.org> <1515049684-23481-2-git-send-email-zhang.chunyan@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Jan 2018 17:51:29 +0100
Message-ID: <CAK8P3a0NNQYkXjYLZoPpzacc0pf8Cydv7muVigm_r9UsMqO_og@mail.gmail.com>
Subject: Re: [RECEND PATCH V7 12/12] arm64: dts: add clocks for SC9860
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: arm-soc <arm@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 4, 2018 at 8:08 AM, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
> From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>
> Some clocks on SC9860 are in the same address area with syscon devices,
> those are what have a property of 'sprd,syscon' which would refer to
> syscon devices, others would have a reg property indicated their address
> ranges.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>

Applied, thanks!

     Arnd
