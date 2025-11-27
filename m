Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE7304BA6
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271684; cv=none; b=gyvEWV1s8Sgkqa9WyTZAchXSLRkwINjD3jutD8V9IczfFBwSFL5yVo0wESDYQBu2NrIdxPtlTCUEMRcgVRdp9+CxTj14FfPDi0OA09gOTf9Z5aeeyof/94KAoFz5Kgxh308Q6D3GXtC2HsLEfENbsnufco7EhTiePAvy8NnT0fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271684; c=relaxed/simple;
	bh=UZAwFoanMv4ojyrr/Eavmil7E7Xl3JU5cDcURXwl0Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCzfrw6gZaa+QjOQ4/fQSvqeGp8cDHo8aJXZFyQdlq0BY/aziLysEQ+4+ll5PgS6pnQIbIZVSsc0ug0J7EHFcU1ycLaZNuIUHL+KUB56nayvMdGJifVHzM2mdesM9WjuS9f5CNsQmvtQ06+zQNobWjMbl+owrGGPo3dBrIgDPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PydTTUpJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PydTTUpJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a33bd356fso1411711fa.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 11:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271681; x=1764876481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8p6A463hv8Si4HXmKmI7aW/9WAgbYM2EL8RGiyZ+8=;
        b=PydTTUpJ5kxt/5yCsTiXKZ8r/UtQ/nNe1I7Yq3+FICCupJSy7X5kruxNvX3Y4RctST
         u7Egx7UzEr7Ym3jpFVMur0YPH9oUtLv8bbaGNIKwF0XJl6FFZw39zfUclCJEPjgf97mh
         bL7NNOF3Cf5YfoP9b59/DTxPZfqKyNtclhhhvxnT1qmXyl/X4fEPn0bDZ2uSzwxdW1aw
         l0kxq9/O1ZfQjuAQx5YrzVYZUcDqq5bWE+PaIh2gJv4ocHUfYk5ag4dQuVfYgix9ZVRK
         kxqNcX3Kgz0HbEVxfpwSH3T/n6WDGFsHmSdA4C/hT5t6cFP7XunMp0XA+MJSbFR77pa5
         pJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271681; x=1764876481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ek8p6A463hv8Si4HXmKmI7aW/9WAgbYM2EL8RGiyZ+8=;
        b=pKqhddSEej7o7NM07d9uSKdtXqXFHtW+AQOrA9Ed4iG/phuHLwxgox9FfKKFkdcPlR
         sbBsIl2o98jOtj7WNAJ8EHJYhdJ7qhWF8XxlzVUqpk5Ly6Ne+/x3AdD4U8cZaOqW1QGA
         0MSmIG8F1WaoTwlvJp5U15fjLMIp2Zp6pniLwheQfsfT7rhR4T+5Tvn/m2GzyuG+JQl3
         XOD4a8iAaaiYM7jRUxv8QsGhJYi6zbjj9JAuz6yMzgeUP9aJAmMIVLMmiWVs5QROwXLd
         c9bNAr+HdSzZqMKEqzAg9q8RS6lVl43/sHrIP/Hl06zZy+YsdiNC+t/fvh+bWG4xFgb+
         o22Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5Cbl1RY6QRLPRftddomCwoqnNhvJdsByg03hsYVLVs43nIIy6+7iRCQH/jctQEyNoeL95PV7cWIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOR2T1UuLAYS9T70JovgRGwk+A/z3xFZIq9nw3RkPwvgktmhzQ
	iIcur+01O3G7u2xBCYjq10znSn9li40Tsd+Dk8W92Jw8tiGiJRdiMP198K5KAWKCOB0=
X-Gm-Gg: ASbGnctEY5F5LN2zDfnIp1m8f6j8p3keRLMMW5zQw9J9xlhyOJfxgaumP+tLIlbfpKg
	VvLtZ+8rhE14jtQVWLQKMXbiS+F5ixMFP/nTg3Az+4sPgOjIetiK3jT2w0A3GxTHm87hR5VxkEw
	/vIBdr3iul7kixYRA/9S7YVfYqCYFx75COQPtMEXKUKZC5xFhyaqVSv+dVas1t7GcvoDStkHHDp
	FQIsiBVkEeH/wd4FfEa9s5IsO6A0dcbRUNVjXq1j2PJks0i1t00Tdhb1RkGZEzWv6o9jb7E5YSv
	3S4+BaylM0l1ZJAlKHobqWvB3T+a+ENLxOUTz+RmOI+NvdOC+16cR//wCOMcuYzspKKgHHcqaoJ
	V0x19aSkqj3TFnx7wHn2UqJssK0wasZt86WvyK/oRbNL82HiLeoGKr0ESVQLx1YgMxZ2A517CmS
	r76R/tuNWI9NgVKe0dPqYZ++tk+0R+lbo7kpPzbuhcYjlIsua24rwo7j7zGYhdy36+1Q==
X-Google-Smtp-Source: AGHT+IGFumLAM3mMcRCHGRJUMc9x3tdPoRtxoU0CKQ+nP522dxxTt8NUxY/84RLdyRbRJSje7zoHQw==
X-Received: by 2002:a05:6512:3182:b0:594:3a08:162f with SMTP id 2adb3069b0e04-596a528b52cmr4878262e87.1.1764271680595;
        Thu, 27 Nov 2025 11:28:00 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm606630e87.74.2025.11.27.11.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:00 -0800 (PST)
Message-ID: <ec5b3a20-f28a-47d2-9b71-ef5d2af8b41c@linaro.org>
Date: Thu, 27 Nov 2025 21:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: gcc-x1e80100: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Melody Olvera
 <quic_molvera@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-6-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
