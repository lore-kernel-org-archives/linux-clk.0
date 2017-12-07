Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, jassisinghbrar@gmail.com,
 bjorn.andersson@linaro.org, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <CAHLCerMok=-0hFLm27_VzSWzC7nArmTz+shQH05DAuBr3An9qw@mail.gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <176b5b3a-d1da-247a-1a90-acf7624df460@linaro.org>
Date: Thu, 7 Dec 2017 18:00:37 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLCerMok=-0hFLm27_VzSWzC7nArmTz+shQH05DAuBr3An9qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Amit,

On 12/06/2017 07:51 AM, Amit Kucheria wrote:
> On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov@linaro.org> wrote:
>> This patchset adds support for the A53 CPU clock on MSM8916 platforms
>> and allows scaling of the CPU frequency on msm8916 based platforms.
> 
> Though it currently needs some additional patches (that'll follow
> soon), FWIW, Tested-by: Amit Kucheria <amit.kucheria@linaro.org>

Thanks for testing! I will submit the platform specific dts changes as
separate follow-up patches when this is merged.

BR,
Georgi
