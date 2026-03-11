Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D353DB654
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229862; cv=none; b=qffA41DZxESZ74qVSK7xHTZmbunXbBNtQwNA1+b9AyAmYcxDUjPyHBi99+VtDTRL5Zm4uCwG9Krl2XODbvcqCQyZU1NAlAPZTm+kMNOkk4CN27v4s5N/4iYTpLjKjnZb+fPZV/6AHAIFz859X0ES0sfkPyzwVT6kgRRQxr7ZUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229862; c=relaxed/simple;
	bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBH1AKT7DdEIARtTD5j3oKdpnkmg6z/trznJYOjLfEigDt8SsKC6IXOsgolkTQPb5c0lvBpeQQV85CXcv+leqEMupVEDMn6WzLCme5QK7rbR5ud8QPyEnxTIkMilh0v5IVYWO1sx9aFk64hD2xqQvnY2v4ySSH9/zpxxsGf/UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xytk/hOv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xytk/hOv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso7956675f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773229859; x=1773834659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Xytk/hOvDF00hrRb0Yq/EusNd26162BrDBGz2sWnSbsSk/+p5rD5lLSiv2b7PY5urb
         OPxEL64A57Qp3tqmHx6KHpff3lWanqPqOt6l6tPBkP5HHBIgcF2r5XtAqpBxUd/dzQ9s
         j8O0AxVKizDNhSup3trigc0CmMRyu6gMGCNJG485cvPol3UbXCAo0qF7FNjwdwlXG9Jd
         FOJ0RNuKWnPNUOKDCH/SjsV9ui4Ashli+wXyhZGNS13kvud1uCiF6oc+va0QIjDnBv80
         2ufQgvlo4GMbOcKvzWmgaoot/MIUuD4DKlHSPgK0nLM5dT0nAerncHzQYGITENEwUbqH
         /CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229859; x=1773834659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uecr21BaIjAMsFAUZnGkKoaoMnYN11yTcZleCmy3sho=;
        b=Jv5408iItD18wTZE/dg6GEBqYEmZmf5UwEkI6iUg8enjVHRXnux4aQc7QYv3kZMF6p
         wUMmJf2x0oXeKWVcj0IVrMtcUyuOzF3cii7RogMOhjnQyRmmUb88W4Z0CTHjOb9kaJkW
         XR6mEm0GIA+m9J9pwvzcaZWQEElyY6mR33JAViY4ts1FzeiQptq4Y4E+vR2ZiHZ3prc9
         4e+mmiapkWogNx8npl40rFLdELEj6w79ofI+i9L/WwngW/OnwvhzPmb/uT3OPrPRf+qo
         MxnKlbHojoO2sPdwhdTJSbepD2fS3Ve/mqDx4OwWKCLwlhdm2E228IqwqTv5VxTh+LrW
         fwog==
X-Gm-Message-State: AOJu0YwpeAZtqaOoprq72tY2QJva63RnpTSbXuNXoRMEENwIb9Nr+uFs
	Wd8KIAqVjdK0eY76KR5vFQCzEdAo1s+4pPKYgrStOgYww0MEDFXzFpI6MADSk3DOm4M=
X-Gm-Gg: ATEYQzzwq9JLo1Cwr5xqguZRz2igDEW3skS6nP+SD+8MFBKqi/FZTRCiT+rBEDl30tt
	FybBN+XK0jVqmpMHg4bDRhA9yaPdoowoUFA7n/6TXnsKHcAmrxdNVCPyC95efugglmPoTXm5fLP
	5Db3Shz3/HEcOjj7t4zlIY/zSLd+scZr/ZlzJjLCBM8bqBO5X6Y+q2dRkoeSoqvkq00w8MMe14C
	1obT1JKOsb+rsniAva3Su/pH0vXf6Fxtg8hs8NYdMfL9Sov/rWGIugi5Q7WZVYjjytUUoXD3K+r
	IT2dj1GSWSAlj6RlV1BBYQG3qm4twNqqw5WFN0W5ufCjg92B72zahnJ0Q2AOLZuXAIiqw4ltWVU
	34WeSon0YaccNHyZ7tJp/HSaX6OI/PQNmNMIJ6H/9QKQpRLNG6/oFBNz2/SHZHchDzjgOwC5hJa
	84k11LBuQ9ViFToHdzbWpjDta8nZ36MDU=
X-Received: by 2002:adf:e94c:0:b0:439:cb77:aa6 with SMTP id ffacd0b85a97d-439f8222fa6mr3599215f8f.42.1773229858683;
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d209sm5881724f8f.5.2026.03.11.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:50:58 -0700 (PDT)
Message-ID: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
Date: Wed, 11 Mar 2026 13:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi
 <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 3/9/26 4:38 PM, Brian Masney wrote:
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/

There's no tags/clk-remove-deprecated-apis-v7.1 on
https://github.com/masneyb/linux

Cheers,
ta
