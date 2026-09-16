Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD734A92C7
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559071; cv=none; b=LLbFDgsCmRddbEIcwhXWpUuBwvpxw7A20cPgu1ASNp8qDvXN372vAtgpt9NhMeq108B/YU4jPp4UTnVIt044/4ay6Tnc8G6DH6amXiW8gps3AK9g1T/4rqvxryuw2lzKLZFMbwRwx7dWmR79lPaXLtFfQ5QedkWRHKOWzqS5o6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559071; c=relaxed/simple;
	bh=p9+KEa8/8Dyrx6vfvDzmtoHvB1DxFmQKzIxJDGWSSvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=On9vvY6/30xS1T+e7Esdf92+GwhgzJiZl98hZVAjZigOvccs2qAmeLlHjpmEUXdnkyrZuZL5JsdkPzW5yW/sgs6BVuLMZvotxdkyyxPA63y7Le7z7nMfyR0e21L72Pm1sUGnShDYs1/q4X4M2OezDoWesTf5OtzHSR69+v1koI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6mwqufz; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6mwqufz"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so2284313a12.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789559047; x=1790163847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OkjIpCELnuJRozHROd7rQfIVtAzAlx7qACUrTNgcPM=;
        b=M6mwqufzRXFGPxlkJzFuxdGmBSc5hTsZKnXWJiYA87Ue8TSmNMqb0kEs3plnSPOinb
         FXKzZ1QXfDOgnYgYpK3xfg9IRQ5AplqM6Vop0ycWAItq3Cse7eRlxkbwgES8tuvUwiP7
         kfjTZ2/u0r4HI5J3UtW4tvMYmE67k9QvrgtVUVbzAgATTuUeTlSyl7dAq49eue1XOilO
         dtWYENx3sUQnVpZoiZc/uzr5s+bcKUfkZoREZM3ok5jnpG4nZp7rDmYdQyxFK+RBds3W
         bOJ3zM9hv18M0VeJaijRhpUil3cc34bbmSKr3EKhuskGMI+N/U3yiQpfjUOUDfHWPgOZ
         RT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559047; x=1790163847;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OkjIpCELnuJRozHROd7rQfIVtAzAlx7qACUrTNgcPM=;
        b=Zjrbk9WrwystjrhTSrlV+qyvlRe4HB8tsHN1aILAl7mi8qk43DVp2TCvkthd5L2pWN
         d4TUeX/ykFZPMqfm0eHsT78A4WbygrB/Ycr6nuraj30uGOVVUfOYCYJFRo0KQxPfXMyu
         vaiwSphenUm5IFvugNWqsKeSLBrfaqHW3+m4ytbmjeNBaoFcu6LrQGvw+GIwwBsllQvz
         0qgY8+UYi5F3t1bfi0mkDBYJGQlXGFJ68pYbhlDohF49YqtN544OJ35EOzYzeBtVDrO0
         Ea6yTQThxVnBvcEWIYZ7lOhNFV1JS1OCeaTdbbG7YfRx3cy7loDHa/Wslg9kMxnNT1es
         45Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxaRzZSZ0x21Qm0lb4iVxq1HI9rhZ+o7JvylAwWxlmKh8lQnUcjLD+FteICXIffomVehI+BxY2jFLA=@vger.kernel.org
X-Gm-Message-State: AFuF++nmNhkyzWWvD1RukRyVwrI5alYTSElwMp0dS29PE8HHiodRFOog
	8Enf5lUzrWAKmOiycg6ZuI7UYX/I0DYF8GYs/u+bHYVR8+TO1eIcZZ3RQ81+Y2+nQpU=
X-Gm-Gg: AYBFou0PQD1lS/n6mSjj6syGsuKtOlkU6fOH3UWbFy42kxnpCclpMATYdHvTeqLNjf0
	gJAm02RQm9V+y3xJ6fb6OVpVf+AtqlfJM3YxyFTHkaHsb90ZNi7vUStL3yr8hNTzXMRsdQ6p0+U
	SQVZnaxvo3N83NO/r6CyDmzCD2ySOC1Z8Yujm/du6FqgV265Mo3rwUzeFywqFO7rQb4bxlURlH+
	k9Jy82ishGq68uhcwiAFULgbeibFVsmy7F4pQohyY2Ev1yJMq6CIaHFSGy29MwDFNMUO2w0kE/S
	p2c3obktBuw1RSX53CQlZVAd6Nf3bcULgMuD+LWHb155Nj5XqN9pCRWW0HQxAEAy6Bm/cla3fJM
	DafaUFQiQkx7kP8XWmXpfAIfSQbduU24amyj+nK3osaO1xIZ6P0w04eW0O/OzXJyW63XTzzz8OI
	9oimgN0VaqnORnzeVnHIpN6Y3q/mM3VFwavXnyF0okunRVTabWO9QfbPN+mV1HEhq2QbcKSC5gb
	BmQyOFfIKAq
