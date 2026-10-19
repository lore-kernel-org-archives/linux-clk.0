Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95234E5346;
	Mon, 19 Oct 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414814; cv=none; b=s0gTSZRATppBTH3FX0nbAhJKHXvxnlGwjX+Aa9HqC5mo3QaVWc2Q9zX47qLhki3UmpnY9JRGztkFolqCvlCrwveAy+h3/7a5cXAs/ocH4gvc2xrhgWtMVRY1wyHr9tlHr9G2+M9O8PJTAVDPVsHGimm0h/31mBCErnFLGc4zhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414814; c=relaxed/simple;
	bh=knd/gj40sFjRqKe6w/LldOmiWgAoLSPveNh/KSsbFUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjRO3phZXHTu3a25dn4+n6Fa9ySmTr9LHA7nfNbF77MUHG2GzHmnxPIawwgVPl1l6hOSLJKWK1lph1XjtoxH+TgXndjH62M3f0IhURAcnYahJQ/JqLsRd8ss7SX+UphXLntAT6slLGmQnqqtmoohfqmohaXCw4ZR5UkUeFCv9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSPj/zDu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSPj/zDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666021F000C4;
	Mon, 19 Oct 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792414813;
	bh=b0A77YKTXFaxgjm9V8KIMJopVwoJ/660eC1eVvp9d34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XSPj/zDuNsxfx3U50cQyoHped1vFYlIc2Iu+XRBXCMaElueT1xVtC58uIAt5wjF/e
	 7YW6KxRz+eRQXaH/r7SYZ9zL/RjsgeFx5U6Ektj3jPB3uhryUuVzebY5/B0hUI/blI
	 AcTIXAKF+odndyhwA25tS/cMXg68qcjGuoMsLC5QLUPPPLNrcSprOF05tqX68fqvbs
	 J/dITzp/3HJKrskr0gpdFUwokxh84nEJympudRc78WlRprLhdjojvEsSzDv34bwhQe
	 izoH/geTqrOs/JeL6xKASm6jvzmhVhDyvMnreGxbE8e3r8X7UfxfeCriCl2TsdYilT
	 3aIXcBsx94QGg==
Message-ID: <fa2e9997-6124-42c0-959c-ec920ee9cbeb@kernel.org>
Date: Mon, 19 Oct 2026 16:00:09 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
 "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
 <TY3PR01MB1134614C56D70F75D2C3214D986982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <TY3PR01MB1134614C56D70F75D2C3214D986982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 10/19/26 15:36, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@kernel.org>
>> Sent: 19 October 2026 13:25
>> Subject: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and critical resets for s2idle
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> When the system suspends to s2idle, any of the IP blocks may be in the wakeup path. For a device in the
>> wakeup path, the generic PM domain (genpd) does not disable/enable its clocks across suspend/resume. Re-
>> initializing the MSTOP bits for such a device leads to synchronous aborts when its registers are accessed
>> for the first time after resume.
>>
>> In a suspend mode that is not controlled by firmware, power to the SoC is not lost, so the MSTOP and
>> critical reset state is retained and does not need re-initialization in the first place. Skip it when
>> pm_suspend_via_firmware() reports such a mode.
>>
>> Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>   drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c index
>> f6293c968bcf..3d2281456036 100644
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/reset-controller.h>
>>   #include <linux/slab.h>
>>   #include <linux/string_choices.h>
>> +#include <linux/suspend.h>
>>   #include <linux/units.h>
>>
>>   #include <dt-bindings/clock/renesas-cpg-mssr.h>
>> @@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
>>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>>   	int ret;
>>
>> +	if (!pm_suspend_via_firmware())
>> +		return 0;
>> +
> 
> Please move this after deassert, otherwise it will lead to SCIF not getting console
> prompt during s2idle as reset is asserted during suspend?
How did you reproduce this?

Who asserts the SCIF reset in s2idle?

Is the s2idle done with the help of firmware in your case?

If you have issues on any of your platforms could you check after applying this 
patch: 
https://lore.kernel.org/all/20261005111157.17256-1-ovidiu.panait.rb@renesas.com/ ?

Thank you,
Claudiu
