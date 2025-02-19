Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F94B1DF24B
	for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739966841; cv=none; b=ajFK1jaP/AOZz9d8MOIaQZCTBpAoUnjbgF6mBnippVrLK3YdvkaQ8Y3anwac3xFgGSjXZsdUgU6PIGn66In5E2xECp3miV0OaExuG4DTvEdYn2lTpKWNS28GsizHjNkzp0lBzIizwDwnGals8GbDu7X0l+5YaKhrgQo0egHtwOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739966841; c=relaxed/simple;
	bh=4OjYJGHLbHcSgiHKjS0IIUhuCTr3EgjGNYeyisUEQZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp3fXQBtGNSjKzxxg6cKoTtyDlh9VAX0VC4u06vG9qZnU6wo4mih0P918K4zuX9QSlxZ3faUJYJhjKiYF//BsotlGrwHPGg/SQDdhJVC7rfvR5cpziVNIXQoOvTEjwiRX1EVz65jZRqnpikbrMbZKDib8vEHzvNzQKs30CyWVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVOkFPPm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVOkFPPm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f406e9f80so3035859f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739966836; x=1740571636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Kmiv++4vNW0rEfTtHkFe1jOyHczktuNnrPo1TO1Qs0=;
        b=GVOkFPPmQdtqr571kNUbLgld2FKyTxKsirRDIm8gSP3ZnvCrnlDmPSEBkB10ThU1lN
         F2D2npTpW2M/za5qzOuUfxn8EKUe5hCj1uwNX/e9yfotOasYC4xh3DeH2fiOJHa2L2nZ
         DKqm/MlOCs1wzwXBPKlE03tfkh+ubwaJM16gIo1lJySa9GOmaQ1mpBOp0LJUcXL5iqBj
         wzDG8bgL9r9jsMCnX2FwSin7ZG8zYXX7Cafi6LkXCYL+HOLvETQoDoUJIhVPhis3nRQH
         iuEzMvIwVfLuESsWCPnUg6GvoZNdAhE5L7yCuqrJmKOuQzcuSRHUwkeiUDqxXgxtfeVi
         G3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966836; x=1740571636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Kmiv++4vNW0rEfTtHkFe1jOyHczktuNnrPo1TO1Qs0=;
        b=gExsIZQ4mfPaeLMKMjTsCxCt/2vNq5Qmd7LoKauMDOxS90MBFXfI5316gyccsUTCzO
         rO+pTAN5jDNt/gMkbwq8fTrNjpM5fn5TIPgF/Mt/IxyP8IukymUO6P4f7lm3wrcsOFWI
         T/pbKINAi31RbpGTiOx2XefLl/FOLV5/FzIJjrIDP9f+EhgRLXfBM3OS36G6Nv+Ynyw0
         YuNmO0UkIAnq9pHWORKsY8CPHExnE9PLvoAMN7xTbVGmzOzALuAVF4jHqO31wy5Hx+E5
         Ke9H2AQ8ZvO7KHF3h7MFPyUl+CiPhhnS8hgGmoPMP2lT84AWu/AmckTsWPh7HuQHlwbL
         SCRw==
X-Forwarded-Encrypted: i=1; AJvYcCUwf5d6tEW/rareyEptiZJ1Mws+CmppazUW8Lz88S1DCM7M0qUVcOuOsMKJkH6ooGQtIIQQKdM19GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYb5PNMYaBt5tin1Dc32qWEjanHrFqxeQKgS2JR/efBEFN9gre
	/jJGaBQ4HY9wRuT0yiyLE4hq4u4nL6GV3KeQIJ/tdtFr/U0rXRaRWFVQGbIE8Bo=
X-Gm-Gg: ASbGncvq/aefNSSNILgeH6Sg55ftcIDMMOlbYDP+AbCvbbPEICQa9eKIfcgV1PkMBlU
	tpuc+bjs3U4zWuLROtcFhEIRm6tYdBtsfYvLGqWp1KjmKs/stt+AZDv5Kg1dD02q2SRiAZZ1OkC
	xvyfyKQ7B5IIfQbbS6kKnrBGDKnD9xtQWOxjbG9OzcUWPQhMBxr+Sas5mNvQi4kiRGKMZV61Q+8
	stfaS7B8QU7WRqPHXP3GD3fG+S675WGyXf42DKCbScpmQWiR2Kx2YE5PpAHCy9ItTzy/Z41cEeL
	reikZTTtxiM5kBhPF29H1x0ommy0KKqUXT7BPheVLiytbXr1lYuzqoKG
X-Google-Smtp-Source: AGHT+IHRib6UMMCKzb01An9fHSVtMmS4WBnrNIwVhvfDFSkboHIWb6WUN+wEq1fa+HU5RjFLzoLsKw==
X-Received: by 2002:a05:6000:188d:b0:38d:bccf:f342 with SMTP id ffacd0b85a97d-38f587e16dbmr3408791f8f.43.1739966836406;
        Wed, 19 Feb 2025 04:07:16 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d9be9sm17948979f8f.79.2025.02.19.04.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 04:07:15 -0800 (PST)
