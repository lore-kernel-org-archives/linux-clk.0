Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE7A1DEFE0
	for <linux-clk@vger.kernel.org>; Fri, 22 Nov 2024 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279861; cv=none; b=S8+WGC3irgaLnu/W57jwqvdKE6VsEfd04i0o5A80YyyqdgGq2U1kUDXaQ9J7rspNBDgHO7/iiG8g60EV1If7+2+a7sWbmt5zKhahcV/pcv9pDYfAmVWnT5R2vur7MjfrEviKaCXoGU/cZ4tBeoFs3boftYqWtDwB5Lzkj/3ol/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279861; c=relaxed/simple;
	bh=JBHOh4rUnLADzXtOwvC84g7/JrNLMPYtlQhDKTzIkJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGmyTGr5AyZRQwqsOBkzr7CzjWzCcYtzaTcwz6+QnDp635/jtqyBMUmpDN8NZ6oRIc0gOFsxv2bbEYVpV1G5ga9G3GURovJ6ESZo5lGKwJ7D11v86UwRm7HFVTS0q+uDnysTmV4wlFtJZImW0THhFyigl3jIlZ1TarQ4gz23HhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euAhNgAx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euAhNgAx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38230ed9baeso1422188f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Nov 2024 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732279858; x=1732884658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KISqflzqP4C+qpQH2POLD8D91UlEquq5DIx6lhdqv9U=;
        b=euAhNgAxorUVFsIASQSjJa5dVhdxz+PiPyB5faPqRuOSn+aKWBG1XSpIl/VtWkKuwE
         Bdw8vLDl8bK7tPpnovrsliIbLi8LnW5uodLlL6Ul+gIPrxi20foUl4G/ZRXgxjxbtsD7
         7op1n9gMyGQZ6g90HwJtVnu6jY4nwcm8pwBCKDc+rjqtMWkiC2kydcTeujeEJaMfI1d3
         cE5/bvgkjCBEnpRWhLXxRvIaIpqb1xBpj2606A0HQ/fdtTyjBsgvLE7FSmoopUN4Ja+M
         VJiE3BjevBK1/LfB4qbqdh9scSHNJgwzqRnD3RJOQY1evJ8MzW/Vj2po8Kk+FK4enI4E
         SyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732279858; x=1732884658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KISqflzqP4C+qpQH2POLD8D91UlEquq5DIx6lhdqv9U=;
        b=XoV7jQOFVmucyF8KqQr7XDA442lTB0YDhLqGuVBTHHZa4yWuoVjcp3vLjAVohqd3Jp
         IsZxkVgie8osjGTZxw696x4HXTMP2jnnk0Dq9bDJTEIVFpFgyv+UvYuIFditOltlHUhz
         Uj9hsl+WjhA5ho09DHlIvk1TLkaxwN/L1vbUjgkq/tdgJi06PRxSwlE9nSWumdyNmxdD
         gOZwpTip/rLyE8hBpWMQPcD0sV/e0gFcP6eZVp0+GCwodOaH0v3hF05lhYpSzlbpDtrh
         7/hIDzNjIPc7eL2osv2kPYv0CvSFUgcUAxHN+3rBvZdEyO25UqRf3EAq+Zeq3X4nNY7h
         FTCA==
X-Forwarded-Encrypted: i=1; AJvYcCUp9f6U2I7ElUcANnFGzNDilfMgrZ8Hv1yDg0U6vUpXBIqkz8iWgF/6Nmb5gbQ5dKgkLl0oIhsYWZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVu1JklRzZjswvmEp3eYVhr5xR9jAAbF+3UP4GJxPMP/KiQ6Iu
	ARl1IG59HE+qXbNG2R35Z5qtaniqv1ca83YmzS2VGYsWPJet9tw7JT1H8d29fcg=
X-Gm-Gg: ASbGncuYae3bRT8N/gHvaMl5aX1/yT4oI7DIS9PbPcNVTWORNlEqZUBWsFXkYX9OQIQ
	XhEcAGWo/Vq8CeKbxXNX9yYX1dAgoMoUu4r9/SkhxGL27nyKwrxNw3JWUk7iD6uZcLvSmow1vUn
	/6F4v+LzuWQKs9CSKELaVH/Szw19b4qEjClnqpVsY302F6UIHxoct2QYFFOS9o/ti4ltr0tbIdE
	/dNRs6FZyUCTqLxv8K9CK6wN4KWwRJbSfFaO9VYLubS4Kq45tmD8jYrorJlQE8=
X-Google-Smtp-Source: AGHT+IH8paRTgv6TgTv/fMTI/UYofpz859HmfaEoTHqkrdKZAJ6nGDUeZc0w5K8HyhUYuBIakIZLDQ==
X-Received: by 2002:a05:6000:186b:b0:381:cffc:d40b with SMTP id ffacd0b85a97d-38260bcd023mr2225909f8f.39.1732279858025;
        Fri, 22 Nov 2024 04:50:58 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf63sm2333104f8f.102.2024.11.22.04.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:50:57 -0800 (PST)
Message-ID: <2299ec8f-4b80-48ea-96ed-d1eb40998e55@linaro.org>
Date: Fri, 22 Nov 2024 12:50:56 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2024 10:31, Renjiang Han wrote:
> -	if (IS_V6(core))
> +	if (IS_V6(core) || IS_V4(core))

sdm845 IS_V4()

The GDSCs for the clock OTOH are


static struct gdsc vcodec0_gdsc = {
         .gdscr = 0x874,
         .pd = {
                 .name = "vcodec0_gdsc",
         },
         .cxcs = (unsigned int []){ 0x890, 0x930 },
         .cxc_count = 2,
         .flags = HW_CTRL | POLL_CFG_GDSCR,
         .pwrsts = PWRSTS_OFF_ON,
};

static struct gdsc vcodec1_gdsc = {
         .gdscr = 0x8b4,
         .pd = {
                 .name = "vcodec1_gdsc",
         },
         .cxcs = (unsigned int []){ 0x8d0, 0x950 },
         .cxc_count = 2,
         .flags = HW_CTRL | POLL_CFG_GDSCR,
         .pwrsts = PWRSTS_OFF_ON,
};

I can't see how this series will work on 845.

---
bod
