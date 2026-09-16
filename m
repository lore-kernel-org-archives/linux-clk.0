Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C85B4B0CBB
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552286; cv=none; b=UV/bcmSsflJzFZL0fbYsCjN0DtV3QAf658Z6n5uGcnBLCuQhGv9d/9m4XftV9v7Ex4JrY6aOhonzTFOAoaNmFBnOtPjImRzbcqGK5gj0Qm616nCe1DDYATHTcc7U2GLE0cB1sqKmxAM7YPmK/ZOG+bSSvj5ZRSSmRFinsFoWhSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552286; c=relaxed/simple;
	bh=uDUBFhrHSWxtA5CWKAYzHXxVZVWpzdiiwyRmn9zcjdg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GrjoyHbZuWLgTNn14GqrjSnT7FnuCI3saP4zpSLagH1lkvyVthhjp/ZBQ3dav4ROIq00Pn8FCGZ0bO7uaDgOn2JIEiitUvx21XZlPGJpGIDGuHX0UrZXLGjOMl7NwjQ3wiw0HyneA95yTJ3XDc2VNtZdPJxZBfnn6fnw4DUirZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqaKVQeI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqaKVQeI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so371284f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789552249; x=1790157049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=oqaKVQeIbZCaei/MCOwhcsJwRV1judRS1pduHdktVnVYoCH0C+LBgCrJ8449hp80ad
         RJ/CYOuN7AGcjgzPV3Rdx+lZ6J7qyfAsezqCqOIrImW358bFix+YY1cv+F4bbLB+6VnH
         UqWbLkx9kjiprZXx4Jc0lScu/xsrPBGTL9EgqDysK13L267DDkcqlv/rB+IBOuHaw8Ar
         90hQn89y7v6KpO/7xaJsGP4rBDn2r4d1q2PGB3T3xU34+cgoP+zIKiaHyuGqYRX/fu+o
         0usQKCVxJ5gllVU9EnI9FN4W+FuPWtarQQ/Hlf9pWQt8Paa//Y7FtAOfFZKQRSfO7toH
         wxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789552249; x=1790157049;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNrtt7QAjnKfCZfemi/DOxqaTqOYXDgqMMH9wuegbsE=;
        b=IFAv2BikwuvqZa2BtDagrArTRkJTpQIEM0k5aJVX6rGSRdafKNFEbemiGMGNVdP6qD
         Sc5d6IP96X7Y964RksjgsP3td87zYO+zecJTLLqD232j9CoSWiXv3TL8uCS7PNKQUJgx
         a+Y57xNYHTY07nnsYH3Q5zZJarUkGZ61YBJmrtJS6g32kyVDazrVQLTUNKYcVQL22oxl
         pT8ShZ0KEAYvzUV7AU9SKCH+GWGY0Ad1UcuEtPsrLWBBzt6LQIgMoYqKV/Bc2Afd1HWx
         hrJvgzUaTK7MEm0EL4BNwtcHyAKv7zMneiiaLw4naO211nXvDemcQC/sN1yyGkyjNOff
         E0WQ==
X-Forwarded-Encrypted: i=1; AKwUvBznckrTDz47xRgiWDc2tJWbJKeAShPU1ocIgZQsvd0IRPKmymY2tpLNjzkPQE9H+iTdWejTMjqU0zg=@vger.kernel.org
X-Gm-Message-State: AFuF++kYTjBRyjdWMBoFWDYJvLDSXQUMilm3cLIaQ+Ny6NlO4ur/yBfr
	2Ga9d0YOOScobSEfjFHk1GhwhK0VTUa8YfyAe5yq1ZsZszj+LAVtJEpJNbDiy9H4HgM=
