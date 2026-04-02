Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44743C1960
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119589; cv=none; b=Rm9up/uc6z+QSjjLy/l3zutE0ZMq4CYpjML2lqlKs3qJDESOqSU9qP+R8wAO+yqiSLPLp6KEEPkmt+3dteC+dAtuqH8mHrrZgzSoeSRxH7LA1WdI/bhDHQGENZfDFXlzJc6sOQx2FrGl9gs/Z20VJ5UESLZFmbLissKKWip79HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119589; c=relaxed/simple;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8171g4d8jz7EM7w4GPdYsig71TLIxe1lTKvTBjYVfZg+GGSOEj6ec5Co/SGoHep8lPrxOZvhf2cQ+e2ILfxBlXZOfVgDK6KrTk9mDhNfDBKo6NcY+PRKFUw6BXPr4lZzDi6Ne9FN4t/IEGXDeL5HpzvSZtfYWEdKQ5uEuYQluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEbDHRD6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEbDHRD6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486b9675d36so4816505e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119587; x=1775724387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=OEbDHRD6zavDlt62Hf8Yeb89S541USknmfSO92ew11z4hAE0xoo7WSiaULW6A+2W+L
         K+GN8pigmWYRi743U/dwWXisPy8xAYnnZ1ioSUnJGZUZC+3FmBAFcUPPYvJrRHGo9lVO
         VFXYdiKP7t2c5+f6CE720xSOaJ4/n051ynipwzOPbDy0snnD7au1z30J+xHsbJwxetxP
         fviyD0eTq1r69XXZyFmLDtcWBh1bCJ50bWjOoJa1wlLQGps8OZG7reCQV5PaWUM421P/
         YAWj/IZGK9quxp1KU/6/0J2COPDHZuZaLGV+gZVQ6bcqu0fvYMj/uVpoCvzBORtG6mA2
         WeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119587; x=1775724387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=BiX4S+H3KkgO3gC7z1PI4S3Sl11an+0C4rFU/nNZdJT6zHP6eVEwTaxXZBYgQDqvna
         iMOBRFk2KtgN4VMVxaDDi+fx2F3DRgJfr2W9bCUS4QnCFGYRnOYJeuYU3tMbUCZNksQG
         6DiVUtarVRIP5R098NKwK3fSzQ5nu8aq3380E7QMjLeqvUKqpsuSAge4O0gGLiCGLWHU
         E4SwVOvB0JtOonlYNr5gKiO3Xq3WoCB541g5npfFG9KOMUcRiku2HaglGfCs6T0ocvIb
         JCnAt7bZMOKI35jNK2Qi71u08VaLY7rWqBhHF3FEmBbYpE3VQ2E6tHMPnfJss0c+mZ6l
         QJvA==
X-Forwarded-Encrypted: i=1; AJvYcCWEdcP1xAuR2NfmhcW7XuQ32iLTmuOu7RY6iEp1qGVoTsNUF+CXcyl2uuNoaQDlbs1esRHtrhqxYq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmrTw6rNO6Ciud7ZqMWpfkLc3hX3J2niyFpanQk1C94NZgc6m
	hfIJ+/kVJ3Tv2H/KUHAk/Ta9GuNFH5hCWn2B/jyV57eywhRRZg5C4uzFzuT77QuzxqY=
X-Gm-Gg: ATEYQzx7OHj/vc0/3SB6Hhys6AkRX/rC1mIzc6SU2I0mucCJx6gNI6nPoG248cc3yDG
	U3lROIKoOhvCpDR6qBFVdg8lwqyufb3kg2kYq24jRVItwsPlDpydDKbgmtzL56Tk9maBd5xMczc
	GEchfj20x2jcUdFbAtTmW4zytUMlpSAilm1Bt+KHcjaCjgnSFiMUVAdJcBOYn+hHeFoAdDJCthP
	iYNdEaz67dijBiZZEmC0Wr1aMGQpII+NKkufARwjOlzA02gWukDqUf2jewu9M3Z7cAzO+WxdoI4
	EZ7t3oVwbjqYAWOoCxMJ22hC9lR1XMkYkYwt8AnJ5XnGQAJe9CgObuFIZR8B9IVZhTolcf+CNZU
	tyJCX5V3esUHvYMTSRIDO0+rYA2YDU0i1vbQkOTvgKjjbvYNC4VJnNV7wMnxqV74xwpPUkmobHl
	0cuocfIl+NimyYJ668e1+oUmLijF5xfk8=
X-Received: by 2002:a05:600c:8708:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888b6d4fdemr41857485e9.3.1775119586975;
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm161779865e9.11.2026.04.02.01.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Message-ID: <55953d5d-c4de-46a8-a9e0-8ff952707234@linaro.org>
Date: Thu, 2 Apr 2026 11:46:22 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
