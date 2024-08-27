Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3991BD026
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764420; cv=none; b=lUg/1MgWYj4UovM+IlSxdkbhcwFHQs6wcfuT1RC+oTIHYHNtswybvZBt5lXnIFTdm444cokdWPj5Q67KBzToW3j8YnMJLxzJERIgOp02FpvLvTjVw2yUHNNMj83XV9OjlZwqsed2eQuE8jJe4mI8lAoG/a+R67thqzhtRnDF7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764420; c=relaxed/simple;
	bh=AsE2cQXjHRE2DxI/XQtaPRzwG7nRcAMfnjdoARd5SkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQOqqTePGWCPvX5RxygQHgNyqt7Pt6NVC+HNXCGVvZ9Z4O6Ilf04dfJVPqBG02puGgvlf2mbsu/Lw8Jj7NbmBfUdFZ/Sw/GlD9TW8qz/b8Rk7SC9CFiZZhcMoACQvUDlI+6U1BfZZ8Wo46LcfIo6b6Dt9w8BO440voStwePnCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhcDaTK9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhcDaTK9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37198a6da58so3848128f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724764415; x=1725369215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeuE13/7vbNdFThwAEiu12EGxIgMIw579eVWJrBDrS8=;
        b=NhcDaTK9kqeCeWTX4L2H5uE32TyGWfuUl4YHLxUgJDCET/ryPigAPXMzIgiih5781b
         d4DepFnGppbsVoOuVugz1AA+XRPexwPX2hxSFViu3dalS/PbUcBJeeoDvhZSxq/uty+e
         CXjLrENvTPFLpquR6W4KcKyvrD9P4/lemb6mgylb1RSEX9CZQSFcvNWu9GJo/Avh+TJg
         zrXOpRSxTNN2x2NSoOr1sSJocVkLHN31gPEqWjBOEvhxV5U3jraWT9FycTzFbIytIhpS
         AJNapEQlJLGz+Cn2nAhSp6X6WJ21wgcM4MaFaNMM1rZTrUpFP8u4csAiq5QbB0xoVm8s
         QMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764415; x=1725369215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeuE13/7vbNdFThwAEiu12EGxIgMIw579eVWJrBDrS8=;
        b=NMJbQIWGmPyka6DikrQJU6XKhOQiNFBPdi+PEnFwULDFngbSGb55ujDynIh+EFO5cn
         8GHHQZFEv6b17BMXaMKZRq2wbinuI0Dbcuii/O4rfZ+/+mlEI+LTYBtrz0C8g1qtwcIu
         Gb0N3/n4M4Qv6lVYC8c1bJEQX7lFboN0CNXTJvJ6CRvYPbVulegZpXkrurZBANQYAcTs
         2nXIISPardmbf5GJmdBiP94sGQLhjBYNLqONV7sZUhe8yk/s2mAVHO4sL/xO/WLwNRxH
         LH+Z6VrwswJzPcTtO7gfHW6xI5eqhkHCJ9jg5o/zy9mxG/rU/KwoCJUw3+jbEoUID6pn
         07yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ECgLt8cVG4elU+rp6LJiYZD/uWtySqfxPM6ksldo76KzCDwTxfERINIcVScLfzBMnumHFrLRSRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY6nOX26Dm55KmYIagS7VxsT3LFH4vAkbP1RpolsQA1QychUZR
	JvbuuVlKUMPonDb3VVqXxgcZJ4f2JUgovKzOgIrGmGmyI9FPigXZ7wHwYKwm644=
X-Google-Smtp-Source: AGHT+IHdsyhSLBjiurVvaE79aFCz+ddRrXoXvKxH/wwYSLEfj/5MHZEUqYeob8Osk05sYIoi0UFnqA==
X-Received: by 2002:a5d:67cc:0:b0:371:8283:94c1 with SMTP id ffacd0b85a97d-373117be78bmr10635617f8f.0.1724764415477;
        Tue, 27 Aug 2024 06:13:35 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549df50sm109365166b.53.2024.08.27.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:13:34 -0700 (PDT)
Message-ID: <9a1ca52b-6eae-4897-891e-6fad3d981c6e@linaro.org>
Date: Tue, 27 Aug 2024 14:13:33 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for
 QUPs
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
 <df107382-5c9b-4568-b9e3-5a893070fad7@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <df107382-5c9b-4568-b9e3-5a893070fad7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2024 14:44, Konrad Dybcio wrote:
> On 23.08.2024 2:58 PM, Bryan O'Donoghue wrote:
>> Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
>> need to be parked when switching frequency. A side-effect in parking to a
>> lower frequency can be a momentary invalid clock driven on an in-use serial
>> peripheral.
>>
>> This can cause "junk" to spewed out of a UART as a low-impact example. On
>> the x1e80100-crd this serial port junk can be observed on linux-next.
>>
>> Apply a similar fix to the x1e80100 Global Clock controller to remediate.
>>
>> Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chromium.org/
>> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
>> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
>> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> I ran into some junk on the x1e80100 serial port and asked around to see if
>> someone had already found and fixed.
>>
>> Neil pointed me at Stephen's fix for sm8550 which I found is also required
>> to fix the same thing x1e80100.
>> ---
> 
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> 
> Mind also fixing up 8650 that seems to have this issue?
> 
> Konrad

np
