Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73A1E0E15
	for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740026700; cv=none; b=FTqxp5xj+r3bLy1DXnzrClm2JY36Oes4ugtH+sDrjaIgbcbCokFVloAPZY7hETD5TbiPgysr+fcWWZIR79sU/GV+4YwiE3BU1eoQj725SJgAUzl7KNDaEHUDCbB441jGC8r6tSMtIMt9QCd4dTNEpqnw2dSElM1lRA9AcZSIClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740026700; c=relaxed/simple;
	bh=d+iFZuxJO7eL6REewH1kUH0Ywtv4DV1Yvdltas+I7T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8qktmVJzlOaIeU8TRQ9jBEuI6Le90kPukgQjlibdhhoZIzmHiUFdM1YU9FQjTRlh4Qyc2UlIqK2fHLAC7aIug4HW4NPOLzp/zbdcg5JU+7DxMY5OB7C6WeG7Mn2ewGx1+4vyy7FT/fr3G1N6LFHEWOo26MTVn0OOCiiifEzC5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqbB5WL3; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqbB5WL3"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30737db1aa9so4267341fa.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2025 20:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740026697; x=1740631497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtYcQ+2FJMDcbUz4z18Px8ZZK4xLqjkYjz2BFlX/9kQ=;
        b=YqbB5WL3sWglGXTy1l0wH01PYt3OzIX+4ZR7fvWbF8hG1O1YzAr3P9n4mIey4DQXX+
         2znfuVY9QBIpCchD5aK5oE8QhjrE7KZu579u40ylM/v4qukhFSqxvCYsU/vD6nIsOy5L
         oK/4tUAtfmZHB3G15A8WyiGL+UL2iLIEy+TP/CKrVgmNI03wC8tBBlI1ggmKYe03WKWU
         ua/jsgDX7TtMLVd5/Np4ZDkUX0ywRWiHKfqQVqzBEU/LlIMeWTNE7SnigfoVjEclliNY
         sCW1Gr4kyL/JjxnsqMEMmBDeYtXI0sV8XT0QGT56rpOGkkQU5LOyDQc0P6NV/SryQHyf
         tjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740026697; x=1740631497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtYcQ+2FJMDcbUz4z18Px8ZZK4xLqjkYjz2BFlX/9kQ=;
        b=V3qvqc78+rTS7Q1Oqi+aEToveI0OXEy2p9Tiq+6sn52aKdvJPc8v0MrWk1yapZDGps
         02Rs4nNbvMsmqVbn3e2IAJ9Ea3wVUxG34R4TzRCU/sHWhz70sCdJbfT5MaUL1+lmk8XV
         Jy90LZHmRgDxzIuWvCuAi0oAO2IstaLwpqyk8zCtMLaiHenF8tEz63w1dIQ9oYWG7Hfg
         JT2LNk23ArnWhs73eTROp9fXseY5/Ga2K90d4KfZHSoO7FPvTveb7z/HlBz2SYWDf/TL
         ilUX/3ij+iqUE3N1IzKNaSyDAZL/fk8T2btpjTaajIoElun2Nk178s9LdfqTTfsPyYJH
         NvtA==
X-Forwarded-Encrypted: i=1; AJvYcCWzPpAtj5iqRvZWl/wL+YIYKJ5xlonLHv606/CN3YbuFRMB1pBfw1OT/+uyCRrzbOq/Ve52g4X9y4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNn6/ej2wrKkrNR1KaBUKSX96l1uN/vJFLzlThpIYU1mLQn/TB
	otFCF6tvqGjzqV3S6k69GVKrQaxQtzmZ06A7yn4aiCaBAsSBTjzUFj4+3LMgIsk=
X-Gm-Gg: ASbGncs4mqjrma+suAbXFnzFktCCihzy+Z+A5v4lIdUAQMygtWv1gsDo49kbrm3uriT
	fjznqJZFUxeRBLtaWlWdhpLmCd1zZJlqqRGxhhrS9Z0l8k0bluiUdMFFMKqqegm8+ONGp4JKZOL
	IYBX5rWs+blqgy0veDSxgYtaw8hOv4KfH9C4ZgJvpXt4uz6kUfiJYKgWd1g1u/ZkXvtP0Yl891S
	mOy/JuX5Qv++Aj6ggpmIBEwCHiZiQQUodjFsR6KMXQheRoO6lsEZzp7VaDASvPZGelaXyX9AtdZ
	wJnFi9cwpoWx/1+ecionlHeYI4XqWmnkE574r/42msNZoP6NZwgixiDSTyXnI2llYc4w2/4=
X-Google-Smtp-Source: AGHT+IEwZ0li2gmqCbbSb/xDJ0sR4BsPeqpGMzMpoUos8tWg+NSjnr7x/0yyIj4p3yB1OUI7BBnjQQ==
X-Received: by 2002:a2e:965a:0:b0:308:fbd5:9d2d with SMTP id 38308e7fff4ca-30a45062d78mr19375761fa.37.1740026696916;
        Wed, 19 Feb 2025 20:44:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309a0b59bf1sm15738491fa.59.2025.02.19.20.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:44:56 -0800 (PST)
Date: Thu, 20 Feb 2025 06:44:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: qcm6490-idp: Update the LPASS
 audio node
Message-ID: <kaswrgmgmrgt6uukevi3oon7mcrc4hlfyewx5r3os6j2oyhb7d@izgybktb4fst>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
 <20250220-lpass_qcm6490_resets-v4-3-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-3-68dbed85c485@quicinc.com>

On Thu, Feb 20, 2025 at 09:52:52AM +0530, Taniya Das wrote:
> Update the lpassaudio node to support the new compatible as the
> lpassaudio needs to support the reset functionality on the
> QCM6490 IDP board and the rest of the Audio functionality would be
> provided from the LPASS firmware.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
