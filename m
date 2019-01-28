Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28A2C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 17:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66CBA20881
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 17:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZ+AhGt3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfA1RrA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 12:47:00 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38299 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbfA1Rq7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 12:46:59 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so19034571wrw.5
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 09:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ucQoGI6eeDkSCShaaooJTeyuH9/2ggLECWyCdy0UcdE=;
        b=AZ+AhGt3GDIcMDCN1ieBAUHdPcIEf54BWaUxhx8Zh3G8HMNDOOmQLKzhMx3kePnFK7
         ugDXMg51x++zWteWlx6INVaP1eUhiZkNQ/8kzRLOBPwRSbSGuRU6BpoV09f2xnTEj1Po
         GBELGfL6ywrs8GSnUz3MQ8TwsJQqTTEu0Sk/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ucQoGI6eeDkSCShaaooJTeyuH9/2ggLECWyCdy0UcdE=;
        b=W0W97j5KyOo+XhgJSbwQH7KSBjJxY6G4ol3NZxfCrs9pvLF3iyLayeSa9tp0XofB24
         q+mWPaqepvB7xmiMjNpLNZz7Z5zTAoTRIB2G+b9w49PyXNbYQY1EqW/h0X2ILRlWpZv1
         yDArHSVcDUoLMZRZic/Z7PiXbYhPoV74E/8IvLUxEYaYVwFIQsaugLrl0PVebKhs6Kwd
         BtPCR2HmJ3zHXCW9up18fDYR/GNcbG04r+46uRxDTrWWyl1QNF6MlfkuSsqBB4Ehf/Rs
         EvJR4d4ggwSu6AMeFLmmKctO1sMzywKzhZppjawyMkrleaOEbyaG3NGXBAT+zh+U04mC
         oK0A==
X-Gm-Message-State: AJcUukdM7RJioagH4QCBiHK0rBMhsvbIt8nG2mPUbafR38VVuEPXIvEs
        Vwla57PKEU/NoEZ/VBBnbhO0bdX6O9s=
X-Google-Smtp-Source: ALg8bN5c7UXcptN0BFXX6GWnquBg0Rtoe+FpTxTz8kwdYPBw190i5XL5ybDbrHt2ua8a+GUIQBbQAw==
X-Received: by 2002:a5d:4652:: with SMTP id j18mr23337367wrs.279.1548697616367;
        Mon, 28 Jan 2019 09:46:56 -0800 (PST)
Received: from [192.168.1.2] (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id c14sm96884wme.13.2019.01.28.09.46.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 09:46:55 -0800 (PST)
Subject: Re: [PATCH 04/13] dt-bindings: mailbox: qcom: Add clock-name optional
 property
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com,
        vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-5-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190117064411.GK25498@builder>
 <83e77b69-9a22-641f-ada9-7dac565160e1@linaro.org>
Message-ID: <be1a6252-2854-c095-e8aa-05b3e35c83c4@linaro.org>
Date:   Mon, 28 Jan 2019 18:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <83e77b69-9a22-641f-ada9-7dac565160e1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/28/19 17:57, Jorge Ramirez wrote:
> On 1/17/19 07:44, Bjorn Andersson wrote:
>> On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:
>>
>>> When the APCS clock is registered (platform dependent), it retrieves
>>> its parent names from hardcoded values in the driver.
>>>
>>> The following commit allows the DT node to provide such clock names to
>>> the platform data based clock driver therefore avoiding having to
>>> explicitly embed those names in the clock driver source code.
>>>
>>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>>> ---
>>>  .../bindings/mailbox/qcom,apcs-kpss-global.txt      | 21 +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> index 1232fc9..f252439 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>> @@ -23,6 +23,10 @@ platforms.
>>>  	Value type: <phandle>
>>>  	Definition: phandle to the input PLL, which feeds the APCS mux/divider
>>>  
>>> +       Usage: required if #clock-names property is present
>>> +       Value type: <phandle array>
>>> +	Definition: phandles to the two parent clocks of the clock driver.
>>
>> I presume you meant to replace the existing definition of "clocks"?
> 
> I am sorry didn't reply to this earlier. Yes this is not very clear.
> 
> This is required as an extension to the apcs-msm8916.c driver also used
> on the qcs404; since it is an extension, the previous definition should
> still be applicable.
> 
> In the case of the msm8916 the #clock-names property is NOT necessary
> (it would be ignored by the driver), so having it should not mean that
> we need to have #clocks.
> 
> In the case of the qcs404, having clock-names means that we do need to
> have #clocks (hence the additional if)
> 
> and not quite sure how to word this condition in the bindings..
> 
> I am going to post v2 with some updates and if required will post a v3
> with more clarifications.

In the version that I am about to post I ended up following your
suggestion:  replaced the existing definition (and the apcs mailbox node
msm8916.dts) but  kept bacwards compatibility in the driver (so old
bindings will still work).

That should enable migration to the new bindings -as per the
documentation - for new platforms (something that IIRC sboyd also asked for)

> 
>>
>> I think the purpose of "required if #clock-cells" comes from that
>> meaning that it represents a clock-controller if #clock-cells is
>> specified, in which case it requires the upstream clock(s).
>>
>> Regards,
>> Bjorn
>>
>>> +
>>>  - #mbox-cells:
>>>  	Usage: required
>>>  	Value type: <u32>
>>> @@ -33,6 +37,12 @@ platforms.
>>>  	Value type: <u32>
>>>  	Definition: as described in clock.txt, must be 0
>>>  
>>> +- clock-names:
>>> +	Usage: required if the platform data based clock driver needs to
>>> +	retrieve the parent clock names from device tree.
>>> +	This will requires two mandatory clocks to be defined.
>>> +	Value type: <string-array>
>>> +	Definition: must be "aux" and "pll"
>>>  
>>>  = EXAMPLE
>>>  The following example describes the APCS HMSS found in MSM8996 and part of the
>>> @@ -65,3 +75,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
>>>  		clocks = <&a53pll>;
>>>  		#clock-cells = <0>;
>>>  	};
>>> +
>>> +Below is another example of the APCS binding on QCS404 platforms:
>>> +
>>> +	apcs_glb: mailbox@b011000 {
>>> +		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
>>> +		reg = <0x0b011000 0x1000>;
>>> +		#mbox-cells = <1>;
>>> +		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
>>> +		clock-names = "aux", "pll";
>>> +		#clock-cells = <0>;
>>> +	};
>>> -- 
>>> 2.7.4
>>>
>>
> 

