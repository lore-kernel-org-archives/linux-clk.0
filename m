Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51C3DFC94
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808977; cv=none; b=hr9Zp2TNY83Wj+kEZzVvH7hfN+YSfq5Z86J7EUl7dzFjrelzGb/OMg9T9Ot3eW9Al/c+wkgKfHtouAVjK2Mzj1OMKwpR+OXZQ4Fcvn9txmCBUVcUYGI+6CSxQuSmIhxWddTqRMfc6yBEk94/S/Dsp872hiU1aowsuPiXNb6EXkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808977; c=relaxed/simple;
	bh=fjQMEVKU6aPBoShsqz1pBXXrH131KtdlQ/A/QQAVYkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IB6HXGcBwtYoyfHzVJTAOE7YMn7/whT5MpYJ8LgepUZW6pFKJBXJfIaBYgo0jym+LP/lYiMwIzZlPRXUESmo9zddwXnLuVFDnMvXNRb2Dn8PbBQJc++JQrqSy+yL5JDUfCVmWNfGSINYgkhGpbAsR8O/3I4jYlpXA9Q7cWAfKpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prRVYidE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prRVYidE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-462342ac290so1522286f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781808974; x=1782413774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=prRVYidEyTI+kKsrWNmMeGCsZ+a+7oZpUAJsrWBR3pKa5RwyrSmpbAT1XxhpWBOZBQ
         2x3VhLLb1LBgHbl8qytO4/RdOyPY32PF8KdQoIb+00080eZsRYQjvnarGBjCsoveawJP
         pCRNQX/YjnauraTn47Y2zXWYx4DpK9zzTKAriqHYXWinbKGefWshC+07mt97lvlrL6Hj
         MOWAIvNWlxMSaXUH/jTaQEaLQIbuCASwbXstEd+tI+qBifmJkHmdfFnzCjKwmM4fyiYQ
         uww61UX7MpdeYPAKA7eIXAwktZvWfpkL3roEvfomCwKxTvyeiPAB573J0f3FTCvjkyXZ
         l19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781808974; x=1782413774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evnk7vg3/NTpBLsBSt0/v/1Hx+pafxs17vxy70hm68o=;
        b=Dv2fUnnPxoo/Eqv8854ytBFcbQcKV3IKRLlEX2GVBan+li9awNHp6HJzCuEAkNysU8
         FHUMcA+Ume3IRMWZYCugKxDlGxI4Qf8jnJTZxBv4u3yB/5mHuB7hh444xeiBW0vBFl8b
         X/N1aywiARIqC5Hxs50QcK5xPwqPKmBLsSEn7CfutXc1FvLnk6qBLASBvdu3cBhglSto
         XcR9zk6Td3wzn93U+ypvLRhLZ8BS2z+1HQsdOBrBPiv9+Fcqjf/JWvlhvVi1mBO3QOyw
         gsgUBQxwRj+xJHow/zlXnPUR6t4dNr/2h9n2t1E3nbLoSFglb8euXsI5JWMlWvIBW8Jc
         zaCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8A2GXq0DAmD6r/rkuiMU7omMhygyOC9OL4PGyddtVsx+80S4d0jvbNvcqwQIiviwwlCMdxQrBePC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3Ng5OYguLRNjjqqUXe/TS9FlHNrs6D37EWQ/0wryuy8Qm4t9
	F1eBfd7pMj7dsBWEW0nj8ZGLrIHw+U9JndOQJq4wa+jT5apmCP+ZdAJy
X-Gm-Gg: AfdE7ckdEzzfi/pn73unI2DE4CxTxNFIAfOnaT+pPix5CA4s4aCLz0sdtXvUfD6RohU
	i3Dvm/xWsemS0xEalUCGn9XahOr9mM/DoTQW+ILbneceOVgdy7nnz9/d8D+9Mn2L0sRLb3a2tXf
	v9Uy7J6by3kgoGLnsgdW3ai5Bko26cEukh6Z7+h1ETDUiuvTxk7Yg+QV1KQR4p2p4wemdULLXIT
	stf/mTlirEjj7FhBDtkmGKyI7YGt+CZZAnl2TVR3hX8mc2sn5/zLjj7RZouvMg9+KbpREAJlLT/
	AojmIcBjEWecPTtAV5ghMV/0N515pJRi1q8sdrXrqHN6yD05H8sBS6iEdz2tVhFohC7bRrHS4Mk
	Y+QKvfXmo7N6aTt5U2uGskcXh8eN9u3raRhIVB7olYV3ksbUFA+bJYJjDWqy9OpbgaQv+2LeTPz
	K37OROp01EzhWZXOyTlic5AVkVLCMMXLQnl/w0xUNGDKgtC6kU0F0O6XwxD6ssbPK+9JAK8S9mR
	D+SV9mGhc1UEiOeag==
X-Received: by 2002:a05:600c:6090:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4923f4562b0mr19793815e9.9.1781808974258;
        Thu, 18 Jun 2026 11:56:14 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm9756965e9.1.2026.06.18.11.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 11:56:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
Date: Thu, 18 Jun 2026 19:56:12 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jian,

On 6/18/26 10:49, Jian Hu via B4 Relay wrote:

> +config COMMON_CLK_A9_AO
> +	tristate "Amlogic A9 SoC AO clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV

Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
selecting COMMON_CLK_MESON_DUALDIV here.

- Julian Braha

