Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137AAC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 21:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhLOVOz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 16:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLOVOz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 16:14:55 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47D1C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 13:14:54 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id bn20so35310237ljb.8
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 13:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6+hLkG5lH/kaUWgpFIbohOH0LsJRkK94UjAK3/LnKG8=;
        b=fkqqZNELKykn+rbm/yy5CJ22azGd6Dtg7XH9k3MINFGprRvc6wkYCuEMLxSlQPXXsO
         RhoPqECGLlOe646CS7jBiv+4m7Jox/w9w3ytMp8XWZebUdsFCsX4C5Mw7CsEBMFmDaoC
         V/NddGfd1D/YIiq7JMOgkwcnryN05Fa6JjkdRfiKqcmHKC1bOVAxOQ7ZlKOXfs36MQ3A
         ufvF16Sawb2oui+oGOEGdX27CKB5cnBxREslvUuFkZOoQpdikkWLvCtDL5LOl5Hgd9hl
         heulQ6INZAj7M3UoPdG5fgWbzV0HiDkNqPcN6FVb9l5cmlslevk3S8xwwZdFrgN7lBYw
         6jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6+hLkG5lH/kaUWgpFIbohOH0LsJRkK94UjAK3/LnKG8=;
        b=5URtPSV1BTKe+9A/XZPK13bXxhDHEX6qw/m//XmkHqK3m9qYZD238+CPNnt8ghAT4V
         +VMYAoyFBMDZx7RjYURMSI3MdI8ZCu+eZ0TUrvnLt6OYTlwEIXmkgw7yz85CoMbM0Mjg
         s7luJsadzrJoUszILq2IdiNZ9izcxUnmZMQqhWrNhiSu6Dtg9fMCiKq6/qMwGabvm1BS
         jIcCoKqvLLAj5ZDe1MpNDMRAKCC41ZTBe9Jt89G/m0gu4v+Ay9ZaGfShjuB7/NPV0vzV
         2xHyjgnizBmNmz3M533D3+OxKeHMtTNW0BM60ocsN5SEyIphLwxvoNOTjNd6ODDPZQ6A
         3Hkw==
X-Gm-Message-State: AOAM5336ZfDFafIqgzF2DjgJwk98Z1hz9QlmUnTCnwNOhbomnyppYM8r
        BA6rzaKaN/PiOZziKnYH4TQxQw==
X-Google-Smtp-Source: ABdhPJzaNhCPg5W4BFNY/qx3VY7VsPJzhzwVPZn2AG7tVRIuHe1xveicxU/+IGyVFVhqSmUMhdaP4g==
X-Received: by 2002:a05:651c:a04:: with SMTP id k4mr11893366ljq.421.1639602892273;
        Wed, 15 Dec 2021 13:14:52 -0800 (PST)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id bj11sm647603ljb.62.2021.12.15.13.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 13:14:51 -0800 (PST)
Message-ID: <995c66b7-ef69-56a4-93cc-59be52977972@linaro.org>
Date:   Thu, 16 Dec 2021 00:14:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] clk: qcom: add API to safely park RCG2 sources
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Mike Tipton <quic_mdtipton@quicinc.com>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
 <20211209083727.30DD2C004DD@smtp.kernel.org> <YbJMnvg/IDwHNeWS@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YbJMnvg/IDwHNeWS@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/12/2021 21:36, Bjorn Andersson wrote:
> On Thu 09 Dec 00:37 PST 2021, Stephen Boyd wrote:
> 
>> Quoting Dmitry Baryshkov (2021-12-07 18:22:09)
>>> Some of RCG2 clocks can become stuck during the boot process, when
>>> device drivers are enabling and disabling the RCG2's parent clocks.
>>> To prevernt such outcome of driver probe sequences, add API to park
>>
>> s/prevernt/prevent/
>>
>>> clocks to the safe clock source (typically TCXO).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> I'd prefer this approach vs. adding a new clk flag. The clk framework
>> doesn't handle handoff properly today so we shouldn't try to bandage
>> that in the core.
>>
> 
> I'm not against putting this responsibility in the drivers, but I don't
> think we can blindly park all the RCGs that may or may not be used.
> 
> Note that we should do this for all RCGs that downstream are marked as
> enable_safe_config (upstream should be using clk_rcg2_shared_ops)
> and disabling some of those probe time won't be appreciated by the
> hardware.

Only for the hardware as crazy, as displays. And maybe gmu_clk_src. I 
don't think we expect venus or camcc to be really clocking when kernel 
boots.

> 
> 
> If you don't like the flag passed to clk_disable_unused (which is like a
> very reasonable objection to have), we need to make progress towards a
> proper solution that replaces clk_disable_unused().

The issue is that at the time of clk_disable_unused() it can be too 
late, for example because msm being built-in into the kernel has already 
tried to play with PLLs/GDSCs and thus made RCG stuck. This is what I 
was observing on RB3 if the msm driver is built in and the splash screen 
is enabled.

> 
>>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>>> index e1b1b426fae4..230b04a7427c 100644
>>> --- a/drivers/clk/qcom/clk-rcg2.c
>>> +++ b/drivers/clk/qcom/clk-rcg2.c
>>> @@ -1036,6 +1036,40 @@ static void clk_rcg2_shared_disable(struct clk_hw *hw)
>>>          regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
>>>   }
>>>   
>>> +int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int safe_src)
> 
> This seems to just duplicate clk_rcg2_shared_disable()?

A light version of it. It does not do force_on/_off. And also it can not 
rely on clkr->regmap or clock name being set. Initially I used 
clk_rcg2_shared_disable + several patches to stop it from crashing if it 
is used on the non-registered clock. Then I just decided to write 
special helper.

> 
> Regards,
> Bjorn
> 
>>
>> Please add kernel doc as it's an exported symbol.

Ack

>>
>>> +{
>>> +       unsigned int val, ret, count;
>>> +
>>> +       ret = regmap_read(regmap, offset + CFG_REG, &val);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       /* assume safe source is 0 */
>>
>> Are we assuming safe source is 0 here? It looks like we pass it in now?

Leftover, will remove if/when posting v2.

>>
>>> +       if ((val & CFG_SRC_SEL_MASK) == (safe_src << CFG_SRC_SEL_SHIFT))
>>> +               return 0;
>>> +
>>> +       regmap_write(regmap, offset + CFG_REG, safe_src << CFG_SRC_SEL_SHIFT);
>>> +
>>> +       ret = regmap_update_bits(regmap, offset + CMD_REG,
>>> +                                CMD_UPDATE, CMD_UPDATE);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       /* Wait for update to take effect */
>>> +       for (count = 500; count > 0; count--) {
>>> +               ret = regmap_read(regmap, offset + CMD_REG, &val);
>>> +               if (ret)
>>> +                       return ret;
>>> +               if (!(val & CMD_UPDATE))
>>> +                       return 0;
>>> +               udelay(1);
>>> +       }
>>> +
>>> +       WARN(1, "the rcg didn't update its configuration.");
>>
>> Add a newline?

Ack.

>>
>>> +       return -EBUSY;
>>> +}
>>> +EXPORT_SYMBOL_GPL(clk_rcg2_park_safely);
>>> +


-- 
With best wishes
Dmitry
