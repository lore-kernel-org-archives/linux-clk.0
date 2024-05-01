Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89237C082
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714564519; cv=none; b=QZExTyN35nLmMmREDOfBqAGlzJdheTyT8NON0tfpFkmUX8M0iXGvZz4jD01gc2mMV++7G+nRe5bQwCgq7/THMOuQdboNThflQWtVyNvFItxcDIYHKwVRE37ELsnVIq68zQoIweOxIOAlI+PSOwwjp1Rvqd28Ac9kh6OIq/h2P5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714564519; c=relaxed/simple;
	bh=ChYfHk6ify+07TDm5jzBUraRqbH7mCQfzV+oNs2HYwk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eb4rCOsx9nRbuQ89oyr8rd1b1yqZ6ldHmRVY8rXf8kNSHT0k74WH8nE9hL2o+BLGidc9WdmATBSX22LRlF4H4aFiheSK1RV4JpxN7sNvaG+eSnoWShEhj0vdE0iTKFrSZXz2DcawUgSQmBkCv+V8pKOHJwR8tFLRLHlEnq6atjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NopT6h/1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NopT6h/1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a55bf737cecso793364466b.0
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714564516; x=1715169316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7RQDoC29FuPtm118cUmiAZ7JuokdBHdX7p7hgBcheQ=;
        b=NopT6h/1OIORon7kn/pvHfJI06iXugnBibSQDfMueL8Rx0iIcXDQATxMDTreWUT9A4
         wWnRFOoJcGZXWI1wsENoz1Wf1B6qWY72Bm1hkWU4dczsXEIj19AF74TIUbJzy5jHprDH
         tcJBCA7Fr+YoLy+K6/IoUBv/q+uJWg0kuOoo/y9gyPrZWcsNTQeG2Fspiz2/Ikn9kRt+
         MlUdLmZZML+TueLoRcztfyBCUEaStL+dstB102uTDeKsN0kSB5PIdzyF3JxlPRfaNFSE
         wmwctadEScOHn1sV0PbtPhEGB9ugpDHYT/m2BPZyQYIHGe3VaLt2DrFJ9KkV29evykWB
         Srig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714564516; x=1715169316;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7RQDoC29FuPtm118cUmiAZ7JuokdBHdX7p7hgBcheQ=;
        b=mV3P84lV7dzH/nTsE798sR7OkDlWAT9uNgxMRPNNjkyz54BiN0W/DeeEfJceq2l3Oc
         HAp3kK2EkszRhfA0Zn9QajSiHlcErB07TNERGDQCuvS+45n4HevB3QzbX/nGEMKiByJk
         QhslKOsfgJqrdtUer4E9LRJL4tdYAh60QlbKNM3ntifyb5mo9VULd+0dgaT0mdvW5lyE
         Gc7qRRWa7u59x6/dVYfwMvc/Hcp+F6YiGxrLZmtN6z8D92emABp8FnKMH0ZQfKa5k8MC
         UvALcRoygf2aIGxd2Htl4ArLWBg00tvoSFMEGW4YgXdqjclseqEF2J6N/ZfGV2RfoTUN
         HavA==
X-Forwarded-Encrypted: i=1; AJvYcCVFPUHAl5M8Wn2KNNwXqGWf9FZLROsGroOP7IpY2q16GEOqYOHJGRRP10+udz3zKeAiji/IF300upuavYfCh/kp/oPnM+4QAmjg
X-Gm-Message-State: AOJu0YzNMGRRa6jVlXzK1wcNEfkaF/d+b45a7JWPlNuCJVDjfno8sPxQ
	y2QVNZ1cNksl51jWpdxQHzIT2tpmlSSUwDFnosovUsPDzCDycWgEtLfTGfoQdDU=
X-Google-Smtp-Source: AGHT+IHlMLKY3jKZ2nU2LgHTYLCpY/A8uvXf+lbt008EwOuXxiPeBvOWntVRTIbpHf4u2k1V6tf/Aw==
X-Received: by 2002:a17:906:471a:b0:a58:8d65:65cf with SMTP id y26-20020a170906471a00b00a588d6565cfmr1587742ejq.19.1714564515992;
        Wed, 01 May 2024 04:55:15 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id js9-20020a17090797c900b00a5884e0ad1asm9508243ejc.33.2024.05.01.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:55:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, shengjiu.wang@nxp.com, linux-clk@vger.kernel.org, 
 naresh.kamboju@linaro.org, Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240429214502.1363592-1-festevam@gmail.com>
References: <20240429214502.1363592-1-festevam@gmail.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Message-Id: <171456451503.604561.10850984027278876629.b4-ty@linaro.org>
Date: Wed, 01 May 2024 14:55:15 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 29 Apr 2024 18:45:02 -0300, Fabio Estevam wrote:
> Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the suspend/resume() functions are used at
> buid time or are simply dead code.
> 
> This fixes the following s390 allmodconfig build errors:
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
      commit: 57939f392371fc93c203b781807c951018c29606

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

