Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E524EC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 17:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiLQRyK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 12:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLQRyJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 12:54:09 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BC112D0E
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 09:54:07 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y25so8059895lfa.9
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 09:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k0q2QQnxpm0TXHw29OgJug+FEx+jfuhjsMjmeqCML58=;
        b=vG/kbDbx97Rr4/F+1VS/162sCuOv2r1Gd40apQN6ZhyYH/yd2V+PVtl+tvj7UwbQBF
         iT1OXJSmwDX68VRMsx38PFCOTnOwCDzgOCX0ZYpxOOqx8aaq/7gFkusis5CGbgq3A6BV
         rz/baOPLxS6tXKNpf2lF38CwxGIHn1iZcvaS2bxsRwn5Rkoz3OY0klXu1HVfE4yh1oHl
         Fms9doOXI5BXm9qgepaPnhfd3yMK2t9djzS2h6qqYNNwzXqOOtdJsWzyCaIdY6byXVu+
         udiC2OO1eVIY154oIJZFTJfAHLVZtl4kgPtLcNyHJOZ9HIUz/ReDcay3PpFp1qR98ipN
         rRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0q2QQnxpm0TXHw29OgJug+FEx+jfuhjsMjmeqCML58=;
        b=VYNOSnz2iciVNqIob1sTycJT+Rx/ivikUriXOB4VvAKk+VEsQGwU6o0CBXCvnpHF9j
         SzSuvG8Cdw3iBPidOB+c4Z5lDbhGi0WVPazG15qIcXPohAPLJdjF0GNbtSzuLo173t2Z
         k+j9XTJVDfGCieTNaVsWi4SfJ56+p/Y2IaoaUOK6qvYX/IrMqqz/+zxOVIItBv7dA3Ig
         Iz2w8AyME4zvc9tfujAVMz/UoGeeqm3HJOrJzhDstz/scQysfwhpz3Kp5EPYuOn4Swkr
         eyjSFZC12bhkJEUKt2snxZkOV7lNVScPoprb4V4jW3cy/UgPX3ZEhzfiXs2GJZ1rGprH
         EogQ==
X-Gm-Message-State: ANoB5plzJtaDGvRI6Ulok6lBTbpckvU3xPQ7FxsxfVRWWlOBrgIlVuLk
        /VZq7bFLPWBKyYXo/sjm0rkXkA==
X-Google-Smtp-Source: AA0mqf6RVcv4KurZarM2rWUm4zkWv2t5a6Se+1gohlSaBG50fR0ukdGgBmHkqkOSOa9s28GBhpcqoA==
X-Received: by 2002:a05:6512:25a4:b0:4b5:87da:8b35 with SMTP id bf36-20020a05651225a400b004b587da8b35mr11729690lfb.61.1671299646233;
        Sat, 17 Dec 2022 09:54:06 -0800 (PST)
Received: from [127.0.0.1] (85-76-70-163-nat.elisa-mobile.fi. [85.76.70.163])
        by smtp.gmail.com with ESMTPSA id a5-20020a056512200500b00492b494c4e8sm571744lfb.298.2022.12.17.09.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 09:54:05 -0800 (PST)
Date:   Sat, 17 Dec 2022 19:54:04 +0200
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_05/15=5D_clk=3A_qcom=3A_gcc-qcs?= =?US-ASCII?Q?404=3A_disable_gpll=5B04=5D=5Fout=5Faux_parents?=
User-Agent: K-9 Mail for Android
In-Reply-To: <744cdde3-f43f-6545-fb83-a4474a84b84c@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org> <20221217001730.540502-6-dmitry.baryshkov@linaro.org> <744cdde3-f43f-6545-fb83-a4474a84b84c@linaro.org>
Message-ID: <65B5F4E4-5026-476A-B62F-1432497BDAF4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

17 =D0=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2022 =D0=B3=2E 17:08:24 GMT+0=
2:00, Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
>
>
>On 17=2E12=2E2022 01:17, Dmitry Baryshkov wrote:
>> On the QCS404 platform the driver for the Global Clock Controller
>> doens't define gpll0_out_aux and gpll4_out_aux clocks, so it's not
>> possible to use them as parents=2E Comment out entries for these clocks=
=2E
>>=20
>> Note: backporting this patch to earlier kernels would also require a
>> previous patch which switches the gcc driver to use ARRAY_SIZE for
>> parent data arrays=2E
>>=20
>> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller drive=
r for QCS404")
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>Perhaps one could just remove them then?

I was not sure, so I preferred to keep them in place in case someone has t=
o use them again (after defining corresponding clock, of course)=2E


