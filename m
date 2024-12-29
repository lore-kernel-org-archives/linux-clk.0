Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89308AD23;
	Sun, 29 Dec 2024 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735485395; cv=none; b=onnrJRHW9q/YaG2n01Z9pzmBrVFD/WHAPfdIaQ1+nRcXTGas2S7/L5e31+vTX1V1mOLxZRQZlPTjizHO3xtS+I2b0gFXSCq7hALvnQjz01QUjIg2nnRsAg/2L152L0ssJZo0GNEf96q0xTtYkJ11eEnPJDw873kMHV15H0rrdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735485395; c=relaxed/simple;
	bh=8Ryfifp5KD6fwG1ehPT+X5npHFy8EeQOutvzLhRMWLk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f7d5JgSypoVscOQD23E+3AIOos+MFwRVFfMiak5gAKKYNVi/liWCF37d/LeYBa4dEleIkAWgNawzYHCaGSaK/uwqSa1NifUyT0pL9iiZRKgVY+/P1oc2vjmO/dSHqZodJy5bOCSGleOyxGMRqkq4qHh7iUr0dE/slQcuasndVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJiBdIg/; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJiBdIg/"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-21670dce0a7so6684335ad.1;
        Sun, 29 Dec 2024 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735485394; x=1736090194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq78cmiaEPaV4FfrF6EAh1QhQFFCPQzra4GNWV266D0=;
        b=iJiBdIg/skwD30VLjI0Rcyr8NhJK7Te9F4CFxkmDJgwO1Ce/DJffdlEkEoN5Ts3rJT
         ZEsM/uwvrCv3DuIhIegJb18WXjf1Y/OcQYlG17jQGIqETLYp9eWYfIfaxpj/9LLA0WLO
         qj103FlYbbjnOwLqDvNYDKpiSDYU7ff3HnTZamWddWD4z7XdzoMA06uz0mxq2a5atRkN
         uZ2QDLABetzD8bfSuf13YJpURTXS+7m0s8eVw6ZGIc1Vl997Z0ksaY9N9czCfSs1isKD
         mLDTHzjaGzS6LkDX2phpxQYaDxZPCh0iZqDi5WYlHa4CXseqwmHkt+L7phr345KCxWpd
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735485394; x=1736090194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hq78cmiaEPaV4FfrF6EAh1QhQFFCPQzra4GNWV266D0=;
        b=sGtfsthT3//3eqbHI2GCk7H2Rdl2gPIIKCPghuDRsWt057ZZpMew9Kr/fSC/S9z30U
         HmucWR4vrWOd8gECNAiAJoa7OMHP2zuk9q+eD/rwbmLnYE6AQ//jFmp2vqT3LDFeumL7
         mbk7vZJt6t1tvUv6AnwXDpKBzUFXOQw9gaT9FMx5oRoDJIBM3j5eigmAlqmaycrIYam3
         TpU3uF1EeypYXWNAYPZh0LW/Ra5R8ATZsCzRK6LfhJ2zyQkp5t6yZMvYmTGfn1QGo0x/
         QTXcIK1/Bc/A6KiO2eij4vLKM7Dv4MqO4TVKb12iJQuHhNLVAUq5xBDgVTgnMaa8F+2b
         uFuA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Zhu1qwTzHWEWn//Ypfrg5ioK+iV5/TuWFMP6aoxgpHwGAEPWlqPYeZoF3GmphFHqnlT5WzG9Mlj0Pt/D@vger.kernel.org, AJvYcCXN4YarPZ6rRE+fwNc8mNCEC7u4ulUAjZJzyN4eEROM1jAKZDynFEWCX0nYpOvb5pBN6DRpXfrkgxrR@vger.kernel.org, AJvYcCXQVKsl6Qb4TBXU5cP9/6y8+tI3y5M40sv43XKQVNAMza0N4hdGtOTu/gjFj5maTudhpcdEe9RpYRUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxtuL1yJ9tX3MTDbwOMASJbX0bdP4kCFPHrimvHnFuPrQR2ZWAF
	VEhubAqKMeWto7FGqVGbZNhsZvjHrj5Q1nARBSVh6aH2vxcScYy8
X-Gm-Gg: ASbGncsni39qRenSwRv5x2bolykO4dR5kpQbDQ6PociRk7MFB0bUrxFg3OLKomyB7AZ
	7aXKj5prNvKPV2PzWGAsajZUL7biOeaRHI7en0qQosEhLDhXqyske8dstYPDxaiFdJJQbXts803
	JbAPe60PIw7MlaWzLBRTZ+PlposuSUWqG7/1XFJfmp1KF/ZhfOHeJx69GWlYpbxeSl12B8/yjoO
	V+OV/JFuuArlxu4isekH9Thg37y/dqgCQOw8GoU
X-Google-Smtp-Source: AGHT+IFFEwNrJMwRkLT29asUZ9fj0F/Jg8lbFG6p3eIzLyKLwNVq/VPJMBS9ZdTV8E4XHszzqYw5dw==
X-Received: by 2002:a17:903:2c8:b0:215:a412:4f12 with SMTP id d9443c01a7336-219e6ed00ddmr391630595ad.33.1735485393650;
        Sun, 29 Dec 2024 07:16:33 -0800 (PST)
Received: from [127.0.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm163693425ad.110.2024.12.29.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 07:16:32 -0800 (PST)
Message-ID: <65709464-8a34-4842-9b06-6365b549ce49@gmail.com>
Date: Sun, 29 Dec 2024 23:16:24 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Xukai Wang <kingxukai@zohomail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/29 21:21, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
>  include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks: 
> +    const: 1
`maxItems: 1` instead of `const: 1`
> +

-- 
Troy Mitchell
