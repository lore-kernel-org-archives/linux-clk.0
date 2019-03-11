Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F394C43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 14:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1D2320657
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 14:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=nelint.com header.i=@nelint.com header.b="H5yNOBrs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfCKOC6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 10:02:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42652 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfCKOC6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 10:02:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id n74so3762752pfi.9
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nelint.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7a64RIAQDwKVyFqy1XdgNWky8hgCqGay2wB34badhI8=;
        b=H5yNOBrsFMdnA4xV9x7tW743xVtQTLqf1+XD2ZlO0n8j8x38SKd5ItQTyJQigDxW0y
         LoCwgk3yCjaIj67xT2927mO85Lw5KftggtQCeP/AhD0b71LOHejkpGdf0Bhe8GLmUDNc
         DC30BssWsBvAeHGln+7DEBXabMFgc+MJGgWAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7a64RIAQDwKVyFqy1XdgNWky8hgCqGay2wB34badhI8=;
        b=FTMGeCjvr4wO4k3sPbTe6lSJLPMi6gL7e0GIx4CmuQ2UXYjs5uL0VFQ53xpeX3POs+
         3nlQ6bNhK6qNMRhWoSZ/sX6w1xjxSEg25gCIn57la6FeRJvAML8ruLqbt33UDOW2JMbZ
         61LcuSdjxhciQKqZT8e/YhTJ5gu27jIQjIPVaM/czBWAymNXSgTG27VPyU42nFSWozrj
         81DaxvnkxHz+GOGMyDhl9g94DxGigdESTLUZhTMgiBVZiBhK04w1QvYKXnGm4pcNFuiE
         MNQbwa29btbm1oUCaHiNhiCjjZyArsC7PZhAHelNMO8vPh2+kN2QmfxAPJjZg0tfqGgX
         bUOw==
X-Gm-Message-State: APjAAAVXZTtbSfeuKnRykMNhUM2abqvfyZiOAPYMU0o1tUuhdLZncdBd
        mUWyOC17jQcXiH6mmxolaGfrMQ==
X-Google-Smtp-Source: APXvYqwi9yU2YvH/l+6VN67F0vo0jMQJff/cpmFXQb0HIlDW7cRAT5CrrlxWUfs/XDCBPCDjw19+Bg==
X-Received: by 2002:aa7:8d53:: with SMTP id s19mr34001506pfe.16.1552312977366;
        Mon, 11 Mar 2019 07:02:57 -0700 (PDT)
Received: from ?IPv6:2600:8800:1301:2190:cc32:ad00:b1c0:818c? ([2600:8800:1301:2190:cc32:ad00:b1c0:818c])
        by smtp.gmail.com with ESMTPSA id c2sm8087246pfd.159.2019.03.11.07.02.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 07:02:56 -0700 (PDT)
Subject: Re: [PATCH] clk: imx6q: remove unsupported pll4_audio_div
To:     Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org
Cc:     anson.huang@nxp.com, clement.peron@devialet.com,
        colin.didier@devialet.com, devicetree@vger.kernel.org,
        festevam@gmail.com, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org,
        s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org,
        tiny.windzz@gmail.com
References: <1552259930-27786-1-git-send-email-eric@nelint.com>
 <1552304271.2453.12.camel@pengutronix.de>
From:   Eric Nelson <eric@nelint.com>
Message-ID: <6eeb02d8-62fe-6b2a-d265-b437a02ef8d1@nelint.com>
Date:   Mon, 11 Mar 2019 07:02:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1552304271.2453.12.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Lucas,

On 3/11/19 4:37 AM, Lucas Stach wrote:
> Hi Eric,
> 
> Am Sonntag, den 10.03.2019, 16:18 -0700 schrieb Eric Nelson:
>> The pll4_audio_div attempted to reflect one bit of a two-bit
>> divisor (AUDIO_DIV_LSB) in the CCM_ANALOG_MISC2 register.
>>
>> Unfortunately, this divisor is non-functional at least on the
>> latest silicon revisions and has been removed from the reference
>> manual.
>>
>> This is discussed in this NXP Community thread:
>>
>>      https://community.nxp.com/thread/462806
>>
>> Remove the definition of pll4_audio_div to reflect this and
>> reparent the ssi, cko1, and ESAI/ASRC/SPDIF clocks to the
>> pll4_post_div clock.
>>
>>> Signed-off-by: Eric Nelson <eric@nelint.com>
>> ---
>>   drivers/clk/imx/clk-imx6q.c               |   7 +-
>>   include/dt-bindings/clock/imx6qdl-clock.h | 127 +++++++++++++++---------------
>>   2 files changed, 66 insertions(+), 68 deletions(-)
>>

<snip>

>>   
>> diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-bindings/clock/imx6qdl-clock.h
>> index b3cef29..dea23a9 100644
>> --- a/include/dt-bindings/clock/imx6qdl-clock.h
>> +++ b/include/dt-bindings/clock/imx6qdl-clock.h
>> @@ -213,69 +213,68 @@
>>>   #define IMX6QDL_CLK_CKO2			200
>>>   #define IMX6QDL_CLK_CKO				201
>>>   #define IMX6QDL_CLK_VDOA			202
>>> -#define IMX6QDL_CLK_PLL4_AUDIO_DIV		203
>>> -#define IMX6QDL_CLK_LVDS1_SEL			204

<snip>

>>> +#define IMX6QDL_CLK_LVDS1_SEL			203
>>> +#define IMX6QDL_CLK_LVDS2_SEL			204
>>> +#define IMX6QDL_CLK_LVDS1_GATE			205

<snip>

> 
> You can not renumber the DT clock defines, as this breaks DT backward
> compatibility. You can however remove IMX6QDL_CLK_PLL4_AUDIO_DIV and
> leave a hole in the numbers, maybe with a comment about why it exists.
> 

Okay. I wasn't aware of this requirement, and I'll send a V2.

It will also make the patch much smaller!
