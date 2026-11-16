Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815963;
	b=0OFPYC29KJ2V78vqvDopXPX1km4cmgOzCrf7u6wDOGBId/ixom25gwVzL2BVdmgW4Z8c
	 ix7rSZWPAmlJ46g65YmAAb06BuJMWwedoGEYMoHSHu0oOIXGXzy4mTwzSacfakuXH14Ut
	 Xpu5Aon1Jta8IoEMh+mD30BlvuR4jaOE5dBZpn2DK76KzSiFpBQAmt9Y6X59rQA8gB31P
	 KLXcbX0nNoROCjfP7zqq7j11B6gFnR7l0mI4KwM+fqhDflzi86KsblnopzSQwC9QuwFR9
	 yQqHxny8LJTukZYJXV2qBO5eZPV2N3f2z6LSPV+Y12ybetnfox0TbdfvTfIEu68L+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
	b=Gy2DhnDchH5142ZiXiHRhCc9Dop82DQcHqvmE75MF5AlZt46w5BhUwh1//DWyStdDMd0
	 DWL8DOn39WtesiNnuMEuSRRuqUQy03rkx59pMjoD9RJg1b4DialJeFeEUXufnF0p6HRxJ
	 GLC0hsWrWayQlraKolXkfbg4oPmP/s4chCwuLz0FoGDrn/I/VLPDZQZdjxIkVqW2tzqoX
	 ib6vT+HbVKIKb/1tGcq1eImz2FfOVFjO9MfRodeu1YjB/6Cz1qRNKKvPJzZHo+17uVTzc
	 nZ2Y4ZPvPfDEHYPRCX4g13LRojob9UWGZi1CS3JhKcY4SjGZus64Fpk9CQmzMoTGjAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896F606A32F
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B896F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOpUDwoG
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso2790372f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815961; x=1795420761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=nOpUDwoGzk/wHg/Bp+Of2YUIaxhFQrZZEVyuZZ89Y6lPT0VGYBaoVPrVXvIZU26D/U
         yBlImfvcXBKEEiBk7wXW0TRWN45cPYMAMaNZgt3gjN0rKvuwijzev03cMfsLdQCRmm9e
         WCYwaYjkWNwvoCPTZnCWV4NIFVJJQljouOD4jbVG6Z6c/Ho8nocRZIIvTUQKKntA8dtQ
         jILjnRi4/thV8WEzDF47rMw4lgjkfaUV/t+uN4W5+m9jFan/uzPUgNZoOPqTEy5dVyQe
         kDp2pd9Hca59jbHV44SXxm2yPySWjxFxovUaW9SIEKbDRlYr26yL/AJAyYOpoitJxeot
         1rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815961; x=1795420761;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjvetyvqxLjaeSw2J4Je0FZ24N4W0eHwPcS5UoEpsG0=;
        b=SfV2c3tCrGUlQw25IS9Ow3dF19xVy7/MI26BzkuO5PxfDSqK3wRCnl9rocolflq7GP
         mfec3zU1xVTd+7zKs6H+Op7xHNaWsfAIwJqR5rID2D5rRV4CfwnVh3nwq+woKlG+onxZ
         S7LEH5pGL6PSBOhxTDbr4GufzZkUymCO+eKB3cestcYeo159l517mFbrLMTTRC+bNPjM
         kTvJ4jJDvBD9ADW99egrveX6xY0pB6D3I2FoDd3Vwm0t/Pv1YAMS4Enm2P3XB6lFr3TU
         AIyr1zl6JqQT1BjnkNIuuwHPfa1gQV6OqxS8a+I4KUpDvK7F32hZr5RoSrJSNQisLKPI
         mX1A==
X-Forwarded-Encrypted: i=1; AL+hErFPSGkpTX8fWTGnldXJf21tAqIXwiF4UxmtrxSQh4OatOWASBhDh5ONmS68BIApwageI0QR7nUDylA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cQTfDCEI3qzOG9iGJV4z6IULIN2Yi198M3dBZJveyWxvwlHCq
	vJgwKCua/cZLoP+1Pglvmri1fGvrLC6g1a7UQT0CXShYajt7Dsun6DssOXgAzZ6pBVM=
