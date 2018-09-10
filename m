Return-Path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 Ingo Molnar <mingo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, matt@codeblueprint.co.uk,
 hkallweit1@gmail.com, Kees Cook <keescook@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Michal Simek <michal.simek@xilinx.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-clk <linux-clk@vger.kernel.org>, rajanv@xilinx.com,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Jolly Shah <jollys@xilinx.com>
Subject: Re: [PATCH v11 03/11] firmware: xilinx: Add zynqmp IOCTL API for
 device control
To: Olof Johansson <olof@lixom.net>, Jolly Shah <jolly.shah@xilinx.com>
References: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
 <1533318808-10781-4-git-send-email-jollys@xilinx.com>
 <CAOesGMi7Q9L4oZkUubKtV-m8XD67MQ05ZFhPA_0Hwky_qVUxfg@mail.gmail.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <64fbd7ca-48a8-7cb0-af3a-131ee61aef5a@arm.com>
Date: Mon, 10 Sep 2018 09:43:27 +0100
MIME-Version: 1.0
In-Reply-To: <CAOesGMi7Q9L4oZkUubKtV-m8XD67MQ05ZFhPA_0Hwky_qVUxfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 09/09/18 02:18, Olof Johansson wrote:
> Hi,
> 
> On Fri, Aug 3, 2018 at 10:53 AM, Jolly Shah <jolly.shah@xilinx.com> wrote:
>> From: Rajan Vaja <rajanv@xilinx.com>
>>
>> Add ZynqMP firmware IOCTL API to control and configure
>> devices like PLLs, SD, Gem, etc.
>>
>> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
>> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> 
> This patch worries me somewhat. It's a transparent pass-through ioctl
> driver. Is there a spec available for what the implemented IOCTLs are?
> 
> Should some of them be proper drivers instead of an opaque
> pass-through like this? Could some of them have stability impact on
> the platform such that there are security concerns and the list of
> arguments should somehow be sanitized?
> 
> What's the intended usecase anyway? Just a debug tool during
> development, or something that you expect heavy use of by some
> userspace middleware?
> 

Thanks for pointing this out. My earlier attempts were ignored[1]
and I gave up.

-- 
Regards,
Sudeep

[1] https://lkml.org/lkml/2018/5/10/298
