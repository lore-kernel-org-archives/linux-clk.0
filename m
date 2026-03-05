Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02434F47D
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716301; cv=none; b=jHHFTHO0pPrnFKuNXWtcq2a/2zF0OxZSyLF0H0pVpeM7rEJ2r4FC+H69jdt3EP+FM8Ux4oCMPvuNRVA/TgGseCBCDZce8Etx1wzSUPO05UtHrX+Ay9XUeF8uFXv6bpb8LA70RjxyxCEn8kkFSMjG0XMOmW9TKWQitXgaTfyHe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716301; c=relaxed/simple;
	bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in2LNEQyrcgWHa0dD+dxOZjzfCbq5EfIpjl1Rfy44PJePNLsn0knjkBzw+KxucoQJWbTX+Um+rwSsgQaIOXtUGHzrefKoDjoyw3ru1rqiZ8WprHdN5f4NxnBLN+YbC7UJ7vRNMNZqSACXFYAyzyRpi9UUuvYOn9kFWOqxsVPojU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wwh41uvn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wwh41uvn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so67546645e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 05:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772716299; x=1773321099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
        b=Wwh41uvn+irwDe5oX6jQKJH62OTy7VPFr7bXXBd5kiIhZZ3PpnK2zqptgJxdPEdsD+
         wMn7qQbreyh2CU8wCEFUCkL/VGDnc7g+C3enbjB8eRUZR0TVTZ7/01DJ/sY896xUyXZH
         6h+FaSqLy7TteqTD4R861j+bxW81hooGohbUDjYjNXOUNHAE/9FnhHqq1wa4wDf1U6oe
         ulLT5TRjef1LDWgNPlYyE64Bg3nQn/enmfb2EWPzK4qYzsE17NbKoEyiNYjG8MhcHxm2
         EY06oUY0QcjCAbuozqxWzSpCvk+ZG+xzjROLs0zJ5DJGEdUQ17F59YJr5ED2Uqq2k75i
         547g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716299; x=1773321099;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPPvql0d0tqKs01yrymniWsmEm+rSLmkjVnK8EiE4AE=;
        b=ucbMHaniDamnq2HD483FWKnb0EeSQKTakbF4gX0DHPBCZ3tcY+E6lZCfIuoi7l58Fd
         r2id/AnbKs/cUzm1sNuf/FR7ZCaQQjEznIgFTgcDC+ZgerWs9QnpbdAg57rPUHOuETG3
         9VkhWBE8hvabB7yH3QqkbIWplCAyiEPw8WJnE9F+cjtU3mcpnV6G4ge2/5l01TJFRMgo
         fXqxw8h2PJ30Y7NyTHFiHo816xcKehRHRfTzM+lKR8JXGAHCRfNUzFO5jPNdwdjqP7nP
         APfCSI//CbwfKHTDTrsQB3uCMxhHu9xPoffoSNymqnQhKaPJJcTHBmp4BRsTEkAWGYHa
         7Nlw==
X-Forwarded-Encrypted: i=1; AJvYcCWhhCoQnEtpWRBEoRWIKDQMIZBenIV/VLNPdbL/ZAbLHVaMdWMHbvdtQYcf+suC/a8kOhOpJwbaD1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/4otPulcfYGfe558KLy7FcBVdcIRTkQtmZjFNNlK8iepW9V1t
	rb1Nj9FmeA1o6hAVnOsmudKLvnkyDskV+y0d7Qn873esLZeFlvLqK5OzfwT0F0iNiZE=
X-Gm-Gg: ATEYQzyY7Std123cPK4LO2m9+I7KzS1Su2EEPz2FKVSOvE1kiAiTHVtWAPlpTuNUfRL
	1Ziq9Lg//+Lny5JU822MUdITJLzEX4X5MUv3250qggqsANyTS1psB0nDoObj8x/Ib1W2w53j6kJ
	LKkJYLKJAk+aJmGp8T9eBfhHUi0miD9ldVl2yUzJuIH459ub6LnPzF/5a/7iKGqmP/IkLmakTDy
	fwGcKO104EPHE8JdeIpR8+lKGBvdED1QtButZA8J490GrFPam7TAh2PFmyEmKnMibV4LLnpu1Fk
	E39g7vcHIWmr74zW+4Zs6PWm5NByrMmg2pHLwJR3OlKpL6KxKB4Ib1ukWfIBZjFRxeU5DL0DZes
	ofJbZKsxAM6MJvzVeTtUS8yH/jBDUXxEEohqDKAI2C/dHs2swP4OZpXxx5IelO5yRlWtJuZGXZT
	/uUKp4GVZBNwPfeHvBcVdUNRp1switz0cEULJ+eDfkJTyAPYtT/GYQdnev0cBdKuvWa5kfwdoTj
	gk=
X-Received: by 2002:a05:600c:19c6:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-48519839402mr103596085e9.11.1772716298965;
        Thu, 05 Mar 2026 05:11:38 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm53169005e9.15.2026.03.05.05.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 05:11:38 -0800 (PST)
Message-ID: <1a22f7e9-8a48-448c-a035-7c487e81a96e@linaro.org>
Date: Thu, 5 Mar 2026 13:11:35 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
 <3f69539c-7383-4321-8cc6-1f5a8cc23822@kernel.org>
 <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2026 12:00, Krzysztof Kozlowski wrote:
> Actually I checked now - all the people reviewed commit without fixes
> tag and you just added.

Eh ...

Please don't do that with my SoB patch !

---
bod
