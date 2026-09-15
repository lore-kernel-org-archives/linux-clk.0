Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E128396B70
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487723; cv=none; b=aQ7O67EcfclpFFGWMhzDv8X7TzBwLaoV3lPUAguhmtovJJroMXZ5Q//zWk2orEPMRiiQwri+WFW9Rc7+d5OaiD6goNRKfbUOnbHGzLulRWypOcmUjyiUUiA52ccrwTErUVcKw913zoUqKR35oaiUXwAVYEX+NCddrPgeUuf6CPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487723; c=relaxed/simple;
	bh=+HzaoJJ1ZNqvWhVTWzsvw+MglRBrJ30uE/Z5FYqCy0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doeN7q7fUCMn/SFQYqwNc6Z+jii+m7GdB/6De7ayEqvtqzIvyOS8rOgOFFB87oyq8j7FXizcFJbVKh9LC1WpdZaqF2S8iNUXKDEfAM2j/sCIsIhIKZBFMWEAo1ZqBMjQseBc+sGQ1rQioM7IARj3da6dmwyFVG59g6/+MIGJXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so88051266b.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 08:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487719; x=1790092519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=;
        b=vQrA/9TvFhlq1jpIcr232PIxwOzcYlSUpDNuUyM9SN2hjku9y4TLvMR8+JM5JOvGBQ
         BtUQqJqS94OugTGJ139ibV2TwE4N0KCoAPE0fzcaGlmfRwJUL3Aa0ctgSk/g9uyPzkFX
         AAoZ7fS8mm02jfqsxoOOg5mh0w+6mOPqzcHToId2i4/doqmygb2OCRRfVFFEIuixFTxO
         WlaNc2EGgfScin4x68y8x4djVJ75+a6IvhleyMjOW04Bma9f5NWxcPXe5qhJJ+asppCd
         GD9lji5SMv/lCggnUaSx9C4ClgDxVo/j7HUEiWFkMlx2vd6JQNivkbvpnT8zri7O2Wi2
         TCiA==
X-Forwarded-Encrypted: i=1; AKwUvBzShBdarn6AQiMXpPStqd3zwrHJnm8SmwI6FuSGpMBsJl0W/FqOdGXdXVSUAmjE368PhP5/LtNOOBI=@vger.kernel.org
X-Gm-Message-State: AFuF++mxFcYfwrusgoRqjy+WzT0ii3ODQMoclIEH261IgXkchzIARe0p
	c7tWep3UqHAeM7XnNeUbrp5KHbqUes1LOp+UyshhYA0KhwcNtET5G0q+
X-Gm-Gg: AYBFou1XA+wrHOfwimG5ADnfWZdSi85sWcj0RdFf9mqt1o5/ow3hr2wQ4bD4kGaQuv8
	6Gc0vUW2YPb1IT6qhcNKbOT2xt/ioJ4rSfqz7f3ICIdx1uDYZjAFbLsbITQhw5PxOSxnJ36Hi7z
	lK83EeEG06k+RizHWb98NRndE3bJwFJVKoaPP71nM9ovBd9493JqLSJSi6XLvRk9oqpX3+iDS4F
	8Ug58zAkOTtoJzZYpddWeOXYBKlc/28QTVbUv5uP3cYnQTY0rGteWxe0XC7qMYsFZ3XQ4FTy1OO
	+qLZXpQOr7kChe3byWcgQIrb0iXcpyzdhh6Gj1kVE3o6hlK8kTH+TLDjnxZgugjTF8IiPHaC9vO
	k8Vave5m80NpouktUUjL17SMSsOuDQJkPOCqr0RpD2Iv0YSNFZqw23eQjGjIowB/7xhxLSqCGxb
	Fdeu9vxFhoHbMehu+KMthdrpK76w9U3xWtMYWB+ts84UchPiDVgFk2ymHD7TkfwRuOTXFjI6HHy
	FK+XKoUzIDKEM8DVpiyctgaWoPiLDU=
X-Received: by 2002:a17:906:4795:b0:c26:2f09:f2d8 with SMTP id a640c23a62f3a-c29d790987bmr118615366b.36.1789487719226;
        Tue, 15 Sep 2026 08:55:19 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966125543sm610972266b.55.2026.09.15.08.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:55:18 -0700 (PDT)
Message-ID: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
Date: Tue, 15 Sep 2026 16:55:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/09/2026 16:40, Ulf Hansson wrote:
> On Sat, Sep 5, 2026 at 5:32 PM Lucas Tanure <tanure@linux.com> wrote:
>>
>> The previous series for the intermittent boot hangs on the VIM4
>> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
>> explained, sys_ampipe_nand clocks a pipeline stage that the
>> hardware design inserts in the bus path between the SD/eMMC
>> controllers and the NIC_MATRIX fabric to help timing closure.
>>
>> So the clock has real consumers: reference it from the three MMC
>> controller nodes and drop CLK_IS_CRITICAL instead.
>>
>> The series crosses three trees; patch 4 (clk) must only land after
>> patches 1-3, otherwise the DMA hangs fixed by 43e1705ecab9 come back.
>>
>> Changes since v1 [3]:
>>   - Dropped the Fixes: tag; this series is an improvement and should not
>>     be picked up by stable (Jerome Brunet)
>>   - Moved the patch 4 dependency note below the --- so it is not kept
>>     for posterity (Jerome Brunet)
>>   - Dropped the e-mail address from the Assisted-by trailer, see
>>     Documentation/process/coding-assistants.rst (Jerome Brunet)
>>   - Fixed the space-indented error path added to meson_mmc_probe() in
>>     patch 2, it did not pass checkpatch
>>   - Dropped the CLK_PIPELINE() macro from patch 2; has_pipeline_clk is a
>>     capability flag, not an SD_EMMC_CLOCK register field
>>
>> Thanks,
>> Lucas
>>
>> Lucas Tanure (4):
>>    dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
>>    mmc: meson-gx: enable the bus pipeline clock on T7
>>    arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
>>    clk: meson: t7: don't mark sys_ampipe_nand as critical
>>
>>   .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 15 ++++++----
>>   drivers/clk/meson/t7-peripherals.c            | 10 +++----
>>   drivers/mmc/host/meson-gx-mmc.c               | 20 +++++++++++++
>>   4 files changed, 62 insertions(+), 12 deletions(-)
>>
>> --
>> 2.55.0
>>
> 
> Patch 1 and patch2 applied for next, thanks!
> 
> Kind regards
> Uffe
Hi Neil,

Any chance you could queue patch 3 for this cycle? Patch 2 is already in
next, and until the DTS lands the MMC probe fails on T7 with "missing
pipeline clock".

Thanks
Lucas
