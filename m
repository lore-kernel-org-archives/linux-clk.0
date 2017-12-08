Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:38483 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753359AbdLHOWj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Dec 2017 09:22:39 -0500
Subject: Re: [PATCH v5 2/4] clk: meson-axg: add clocks dt-bindings required
 header
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>
References: <20171207095300.15384-1-yixun.lan@amlogic.com>
 <20171207095300.15384-3-yixun.lan@amlogic.com>
 <20171207221014.6qwcb43w5hms4ma5@rob-hp-laptop>
 <1512725587.17256.19.camel@baylibre.com>
CC: <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Carlo Caione <carlo@caione.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <060fab5b-0832-198d-9aab-d986a909c449@amlogic.com>
Date: Fri, 8 Dec 2017 22:22:36 +0800
MIME-Version: 1.0
In-Reply-To: <1512725587.17256.19.camel@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/08/17 17:33, Jerome Brunet wrote:
> On Thu, 2017-12-07 at 16:10 -0600, Rob Herring wrote:
>> On Thu, Dec 07, 2017 at 05:52:58PM +0800, Yixun Lan wrote:
>>> From: Qiufang Dai <qiufang.dai@amlogic.com>
>>>
>>> Add the required header for the clocks ID dt-bindings
>>> exported from various subsystem in the Meson-AXG SoC.
>>>
>>> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
>>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>>> ---
>>>  include/dt-bindings/clock/axg-clkc.h | 71
>>> ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
>>
>> Please add acks when posting new versions.
>>
>> Rob
> 
> Yixun, please be consistent about this. Maintainers are not going to dig
> through your previous revision to collect Tags
> 
> I believe Neil acked patch 3, didn't he ?
> 
> Please resend your series with the Tags collected
sorry, I missed Neil's ACK for the pacth [3/4]

let's just wait for a few more days, to see if there are more comments
coming up, then I would fold them together

> If not already done, please make sure patches 1-3 apply on top of rc1 and patch
> 4 on Kevin's dt64 branch.
> 
the above is already base on -rc2, and patch 4 can apply to kevin's dt64
cleanly

> Thanks
> Jerome
> 
> .
> 




