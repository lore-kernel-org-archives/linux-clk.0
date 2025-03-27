Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E461917FB
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091399; cv=none; b=Tp9sSTFY745/nLjDVqNYLSY8dpPvaie/oLM8FgOMNLyXhtqMn6i0kGWySh/a4oDy+gn5W3qSBXY7yhT6kyoW0T3pvQ+BHnMmE+eO+DMxtcJcMsAPrCuHnW1MAMP3fK2+cnzxR6H3VtKVpSx06dAKgSqa0V4aQiXEJ4lrDB5Gj64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091399; c=relaxed/simple;
	bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQ905sxcLehwCZ3Wyo1lb+EwhpBQqVBpwlBHeLxI00oqE1eZAqlUe9Z5w6ElAOuh5SvP+vE3909IGRzACt9/GN2NkyDCIYpBBljj4uNemfImtILHk0J/bT2/VTPlxBlOgqGxIdGnA5XGbpXJA53Y8Ca/d8wPgzlCt0Nq7CoWtCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mrf1bEQR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mrf1bEQR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so9212435e9.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091396; x=1743696196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
        b=Mrf1bEQR6394+stuB5J3/mCriRbuwaTINQqx7lqaEaUvCmuAf8u7j8c7EBCzL78tVl
         XApjcVjPV3fKemEwO+64ZG33my5Kuj9FbANbov3gxBWp0jl/2LokeOst48q85QjQyARA
         1gXwkasFHGcxXg1ZDCaaah3ksD2afOtJcDxfcMhDwGGmaLpIvcuRJcv1E/+PiGEP5dPs
         UF0L2lFb3Q5ETCpiVEP9YVxsrnGg49BNq7vmAov35/GGeMOPfO2NmX01ZPXfEEmnPMHJ
         ZUt8MRGGJZhxj0Np2QOalONkIljhEaggciiaNbmstDlJXoZ02jJEl9HRVNGQBsBJ5890
         rApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091396; x=1743696196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81QR6vZ1/3dHfg19CnDyBrh+7J9IpGW7HgshSplRzy4=;
        b=EqQhNvL0mEpLbpJT9889hQJDkAeO3+DZeDP2kS5LMyRKeB0GF2V2lBbE3DFunTMDpD
         nyLkxnZAC0oVdbzrIh3IZTrQTGyolDyRAPp2XYcXOaJpXkhBkV36zI/DAkFqFQXah9Sy
         U4GK9vDOBuGdkm9PUZtboBNvI3eWwr147aSU/xi1ZeJgRFYti9jUIhGprtXgjllf4a3Z
         4o2FdKG2S/VPMgjMJLSS0uZ1U83Gax6CvTXYFPuPYydPGWRetDH/oW4SZHrnT/7amCck
         dQNTQyYgJIaNAkQM1zaHhNG29fwLynOsHLOG92ycUaJZaWOgwA1L4oamghzFuNbiCkpj
         eXPA==
X-Forwarded-Encrypted: i=1; AJvYcCXZXNhfNYfprwj2Bw0gGSsUm0DFRSCcWqiRxEeO159MFJK5T3eflxj10z+lZWBvah7hWNpHMuz56z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwykOpw9qVrfPTpeLfrHayj3Axl7uwwaTlcvuxW+Nt8jo4SYbZu
	18rX7q2Q7rwFJ1wCkei4N80rnKPzkmFQ5uPhZM+4+/kCjZbTPGt8NJYB9OmZkQA=
X-Gm-Gg: ASbGncv7AaAzEeGNpvirRiuuQ+nSdZlGaKUyG0L6tgMFBf7F/V42kQL8gHOCwn4shlc
	GAg6hVhqzYYsN6Dv5KiOfukqdnXSeekkXjFaTIDUd2r4wtxewha5ru+shg/AQLwv6T8KOL7obpT
	fh4HfGKRPOs2aRxve2Pm5+y+y+3zbqLWxhDY+Proj797qYT9cgfv5nCAQ5gyWceabcWEN862qBu
	eFOOhZuugrgLNucv+boAPuWqqXE8TYoZ0stj2dmSQ7Tv7QfZF8p6ZX3RIN/3CTtuqGokkIAVeK0
	1c2lWpu3OOmYdg2MSqirMGGjcVutTmrEGB3et78s8qOMkGhpMa5ZVG6gBpTw+KyLDrfq+qzffr8
	chBG9j8gv2A==
X-Google-Smtp-Source: AGHT+IH0JdzqVvGdTYUoLn8HEZhsvGhRyL19/EW44GliMFz0RsNCHi1bdJHTLqu2hnfMAiUqwGBreg==
X-Received: by 2002:a05:600c:4f10:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-43d8a32c74bmr25755085e9.0.1743091395532;
        Thu, 27 Mar 2025 09:03:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6445sm20395820f8f.71.2025.03.27.09.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:03:15 -0700 (PDT)
Message-ID: <6063c030-f96d-4950-9ce0-473368988a07@linaro.org>
Date: Thu, 27 Mar 2025 16:03:13 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] arm64: dts: qcom: Add MXC power domain to camcc
 node on SM8450
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-16-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-16-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Your patch titles are in some places missing the soc:

arm64: dts: qcom: In this patch

arm64: dts: qcom: sm8550: In the next patch

Please add the SoC names to the patch titles in your next version

---
bod

