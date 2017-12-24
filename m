Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 23 Dec 2017 21:06:26 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Devicetree List <devicetree@vger.kernel.org>
Subject: Re: [PATCH v11 2/6] mailbox: qcom: Create APCS child device for
 clock controller
Message-ID: <20171224050625.GH12655@minitux>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-3-georgi.djakov@linaro.org>
 <CABb+yY146ho0gtbUzDv-Z_xESkU2y=UYfBA6i+522+m58LkABQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CABb+yY146ho0gtbUzDv-Z_xESkU2y=UYfBA6i+522+m58LkABQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri 22 Dec 20:57 PST 2017, Jassi Brar wrote:

> On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> > There is a clock controller functionality provided by the APCS hardware
> > block of msm8916 devices. The device-tree would represent an APCS node
> > with both mailbox and clock provider properties.
> >
> The spec might depict a 'clock' box and 'mailbox' box inside the
> bigger APCS box. However, from the code I see in this patchset, they
> are orthogonal and can & should be represented as independent DT
> nodes.

The APCS consists of a number of different hardware blocks, one of them
being the "APCS global" block, which is what this node and drivers
relate to. On 8916 this contains both the IPC register and clock
control. But it's still just one block according to the hardware
specification.

As such DT should describe the one hardware block by one node IMHO. The
fact that we in Linux split this into two different drivers is an
unrelated implementation detail.

Regards,
Bjorn