X-Gm-Gg: AYBFou3KA6b8UDEApW1C1kfcU0EFclVw1MW4yskuWW4UPzUE3L2Ll3bkKc9lblquwLy
	6/GB5rprWABaF3oqWZxpwKs34dL5/BhvUMCHPXD0WV2BFRVwYK1h6dxQPkmFnGAAmjg1h7xP5c1
	+rrJmgQXqEqGBS5b4qm+3gJqAlnfF8BuefWC7Ao7YGWifEmOS6R4Dq+71rxAJLsPCK+o1QoZTk3
	P7oeVuagoq/CPcg6Yc2Ks9093bbKpRIi/XKyJN7r0e18k+12Db+EEx5gRnrXGL7xW5HlpWNGbA0
	ix86TegbCsD8uAXbk/R3dV9mnbQ2kkBbNREua3IwLVTPD1b2cijSjfzZA/24rok4QMHvBASZ8WD
	M4yYXDkL6O+vtU6U4QFNUd0c8mWLr74/ABC8XmRPo9oxHaSDnohRDeFaP17UqXwHAG7pG8PvSB6
	NO1sq55bez6LYcuxCjuyX8Q/KIhnb1M/L/61qtkJGiSOOeOnvOoB6EvHRP8m/5+JKygJGd5rwCX
	FlG4bl35QmYw8Ek/coyJYFM3Brl4djJWkfSe38HsH/yen/FNrjUQyODYsIvJBFTbSC7Ur5/uH1n
	Dy9a+gO8pEYMVDjrZLm/npzvRUTcs30A42preiYT2y/kJ+/GIrWLgL+3qpnrj6p9frgvmhpzavv
	61cRUGvf6
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr19030193f8f.33.1794815960914;
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm20167439f8f.46.2026.11.15.23.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:59:20 -0800 (PST)
Message-ID: <23f7de38-a5be-4de4-b026-e97deab9535c@linaro.org>
Date: Mon, 16 Nov 2026 08:59:19 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 17/23] ASoC: qcom: add SM8650 LPASS CPU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213544@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213544@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] ASoC: qcom: wrong lpm_type for lpass-rxtx-lpaif in
>    sm8650_lpaif_mi2s_desc[]
> - [Medium] ASoC: qcom: missing set_bit() for RX channels in
>    sm8650_lpass_alloc_dma_channel()
> --
> 
> commit ee9ae911e7b58d190ad971326ccfe23116c1a06b
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: add SM8650 LPASS CPU driver
> 
> This commit adds the SM8650 LPASS CPU DAI driver variant supporting MI2S,
> DisplayPort, and codec DMA audio interfaces when driven directly by the
> application processor.
> 
>> diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
>> new file mode 100644
>> index 0000000000000..42050f56a4847
>> --- /dev/null
>> +++ b/sound/soc/qcom/lpass-sm8650.c
>> @@ -0,0 +1,651 @@
> 
> [ ... ]
> 
>> +static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
>> +					  int direction, unsigned int dai_id)
>> +{
> 
> [ ... ]
> 
>> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					   v->rxtx_rdma_channels);
>> +		if (chan >= v->rxtx_rdma_channels)
>> +			return -EBUSY;
>> +		break;
>> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
>> +					  v->rxtx_wrdma_channel_start +
>> +					  v->rxtx_wrdma_channels,
>> +					  v->rxtx_wrdma_channel_start);
>> +		if (chan >= v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>> +		chan = find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
>> +					  v->va_wrdma_channel_start +
>> +					  v->va_wrdma_channels,
>> +					  v->va_wrdma_channel_start);
>> +		if (chan >= v->va_wrdma_channel_start + v->va_wrdma_channels)
>> +			return -EBUSY;
>> +		set_bit(chan, &drvdata->va_dma_ch_bit_map);
>> +		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +		chan = find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
>> +					   v->wsa_rdma_channels);
>> +		if (chan >= v->wsa_rdma_channels)
>> +			return -EBUSY;
>> +		break;
> 
> [Severity: Medium]
> Should the LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9 and
> LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9 cases call set_bit() on
> drvdata->rxtx_dma_ch_bit_map and drvdata->wsa_dma_ch_bit_map before
> breaking?
> 
> Without set_bit(), channel 0 is never marked as allocated (even though
> sm8650_lpass_free_dma_channel() clears the bit on close), so subsequent
> allocations from those bitmaps will hand out channel 0 again and overwrite
> drvdata->rxtx_substream[0] or drvdata->wsa_substream[0] in
> lpass_platform_pcmops_open().


Good catch, will fix

> 
> [ ... ]
> 
>> +/* MI2S mapping over LPAIF instances */
>> +static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] = {
>> +	{
>> +		.reg_name = "lpass-lpaif",
>> +		.irq_name = "lpass-irq-lpaif",
>> +		.lpm_type = LPASS_LPM_NONE,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_PRIMARY, },
>> +			{ .intf = 1, .id = MI2S_SECONDARY, },
>> +		},
>> +		.port_desc_count = 2,
>> +	},
>> +	{
>> +		.reg_name = "lpass-rxtx-lpaif",
>> +		.irq_name = "lpass-irq-rxtxif",
>> +		.lpm_type = LPASS_VA_CDC_LPM,
>> +		.port_desc = (const struct mi2s_port_desc[]) {
>> +			{ .intf = 0, .id = MI2S_QUATERNARY, },
>> +		},
>> +		.port_desc_count = 1,
>> +	},
> 
> [Severity: High]
> Should the lpass-rxtx-lpaif descriptor use LPASS_RXTX_CDC_LPM instead of
> LPASS_VA_CDC_LPM?
> 
> lpass-rxtx-lpaif is in the Audio CC / RXTX domain (clocked by
> audio_cc_ext_if1_ibit), so setting LPASS_VA_CDC_LPM maps MI2S_QUATERNARY
> DMA buffers from the 12 KiB VA LPM region (va_cdc_dma_lpm_buf) and enables
> va_mem0 in lpass_cpu_daiops_startup() instead of using the 64 KiB RXTX LPM
> region and audio_cc_codec_mem0..3.  If MI2S_QUATERNARY is enabled
> alongside LPASS_CDC_DMA_VA_TX0, lpass_platform_allocate_lpm() also fails
> probe with -EINVAL because VA Codec DMA already consumes all 12 KiB of VA
> LPM, and if MI2S_QUATERNARY is enabled alongside MI2S_QUINARY without VA
> Codec DMA, va_cdc_dma_lpm_remain underflows and assigns an offset past the
> end of the 12 KiB VA LPM buffer.
> 

Good catch, will fix
