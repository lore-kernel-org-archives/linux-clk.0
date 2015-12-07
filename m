Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01 bindings
To: Mark Brown <broonie@kernel.org>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
 <20151204121153.GZ26072@sirena.org.uk>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-clk@vger.kernel.org
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <5664DBBA.7010006@samsung.com>
Date: Mon, 07 Dec 2015 10:07:06 +0900
MIME-version: 1.0
In-reply-to: <20151204121153.GZ26072@sirena.org.uk>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04.12.2015 21:11, Mark Brown wrote:
> On Fri, Dec 04, 2015 at 10:10:05AM +0900, Krzysztof Kozlowski wrote:
>> The mfd/s2mpa01.txt duplicates some of the information about bindings
>> with old mfd/s2mps11.txt. Now common part exists entirely in
>> mfd/samsung,sec-core.txt so:
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
>>  - add company prefix to file name (regulator/samsung,s2mpa01.txt),
> 
> I'm not 100% convinced about these prefixes BTW, the duplication isn't
> usually an issue within a subsystem.  They don't do any harm either
> though.
> 

I am not convinced neither... Some of newer documents use prefixes so I
had an impression that this is a more organized way. If there are
objections I can drop it.

Thanks for ack!

Best regards,
Krzysztof
