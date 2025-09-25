Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EF2877CB
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791424; cv=none; b=isGU7Mkrj+WKkvinusKlYcQaGT81d/KvJ0ru1FNFZ0o9vOM2y9atuqnuB4h3F/mBuQxo9TQg9qvuuxI7JArlI0kEVnX5K60Cfq1BSbjyPpzN5QLt2ICz6u/59u+9DDdOBrOhOTRqVh4gFEMCVCuYu0i1ABJXs6rdEBQjW9vbU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791424; c=relaxed/simple;
	bh=L5XR6t5ZxwfG3rtP2YnGXIBz4GtqNch7l7akgqfMJNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGnTSjLxrhJqRNCNDt1Jmm09yWoPhrdv+oE33Brok7zoGBLBI8CWS0wKHLxw7YIZ8+b3KahMOkKVHGdaTIoOV/t/dt9aZvxuFL1w+KMtxDPxVpRZtf/RyxWuzFXUfGEZq6sgIhwPubWepeoE3SrQeu8c9zQ1t7RJyFtzNhZKyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNEVQhCi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNEVQhCi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ef166e625aso605998f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758791420; x=1759396220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=ZNEVQhCiUaS4rNzMkUfSwGh75tyS/xDug9nFLpBRlRh600+XKL5d4QkFikSRs6y0fU
         nsd1nKRh1f+SBofkmrSphSxpGnVwOMti8pinY0Ahkk/nM4JyJYrb0FqUHZdBe26np63z
         TaLFo/XsNaCjyL8hl9dnsE+/BRYHO4jPvPifKWcwbqk7yHG27TkkwAhUjrRzImj94t/j
         g9izz81008mC0rtN6Ip7xjNgSN3RvxxCzwA0FhZSx2BISl3R/eO8BVbxytjl8vHLVlPY
         Fi+UB9mLUQlUugtLCa268g9hEC35EdWyuBYRDckiZPOmyu7gMYYNjwzZvRNvtcc0lSL6
         3WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758791420; x=1759396220;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
        b=AhkdzvZVP86E017wFPjyWItG8tBG2lohc3ra7nofzqSLfbdT8AhWWNGGWnt74j5/de
         gtTxuHecFChQxYgbswVqtH1ckUe8N1/PZLqBijLel6RDe9pGtfjvhEA4RCuphG5PHH7/
         e/ePwp79nFYtiT6OLhFzNixezK7RvhI1tW4ihgW0/siBaH6s1bi/HKXBuQ0JX/Mo+ckJ
         oU8SrkFAjyARMsZr5DQVdg9ju+VbSNQnqcgFAgPCUSBcjkLli4lu7iHm6MZ89AjtrYh4
         UBWNsxfxacpMeYnlMx5mjFsxXnwni9XC38FTb9ZsjVDH9sSTFsBDw26Co83+/32eeKtb
         zAFg==
X-Forwarded-Encrypted: i=1; AJvYcCW1P8RlIu11cAHSeQaKdB19YAPDnvhu/Y80geQMlFwAxwVrI++uBoOB633ZO20LXYjUHvpBkhgXG6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdaXJlGX7RTKMVeJon6ovoN4SKrEMzFDQjqmS8SpJAeZg3b8t6
	BNdez5EvRJvxr/4t+uxpxRcriRV2yujxFiSP7vl8hs/VUsP3n7SLyY0RQ9OCFO8jtRE=
X-Gm-Gg: ASbGncuHqrEw1Rl4N5sQsv1zvbn7kVVwuxHhBH/ahHAKbEy/w/JUJnGuWTPCJFbwvTA
	KBiX9epfNGspqaxxjNH6noPnZ66wSkKw+gpLKzZyeZI18dpIjyeQEo40qq+aPc0ad8E0vP6Frl9
	kqQmsZA3eGbdRxmF5y5O0I6hXOfAvjSp9mOb9caW98qSK91uTNaFMl3HFgjFuGrjff0dS+7py86
	X+Lpd6f/okNHF5thWs8D+tUbRrU8LDBSESgZDSlqB2Nu78hEA8nPJ41QHbR10w6gBfHCqtpdkKb
	MH5kGjxkCSTt8J9YJGm4OeUHTxb99MdcLH61pybgCXaWmxYxiepTK/gTlFnw2qJMA7dOvtAyEN1
	6QSvHvX3HmvCt9MMv1R71QOlw42MDFOmiMS2Dcuz9Aw4F/IWv7gk57sx1rKu+cpoMWRefLPEDVi
	gzuhcZj0P4ZTqMxk7oFI+4
X-Google-Smtp-Source: AGHT+IFDpMpHsFRgd6YSWfaUgP4h+TK2gackvhjt2ED62B1HXzzX5IdszOWCjQD2qcaPDSO7lAZ6/Q==
X-Received: by 2002:a05:6000:2484:b0:3f1:2671:6d9e with SMTP id ffacd0b85a97d-40e497c346fmr2389638f8f.1.1758791420460;
        Thu, 25 Sep 2025 02:10:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e3bdsm27566255e9.2.2025.09.25.02.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:10:19 -0700 (PDT)
Message-ID: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Date: Thu, 25 Sep 2025 10:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:56, Jingyi Wang wrote:
> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
> +	0x21398, /* CAM_CC_DRV_AHB_CLK */
> +	0x21390, /* CAM_CC_DRV_XO_CLK */
> +	0x21364, /* CAM_CC_GDSC_CLK */
> +	0x21368, /* CAM_CC_SLEEP_CLK */
> +};

How is this critical list decided ?

For example why is the AHB clock critical but the CAMNOC and AXI clocks 
not critical ?

---
bod
