Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB463F5BE5
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549963; cv=none; b=kbO8N84CahsiI2Abor1nw+L6m+Xm+o1eeCd87luCwvazJ+GbwMz64WO5HFwm45/sXpsH43pQM2nBpopDkINWeG2C9r54ErVoP/V1KwxaF1eBjoPcPwXOCWAkVyXXvTrgIwJzrq8Pc9HjWK0ThMf5U3f+3YYiR3o43dV/yZbxbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549963; c=relaxed/simple;
	bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0RTTGjmeU28F4j2wb6clFo0gr92no7BY50Wa+e/6bFuarsGdtKWs9dtDxtcqWrxtnYIzPFeb9oveyl9UyyBHuzmE6ANTk3KJGYrfclh/kq55yqfcyqoffnkmBkvWSyUMA67vz1qYXQqvZA/CgvhE77mwsc7Wmo6EQQ7B2+vMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XutKY883; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XutKY883"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ba701891so8411055e9.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783549960; x=1784154760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
        b=XutKY8831PWAz4OdW+oHhI2Q0lbiSDAIBIGxTu4iIHpgQcR2/wAkuVDcp9qC0BiA3e
         IGoL+YrO3FLdDPPes9smBxNHLWHRJyjpYcAcpgnnG7GUVdKhC/RbsLEGqlb0HeyoNi6s
         E93m0GQRPcJhGNqMaVRqjGDZdvK+Fx+8EZthktAHXie/lJZE9wMeQpgwypOQAeqUGoub
         ql1O5xgKTr51pHUci4ogAQk8l4eeFep30vmaDtjzVsn9CmQytCUL4fDk9+N3Der3/Eep
         gzC4hRD8EHN9BU2nxRtOLwGMii6kc2q2qUxI3WrZLx14znosRQQXute5X2vxqgALri5V
         kloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549960; x=1784154760;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
        b=p19kwdvJIDkp4Atfa0SaUcrcU2jNVJ4nnM6oXvP8MDXq86INcVJmfFNqRrnnAw0b7g
         fGYkqBSk/PMukVUBV5w6SxMjQCsaDaZufHraQsuLHsRNxrY70YYZ9OgOBXQORjUUanqs
         H6Qf9Thyh627kG6Q7hKZ+ifHqHPg09kDzTg5osPKssKjdWR9mtjXJnHL2EotatJtpG54
         zwqInNG8QBftgZzyiHdALCUST5Uucsx8FM7VKja4qD9EwL71uS4ff+vOGO/8P+JRGiUU
         gDJa8s/tCs64XSEcnaz2ncDsh1pNCP5zqiPJ/r3VRW3ZYq+TCwqrTsT11/Mz/Oy6BZfC
         M2BQ==
X-Forwarded-Encrypted: i=1; AHgh+RriA1heXIG0JhZUfSwa9o6rBq2QlzXQlypoAwf3HKUHBlr8ZGzewLUDjr9dp/lzi/4ObMT3i3383d8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYYkCDoZsCLsfCfdErZk6AAR44WP0HgWNz2nqHDSWP2ODsNwu
	OnbqUfcDnTls9x5uQ34uTpVoTdElD6F8gbp8cf5MYIa6ru2gNpMgeKPE+VpL2hgDBi0=
X-Gm-Gg: AfdE7cm0B69lkVTWe7C5CC70PcJcI0piTsAQZ+9rlCXYCsxUE6N1/OOFNt1gf6AjKAS
	quccILza/kPIHC9xhE76eBMx5S/aycwRAkyCQ+8gaXFxkpWQl4QJz47sQR4FtlH7df0T3PzP8j+
	qHEJe7y77A5EdWwEW3VM0ZuMLItzX7vGm9ovAbVqdXkv8nH+Q/MFNnsaxGZ2gutou66ASqTp0Ka
	l3GhbQe+NC9ySgLggyAUV/Bm2UGsM6+87md952fQNm53U1fn+0vxcTeOyoHHF8cGYGNQ+uht5jd
	E0ctlwH01Nvhjf2qoeoY5X+/qmKLpGmE52X8hWMFA37jLoa2syXDJDcapw1camFRlvd3clLlLtf
	6Jc/P4X9ycgKU6ZGI8TVeorrk7Ev/+jUdiOt5/h1Yid3n/wqfsKbqXSp4mv+/bI2N463RuPUJVW
	aIHPtKHpuX7dqp+MSz7asbVNuTQ1mwaojfFV7RAw==
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr41768295e9.23.1783549960120;
        Wed, 08 Jul 2026 15:32:40 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm11268875e9.1.2026.07.08.15.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 15:32:39 -0700 (PDT)
Message-ID: <2d1c56a7-ed93-4fb8-9748-0d4e35cf46cd@linaro.org>
Date: Wed, 8 Jul 2026 23:32:38 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2026 23:30, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
