Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A0304BDC
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271707; cv=none; b=kzMLW4xb/JMC8LUP1ysNHoyei5nuMTvl+uJxDpgncwtl9+QmW+48TnZCI3N+VWynFYerm8ndzk4ydhZ0Nfj4ZwRkd5rH2LBl9x2ItVXcZVDJeQvt+I+MaM4fhfmjSP59mOcoRiCj67lq2xMeaFNletShZagX9jJmWGmiP7UN1NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271707; c=relaxed/simple;
	bh=wMhT9VCA+Fg1kyNESQJIEXfJcuvbCg86hEoAgTufXCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQWgeKn/tK1eK8oM6l0YJMHwhTehZnHYSQd56eysWAN16d/DIKhWOCxT3h/0nc17zG8eH848nH76ImLfXg/HO7pNB4T3a3h/UOQzbbylBgepoLPdQA+FFZb858mD5OEvzcKyHFbsBHxMJ1WSlC91bPCKHiiipkOwhD0fAlokgho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6/jcA2x; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6/jcA2x"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2d728536so1059871fa.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 11:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271703; x=1764876503; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK+ZnzMyo2Qglturi3DKY8unAQuLco/jmAh3/EyH0pU=;
        b=E6/jcA2x9xdQ7QtubDUwyFXRoBY6/UOeFr9zrBZAJoxSxlgwwBTBou2nzHFahG24iI
         vGwHz1LQlCXLODZLKsqzYVHSKQHXXFpYRSkXQAKeMt3M0f3Ew4fYxC7Z8bwrqKvhW4ym
         DqvxnokZj52XQyzXC2ZL4WGJZdgd4zMQ4KY3i6NCn39eid/2BeDF+2dEMJjF4GUAoygB
         72NRupPdJjrvyLlfEmER7IvpRXdxVeGqZ55T2SBk0bpeoiYz6Zgl8W4bMfKy019qsZbx
         l2F9LSQV1NvMQ1kaE8Pf6R2io3P2lzHzXp/fF8epGZLLz4lL8bRHIDkJ28GLCLv635/9
         FH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271703; x=1764876503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aK+ZnzMyo2Qglturi3DKY8unAQuLco/jmAh3/EyH0pU=;
        b=P+NynN+rsKVeQRchs+Q0lxpgxKDd2x2J1apuq6ORjhmHWx1xf/LCK/IMJIl9hRMXsC
         nf2+makGHc6C6I6oeLOGMWdPZ+BXkmNqUNsyaiBN5Dq6LiSNrsuIw0+s7bQxttSE5heK
         /WERLuyO8eIOm8YxJ3TNZ45Yzkj6z7ywh3BIg5IV4c2CxKd0tu+vcdjj8nr/F8H7s0qH
         SYQKBxqRimc/nRKd+0gMFkBewOypJSymrl1wke7Tcaq2X6FGqC/JEI0p/Tg9UviphRfy
         ew4JKZGEpFlOm1GyQTku7eI5QwJJgUlrNd7/m7FIAFKRwEh1u+pWAaZMXcxm3hmRRkA9
         VGcA==
X-Forwarded-Encrypted: i=1; AJvYcCWnFRL7HlijDBJ57+QXawKktPws7WJ2oL0vLquBjgNhL2CmY1C4FSDSuCrf/qlgL9OP2IAfcSqBEx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2DByw6Swm2kYuTIlJrRyOvjDqBCyeZY5DgxAO+7mqulCpe60
	x+lKe1RxmbC/4HABpWOSIX/6168ZpYXuRlVTMCI0IdTO8NXQs1d2b3D50pzKMB/6EuY=
X-Gm-Gg: ASbGncsD3THjCayEI0dvAC4zC6NrvkOLKzLzie0kXW98X+2+PjVE+82CfVrevJAw3j4
	vY7rOThMRWVtQ/Dhixuq9cgkfS2W4MRMvGfOeNAr+GgmPE4YS75DvisHYxmlzQG2TWskEpTDc6X
	AA6ypP6ijA+2xihmGfmTR05pA1hu3uOz1/zEAj7DfYsjYceSgmal4RytHvJKaREsdWdrwRq9GEp
	JH+oarRNuuCBkc/68dGiFmZkB7Z4djPqFZ7xYjrnto6G9fYUrRIZJsHUvQ/zTMBs4TdhUc8M+Jc
	6D775GZWeItYNXqDKtpBZ3W+KhZG94Au/JngPZRdYMoYFVHU5enNBUENRmGO0b6J4s4acnfYJRE
	eTTyOhVF+zGtqiFJDUWQwKAsxkNPn349jgkKQhEpoWAH+mnF1RZKheNGqBCbo3Yx7i900hIYJBB
	5d+1Qb8ulGc7c+U1sYsI7x8o0IpkrlxKfqSEJ/jbpxfE60k5pdMJHNgWVFJMC7iI82GZi2/VkTc
	eQT
X-Google-Smtp-Source: AGHT+IHpVprhxqb/fHYDOy9jXjkZxaKctTCYR+JZNVbUZzVArM07katvWL6BbKyJBlyUk/6pUXi38g==
X-Received: by 2002:a2e:be1e:0:b0:37b:be38:76ab with SMTP id 38308e7fff4ca-37cd92b9ae6mr36695051fa.8.1764271703115;
        Thu, 27 Nov 2025 11:28:23 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4406esm620078e87.66.2025.11.27.11.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:22 -0800 (PST)
Message-ID: <b3743f6c-6fe2-48c7-b380-76b26e6b93cf@linaro.org>
Date: Thu, 27 Nov 2025 21:28:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to
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
 <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
