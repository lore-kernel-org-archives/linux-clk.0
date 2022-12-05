Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EFEC47089
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 21:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiLEVlB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 16:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbiLEVk7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 16:40:59 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BAF25EBC
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 13:40:57 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id s10so1075395ljg.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 13:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2DTLEWbgC4l5iyukgMyeiGSW5/MQjgk3OBffNxDjWp0=;
        b=UBrXMmm65k5U8cgJu3jsVVTbS1A8tqi0sSSprHlKKJ2nC3Hp4ApAISqLjafFw9GRKm
         /0UQ7xZhiF8w9j3j0nAP0IjNIBCQrh5c1sAmppmIkeAU8/Po77J10/tvd+UlcOKBQYE6
         6rKadFpTe3NeiMwZgDCIh5HJmWXPNJZq1RRPu26f43ZBNavFg4axw/nfT5j76oMvTtpR
         1ORYJiqSorOeqSmp5beo60nxbKLTj38j9H1suJ4+I2q4wT8DhCqo5SGXDWueJ07dDQUO
         1U36sJl0fIOLLoPjFjzhjQH5tvWFBp/7DhNVvBVn33DFY8bqSqF6Q4BTsyqJkF+0jwq0
         TCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DTLEWbgC4l5iyukgMyeiGSW5/MQjgk3OBffNxDjWp0=;
        b=l00hHVuTi2dX6JqTDO19pUN0BzOO5RdjwAwHGlSsNdzCUPc1patX0+hiXrDbVRsErg
         SnrP7T+rv4AqiNpR9gso4q9l3hTACBG9cdc0l1POI9xbSOAMtE849bMv3Dr1FiDWV20R
         duDDpwOXKfaxGVoYkCQBT1x45tIjLZ7pWWSYl828wtfnCtavviyHRvlIFB0mTi4hgFPA
         gmOZb493QZrefxgNxVM/JBGwAXLxFpMh1yUVSFyq9rtivx4ftPS0keJDnL7XGAjW5OoT
         BgR0R2TO3Tkz2bOQoI82rZXe+U8L9zAAtN/P+bIZv+bLTDlfhCt9CuJpgf4zfmm1z0JD
         QA3Q==
X-Gm-Message-State: ANoB5pktCYhRq1I36VcRgKwNwrcVoNsIrB8vInp8CfheLfxCXsr6kBAW
        vZ5/XMGnoRfc9swJ/lzCVCzUuA==
X-Google-Smtp-Source: AA0mqf4WCglUl2NwwznBAZnaSSmTxptSNvIcKwvdZx3BorZcu3nCYTMzI6qZxuw1i5Q4nKj7yt9tNg==
X-Received: by 2002:a2e:b5a1:0:b0:279:a060:99f with SMTP id f1-20020a2eb5a1000000b00279a060099fmr11181731ljn.429.1670276456179;
        Mon, 05 Dec 2022 13:40:56 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129])
        by smtp.gmail.com with ESMTPSA id u25-20020ac258d9000000b004b57a253deasm354325lfo.162.2022.12.05.13.40.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:40:55 -0800 (PST)
Date:   Tue, 06 Dec 2022 00:40:51 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Alex Elder <elder@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
CC:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_10/16=5D_clk=3A_qcom=3A_smd-rpm=3A_?= =?US-ASCII?Q?rename_some_msm8974_active-only_clocks?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2b3d23a2-674f-d3ad-6d4f-1d8f9f08bd46@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org> <20221203175808.859067-11-dmitry.baryshkov@linaro.org> <2b3d23a2-674f-d3ad-6d4f-1d8f9f08bd46@linaro.org>
Message-ID: <A952F00C-BBBF-4F88-BA68-E387AAC40120@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5 December 2022 20:05:10 GMT+03:00, Alex Elder <elder@linaro=2Eorg> wro=
te:
>On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
>> Rename msm8974_diff_a_clk, msm8974_div_a_clk1 and msm8974_div_a_clk2 to
>> move the _a suffix to the end of the name=2E This follows the patter us=
ed
>
>s/patter/pattern/
>
>> by other active-only clocks and thus makes it possible to simplify cloc=
k
>> definitions=2E
>> This changes the userspace-visible names for this clocks=2E
>
>Hmmm, is that OK?  (I think it is, because I don't know of any
>tool that explicitly relies on these clock names=2E)  They should
>have been named consistently to begin with=2E

As far as I know, nothing depends on these names=2E Especially not on acti=
ve-only ones=2E

