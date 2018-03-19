Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH v3 08/10] clk: qcom: Add ACD path to CPU clock driver for
 msm8996
To: Stephen Boyd <sboyd@kernel.org>, Ilia Lin <ilialin@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, sboyd@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-9-git-send-email-ilialin@codeaurora.org>
 <152147863176.242365.17292287330283256524@swboyd.mtv.corp.google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <41f3b246-43f4-450d-5c6b-34cdad7b15dd@arm.com>
Date: Mon, 19 Mar 2018 18:16:15 +0000
MIME-Version: 1.0
In-Reply-To: <152147863176.242365.17292287330283256524@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org,
 robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org,
 tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 19/03/18 16:57, Stephen Boyd wrote:
[...]
>> +
>> +       if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
>> +               /* Enable Soft Stop/Start */
> 
> Sigh.
> 
>> +               if (vbases[APC_BASE])
> 
> When is this false?
> 
>> +                       writel_relaxed(SSSCTL_VAL, vbases[APC_BASE] +
>> +                                       PWRCL_REG_OFFSET + SSSCTL_OFFSET);
>> +               /* Ensure SSSCTL config goes through before enabling ACD. */
>> +               mb();
> 
> Use writel instead.

Note that writel() only gives an implicit wmb() *before* the store to 
ensure ordering against any previous writes. If this code really needs 
to ensure that the given write has definitely completed before any other 
accesses happen, then it still needs an explicit barrier *after* the 
write*(), unless perhaps the next access is always guaranteed to be a 
non-relaxed write (thus implicitly providing a suitable DSB).

Robin.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
