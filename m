Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6A1339A4
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943009; cv=none; b=XEXGwrif9qiyggy6DNTNGWrdJ3Wok5Sa5MKc1vRa1jt+gGjHvtNNj1QbrbaGU9UO/9lwoG1zE94Hqto4jBWKnMU5nepMbPl5WkgfaRR4nJiEC124Amh0m9FQwFaC6d0aGrWgsDPgU7h8JihYarthUXBT8a+Ked2zh3s5HYJr2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943009; c=relaxed/simple;
	bh=NiWvDq9Jv7c8V/yKO2o6tUV8lhRD29H7mB84D22zqXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zd7H/lftT2cjED7geE2eFJqDM72Q0dKYngLW97QEpUyYLOC89qknBgxKN/zZeu1qxWzDaVKc4suHx1hLq0LIVHot8a9ExIbL/L/mgTYEHqcR3wHd2Zs9nJVnVflu50y1bNFXDYp9rWhKPgdJ5uZBBhEcMe+FER1YVSt9WaRj0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D6lKWGR5; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D6lKWGR5"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43277900fb4so1211521f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 23:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767943006; x=1768547806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r19tyQaWi8qpXtWGCMBQyqBf8+whJhST0zh1uSitStg=;
        b=D6lKWGR5/qSASemQYI038SQGWhX1dqwrlQS+FzeQI5zqxiAtLd963/AOjE6Un8zR44
         pGjxcZVjBPrEHQ44PpK8tgSdtf9z1DHP6aZJN/keznAcCvX2ON+Cimw+O+gC+CsTOlzx
         6evWlBOr+fXC8xe4WyxmiMgvdco/JHq/OHqeWkW1WxfAVPl64cucCahrb3k9hNNG0txu
         M+BOvcvfmK2ohjqhfMZ4RIbMDRblgFuVUfYJDo3ItBwjIrnc3bvd35s3OEtUgMM2/+RA
         Hzg3a0s6zXCdhheFAeQ0908LY2WOf7mVB/6NA+lUDTa2VReVjAN3ZAW9gl03GO+ENeFe
         EeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943006; x=1768547806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r19tyQaWi8qpXtWGCMBQyqBf8+whJhST0zh1uSitStg=;
        b=GRr/lpVppKtgbEzud+POIi2aOcJHWo5ieNFV0cefX+d4LYLzKICrVnZQtC9fdiYaFI
         PlyDKMQWj9jqGyhyFKJhqpU5RjKXHvT+OtzNgDF0Wr/MEWYE5YuIqz55+TFQ/SIFjMXk
         Dt2Z7OqO/ga52TDK9B9EvudT3xcazvHdIS6XCvDy0jzcTE9sXtcfMtaRqMzk9cPByj9y
         /mdvlCnuX/yROW83dH5+ftVQiUftNDHVpfsFId0DZAgNAY4+nyNvfi0NHhGar/ixN2O2
         BV9TWG68VpPo0tC4RCwPL6j1ZtytILZTz8PlFZM8jc97vdulEECs/xQTTwLch/Haz6dk
         6yiw==
X-Gm-Message-State: AOJu0Yx1q0Qf0xkB5VK+iV4bK/G2zhNzOD3R1R6lVCj7+e/FwlVTxkgM
	l55fnu6anO/rA7OkqHBqczRhWKusz8p9sC8vxkKqBWT+gjox0jtprcqhwieDE2hBFeU=
X-Gm-Gg: AY/fxX471Nv8LooKJvkFAVJFci3ctOQilbMHpCvlMy30UMrIc+IwPw3Kb+LqolnEkNf
	YD8CxTAwURtjHwjxTyWstaphYxcGL33QH7XER3VAb7XHreXmT6bvL9ElyGcBlkZMWT1SOyJJqv9
	Nb/JxEV7m8dg5SHIkh4KGIEkBK+KsWFls6IQGtZhZhwnBr9prFluO9NAQE/5p76Tvce/vzkDMKu
	0BKnqdihJqi/HG6/q/X1IShECr4sm4Ldxw+fkco1yy9GC8PMDKcE2KOWTcWiEAk5OaKVQd6EP76
	lPTkybTURZWhHmYZUF4PiltCkUyR8FWpVnFaLNWKth74aTiOz4ZXSGrF7e0X4zoF2m1aBzwpXs7
	7iY/i4p8AChg1Esi6iBF9YFJXxzwPEfdFpdtVuOcuW5tkXw+z0hEICXhvWgw3mA356VR+YI0YfJ
	yvgI/pNI03L038SL8tqg==
X-Google-Smtp-Source: AGHT+IG8xyHPtuf0fJBY1zmau/DLVTO8ES+UEcPLUqFXMKTM1lFC+ZspP4WB77RwIkosSgpMEuzgvA==
X-Received: by 2002:a05:6000:a88:b0:432:c0b8:ee42 with SMTP id ffacd0b85a97d-432c0b8ef25mr10812377f8f.11.1767943006421;
        Thu, 08 Jan 2026 23:16:46 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm6989440f8f.7.2026.01.08.23.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 23:16:45 -0800 (PST)
Message-ID: <baaaccab-3ac8-47ed-b4c5-13401d08228f@tuxon.dev>
Date: Fri, 9 Jan 2026 09:16:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clk: microchip: core: fix issue with round_rate
 conversion and allow compile test
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <aWA6rNLNqYfJKTzf@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aWA6rNLNqYfJKTzf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all,

On 1/9/26 01:15, Brian Masney wrote:
> Hi Stephen and Claudiu,
> 
> On Fri, Dec 05, 2025 at 02:46:26PM -0500, Brian Masney wrote:
>> Here's a series that fixes an issue with my round_rate conversion on
>> this PIC32 driver, fixes a minor bug, and allows building this driver
>> on other architectures with COMPILE_TEST enabled.
>>
>> Changes in v3:
>> - Mock out cpu_nop5() in the case of COMPILE_TEST
>> - Don't return -EINVAL in *_get_parent()
>> - Link to v2: https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com
>>
>> Changes in v2:
>> - Add new patch to drop unused asm/traps.h
>> - Link to v1: https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com
>>
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>> ---
>> Brian Masney (4):
>>        clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
>>        clk: microchip: core: correct return value on *_get_parent()
>>        clk: microchip: core: remove unused include asm/traps.h
>>        clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> 
> Stephen: Can you just pick up the first 3 patches in this series? Let's
> drop patch 4 for now. I'm going to send to the MIPS maintainers a patch
> to move arch/mips/include/asm/mach-pic32/pic32.h to
> include/linux/platform_data, and update all of the drivers to use that
> new header.

I'm going to take those though clk-microchip tree if that's good for everybody.

Thank you,
Claudiu