>
>Aside from that, I think this looks good=2E
>
>Reviewed-by: Alex Elder <elder@linaro=2Eorg>
>
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>   drivers/clk/qcom/clk-smd-rpm=2Ec | 34 +++++++++++++++++--------------=
---
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/drivers/clk/qcom/clk-smd-rpm=2Ec b/drivers/clk/qcom/clk-sm=
d-rpm=2Ec
>> index 761a5b0b4b94=2E=2Ecb47d69889fb 100644
>> --- a/drivers/clk/qcom/clk-smd-rpm=2Ec
>> +++ b/drivers/clk/qcom/clk-smd-rpm=2Ec
>> @@ -474,9 +474,9 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a=
0, cxo_a0_a, 4, 19200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19=
200000);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19=
200000);
>>   -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200=
000);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 192000=
00);
>> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 192000=
00);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 1920000=
0);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 192000=
00);
>> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 192000=
00);
>>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200=
000);
>>     static struct clk_smd_rpm *msm8909_clks[] =3D {
>> @@ -607,11 +607,11 @@ static struct clk_smd_rpm *msm8974_clks[] =3D {
>>   	[RPM_SMD_CXO_A2]		=3D &msm8974_cxo_a2,
>>   	[RPM_SMD_CXO_A2_A]		=3D &msm8974_cxo_a2_a,
>>   	[RPM_SMD_DIFF_CLK]		=3D &msm8974_diff_clk,
>> -	[RPM_SMD_DIFF_A_CLK]		=3D &msm8974_diff_a_clk,
>> +	[RPM_SMD_DIFF_A_CLK]		=3D &msm8974_diff_clk_a,
>>   	[RPM_SMD_DIV_CLK1]		=3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1]		=3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1]		=3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_DIV_CLK2]		=3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2]		=3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2]		=3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_CXO_D0_PIN]		=3D &msm8974_cxo_d0_pin,
>>   	[RPM_SMD_CXO_D0_A_PIN]		=3D &msm8974_cxo_d0_a_pin,
>>   	[RPM_SMD_CXO_D1_PIN]		=3D &msm8974_cxo_d1_pin,
>> @@ -653,7 +653,7 @@ static struct clk_smd_rpm *msm8976_clks[] =3D {
>>   	[RPM_SMD_BB_CLK2_PIN] =3D &msm8916_bb_clk2_pin,
>>   	[RPM_SMD_BB_CLK2_A_PIN] =3D &msm8916_bb_clk2_a_pin,
>>   	[RPM_SMD_DIV_CLK2] =3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>>   	[RPM_SMD_IPA_A_CLK] =3D &msm8976_ipa_a_clk,
>>   };
>> @@ -687,9 +687,9 @@ static struct clk_smd_rpm *msm8992_clks[] =3D {
>>   	[RPM_SMD_BB_CLK2_PIN] =3D &msm8916_bb_clk2_pin,
>>   	[RPM_SMD_BB_CLK2_A_PIN] =3D &msm8916_bb_clk2_a_pin,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_DIV_CLK2] =3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_DIV_CLK3] =3D &msm8992_div_clk3,
>>   	[RPM_SMD_DIV_A_CLK3] =3D &msm8992_div_clk3_a,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>> @@ -745,9 +745,9 @@ static struct clk_smd_rpm *msm8994_clks[] =3D {
>>   	[RPM_SMD_BB_CLK2_PIN] =3D &msm8916_bb_clk2_pin,
>>   	[RPM_SMD_BB_CLK2_A_PIN] =3D &msm8916_bb_clk2_a_pin,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_DIV_CLK2] =3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_DIV_CLK3] =3D &msm8992_div_clk3,
>>   	[RPM_SMD_DIV_A_CLK3] =3D &msm8992_div_clk3_a,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>> @@ -813,9 +813,9 @@ static struct clk_smd_rpm *msm8996_clks[] =3D {
>>   	[RPM_SMD_LN_BB_CLK] =3D &qcs404_ln_bb_clk,
>>   	[RPM_SMD_LN_BB_A_CLK] =3D &qcs404_ln_bb_clk_a,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_DIV_CLK2] =3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_DIV_CLK3] =3D &msm8992_div_clk3,
>>   	[RPM_SMD_DIV_A_CLK3] =3D &msm8992_div_clk3_a,
>>   	[RPM_SMD_BB_CLK1_PIN] =3D &msm8916_bb_clk1_pin,
>> @@ -875,9 +875,9 @@ static struct clk_smd_rpm *msm8998_clks[] =3D {
>>   	[RPM_SMD_CE1_CLK] =3D &msm8992_ce1_clk,
>>   	[RPM_SMD_CE1_A_CLK] =3D &msm8992_ce1_a_clk,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_DIV_CLK2] =3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2] =3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_DIV_CLK3] =3D &msm8992_div_clk3,
>>   	[RPM_SMD_DIV_A_CLK3] =3D &msm8992_div_clk3_a,
>>   	[RPM_SMD_IPA_CLK] =3D &msm8976_ipa_clk,
>> @@ -945,7 +945,7 @@ static struct clk_smd_rpm *sdm660_clks[] =3D {
>>   	[RPM_SMD_RF_CLK1] =3D &msm8916_rf_clk1,
>>   	[RPM_SMD_RF_CLK1_A] =3D &msm8916_rf_clk1_a,
>>   	[RPM_SMD_DIV_CLK1] =3D &msm8974_div_clk1,
>> -	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_a_clk1,
>> +	[RPM_SMD_DIV_A_CLK1] =3D &msm8974_div_clk1_a,
>>   	[RPM_SMD_LN_BB_CLK] =3D &msm8998_ln_bb_clk1,
>>   	[RPM_SMD_LN_BB_A_CLK] =3D &msm8998_ln_bb_clk1_a,
>>   	[RPM_SMD_LN_BB_CLK2] =3D &msm8998_ln_bb_clk2,
>> @@ -1013,7 +1013,7 @@ static struct clk_smd_rpm *msm8953_clks[] =3D {
>>   	[RPM_SMD_RF_CLK3]		=3D &qcs404_ln_bb_clk,
>>   	[RPM_SMD_RF_CLK3_A]		=3D &qcs404_ln_bb_clk_a,
>>   	[RPM_SMD_DIV_CLK2]		=3D &msm8974_div_clk2,
>> -	[RPM_SMD_DIV_A_CLK2]		=3D &msm8974_div_a_clk2,
>> +	[RPM_SMD_DIV_A_CLK2]		=3D &msm8974_div_clk2_a,
>>   	[RPM_SMD_BB_CLK1_PIN]		=3D &msm8916_bb_clk1_pin,
>>   	[RPM_SMD_BB_CLK1_A_PIN]		=3D &msm8916_bb_clk1_a_pin,
>>   	[RPM_SMD_BB_CLK2_PIN]		=3D &msm8916_bb_clk2_pin,
>

--=20
With best wishes
Dmitry
