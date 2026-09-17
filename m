Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F313336888
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649046; cv=none; b=rDUURr0Y49kUbY+hHGr4EGxR4Bz6/qzspxcBjc79l4r8RELbOGcHL2Qw1bKycfekXOtof8UPG70ps/8uKcyEZgeaDWGvumYczdomFSYuZKadVvmJNTnjUlYq/kRwF+QaUOhxH4JBw3LfVVdoGWyNfqj4ooXWYV57JNQ8pCwu2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649046; c=relaxed/simple;
	bh=X++7KAk2FmgKKTdfe031N+A5JegX9n/upfzGbRy0M9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5qSadqbJ7fGeMoCuxCs8IiaGPs0d5t9jfglhNBqoOopIuiEUm8oOsDHZ+t+zPAPdQZ0lkVLvOaveWKAPZmBiTD7hiefTKsSDxxWfsEAJc5BdVu3SgQ5axhp1Hni+quvVjW2RtlQk3GfmeCM+7u4uVAq1I0Pc1zMJL1Tlro6p5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+K9UVO/; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+K9UVO/"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so1341279a12.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 05:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789649035; x=1790253835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=H+K9UVO/rzs+TITURqIIFQIdtEsgnkt36Gcksij51sflBHS7pb0Tf0ho02panhb/gi
         ZmyLiNLheYB/+rvei3VN6O4nQmhSHo9RdtPa4J0pUQJd2bos6Ln5ciSUlHHrUS5z4Tsm
         YgdTixm3vBp/N4rxxojEaMQR3D+osNRqIYO2PEDo2KFFT/KdJBsFa4YagcIj0Nctr0iE
         DFg+epZMXHQdT+mH3oPNYFrV3gdIdflt+Tn/2i3Hf/kuGugxLE+gxwUIzjUsLLfScMX+
         rgvYppHKqbhKn3BupkNje3PGrJO/i2BF9S4omEic+GJo7eiH2E3dDw2iowKsaq7E/vFl
         sVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649035; x=1790253835;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7EV5DL8qRH0a/MP26yVs5lc2kWIGglCyt84hDRgCrI=;
        b=jMSOcH5ujnFb87r16DWoDJRCICYjrgLPHMcfnIyliMfmp4PM/yrlrn9Bw1NMzn9JHt
         Uu9D09RwBjCMDnz0+JIj/EuTJ1v1ZZ7A6lYP5v5cQxe81FJ+tp8BHoOfczTxZ6zZ9E9b
         GTyhsrc4jnk9qeQBACBfHlgsbrG0kKSpIAkGZ/QAKbIr5COx3A4ZNZNldXcTBHymjlIy
         FiNkBEKTew2pGTteuLUvuzdVc0z294AmtIqe2DR7Ax9YceQ9FqkTdtEKhU2zTWVIT3y3
         HjbExIN6aKIqpElHQ+138O8o1noFXA/GQ+ZFG/bbU5SvI48o/yYU7i3YF2slWP6SLDMW
         ZK9w==
X-Forwarded-Encrypted: i=1; AKwUvBz6sZFk+ogifHevUT4U3mSGC0/9EdxC1y6SczyyHCRfxahGXDlHkiuKBoKeSoL91QLekph9OWl0jHk=@vger.kernel.org
X-Gm-Message-State: AFuF++mn6gZrTp9ZSGxLz5f1kcoCCYq7G9edjQttDNpZSBVSIPFbu7nh
	5Vcr+dYQBW4U7y31SG/x6t7rkprOGdVnFJ51pwrZfmC0CIERNKmVpVI7FIx9DoZThcw=
X-Gm-Gg: AYBFou2LTXGxon43MfT9VK7+TT6xKm7eQxsnzfJ183NTnz4O6Qq6yjPVMmvQIkkUqeH
	Nm5yvcv2/fbJxB+uQpHKSj8ZHKfp9wyvOup+RlLc40b9B/7oUEsrtVdwxva0yGDvUd2QfHB3C9r
	/981AX26PiCi/7aq+Y4Hb8zRvpfAWPlAYODlfxiYWezAPLBpKMIJMLBUa8vBQ6xsJbNKD11sRHR
	V9knSpBhHfQDiahveVD+uS8N1UPBt5DLLBWrke8jFEMQzLRb+Kyq1sHFKR91f7lGiugQ/DiYt+Z
	pi7VRW7n4169gOPUjSoAbQnra2pz19osGEq7BvGToDi82QH5jCHUU2Cb8kEQQs2Oe1YR4qXxNpi
	FpXcIED5A2AVJT5ODUbe3kgzAvXqV8S0rumz9qyPX6AEHa/Iv4Tnn7Y1zlzFAh+vnEzAaIflTv7
	tLhmHUXDNgy5eKb7xO5SFAcVWO5LAYlu370Wi8TCJm+uqlgOrfSydEOPVT8psHuyGna8ywZHlEM
	N+lOulCZFg=
X-Received: by 2002:a05:6402:360d:b0:6a7:ea53:f62c with SMTP id 4fb4d7f45d1cf-6aa2246021dmr5023762a12.43.1789649034670;
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228baesm3705562a12.9.2026.09.17.05.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:43:54 -0700 (PDT)
Message-ID: <be9f9890-1bca-4f25-9005-faa5a4413e98@linaro.org>
Date: Thu, 17 Sep 2026 13:43:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
 <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <9e8ae55f-6d95-48a9-bef1-ab653d0f1c7d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/09/2026 13:32, Neil Armstrong wrote:
>> +++ b/drivers/phy/phy-core.c
>> @@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char 
>> *string)
>>       link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
>>       if (!link)
>> -        dev_dbg(dev, "failed to create device link to %s\n",
>> +        dev_err(dev, "failed to create device link to %s\n",
>>               dev_name(phy->dev.parent));
> 
> This change belongs in another patch.

yeah you're right I messed up my rebase ..
