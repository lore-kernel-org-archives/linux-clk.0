Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF4AC282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:35:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A596E2086C
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="JxLiMUmq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="BL3IIAro"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbfBBPfR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:35:17 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:43806 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfBBPfR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:35:17 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 48C7F60867; Sat,  2 Feb 2019 15:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121716;
        bh=odvhl6fhxVV1blHQ43C+gJwnh7H4jQeJmnbETUwZm+E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JxLiMUmqSZtAfa7OHi+wK/k8O/WJEJMfX9XuqFFA0a08klYFSXi/ae5Zoj1zK4AiV
         ONFoim/lG5ceLGeopT3Q8T928cPlbIpHExYyYBRwsiKBc4393pZx+hNkq6HP1TJj9v
         eEsSiNW7gn5/OEtn5f7DZ/m6PsAXkCw+zc7SsGno=
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id C3A7360590;
        Sat,  2 Feb 2019 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121715;
        bh=odvhl6fhxVV1blHQ43C+gJwnh7H4jQeJmnbETUwZm+E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BL3IIAroVA6JaXF8wAPU+DADWBxTd4z1ch6x7NYn3BVuIybyUvvpKqGmuYMP14Mn9
         fyCLbyLsBymSP85v9vbXXcw9zc4OqKi6AAhYqjpwAhKXFN9/12YjAHA4ZdsLltByIw
         59HQWFubx3nWeB79HEtaOHOfGuB8JYNs3ptlVRs8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 02 Feb 2019 21:05:15 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: clock: qcom: Introduce QCOM WCSS
 Q6DSP clock bindings
In-Reply-To: <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-2-govinds@codeaurora.org>
 <154507522782.19322.17858102871851741802@swboyd.mtv.corp.google.com>
Message-ID: <1285eb4d33b796fd523634cead8142bf@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2018-12-18 01:03, Stephen Boyd wrote:
> Quoting Govind Singh (2018-12-15 02:35:51)
>> Add device tree bindings for WiFi QDSP subsystem clock controls
>> found in OCS405 soc.


> 
>> +- reg                  : shall contain base register address and 
>> size,
>> +                         in the order
>> +                       Index-0 maps to WCSS_Q6SSTOP clocks register 
>> region
>> +                       Index-1 maps to WCSS_TCSR register region
>> +                       Index-2 maps to WCSS_QDSP6SS register region
>> +
> 
> Index 0, Index 1, Index 2? Not sure why there's a hyphen there.
> 

Fixed in v4.

>> +Optional properties :
>> +- reg-names    : register names of WCSS domain
>> +                "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
>> +
>> +Example:
>> +The below node has to be defined in the cases where the WCSS 
>> peripheral loader
>> +would bring the subsystem out of reset.
>> +
>> +       clock_wcsscc: qcom,wcsscc@7000000 {
> 
> clock-controller@7000000
> 
>> +               compatible = "qcom,qcs404-wcsscc";
>> +               reg = <0x07500000 0x4e000>, <0x07550000 0x8012>, 
>> <0x07400000 0x104>;
> 
> And then that unit address doesn't match the first offset so that needs
> fixing too.
> 

Fixed in V4.

>> +               reg-names = "wcss_q6sstop", "wcnss_tcsr", 
>> "wcss_qdsp6ss";
>> +               #clock-cells = <1>;
>> +       };

BR,
Govind
