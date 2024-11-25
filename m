Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7ECBE40
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496871; cv=none; b=Co5NDxK3xwIffiRbtCgXL4WYn0NLtYfPZs8HIML5wqpC21Y0OYSnO1ooxresWJw6LWcVoeLJbU6O0PPgZwHqfWuqmlEYYSp9gjaTBExhE3n4jjSI2iofiIYOTXPCEWjfBjIvvP49HHmGw0cA6RkXqLrJgTekjknCF2cZiOQ82Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496871; c=relaxed/simple;
	bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUjobAHziqJnDmrVldxrJWUVLbot6epgOaKrHMniu+qmaLngF0hCV3YWwQZpo6qm112Fo8pFBm3gNfnM5C7DENI5U290khP7N8a5K0LiZ9SsLnKHymkD4mSDJelVUONp+fB3GPgCPgITUoBRdN55NGWYWc9+QI8bh9N9h6PNApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fvqk/7DM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fvqk/7DM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso36135225e9.0
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 17:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496868; x=1733101668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
        b=Fvqk/7DMQqim1X1CrIHSs3BZ+mdI3VV8GYux6wSflK00D/zXDUoSR5+V6z8NQKueLC
         vGXVrOlIuXZiXVecjTEE7r1KSk9TnSznwrLOYa4A0F5DSyiD/CHzMlFyebEmSLnh2LKb
         evl2dwb7rIp8I3ad8cVVG67bWHeav2OTBFNfU3wWvIkcapyQfip3kWHytbmFkNIxQzh1
         2U1qVGUtKWMDjSTMQdj0CLf/dtAuKOl5o+UqbmJpKR55vX1s2tn11a++pONSdzvBJRmX
         J8KGV7z/GIAR27TzDK+wh/obmmUY03Xm/hPshHdtkObqOvJa3dn/+2bav6yvhGwiTdE8
         Zf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496868; x=1733101668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zyft1p8BKzVPHJKKM8dRsZ8hHf5nnaQuyeZe7XSgq/g=;
        b=W6CyTnRevCv8VC/VePc/6q5WgLxgfK/1F5+QXTsgPlN4J7bWaACiZJqpkQwVMlXfbv
         0YWx421XAA0ZqtpUHxnrdlYQgNKbJx/2MIJKkMb/LEQf8FLquYosfqKHh2YTerfIRWAz
         UhIIF4TNlmJgLL9Jt8NZMX8lWsobkT/ewAzlJxnYdRqFvW/OMgGh21UxIuPlNTYb4uuw
         S3M46+8u2VA6gzC6eKfrDE4Mt+7CauyTWGQGCl00p6YGAp2P6TtYo/gf5RxoNmGTXMl9
         C/+nYyVjyPhTyMC8Q16lpAXJ+4IqE5gYeXFh4xUbfrZdmhk95N7fDVsxOKr0Uh3DT2M3
         xztQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqLX7r6V/67OhVyjeMk9iEUUaMVDwZ3mzFvKouiaWvmL/9qK/5VxKvLCzkMRuAU7LPE9Rm4p6QCnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRleTBpHsVHSsaNtG7AvbQ0xV+Mu5/v79HxlmIAW/PTSn+lYKP
	QJYNJ44UmgYvxt0fbAKcTUfIFO4rtvoL8ONVyIrwlDKDVTjK/D3BhLCRXzBVxdw=
X-Gm-Gg: ASbGncuOTMDb6AgNpFnFyYGGb1ZzI83fMXR4vq5idaeB1uZBVnf6neP2o8ErmrzfV6s
	yERUULZi7aYj5TtP3e7vDIeJs0psfpx5XGfKU3l0e2FK5BZhD8Q1/+oRTgH1DL2L7vCK6Q3r311
	q2ud6kJy3IRw5+iws/7H/1EG2SkJVwxIMVN/36UAhcGeXHBWaZsFc/FqSA3d1DMLrAaPo1Rbg2F
	a6Hu2CBYnNDrl06OD9IL/4THoyUN0Ka4B5k56hcV6ChPFGbG3gHlkz+ZL2Wf1k=
X-Google-Smtp-Source: AGHT+IHhoeFb+Wf/gYrX78mfl6z1x1kaYwgpE8ZNovkFpwSxzWiADNjuxgKT0GRkBF+vDAWZZizWWQ==
X-Received: by 2002:a05:6000:797:b0:382:5066:326f with SMTP id ffacd0b85a97d-38260b5b0bcmr8716564f8f.17.1732496867967;
        Sun, 24 Nov 2024 17:07:47 -0800 (PST)
Received: from [192.168.0.30] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd04ec7sm8938616f8f.110.2024.11.24.17.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 17:07:46 -0800 (PST)
Message-ID: <b1ff464f-9243-4e91-8dde-b31fac61e08c@linaro.org>
Date: Mon, 25 Nov 2024 01:07:45 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
 <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-2-a5e7554d7e45@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-2-a5e7554d7e45@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 01:00, Bryan O'Donoghue wrote:
> per which

for each
