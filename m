Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C31926CE23
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123364; cv=none; b=U4wxiP+DS0MgheMGSpGmg7FeSZB9CO+PPFCdEpTPNEc6iB916eDGLfJaVgG+/w+7V8gH14SgecZR5nG6LyMalWcD33Bq3Qil2Laym6A5Glj79xzEX5Z7iONQ9w7ymHBXP9SEBIc/7wUm/OpAH02X2LJqKtsWt33Hjr3xe3NBLIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123364; c=relaxed/simple;
	bh=kN3O4oAZ9kJwN6mPygYUfzC342hF1oirE9ZK//UXyWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dm+tuqXIVtTA443LalB5qEHfk5A4vArC4nbRGsZos3v+O2FHtT7ykpH+TagI4pylefacOa5uZ+g+L5KqVGjQ3rtiqkvGTF4vAUTpLw0rL+TQ1A/8T8MblP3B5ZJa4AY69WiToCzv78LuNKgbiJCtzWnoSZ0B3HcKh9nj7YxLh9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SE2BL/wZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SE2BL/wZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c68ac7e238so1353389f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756123360; x=1756728160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJvbqf/yt1tsn43VAwo8VG/RGkLizif52M9SXD1q9EE=;
        b=SE2BL/wZ8ZQHFH9NPi6CMvQrmp5ooM5cHc9ESIWihbo1tnXjTbzDJa0ULyO9JYzPyT
         sG5e2BD+gRPA5rtyK/sm8X1IASJyvm512i1KW5V68GbA8GfxQht+riDTFvsRY76/Cakq
         AB7bQyO7G+nF0h9Jrql/38zZHVtFPZqQrv06trPa/GV2MH0dUATtslHglUtLNXJQwccU
         8RAB/cY4URQouu+0VVoXy8YThpifeIznF9q/u1hVux3LqCgNi8l4ebKR0nszxWzH9ulJ
         MNXSNe2/mtrWZfAOauHqXFK6bTua0F+HWRl4/iF2bS7jjoxIRKAdmcMXOvhSgDGnQAC+
         7VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756123360; x=1756728160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJvbqf/yt1tsn43VAwo8VG/RGkLizif52M9SXD1q9EE=;
        b=wLBcDl/3EqUGxLfgv3VEbrLK9HTa1jDK+vKR3yXEdS0VHAumVCf/yz7RVYG7g8sPjZ
         9dWEvH5v1x0Txo9IdajVQODpkp335fX8iWhAMfcd2bYgThDEA22Ch/RleLMjfuxWTmel
         ssChpKJZ/h6UQmpRkOXTLwzmT6ugTSkmd8buFf14wNNAM1CDtqUvUSdiNmZ5EkblDfFZ
         4YJGMtVUtE22n5+Ohs7yCegYpVjV8En0ntUrPAyQtBgowit5/5iH70Z5j4ouks+/J824
         4e1wuPxYubXT7CO8yU8Jm5/6yMVkTsjMMEpSLFZPlN5vhfOWxRB6cTlIPUGyrq19pPEj
         XhBw==
X-Forwarded-Encrypted: i=1; AJvYcCUX02qReybQ4J5H/DrN0oXmERq/ujUFfBpKhPIteV403sFza2u8gc5UouprxLlGCEyn9DrNzyLnpVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2nkOsomOlkZOnhMXK9YJVDBYhvdGPpkoRD3bdMyq4KqekFzx
	0+L4jR/Sl4LEC7Q8+ZIhA8OrODnJiEXVz42bUFvHooRZfGURSzPhLLLLdUKGjabgXDk=
