Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2B83E8692
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947652; cv=none; b=SBVlIkEW5k/WemePNfou+BbkMi64zltaOOD8g7ayGtYH3AOASEHqqLJpQUuRKa7QQfppn9g82cMs3220mKlQohhn1BKtUyJwPLC81+OTFuSb2eH5ypRBzQlJuyLISD/1yAuZ9jpq0X6M4ecvOi2GvVzfSokf7pZmo6u2+j8Nw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947652; c=relaxed/simple;
	bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIJA0WwSpmfj0XF/ulMLz6jIJ3R/WitgkjH3p3CCI8lh1q51L8TgfL4stPchPcsIGfwcT+3IYnZV6B68Mb/dDrUvyVJc+xogzpt9y+r/T9BHPEboOJiCtfIYFW31o9tVNH22hyco2hS8G+8uO1iLs8DBOwbDiXoEgRs5kJqaWVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OyuRrHlB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OyuRrHlB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so53534815e9.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 05:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776947649; x=1777552449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=OyuRrHlBpR0TcLjq11DTQNVtYQFiAa0ENCTgMudk1mmQm9bi3GjK0R+oqirFvaux56
         tiRflDIWvLlzZ0z0VxddZifTV8BBSsdBZDJ83frSosJnARIDfSQvBCWqcDIk/20KWfF8
         RLnCxbLa42aWvpoN3X5VBE8QCtyZUTqn5uHDT74lEb83MawzycdF5ewTBOMq8jM/GmZ9
         EGnQyJAsjGh4MX4X2Nf+i2LlYrrwenkMWqPKmxB/1LtLVIpImd5HAvjizdmNEMlc3NMT
         weIWR5WCAM4x+JDd3XhJW3AZ+3PILhr8/095YeW4587nwhr6XPNaIspj7jKjrWLB/rUc
         8QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947649; x=1777552449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHt8/jDSXolzcD5Ycs/HtVeMQJoHpcSGMEeHPCWu22c=;
        b=R6ph244fhO56/BTsq78Lq8DHq24ZWnl+Tzx13LdUeLtKDP12PT8yYd2h6UFEcUKn65
         33ZDtuOfvsFGKVJ3o1sNzUjm2CAgf7OeFlrzejubg5UN2VOpqDdUgQez6ONt4zu5TzkF
         udx6mKdDfw4tBrrvFB5ajKWBD9iDhlNb+wtMGpR3Rhj8hH1INbg7D1c/sMG/TiN8wCFL
         S1OwZBSaYjCvyd1MVnHPx1Lic9/HOpefNL/e4SQdme4QxY+vAJpG955uR2TaPZk2m2cl
         3M4A3OkaeoxnKNQFIjiE/O/h3NfJN/6x9OTiZA+C/ciUG4ehgiOmq+3B5LDmoJRsuAfQ
         H1Qw==
X-Forwarded-Encrypted: i=1; AFNElJ9lMsYciJcXN+5LyPW4NVWAzSPAMWyQs4/YKQQti0RsuQlK8wSyaxxGMGazHKvbEjh0s1MAVrfWBFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IXEJZoRJ7912oJgJcYITx9NI93dos5WJadsUXPIrDnQq62e6
	9aAu+C3m7h6VBpIMPHMgQIjfiSx95D5W/wQuz4vm6nN6H6Qw8G/lSVmEq/PRzKJ8cg8=
X-Gm-Gg: AeBDiet98XXeu/Q/m7uRKdWorBINA/2GbTMD/0JOIWctX2lQ5BLwAM+EJAsQDAGFCyu
	krFC8xmBZqq0rNZ1U7Upjvab32vaMmeRDouwA57Qlrf8lmlRHc5OiH43XjYqO8k2PcM4r9jBr9q
	2/cMFCrdFqwCNm8T8Dc81L3DA+KhEYL7SQyB7UoUMSOxP7t4X56Qs24yS1asNsPzoGIGMUz+sZm
	3sZW6yZuSz1oMu6sTt30ScZWpek0mq7byeVRG/OXgSLmxl/VO8CP3f0Q3Qn31XBP7vEanloUOSx
	7NyFpONxv6PtklXllOWO6Z/RE3H5CtCQUkL5DkuNSpDnqT4uf/k8CRoL3ajmVFf2wtFFtaAM/QH
	FG6M1PNRp9NzD88Ans2CT2k7aWZcAl70T7Q8xwFC8K6N4WiKhgjXk8/ce01V9PigEugrgj+4SLb
	Yd5l5dq7oxYH+bNnf7VlcHyra9r2M7+zYtjyX8cmZmfRk=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr363286325e9.18.1776947649347;
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Received: from [10.11.12.108] ([86.127.43.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm588535385e9.12.2026.04.23.05.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:34:09 -0700 (PDT)
Message-ID: <b85c3dc6-46a7-4d08-8008-a8334262f4a1@linaro.org>
Date: Thu, 23 Apr 2026 15:34:04 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] thermal: samsung: Add support for Google GS101
 TMU
To: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sashiko identified few bugs in the existing upstream acpm code.
And two bugs for the current proposal. Preparing v4 where I
squash all.

Thanks,
ta
