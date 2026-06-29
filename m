Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC48405840
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738059; cv=none; b=r0GVq4kUwBn8o0aXWdVX3wLS5ypwv42rs+QM4P7MQJWHcPLLyqiV1rpIOmGNBv+z7WnQRmnK+b9L51s5kuH70hashTxAuN9hJLBEOd2nvryy/VvkwQkd6Eji0oK6W7DLECURsW95FFbjb9LIGtqi27uNza9jQ8UqcW0NXZmuoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738059; c=relaxed/simple;
	bh=ptC+qOiC6+d1qdGlhlfC4UXNJ/q88wxddxLLdklLOWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDqgPwGaykBc3CUUFqBu7hoN0SLbznYmKKp/QQm6dhs1cJmdYOF+wpd0uMOxo+5QLV7mPAejOgdqVOJDFInhSlvjbI0sfHDEyMru7aNA3UfvAv1vvvH+RHoDphzeI6reryO9/8paVUPrymh6cBPQ6T4Xa7RYLVahGxBe4MHtvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8HusOvo; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8HusOvo"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso247598e87.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782738056; x=1783342856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m3Fai9RBjd+npFV53TQmqA1uln8pKm/M0yqFuuvwOko=;
        b=N8HusOvoin7uG2/EDkYzV7wQ+Q8alB4l6/xWidNN9lmCSqMyeVPtT2KMppQ3liD/xw
         cmMKfosyZdTbIilJsJ4jmfe7BlOWMIZ/LnhzzUljhb6x7QiCxuUDJVSulqOo+m0Chj8U
         ONcmysFd3E77TDyqEFOgvywFRMMmHl1/l2aaeRr0iZ0Mm614nJk8+SDcBr8+u7jc2Tkk
         O+53pKL856zhCZvDo5RqVKV5yZYgS0fs0a5OPb1XH7XUae2j4IeujsFCBfdpnCGVbZNK
         WoTJzeaL68jasp4fwny9j9YndVvS8iPKQmBbkUlaHPG2zlucVDrmye6OwWOeQ7wRczNH
         6RDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738056; x=1783342856;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3Fai9RBjd+npFV53TQmqA1uln8pKm/M0yqFuuvwOko=;
        b=ZpBJ7I9Mt1IEcjdx6wPVU7kDM4LwX4cZYpCdOkNRJzDaKWEyEzn2MMjEztH2O9dcYW
         fcx/m/AZSn4/qcIjvCuuJJMAqr8INqpf4PU6uqo8W0LGp4+87U7F3KDndQwmKB3UmxP2
         7A5Av0rITrPfstGIY+tWN0W2mMNEBGDveGZ/ZCPLCmxFkVUDWBkjjc9RiLt0BEGXZpfv
         kqpxursL5V+kEFUieVdDRx0vPX3rHHBjpriKaH2+xR6hwhZ80BNFs4dL5Hi486ZgnXED
         3Tm+/m42LkX5xKLhxTdW1tqECMQnZt64GZAHYfYeKGEfpx3xbj9Z19KP7/QQgq+jus0N
         U4Vg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6IkoiTA9IDF3vrp26xehvufh9JEhjar4DmWOkef05bOVshJIXpSQjQKyjISaSCVbWmfbMt9kWqDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybj1nN6PtTwwisYgbTpuWNhOCjyzT9mdWXbizb+WrborxkA75Q
	yvEe/Qx3YITHDEsl7TgZio/48yrhCFoPSuvo4dRP9agDUhLSlzPXoymMI/Z5oRuZ7lm04Xc0oLp
	TiKymkcc=
X-Gm-Gg: AfdE7ckvpyZ3DcJODkcOMeeDvqe7shoJb/eoRyJX1ejrh3jVvOUPOGl4EWpMqrJjt6X
	XVsvkvWmEFDp49E1K2tx94jGqhQYPZIA0Uc0zbgiAtYaiZArGkp7RyAL6Iu3RYMCHAJE/FXYcaK
	Lrd3V9V/z26WLXPjjmhG2pD5NESLtsak29QW/TQ7ZVJMa59OZY5bbgNyDVYUUa8xofPKq2KB0xy
	JnJW7yJEEM8xbF/iQFHcP6zfESJ/mjTogpRBLewUbqLBj001En9LsecQ2qU4yRErHCEUOYvcULl
	K/+7xw7K7QABW4IOW3a9W8fiNdnJfi7nSagvOBo+HY9/Y/E0LigWx8SITsk0uamaWq8uBrKRB8d
	jtAtGlKEUrUKtKmEDqBtr38aMv1H9AQ/tJnJiy3tsI88zLCYyOJZ3s+pfyeXNikzEaxwLgYK+lB
	vjc6Byihpno8GK3TxDAAmRnyekR82sH17Zq8vT1KdigBZzrWujD1t1zvsy8hIVKhs1kQg=
X-Received: by 2002:a05:6512:3b11:b0:5ae:ba7d:8fad with SMTP id 2adb3069b0e04-5aeba7d9145mr373785e87.4.1782738055280;
        Mon, 29 Jun 2026 06:00:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebd32dbf3sm45796e87.46.2026.06.29.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:00:54 -0700 (PDT)
Message-ID: <03596c5b-9448-49e3-a035-25c0475df9be@linaro.org>
Date: Mon, 29 Jun 2026 16:00:46 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
 <akJQ7ZFODBjHrqFt@redhat.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <akJQ7ZFODBjHrqFt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brian,

On 6/29/26 14:03, Brian Masney wrote:
> Hi Vladimir,
> 
> On Fri, Jun 26, 2026 at 07:54:39PM +0300, Vladimir Zapolskiy wrote:
>> On 6/26/26 19:32, Konrad Dybcio wrote:
>>> On 6/26/26 6:26 PM, Brian Masney wrote:
>>>> With the introduction of sync_state support in the clk and pmdomain
>>>> subsystems, the following warning happens when the unused clocks are
>>>> shutdown in camcc-sc8280xp:
>>>
>>> Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
>>> the sync state from the clock part only resolve this? There may
>>> be a clock dependency for the TITAN_TOP_GDSC that we're failing to
>>> describe
>>>
>>
>> Let me remind that there is a series, which solves this problem in a proper
>> and elegant way, it would be nice to get the review tags though:
>>
>> [1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org
> 
> As I mentioned in my other message, this series didn't address my issue.
> sc8280xp wasn't included in your series, so I had to make the following
> change in my tree:

absolutely, sc8280xp CAMCC should be also fixed in that respect.

> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e1..4724ea54c5f67 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2995,6 +2995,7 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
>          .num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
>          .gdscs = camcc_sc8280xp_gdscs,
>          .num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
> +       .cc_gdsc = &titan_top_gdsc,
>   };
>   
>   static const struct of_device_id camcc_sc8280xp_match_table[] = {
> 

commenting the series I was also directed by Konrad's review comment on it.
In addition one problem, which I immediate observe, is that camcc_sc8280xp_desc
misses the necessary .use_rpm flag, can you please do me a favour and test
my series plus the add-on change below?

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..a15e9754bfb2 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2995,6 +2995,8 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
  	.num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
  	.gdscs = camcc_sc8280xp_gdscs,
  	.num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+	.use_rpm = true,
+	.cc_gdsc = &titan_top_gdsc,
  };
  
  static const struct of_device_id camcc_sc8280xp_match_table[] = {


Anyway despite my posted series and the above change for sc8280xp resolve
one well-established problem in the CAMCC drivers, I believe there might be
more unresolved issues on top, which should be addressed separately.

-- 
Best wishes,
Vladimir