X-Gm-Gg: ASbGncvvWMyVSxlurh7IvWfpXdglC57MSpyxHZYabpcn2ziZtwyc1/5UdJVYZNCOldU
	wzcztOU83ZSuNYALFU40+gj7B7K1zy9Xqcu09rjkws9ED90C4G/j5v0qQJYqTkD4na3ZAXXHDb/
	yVM2ZIKlRPGBDxfftTPKDNf6RF0Ga7CDWau0PvgD6D07QAKpw3F1yVGuBod1aYjX4gthWa73kgs
	s5UQ0oXMJugW2u4WWPvUgbcmnbmz6t2udeJuTxpGowFMXvEY1h1zBUPdkKD7xPeGgonS5wuMK5b
	/dQhGHKZDibpdWGl/Upx2jV5FFxcR0K4qZSlyD6eGhd8y9ZcxZstN4N8mRKCtj54811pem6z1ae
	vb48Ga0S4ElUb7Iz7pIRBnocTau+ISww=
X-Google-Smtp-Source: AGHT+IHNjJgvFd7vseEGAj3DNMBQJ1GiUVz6n+LYqvwtjb1i5BLxin1zHA6RIo01dWv3lsPQdAUdIQ==
X-Received: by 2002:a05:6000:310b:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3c5db8aae86mr8234480f8f.10.1756123360040;
        Mon, 25 Aug 2025 05:02:40 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211bd7sm11550954f8f.38.2025.08.25.05.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:02:39 -0700 (PDT)
Message-ID: <c82cb87e-c793-45b1-bfad-fa00fae1d9c7@linaro.org>
Date: Mon, 25 Aug 2025 13:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: exynos-acpm: add DVFS protocol
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-2-6bbd97474671@linaro.org>
 <ca2b3b24-91dd-478f-888e-4f46dd26a672@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ca2b3b24-91dd-478f-888e-4f46dd26a672@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/24/25 6:11 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 13:45, Tudor Ambarus wrote:
>> Add ACPM DVFS protocol handler. It constructs DVFS messages that
>> the APM firmware can understand.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/firmware/samsung/Makefile                  |  4 +-
>>  drivers/firmware/samsung/exynos-acpm-dvfs.c        | 85 ++++++++++++++++++++++
>>  drivers/firmware/samsung/exynos-acpm-dvfs.h        | 21 ++++++
>>  drivers/firmware/samsung/exynos-acpm.c             |  5 ++
>>  .../linux/firmware/samsung/exynos-acpm-protocol.h  | 10 +++
>>  5 files changed, 124 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/samsung/Makefile b/drivers/firmware/samsung/Makefile
>> index 7b4c9f6f34f54fd731886d97a615fe1aa97ba9a0..80d4f89b33a9558b68c9083da675c70ec3d05f19 100644
>> --- a/drivers/firmware/samsung/Makefile
>> +++ b/drivers/firmware/samsung/Makefile
>> @@ -1,4 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  
>> -acpm-protocol-objs			:= exynos-acpm.o exynos-acpm-pmic.o
>> +acpm-protocol-objs			:= exynos-acpm.o
>> +acpm-protocol-objs			+= exynos-acpm-pmic.o
>> +acpm-protocol-objs			+= exynos-acpm-dvfs.o
>>  obj-$(CONFIG_EXYNOS_ACPM_PROTOCOL)	+= acpm-protocol.o
>> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee457c1a3de2ff2e4395d9fc3ff4c13294473b2d
>> --- /dev/null
>> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright 2020 Samsung Electronics Co., Ltd.
>> + * Copyright 2020 Google LLC.
>> + * Copyright 2025 Linaro Ltd.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
>> +#include <linux/ktime.h>
>> +#include <linux/types.h>
>> +#include <linux/units.h>
>> +
>> +#include "exynos-acpm.h"
>> +#include "exynos-acpm-dvfs.h"
>> +
>> +#define ACPM_DVFS_ID			GENMASK(11, 0)
>> +#define ACPM_DVFS_REQ_TYPE		GENMASK(15, 0)
>> +
>> +enum exynos_acpm_dvfs_func {
>> +	ACPM_DVFS_FREQ_REQ,
>> +	ACPM_DVFS_FREQ_GET,
>> +};
> 
> These are actual values for hardware/firmware? If so, please use rather
> defines.

yes, they are. Will do, thanks!