Message-ID: <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
Date: Wed, 19 Feb 2025 12:07:14 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/02/2025 11:59, Dmitry Baryshkov wrote:
> On Wed, Feb 19, 2025 at 05:11:03PM +0530, Jagadeesh Kona wrote:
>>
>>
>> On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
>>> On 18/02/2025 17:19, Dmitry Baryshkov wrote:
>>>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>>>> During boot-up, the PLL configuration might be missed even after
>>>>>> calling pll_configure() from the clock controller probe. This can
>>>>>> happen because the PLL is connected to one or more rails that are
>>>>>> turned off, and the current clock controller code cannot enable
>>>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>>>> with suboptimal settings, causing functional issues.
>>>>>>
>>>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>>>> Therefore, add support to attach multiple power domains to videocc on
>>>>>> these platforms.
>>>>>>
>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>>> ---
>>>>>>     drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>>>     drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>>>     2 files changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>>>         struct regmap *regmap;
>>>>>>         int ret;
>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>>>         ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>         if (ret)
>>>>>>             return ret;
>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>>>         int ret;
>>>>>>         u32 sleep_clk_offset = 0x8140;
>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>>>         ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>         if (ret)
>>>>>>             return ret;
>>>>>>
>>>>>
>>>>> What's the difference between doing the attach here or doing it in
>>>>> really_probe() ?
>>>>
>>>> I'd second this. If the domains are to be attached before calling any
>>>> other functions, move the call to the qcom_cc_map(), so that all drivers
>>>> get all domains attached before configuring PLLs instead of manually
>>>> calling the function.
>>>>
>>>>> There doesn't seem to be any difference except that we will have an
>>>>> additional delay introduced.
>>>>>
>>>>> Are you describing a race condition ?
>>>>>
>>>>> I don't see _logic_ here to moving the call into the controller's higher
>>>>> level probe.
>>>>>
>>>>> Can you describe some more ?
>>>>>
>>>>> ---
>>>>> bod
>>>>
>>>
>>> Here's one way this could work
>>>
>>> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Date:   Tue Feb 18 19:46:55 2025 +0000
>>>
>>>      clk: qcom: common: Add configure_plls callback prototype
>>>
>>>      Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>>>      before configuring PLLs and ensure that the power-domain rail list is
>>>      switched on prior to configuring PLLs.
>>>
>>>      Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>> index 9e3380fd71819..1924130814600 100644
>>> --- a/drivers/clk/qcom/common.c
>>> +++ b/drivers/clk/qcom/common.c
>>> @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
>>>          if (ret < 0 && ret != -EEXIST)
>>>                  return ret;
>>>
>>> +       if (desc->configure_plls)
>>> +               desc->configure_plls(regmap);
>>> +
>>>          reset = &cc->reset;
>>>          reset->rcdev.of_node = dev->of_node;
>>>          reset->rcdev.ops = &qcom_reset_ops;
>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>> index 7ace5d7f5836a..4955085ff8669 100644
>>> --- a/drivers/clk/qcom/common.h
>>> +++ b/drivers/clk/qcom/common.h
>>> @@ -38,6 +38,7 @@ struct qcom_cc_desc {
>>>          const struct qcom_icc_hws_data *icc_hws;
>>>          size_t num_icc_hws;
>>>          unsigned int icc_first_node_id;
>>> +       void (*configure_plls)(struct regmap *regmap);
>>>   };
>>>
>>> and
>>>
>>> % git diff drivers/clk/qcom/camcc-x1e80100.c
>>> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
>>> index b73524ae64b1b..c9748d1f8a15b 100644
>>> --- a/drivers/clk/qcom/camcc-x1e80100.c
>>> +++ b/drivers/clk/qcom/camcc-x1e80100.c
>>> @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>>>          .fast_io = true,
>>>   };
>>>
>>> +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
>>> +{
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>> +
>>> +       /* Keep clocks always enabled */
>>> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>> +}
>>> +
>>>   static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>          .config = &cam_cc_x1e80100_regmap_config,
>>>          .clks = cam_cc_x1e80100_clocks,
>>> @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>          .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>>>          .gdscs = cam_cc_x1e80100_gdscs,
>>>          .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
>>> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>>>   };
>>>
>>>   static const struct of_device_id cam_cc_x1e80100_match_table[] = {
>>> @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>>>                  return PTR_ERR(regmap);
>>>          }
>>>
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>> -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>> -
>>> -       /* Keep clocks always enabled */
>>> -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>> -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>> -
>>>          ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
>>>
>>>          pm_runtime_put(&pdev->dev);
>>>
>>> Or a least it works for me.
>>>
>>
>> This patch will not work in all cases, maybe in your case required power domains might be ON
>> from bootloaders so it might be working.
> 
> But with his patch domains are attached before configuring the PLLs, are
> they not?

Yes, its logically the same just done in core code.

>>
>>> New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
>>>
>>
>> No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
>> with this than the current approach.
> 
> Bryan's proposal moves us towards having a common code, so it's better.
> 

I can take the time to do the whole sweep and publish a RFC.

---
bod
