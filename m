Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22B325715
	for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771536450; cv=none; b=h+/+25YnzGosyPnZm+wM8cLG64xgzg/Dnzn9iY6oLCiQYDVdPGvZbUvIS4LKZ6SZlf0mBtEEyUmAoO+UaAmKpigLoTAjk0mIcKSwVfDYanniYY/vI6XmQeeCwH4R8MJaorveVCaQyb3Tc6vSG0le3eqlWAW2G/hltYR2O8nJEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771536450; c=relaxed/simple;
	bh=uAGBrIf0G4PtksC5eMQdKnqhc6vXfYYkalF3B3xNnBA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nP4cjYKDBEiJkHpbp87o8EXPamaJdboLnWRxVNNnqchBWH/nZW339l8CYXEqH+kqgNEG/WPJjbjDNUN36xFseby/FaygaML7DhAQVvxovDsW0z2CMS9bFenHUXcqeimQxY7cvRwJ5U5RxCcm2kkJ7cR+eUWqmsXLNEiyZexWWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GgpKtR6a; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GgpKtR6a"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-404254ffe8aso908924fac.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 13:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771536446; x=1772141246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UA1VERvz5151jt2KdPat2DgK+V02UUk6l4sZ04x/A1s=;
        b=GgpKtR6aGP7idiUYNt2cYM6FhXS49LEVdgkg+d5gPQOk6ooxYU+JrN9UMretVowqUR
         Jj+AVBu3zTavQ4UQKfWJCDTfwP3ECznoPWhty2152bdA2EgJ8PBJgRV9eiB8t+ue/lW3
         myYZrV+MGB62O5uJEK/QLBYE/9WthXH/YePRs6hQd2/52x71u70l5bOu7TXwwjGRb97o
         4Bv7xAR/DH9WPmVh4GJxmtBSi0x/6YCwdmszVL/bsQUPVUjM9hWkQ5ddxDR8wy6/nCv+
         XHUm17PE9aQekZgTDdoh1Tvb6Lr60oKO3eWHoP3426toYsYSuO0DtD5xvIaSb8kfCFYt
         /Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536446; x=1772141246;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA1VERvz5151jt2KdPat2DgK+V02UUk6l4sZ04x/A1s=;
        b=usTR4hGH/2rQhLAhBrPlnt5LOjy54ka5XwS8Ox4BdPADmOPCSNlvJQ6s+/GlvNXDgv
         KjcgPdRnbAVARRl/IPefte/dNTwP2BINTtVeSM/ULlnwfvJwiRxPwO7VasGpKhcrCGfK
         WfWA55mSnoXHBBIaafOvc0h/CYT/iXsLLeU5fcBQVMSfxaJSfnrTBdggJeWto+XhRljK
         OS0rBejiLnkY5hCGBfuoHh+33nGOr2I2S5lgoOuXTxs8jfOVxp3fKCI4mP48f53xmhLb
         +3yJ2yCBI6DYB0JsdDj/JJJUUbIDFFLL6QvBmPgKhrFs4cBkw9FoeZMYS4mNxwbk6pKR
         e+tg==
X-Gm-Message-State: AOJu0Yxg+DGlGhjm5VBEeDkBIAUotUt+mvW/ojJDbfhhEtU5fZLSzA+V
	7tlG3UGhtPgnm/mA/eBr9pTckW/KoCgfwFEj/FAXuzp17MxonSeukRXJ2PWMRHewwrs=
X-Gm-Gg: AZuq6aKGbhOK9S2zGkMQu8AdwtQ/D2esv9vZfiIoKNoXf0APLna5GlQPMQT5whiOxLk
	7taFrQjlEhF0jUc0qXXt/McwXklmb9BASjB8QmzbaxrH1I4/X4ymRXclG55GWX4WMQIA3xrQu+S
	6ZHEB4GFxjheNSfK80tJZbDqWL7z9itvCh0jyroYcnso8/dwsx0NGnlyBY/5HD8SfWolsA4jVOw
	YwCKKOXnM9JYsn5oM0qT4w3T9PCEM+YXwQlquIs5dPhP+b1BHYzOkERgpViPhkDN5Orx75RRVBE
	226wme1+QpxJyyyiHZTKMi8JtDRKIgZq4ms9Sf/t23umJDA9s/QO6IkCTzGpwhjTL2yTikaMCRy
	Fv8uC4zZ4Qw3zDsqeMI1LOsgyaKlN3BfTl0pxNCaSpyPvyOQmyuq3yWP4mVERae7l3qpOZpMyg4
	ThfgYwHM2g3MRcxZBM7c8KvPadejpyh5YZQnYBsW0ndHGbGiD0aOQRWErbq57XTvcT6lyChg==
X-Received: by 2002:a05:6870:326e:b0:404:1ec2:562c with SMTP id 586e51a60fabf-4154539ed1emr1793941fac.6.1771536446376;
        Thu, 19 Feb 2026 13:27:26 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:bce:26a1:c903? ([2600:8803:e7e4:500:d4c1:bce:26a1:c903])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40f062ee328sm18930333fac.4.2026.02.19.13.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:27:25 -0800 (PST)
Message-ID: <5e6fbdcc-6a19-4d99-af5f-50ba8fa529bb@baylibre.com>
Date: Thu, 19 Feb 2026 15:27:24 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
 <b7fd3dfe-c141-4164-80c2-ddc1f79374f8@lechnology.com>
Content-Language: en-US
In-Reply-To: <b7fd3dfe-c141-4164-80c2-ddc1f79374f8@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/26 2:44 PM, David Lechner wrote:
> On 2/2/26 12:28 AM, irving.ch.lin wrote:
>> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>>
>> Add support for the MT8189 vlpckgen clock controller, which provides
>> muxes and dividers for clock selection in vlp domain for other IP blocks.
>>
>> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
>> ---
> 
> 
>> +static const char * const vlp_aud_adc_parents[] = {
>> +	"clk26m",
>> +	"vowpll",
>> +	"aud_adc_ext",
> 
> I could not find a matching clock name for "aud_adc_ext" in any
> of the other clock drivers. Which clock is this (i.e. what is the
> macro name in mediatek,mt8189-clk.h)?

I was able to solve this one. It is a fixed clock. It seems to be
missing from the devicetree, so I will comment there instead.

> 
>> +	"osc_d10"
>> +};
>> +

