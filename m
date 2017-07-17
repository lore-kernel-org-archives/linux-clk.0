Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:48645 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751293AbdGQROt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2017 13:14:49 -0400
Subject: Re: [PATCH] dt-bindings: clock: ti-sci: Fix incorrect usage of
 headers
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Suman Anna <s-anna@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20170711223615.29398-1-s-anna@ti.com>
 <20170712010923.GP22780@codeaurora.org>
 <20170717170457.4pkb6qaa3qbept5n@rob-hp-laptop>
From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Message-ID: <eeda0027-259b-4494-42d6-4f380d230134@oracle.com>
Date: Mon, 17 Jul 2017 10:14:49 -0700
MIME-Version: 1.0
In-Reply-To: <20170717170457.4pkb6qaa3qbept5n@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 7/17/2017 10:04 AM, Rob Herring wrote:
> On Tue, Jul 11, 2017 at 06:09:23PM -0700, Stephen Boyd wrote:
>> On 07/11, Suman Anna wrote:
>>> The clock consumer usage description was erroneously referring to
>>> couple of dt-binding headers that are no longer valid. The definition
>>> and/or usage of these headers is incorrect and the only file present
>>> at the moment, dt-bindings/soc/k2g.h is also being cleaned up. The
>>> examples in this binding were updated properly, but the update to
>>> description was missed out. So, fix this.
>>>
>>> Fixes: 8f306cfe4383 ("Documentation: dt: Add TI SCI clock driver")
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>> Hi Stephen,
>>>
>>> Looks like this was missed during the update/repost of the ti-sci-clk
>>> driver/binding. FYI, Santosh is going to pickup the header file cleanup
>>> patch https://patchwork.kernel.org/patch/9741279/ for the next merge
>>> window.
>>
>> I'll let Rob apply this as it is purely a binding document update.
> 
> Applied.
> 
Thanks Rob !!