>
>Konrad
>>  drivers/clk/qcom/gcc-qcs404=2Ec | 32 ++++++++++++++++----------------
>>  1 file changed, 16 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/drivers/clk/qcom/gcc-qcs404=2Ec b/drivers/clk/qcom/gcc-qcs=
404=2Ec
>> index f60a0ab42da1=2E=2Ec48326da1bb3 100644
>> --- a/drivers/clk/qcom/gcc-qcs404=2Ec
>> +++ b/drivers/clk/qcom/gcc-qcs404=2Ec
>> @@ -25,11 +25,11 @@ enum {
>>  	P_CORE_BI_PLL_TEST_SE,
>>  	P_DSI0_PHY_PLL_OUT_BYTECLK,
>>  	P_DSI0_PHY_PLL_OUT_DSICLK,
>> -	P_GPLL0_OUT_AUX,
>> +	/* P_GPLL0_OUT_AUX, */
>>  	P_GPLL0_OUT_MAIN,
>>  	P_GPLL1_OUT_MAIN,
>>  	P_GPLL3_OUT_MAIN,
>> -	P_GPLL4_OUT_AUX,
>> +	/* P_GPLL4_OUT_AUX, */
>>  	P_GPLL4_OUT_MAIN,
>>  	P_GPLL6_OUT_AUX,
>>  	P_HDMI_PHY_PLL_CLK,
>> @@ -109,28 +109,28 @@ static const char * const gcc_parent_names_4[] =
=3D {
>>  static const struct parent_map gcc_parent_map_5[] =3D {
>>  	{ P_XO, 0 },
>>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
>> -	{ P_GPLL0_OUT_AUX, 2 },
>> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_5[] =3D {
>>  	"cxo",
>>  	"dsi0pll_byteclk_src",
>> -	"gpll0_out_aux",
>> +	/* "gpll0_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>>  static const struct parent_map gcc_parent_map_6[] =3D {
>>  	{ P_XO, 0 },
>>  	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
>> -	{ P_GPLL0_OUT_AUX, 3 },
>> +	/* { P_GPLL0_OUT_AUX, 3 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_6[] =3D {
>>  	"cxo",
>>  	"dsi0_phy_pll_out_byteclk",
>> -	"gpll0_out_aux",
>> +	/* "gpll0_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>> @@ -139,7 +139,7 @@ static const struct parent_map gcc_parent_map_7[] =
=3D {
>>  	{ P_GPLL0_OUT_MAIN, 1 },
>>  	{ P_GPLL3_OUT_MAIN, 2 },
>>  	{ P_GPLL6_OUT_AUX, 3 },
>> -	{ P_GPLL4_OUT_AUX, 4 },
>> +	/* { P_GPLL4_OUT_AUX, 4 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>> @@ -148,7 +148,7 @@ static const char * const gcc_parent_names_7[] =3D =
{
>>  	"gpll0_out_main",
>>  	"gpll3_out_main",
>>  	"gpll6_out_aux",
>> -	"gpll4_out_aux",
>> +	/* "gpll4_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>> @@ -207,14 +207,14 @@ static const char * const gcc_parent_names_11[] =
=3D {
>>  static const struct parent_map gcc_parent_map_12[] =3D {
>>  	{ P_XO, 0 },
>>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
>> -	{ P_GPLL0_OUT_AUX, 2 },
>> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_12[] =3D {
>>  	"cxo",
>>  	"dsi0pll_pclk_src",
>> -	"gpll0_out_aux",
>> +	/* "gpll0_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>> @@ -237,40 +237,40 @@ static const char * const gcc_parent_names_13[] =
=3D {
>>  static const struct parent_map gcc_parent_map_14[] =3D {
>>  	{ P_XO, 0 },
>>  	{ P_GPLL0_OUT_MAIN, 1 },
>> -	{ P_GPLL4_OUT_AUX, 2 },
>> +	/* { P_GPLL4_OUT_AUX, 2 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_14[] =3D {
>>  	"cxo",
>>  	"gpll0_out_main",
>> -	"gpll4_out_aux",
>> +	/* "gpll4_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>>  static const struct parent_map gcc_parent_map_15[] =3D {
>>  	{ P_XO, 0 },
>> -	{ P_GPLL0_OUT_AUX, 2 },
>> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_15[] =3D {
>>  	"cxo",
>> -	"gpll0_out_aux",
>> +	/* "gpll0_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20
>>  static const struct parent_map gcc_parent_map_16[] =3D {
>>  	{ P_XO, 0 },
>>  	{ P_GPLL0_OUT_MAIN, 1 },
>> -	{ P_GPLL0_OUT_AUX, 2 },
>> +	/* { P_GPLL0_OUT_AUX, 2 }, */
>>  	{ P_CORE_BI_PLL_TEST_SE, 7 },
>>  };
>> =20
>>  static const char * const gcc_parent_names_16[] =3D {
>>  	"cxo",
>>  	"gpll0_out_main",
>> -	"gpll0_out_aux",
>> +	/* "gpll0_out_aux", */
>>  	"core_bi_pll_test_se",
>>  };
>> =20

