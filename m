Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADCAECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 12 Sep 2022 13:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbiILNmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Sep 2022 09:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiILNmp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2022 09:42:45 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB40220E7
        for <linux-clk@vger.kernel.org>; Mon, 12 Sep 2022 06:42:44 -0700 (PDT)
Date:   Mon, 12 Sep 2022 13:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1662990159; x=1663249359;
        bh=4VpvV4OBkDK69iCd91VlPdJGjR5kcBrkOVjMljOVhXE=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=WREbsSlNT5mV1GEMq+8anEibl/Y3aoJGcDNiivvU6TJqqr52WhxXILaQG4KCIY1xk
         oW6vlmDLSVZL2XaCc3qchOxkNQ1CowortXBW4wpDGwUodFGHk2wdOiVmWXsjYRj3LJ
         8IPPNNCeZFjZE+2nmQO0S6MiQm2fzvZqOIBBxTnI=
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Dang Huynh <danct12@riseup.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] clk: qcom: sm6115: Select QCOM_GDSC
Message-ID: <6f2ac542-90dc-ec85-d25d-9ba713de8796@connolly.tech>
In-Reply-To: <CAA8EJpr4_G_uK5oj9Y0j_tE_LsnqDHKaU1D_nhXOiL0sA=aMnQ@mail.gmail.com>
References: <20220910170207.1592220-1-danct12@riseup.net> <0a2bb48f-c67d-0544-5037-d02f658a3351@connolly.tech> <CAA8EJpr4_G_uK5oj9Y0j_tE_LsnqDHKaU1D_nhXOiL0sA=aMnQ@mail.gmail.com>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12/09/2022 14:32, Dmitry Baryshkov wrote:
> On Mon, 12 Sept 2022 at 16:17, Caleb Connolly <caleb@connolly.tech> wrote=
:
>>
>>
>>
>> On 10/09/2022 18:02, Dang Huynh wrote:
>>> While working on the Fxtec Pro1X device, this error shows up with
>>> my own minimal configuration:
>>>
>>> gcc-sm6115: probe of 1400000.clock-controller failed with error -38
>>>
>>> The clock driver depends on CONFIG_QCOM_GDSC and after enabling
>>> that, the driver probes successfully.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> ---
>>>    drivers/clk/qcom/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>> index 1cf1ef70e347..d566fbdebdf9 100644
>>> --- a/drivers/clk/qcom/Kconfig
>>> +++ b/drivers/clk/qcom/Kconfig
>>> @@ -645,6 +645,7 @@ config SM_DISPCC_6350
>>>
>>>    config SM_GCC_6115
>>>        tristate "SM6115 and SM4250 Global Clock Controller"
>>> +     select QCOM_GDSC
>>
>>          depends on QCOM_GDSC
>
> All other Qualcomm clock drivers select the GDSC if required, so I'd
> tend to disagree.

Ah, in that case please disregard, sorry for the noise.
>
>
> --
> With best wishes
> Dmitry

--
Kind Regards,
Caleb

