Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E082475E3
	for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942556; cv=none; b=CWewteK+qVeM1ANmBg6bX/szVwT6RCMJEDsHPeDEBU/n5kdsPHM2MCJYoNrMCyeAxxyRCJZlrUUSx5HPDyB08bTtW7IOCE/v7k9p+3uu/ZJF1DCN9aEQWdN/jitRO/OWOGgQaEzkbWq6RhTCtfVVnut3Ff64FKXbt4zWE7zFA5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942556; c=relaxed/simple;
	bh=GxiMUN5sqtriveaI/HLFwTpRRwlH2UsAEbUeMqe17Qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8eK984e9lK6LWs8BUCykVGutKOxOmW4gdMWm1UFI+NaNySugnHw5qB+bfEc/yv8LwyTh7TDPrtNaplX8EMNyrGXwVnXSLpKb/xvB65gHpdGXAmZx2q/2HW4giO4gH6o1erqIPQEdmO/KLk1EqmtS7n88i/Js7Wf61gGYL9jU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Znz9P2lr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Znz9P2lr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385de59c1a0so3342972f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Jan 2025 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736942552; x=1737547352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=Znz9P2lrJglPk3coNHRK0cjlTWtCC43MgS+5q2HzRml0qL9kN81Li9nCKchc4RWK6P
         9YFjRWa7ppEjv8dyvqe0EQNL12SVVVOS+1JyO/Kkpqut0t1o2ckANKOidtCoTkuCh7R4
         Ct0EQzixYjscKyG/ZpqMJbNYwU2wp7ajE+YgO/5Zz7qOVaFaCEF0VsfmPg9AL7OF35im
         EABtqqArw/vHjh6xSTA7pmzkH3MVQXHiagNeoBqcHXfE11UpbykR0AFh4HR8kQkto7TF
         XJ1ZVP1bgP6nN/CPkNZavBwu97BKKtHJGOG4jOX73PPJhhnVmvlPi4IdJEXOv1oBbkhl
         P/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942552; x=1737547352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J09817AefuwhTALG6OGHGhgUnuZ4yA9WXWtiMWd3gZ4=;
        b=Bz45/PA0TGZb9KoUh3mZcOnLYAoU1U3/m+lnXvZF7/95Bi61kIT5XfGIb9ASRQ8gV8
         GlG+LozqEQVr8ie0fs+v1wbhGBEN6GDDpCPPw7LkHZfb7B/G+NCpKjmCZS4z4d9zLxtb
         DUgF15cmtKmO3B1pjAddl7xx0FMqkSGWwtI6yHbzV8S/o+TjDhFSxCv8G295jpLcKI4U
         /5eOgL+sfRUZRKN22/l5E+wO6I4zSpFvqx1aDiDc3m2bfBMgmBuky1DNoA8NqVvqGau9
         wJNkUUUufMyugCV0nRC7d8inEWg10R3bNPRmmaWg4NQd5/X4vWms7GLFKYLDZbV9zTC+
         /kBA==
X-Forwarded-Encrypted: i=1; AJvYcCW5w1ctXsIjeseyTAGemT3sJEyKEdoZi5fh0v5P9EPwIMzFjkh4Nc4PIv1vj42EsgFEQce+DkelaQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMgMlJ/d8fsLecJXTzPRVVsonrZb+ZGdF0mwn8QADcBRapTPV
	xAjl7KRDPXXXiBbAK4KJjayCqruNKo528kqj1cRy8G+4GP9C2ecNA15KpVo81AY=
X-Gm-Gg: ASbGnctFmWauZFOP6RmkBn7GEFkCwhkwReVGUb1SlZ4njnn/geuCnsd1RU3f2VfcZ84
	2Y92wftr9AsVAXJVEtZ1Fy3UCjtNuxXrxjTbNBb3Hd7m8daNfJMRIGQgclql3klXUbgFfv5eXc0
	3G3ugSFesq4zHQy9V05nBCVYT7PTShXH3xK/mmwG+2i+r6zrqIvtkRl1WzVVnuT+/8afOvGAxlY
	oV1gjaTMHQHTABcQLuhJu/vCsRMzBzsKr5TfuQlyjP9/cnRTK5zLbjeV+Vq2/iOHw33rg==
X-Google-Smtp-Source: AGHT+IFfKyGn52ipjdfPZD6RVd7v4EFf3NGE8QU70ELIZjBpZX1RbqBIB9xbQUWlnKSlaXcoGcGZmA==
X-Received: by 2002:a5d:5847:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38be32a12d5mr6050542f8f.41.1736942552589;
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm17718135f8f.50.2025.01.15.04.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 04:02:32 -0800 (PST)
Message-ID: <8322416c-5762-4b64-80aa-7ef1b0b0287c@linaro.org>
Date: Wed, 15 Jan 2025 12:02:31 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250115-switch_gdsc_mode-v3-0-9a24d2fd724c@quicinc.com>
 <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250115-switch_gdsc_mode-v3-2-9a24d2fd724c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 09:30, Renjiang Han wrote:
> The POWER_CONTROL register addresses are not constant and can vary across
> the variants. Also as per the HW recommendation, the GDSC mode switching
> needs to be controlled from respective GDSC register and this is a uniform
> approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> which controls GDSC mode switching using its respective GDSC register.

This paragraph is difficult to read and understand. Try something a bit 
more like "Use dev_pm_genpd_set_hwmode() API to control GDSC mode 
switching. Do that because of reason x, y z"

"We are making this change because of reason a, b, c"

Basically just try to state the facts as clearly and concisely as possible.

---
bod
