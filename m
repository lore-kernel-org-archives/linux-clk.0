Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA0C43334
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 17:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357992AbiFORuU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 13:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349807AbiFORuU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 13:50:20 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E303D5403C
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id g186so12056594pgc.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1jMu+lGlLUwxIWSFxtxOqoxXa/O8y+ZJH6Jya8QmVS4=;
        b=i9YjTi5IhhH6B1eVTcD7vZp7dzPi7c05gv6//PZkCoCOEIvpGuYvj3dEghm9izJvC2
         8OUWFh2YvuBTdcjTU372xEWxRV1lUYPQRcXz7SxgYhN+Ab1txjF7N3MRHK3Lh45OjTSL
         Ase4zsKsalkoKI4I9LHqh9NuddjJSdL/HSR1GdOBTcmILZPrSYoqf45z2INpMZ5ZIdwh
         zr8ZK/Nz1w06bwVKiH7sR9I2YBfmO/BCf6mJ7fpFJC12BwKVkRGmpUBYwWac/qSjd+lo
         WNCfJFIN339BbeVXAngEtr2RGmA5EM0UIYG+lR0iO8WMBILzOElXhZBOd23GfmSBvHDG
         M4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1jMu+lGlLUwxIWSFxtxOqoxXa/O8y+ZJH6Jya8QmVS4=;
        b=ugty0QlkTAJyeeXSzpgrCS84RXlyOXCGSKlFzVW/35gHZWQto9DJvFwyT+pKI1J4Yh
         pCcpJhdU9TTArf12c2GO2gNTqJrzmXZqcEBmqqMJezSq85wQdjIuHBexEirp3hTMb9Yu
         l29XgI+GuZCLqOxDTlwxKgq6E27nswrjUizUDRlD856P6a9hJY4opNNQKYkQtThiv+5f
         lymnTxdbjnHHbm/obrmePvAvj3eh++9inKNdXeh5yr0kSbL1Onnwj/TlCYdbxliu2Zjg
         viZgkjServKPsLtf45ovSGccCo3TRTlE1Jj3o1A20HPs7yWNQsWrXevCpF5qwdqpI4hc
         FNcA==
X-Gm-Message-State: AJIora/wGLkM+JBkOA4H28C8toeeDTpSf0KK0WpfZRsuoc8kgga56/Sl
        qo2zvF1+VgNscY++tAjlKwWhIg==
X-Google-Smtp-Source: AGRyM1tgx5wd//aRy3L6R0T8NZ35VS+4Jjjtdj74hI5yzt3PaMKVofPzTq+GGVbzPuXw0Vby1azuDw==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr788601pgw.223.1655315418377;
        Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id br8-20020a056a00440800b00518a473265csm10034338pfb.217.2022.06.15.10.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:50:17 -0700 (PDT)
Message-ID: <717ad899-31ad-5e70-b299-ffb8ca287071@linaro.org>
Date:   Wed, 15 Jun 2022 10:50:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add pcm reset for ipq806x lcc
Content-Language: en-US
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220615163408.30154-1-ansuelsmth@gmail.com>
 <a92fe431-a995-4c7f-b90b-8e80298bc71a@linaro.org>
 <62aa1b41.1c69fb81.95632.5b71@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62aa1b41.1c69fb81.95632.5b71@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/06/2022 09:53, Ansuel Smith wrote:
> On Wed, Jun 15, 2022 at 10:43:10AM -0700, Krzysztof Kozlowski wrote:
>> On 15/06/2022 09:34, Christian 'Ansuel' Marangi wrote:
>>> Add pcm reset define for ipq806x lcc.
>>>
>>> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
>> To prevent any confusion about identities (we have strict rules about
>> these), I need to ask - who uses this email address?
>>
>> https://lore.kernel.org/all/?q=ansuelsmth%40gmail.com
>>
>> Best regards,
>> Krzysztof
> 
> Same person. Started using extended name, wanted to do this change from
> a long time but all the patch were already pushed so I couldn't change
> it since they were already proposed and on the various mailing list.

Previously "Ansuel Smith" was used entirely, without any parts of this
name. Here 'Ansuel' appears in quotes, which usually is used for nicknames.

Is "Ansuel Smith" your real name or a nickname? What do you mean by
"extended name"?


Best regards,
Krzysztof
