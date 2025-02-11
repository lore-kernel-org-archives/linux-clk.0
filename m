Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5B253B5A
	for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289879; cv=none; b=JuOTYbhe4SmiqNEdYkw7IkWIln38cz9IwmVNgVrRBjrNo69aukrMM1G0nu/LZHpBRyIFKwH8GU+ILRouXfImrwB2fU0XXktTb1bRTqSkT04EYEBDXOXKeGxiwcvFmUnVcnRZhcSlVSVFBEw+lOJfYFZt4u8HyfW9+CYL1xbi5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289879; c=relaxed/simple;
	bh=JH7ijZNDjNdhRFML1H7hwn6Ylh+jwwnUVby5SKkbOZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkqXLJ/asvBse+xTEodNSzARcQGgeyZuS9t8BK4B3TNzzL32oLz2qJHOwVVWgGxUEJsp048Bbbw7G03gcQj/DdCFMLfQpe4peO4CuYFHRbeUPy2+yZ/+mC4k5UhIidE9wQCTF9I/8e88p4l9TAJ7aIji2taO7ZmV7rRBTRzDc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLmxfzZN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLmxfzZN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43955067383so5847875e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739289875; x=1739894675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=dLmxfzZNmUXQZ9Bx69tBjdTbdvcDNY21PN8K1dLjLEWGu9Jv4YMQMCxDU8q9r7U3RX
         MY9viEfz/+hJAvaDBpQzcYJqP3X4c7CgMm3svXyv+cJPtfwW+zZvtZ8JCISlz+Y73nr3
         REI4kkeTc+iXgq9sREILI5BPq0E+0TgUW7uYBeER+zY2A2OoURsIKBBuD/MKBx/MuVy8
         h2/eqaVJk+xNBFEgqcLtWCJb7QRiThBuCylk4pDGNTIiufOO/HeXPHcpgs+VzsXRRTVV
         dufIOtnxwOMJ3O1tI+X/wG0VuW42L+Y6VjaxvZpwdkEUioBqSSd+r4NBFCOAHDEQYIV3
         96CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289875; x=1739894675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=c3HlrbLjkL9X3Vwyt8Jn/jJQWzsqnHC0z0P3ChwB0vxDFy0rZNyCPPTmZkRDtz5ENQ
         iCajaEntHMOuwFC/4YFivJrRjsCBQDsiFrQrkagGyEzWwDkh/MXQPEwSCM+14zxg2ypn
         kWbzoh04GM0TC1YQ/Zyj/yBLgZUcYL41cuTVGmh4qgH1mcV+tltoNFyQp0LA+z6HSf1b
         XhAVLELzZCNCckdxrONTH2v/KdKcx9g3PUXTFkhXE//xrc4zf9T0ve+QtoNjIUHZrXR9
         tuMBPe1GNu9XWBb2KwzsLlRKg44kNcZP04vzqIuxLNz1U4+UVzyhiSeoj7u9JA2Q1THM
         VOBg==
X-Forwarded-Encrypted: i=1; AJvYcCWHASz2RD17et5rgQ4uzRFICFExvWdY+0QF23MgWyl0Xs1SLS9P/gP2QkZzJQVQyRCJdtZTC26uW88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRdTUEnaTQBLpkcuCUk01KWlbI4kDgfulqDgXWkreN8cxGJNxF
	b7OfnmqzFrpn1dojY3Zt86NuP7+8PkbMLZ3FaGew8doLTLzwlb+KgdFXRiMUfi0=
X-Gm-Gg: ASbGncs9dSfSk9rTXPuWcvPr7wYX1g0P/iPDl6SimvTJ3X93zC/drFD4lrzoxk8yk+0
	QuLs45QfnTLzH+RQqq+9OkNh6ZkiNtfxMihU4vBiR5NKy4i4WjI71dbDqlAvBZrGaNm/h8gYpt+
	+zmO5aNNn/M6Va4TVEYFsB4nxPqpEx32cdAhb4HMsMQow6JJQbCjhNBqSW5lFc4ZB531KlQBswd
	IJVmChZFU+As2NipEzlBFuT8Eor83hjODXgIGQbHoTO8biQQSAXVVaYw4R0OkwRV00SR5yX05qa
	FJpWfmSpqK8uQYu4WGjtgNVX/hrr4ry4uujPAtQ8u9ARtDzKA/tIQqsdOw==
X-Google-Smtp-Source: AGHT+IGZ6rqRtEwePiKwnX4xQSPq4bLPiyPcMlt146MZTNkCKpzb/PK7/r6TdTiPg3VS3vFEj4i9OQ==
X-Received: by 2002:a5d:6daf:0:b0:38d:e149:f863 with SMTP id ffacd0b85a97d-38de419408cmr3758370f8f.24.1739289875146;
        Tue, 11 Feb 2025 08:04:35 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm9084581f8f.83.2025.02.11.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:04:34 -0800 (PST)
Message-ID: <a02289bc-fac3-4ea3-b5e1-8557c2b95550@linaro.org>
Date: Tue, 11 Feb 2025 16:04:32 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add SDM670 camera subsystem
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 03:50, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> Changes since v9 (20241218231729.270137-7-mailingradian@gmail.com):
> - add Reviewed-by from Bryan (2/3)
> - drop applied camcc patches (previously 1/5, 5/5)
> - rebase on media.git branch next and sdm670 dts patches
There's a minor merge splat which I fixed on this tree.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-media-qcom-camss/master?ref_type=heads

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
