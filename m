Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085983ED5AE
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158019; cv=none; b=bOT7XLBi+iFMBbMGZlnNLHs7eeTfykKkC3cKZrayvB5G5FtZWYZdknQfw3cjAK07hNdHuHcYGISF7xnuQYfzfia7jSVDZaOZaeIFAxppCzjr2mL7P21lGiDy3E3YLZF9zoX21IcXRhqQ0eS68jASteSLnkdY/me0M6Vb/86RBlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158019; c=relaxed/simple;
	bh=LsNPzTYb4vC/IRp9aPkuk17mGNMZ2iBsyvpkcKxGmAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8qm3wR24WnV/XnZ1de8Hy193VpzDfwwKDp9wrXZUeMHq5UKyeJFUbuSQlWzste4vxjpDIdlpQsSvUaGfzG1gXcaTM8aWdgP3hWVTn5W4oI2FMoHOi9Zhiw7jSmUrfIHx8ucOBeu6yA1C2T7eQhIt8Z9Ydvfw4Gb9qRUhoYM68o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khRdqhCB; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khRdqhCB"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6587cee8b57so801065d50.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158015; x=1778762815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=khRdqhCBafqTwjkbsQBn9aig8F1i7BnjorBwmCPfuM/v7waJLlT8fzHFSn2AsXeYM/
         vo8m6B4r0/0EcIQUHxZp8kUnmhHuQyQ0qMw9SeVtQizMsHLZDfWluPXEuGFTs/0wAyvZ
         o/o5Ngw6g7XazWVgPSvU+sMSS21k/KDmsS0V3j1wpZXpM2MCMsD5arjgtak3D2FSiqXI
         77vJXPZtC/zbZr8OSrRRlKB6IjyxocUQRoI+hRYJ2zC/2XIbXMpdXRlFst9eZVA0VmCx
         dMJhtmK8Yb0B/9o+gmFEQTKIf5nbX3i6/0F9urKmQ1NY0HzjD6WR4PC8Yxr31Su7NaAP
         msWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158015; x=1778762815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=QClpP/ISzgb85FcaCtPq8UFMZ2OIHH0kPK1agDwHwzp6XRF19ZhpaSKqO0H4s1rLA6
         BMu8zcZdwJGpg/q/XJi7SbxaTmHDgP3Kb0Wanb6xb6CzvO0ZnwDr9qILR3/b2xByvj8Z
         wSC4O9q+hykv8kmCBFSf4Sc9GWpRXp1CH+9rhfJbbbdKrM9hWqslX2MWU6b3COYdwC3z
         R9qs1htXukIR4S0KbzthN2OXyt/C2fdwEu4p9THYiS8lwWVcxG5NYy8LIhxCmrSj+UZM
         je0NfJnHwJn6bRLUZQhSHGZJTNkDqP7AFMJAzTxAGULDXCDmJ8XPpW25IiJFF07TX8Vb
         qA+A==
X-Forwarded-Encrypted: i=1; AFNElJ/xunCFBXpajRBgSJm7Xdv+7rgRcHbteBtE1jg/8Z+KnFMQ1rWyphFGxC7IbvtvNpZ5Z0xFP1fHjRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6raODpUQsRy9iQDHeJghIpKvL/UZrRwSNWo1ir3PWiBNQ/pZ
	jgzGOKMfcObxb0zuuzguVco7f1Y1h3jOns/EpvKRivZ3n9ytKNriDwsq
X-Gm-Gg: Acq92OEtareb8g6ijgvrB/jgkejqAa7tNa0Ymzr6twp9oRsbRIfqkGt7oMiGX4XLBer
	SG/9pQWMdOlPLJjHOXDMjS5xmwf35aJf6qMRELbqO5Fl0KpoFlWKuOlF7TFpPHFGRC5HyehuxL2
	6W8xVgHq9g0RjRr4SAWq61Yf2ikdHWDtkcWVsUUlWXjgzQIqnkUYqkvl/iXIN6fpPECKsmK+4Zf
	f/SP1/FD0A6Yyjhfu86/xx7aYz/8qLrz9o7PucFy4RAWLKjyTbnLxANYzhTZIEApoAJaBc3WnqI
	Vha7xitLIa58lJBxnpYKqfXkdnDMINpVnqd7E86hnwCgvJxo8BlVYEvHAhrcO/EQOmMZgbwUUzM
	paqLhk6sD0SqY7Vnc1qB+1bED8TwnPwD3OlKFsdndMsu3KPrRRfttSecKkbKRiQ2lFsgI+/BqJY
	Z2B+O3Kq5+NIF1SwR863tXbDseg+ts1xe9Zcsr
X-Received: by 2002:a05:690e:d05:b0:64c:9f31:e33 with SMTP id 956f58d0204a3-65c79a23920mr7669550d50.65.1778158014778;
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c7abf5e11sm2468850d50.0.2026.05.07.05.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Message-ID: <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
Date: Thu, 7 May 2026 15:46:48 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Try:
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.hevc -d /dev/video1
> 
Sorry, but I couldn't find the file you were referring to. Do you happen
to have a link where I could download it? Thank you in advance.
> ---
> bod