X-Received: by 2002:a05:6402:114a:b0:6a9:8c23:e0c0 with SMTP id 4fb4d7f45d1cf-6aa04039ddamr3843480a12.19.1789559046925;
        Wed, 16 Sep 2026 04:44:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228de9sm1631723a12.6.2026.09.16.04.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:44:06 -0700 (PDT)
Message-ID: <1a2b8244-0e8b-49d0-8dce-775abb070c76@linaro.org>
Date: Wed, 16 Sep 2026 12:44:05 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 4/5] media: qcom: camss: Add support for PHY API
 devices
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 media-ci@linuxtv.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>
 <20260906143233.523A21F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260906143233.523A21F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2026 15:32, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Selects a non-existent Kconfig symbol PHY_QCOM_MIPI_CSI2.
> - [High] Hardware PHY state and resources are leaked on early probe and registration error paths.
> - [Medium] Missing return value checks for phy_mipi_dphy_get_default_config_for_hsclk() and phy_set_mode() can lead to uninitialized PHY configuration.
> --
> 
> commit cc3786ea5902bcb687c49374e8e8db29c5127496
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> media: qcom: camss: Add support for PHY API devices
> 
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API. In the first instance the code will try to use the new PHY interface.
> If no PHYs are present in the DT then the legacy method will be attempted.
> 
>> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
>> index 4eda48cb1adf0..1edc5e5a1829e 100644
>> --- a/drivers/media/platform/qcom/camss/Kconfig
>> +++ b/drivers/media/platform/qcom/camss/Kconfig
>> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select VIDEOBUF2_DMA_SG
>>   	select V4L2_FWNODE
>> +	select PHY_QCOM_MIPI_CSI2
> 
> [Severity: High]
> Does this select a nonexistent config symbol? Selecting a symbol that isn't
> defined anywhere in the kernel causes a silent build dependency failure,
> which will leave the required PHY infrastructure unbuilt.

No the dependency is described in the cover-letter
> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 539ac4888b608..e00748dd83b02 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> 
> [ ... ]
> 
>> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
>> +
>> +	if (link_freq < 0) {
>> +		dev_err(dev,
>> +			"Cannot get CSI2 transmitter's link frequency\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
>> +
>> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
>> +
>> +	ret = phy_configure(csiphy->phy, &dphy_opts);
> 
> [Severity: Medium]
> Should we check the return values of phy_mipi_dphy_get_default_config_for_hsclk()
> and phy_set_mode() here?
> 
> If link_freq evaluates to 0, it appears phy_mipi_dphy_get_default_config_for_hsclk()
> could return -EINVAL and leave the output dphy_opts structure zero-filled. Passing
> this uninitialized configuration directly to phy_configure() could lead to
> erratic hardware behavior.

Yeah but no link_freq <= 0 should cover that case. I'll add the 
evaluation of the return types anyway.

> 
> [ ... ]
> 
>> @@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
>> +	ret = phy_init(csiphy->phy);
>> +	if (ret)
>> +		dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
>> +
>> +done:
>> +	return ret;
>> +}
> 
> [ ... ]
> 
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 2123f6388e3d7..84097d82d99c9 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
> 
> [ ... ]
> 
>> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *camss)
>>   	unsigned int i;
>>   	int ret;
>>   
>> +	camss_detect_legacy_phy(camss);
>> +
>>   	for (i = 0; i < camss->res->csiphy_num; i++) {
>> -		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
>> -					     &res->csiphy_res[i],
>> -					     res->csiphy_res[i].csiphy.id);
>> +		if (!camss->legacy_phy) {
>> +			ret = msm_csiphy_subdev_init(camss, i);
>> +		} else {
>> +			ret = msm_csiphy_subdev_init_legacy(camss,
>> +							    &camss->csiphy[i],
>> +							    &res->csiphy_res[i],
>> +							    res->csiphy_res[i].csiphy.id);
>> +		}
>> +
>>   		if (ret < 0) {
>> -			dev_err(camss->dev,
>> -				"Failed to init csiphy%d sub-device: %d\n",
>> -				i, ret);
>> +			dev_err(camss->dev, "csiphy %d init fail\n",
>> +				res->csiphy_res[i].csiphy.id);
>>   			return ret;
>>   		}
>>   	}
> 
> [Severity: High]
> Does this error path leak the PHY initialization state?
> 
> When msm_csiphy_subdev_init() succeeds, it calls phy_init() to acquire the PHY.
> If a subsequent iteration of this loop fails, or if a later initialization step
> like camss_probe() fails, the code returns immediately or goes to an error label
> without rolling back the previously initialized PHYs (which require phy_exit()).
> 
> Additionally, in msm_csiphy_register_entity() located in camss-csiphy.c:
> 
> 	ret = csiphy_init_formats(sd, NULL);
> 	if (ret < 0) {
> 		dev_err(dev, "Failed to init format: %d\n", ret);
> 		return ret;
> 	}
> 
> A failure here returns early without calling phy_exit(). When the calling code
> in camss_register_entities() rolls back, it decrements the index and skips this
> failing entity, which seems to permanently leak its PHY initialization state.
> 

yes missed the unwind.

---
bod