X-Gm-Gg: AYBFou2IxhsPJxRSvYDVj58glogtuiOrj1YG4MzidTWhlevtIbmmELEz2udG/XqLj8/
	uWFtWj2Z8zD5avbmoZccOhShjcpFx3CmN3BamMPA6gX6tVrmCxXJOMRin+QpHIc1nGt8vLpcto8
	06qaqMFM81cd3i/g3195eu7UbghK67mnVlchc7x1j128vnxlcftqaFsicESxtE62RmTj2ISLISt
	y+2hGbeSecpQc5ytUDS3BW4XyiV2ga8UrtxWXfga5J57At6a3CfbvPaqfGKnUPfAL+5Q73gNa+S
	13hAb/DnveKs9oZ/bUGH5VUKo4wTyVaEjXbc5iksUQDVRZzIsUYcTNAmv6p2OEtljdFx191NY5N
	Fm7pUDS+wycvDJNm9zKCEscIatp5XtZih7b61WcI3EHmWrxJnV4Ui/6Kiz1kYzZnMuz8aVNG07Q
	WUU4rdwH0gLrtWDiMBkeGOBI6yRNqjw66VqxVyEnndAlogn6lDChAesovQuTg5nDg+wNEzof5oH
	p42P8TlZivepzJZpqQIvlFaMj0zV/85K6mr0lU600X5qOVjooE6eA==
X-Received: by 2002:a5d:64e2:0:b0:487:ae0:6459 with SMTP id ffacd0b85a97d-4870d169884mr2405331f8f.40.1789552248673;
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7642sm5657003f8f.5.2026.09.16.02.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:50:48 -0700 (PDT)
Message-ID: <af593f11-9334-4206-8006-cadd9d5c15c2@linaro.org>
Date: Wed, 16 Sep 2026 11:50:47 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Lucas Tanure <tanure@linux.com>,
 Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
 <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
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
In-Reply-To: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/15/26 17:55, Lucas Tanure wrote:
> On 11/09/2026 16:40, Ulf Hansson wrote:
>> On Sat, Sep 5, 2026 at 5:32 PM Lucas Tanure <tanure@linux.com> wrote:
>>>
>>> The previous series for the intermittent boot hangs on the VIM4
>>> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
>>> explained, sys_ampipe_nand clocks a pipeline stage that the
>>> hardware design inserts in the bus path between the SD/eMMC
>>> controllers and the NIC_MATRIX fabric to help timing closure.
>>>
>>> So the clock has real consumers: reference it from the three MMC
>>> controller nodes and drop CLK_IS_CRITICAL instead.
>>>
>>> The series crosses three trees; patch 4 (clk) must only land after
>>> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>>>
>>> Changes since v1 [3]:
>>>   - Dropped the Fixes: tag; this series is an improvement and should not
>>>     be picked up by stable (Jerome Brunet)
>>>   - Moved the patch 4 dependency note below the --- so it is not kept
>>>     for posterity (Jerome Brunet)
>>>   - Dropped the e-mail address from the Assisted-by trailer, see
>>>     Documentation/process/coding-assistants.rst (Jerome Brunet)
>>>   - Fixed the space-indented error path added to meson_mmc_probe() in
>>>     patch 2, it did not pass checkpatch
>>>   - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>>>     capability flag, not an SD_EMMC_CLOCK register field
>>>
>>> Thanks,
>>> Lucas
>>>
>>> Lucas Tanure (4):
>>>    dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>>>    mmc: meson-gx: enable the bus pipeline clock on T7
>>>    arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>>>    clk: meson: t7: don't mark sys_ampipe_nand as critical
>>>
>>>   .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>>>   drivers/clk/meson/t7-peripherals.c            | 10 +++----
>>>   drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>>>   4 files changed, 62 insertions(+), 12 deletions(-)
>>>
>>> -- 
>>> 2.55.0
>>>
>>
>> Patch 1 and patch2 applied for next, thanks!
>>
>> Kind regards
>> Uffe
> Hi Neil,
> 
> Any chance you could queue patch 3 for this cycle? Patch 2 is already in
> next, and until the DTS lands the MMC probe fails on T7 with "missing
> pipeline clock".

Done !

Thanks,
Neil

> 
> Thanks
> Lucas

